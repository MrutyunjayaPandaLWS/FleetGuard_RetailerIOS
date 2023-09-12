//
//  TokenGeneration.swift
//  New Api model
//
//  Created by admin on 05/09/23.
//

import Foundation
final class TokenGeneration{
    
    static let Token = TokenGeneration()
    private init(){}
    var token : TokenModels?
    var secondTokenData : TokenModels?
    func TokenGenerationApi(){
            let parameters : Data = "username=\(username)&password=\(password)&grant_type=\(grant_type)".data(using: .utf8)!
            let url = URL(string: "\(tokenURL)")!
            let session = URLSession.shared
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            print(parameters,"- TOKEN")
            request.httpBody = parameters
            request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
                guard error == nil else {
                    return
                }
                guard let data = data else {
                    return
                }
                do{
                    let parseddata = try JSONDecoder().decode(TokenModels.self, from: data)
                        print(parseddata.access_token ?? "first token")
                    self.token = parseddata
                    UserDefaults.standard.setValue(parseddata.access_token ?? "", forKey: "TOKEN")
                     }catch let parsingError {
                    print("Error", parsingError)
                }
            })
            task.resume()
        }
    
    
    func secondTokenGenerationApi(){
            let parameters : Data = "username=\(username2)&password=\(password2)&grant_type=\(grant_type2)".data(using: .utf8)!
            let url = URL(string: "\(secondToken)")!
            let session = URLSession.shared
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            print(parameters,"- TOKEN")
            request.httpBody = parameters
            request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
                guard error == nil else {
                    return
                }
                guard let data = data else {
                    return
                }
                do{
                    let parseddata = try JSONDecoder().decode(TokenModels.self, from: data)
                        print(parseddata.access_token ?? "second token")
                    self.secondTokenData = parseddata
                    UserDefaults.standard.setValue(parseddata.access_token ?? "", forKey: "SECONDTOKEN")
                     }catch let parsingError {
                    print("Error", parsingError)
                }
            })
            task.resume()
        }
    
}

