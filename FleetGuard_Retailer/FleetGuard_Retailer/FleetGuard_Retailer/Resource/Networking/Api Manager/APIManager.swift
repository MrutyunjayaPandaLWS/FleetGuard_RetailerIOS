//
//  APIManager.swift
//  New Api model
//
//  Created by admin on 05/09/23.
//
import Foundation

// Singleton Design Pattern

enum DataError: Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case network(Error?)
    case decoding(Error?)
    case unAthoried
}

// typealias Handler = (Result<[Product], DataError>) -> Void
//typealias JSON = [String: Any]
typealias ResultHandler<T> = (Result<T, DataError>) -> Void

final class APIManager {

    static let shared = APIManager()
    private let networkHandler: NetworkHandler
    private let responseHandler: ResponseHandler

    init(networkHandler: NetworkHandler = NetworkHandler(),
         responseHandler: ResponseHandler = ResponseHandler()) {
        self.networkHandler = networkHandler
        self.responseHandler = responseHandler
    }

    func request<T: Codable>(
        modelType: T.Type,params: JSON?,
        type: EndPointType,
        completion: @escaping ResultHandler<T>
    ) {
//        UserDefaults.standard.setValue("dsafyudsuyv2dgdgd@fdg", forKey: "TOKEN")
        let token = type.token
        //    let loginString = NSString(format: "%@:%@", username, password)
        //    let loginData = loginString.data(using: String.Encoding.utf8.rawValue)!
        //    let base64LoginString = loginData.base64EncodedString()
        guard let url = type.url else {
            completion(.failure(.invalidURL))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = type.method.rawValue
        if let params = params{
            request.httpBody = try! JSONSerialization.data(withJSONObject: params, options: [])
        }
        
        if let parameters = type.body {
            request.httpBody = try? JSONEncoder().encode(parameters)
        }

        request.allHTTPHeaderFields = type.headers
//        if let token = token{
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
//        }
//        request.setValue("Basic " + base64LoginString, forHTTPHeaderField: "Authorization")

        // Network Request - URL TO DATA
        networkHandler.requestDataAPI(url: request) { result in
            switch result {
            case .success(let data):
                // Json parsing - Decoder - DATA TO MODEL
                self.responseHandler.parseResonseDecode(
                    data: data,
                    modelType: modelType) { response in
                        switch response {
                        case .success(let mainResponse):
                            completion(.success(mainResponse)) // Final
                        case .failure(.unAthoried):
                            print("Token Expire")
                            completion(.failure(.unAthoried))
                        case .failure(let error):
                            completion(.failure(error))
                        }
                    }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
   
    static var commonHeaders: [String: String] {
        return [
            "Content-Type": "application/json",
            "Accept": "application/json",
            
        ]
    }

}


// Like banta hai guys

class NetworkHandler {

    func requestDataAPI(
        url: URLRequest,
        completionHandler: @escaping (Result<Data, DataError>) -> Void
    ) {
        print(url.url ?? "")
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let response = response as? HTTPURLResponse,
                  200 ... 299 ~= response.statusCode else {
                let response = response as? HTTPURLResponse
                print(response?.statusCode ?? 0,"status code")
                if response?.statusCode == 401{
//                    TokenGeneration.Token.TokenGenerationApi()
                    TokenGeneration.Token.secondTokenGenerationApi()
                    
                    completionHandler(.failure(.unAthoried))
                }else{
                    completionHandler(.failure(.invalidResponse))
                }
                
                return
            }
            
            guard let data, error == nil else {
                completionHandler(.failure(.invalidData))
                return
            }
            completionHandler(.success(data))
        }
        session.resume()
    }
    
}

class ResponseHandler {
    func parseResonseDecode<T: Decodable>(
        data: Data,
        modelType: T.Type,
        completionHandler: ResultHandler<T>
    ) {
        do {
            let userResponse = try JSONDecoder().decode(modelType, from: data)
            completionHandler(.success(userResponse))
        }catch {
            completionHandler(.failure(.decoding(error)))
        }
    }

}
