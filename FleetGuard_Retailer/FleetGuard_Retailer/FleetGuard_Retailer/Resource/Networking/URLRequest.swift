//
//  URLRequest.swift
//  TestApp
//
//  Created by Arokia IT on 8/6/20.
//  Copyright © 2020 Arokiait Pvt Ltd. All rights reserved.
//

import UIKit

extension URLRequest {
    init(baseUrl: String, path: String, method: RequestMethod, params: JSON) {
        
     
        //URL part
        let url = URL(baseUrl: baseUrl, path: path, params: params, method: method)
        self.init(url: url)
        httpMethod = method.rawValue
        print(httpMethod!)
        setValue("application/json", forHTTPHeaderField: "Accept")
        setValue("application/json", forHTTPHeaderField: "Content-Type")
        let afterLoginToken: Bool = UserDefaults.standard.bool(forKey: "AfterLog")
        print(afterLoginToken)
        

        if afterLoginToken == true {
            setValue("Bearer \(UserDefaults.standard.string(forKey: "TOKEN") ?? "")", forHTTPHeaderField: "Authorization")
        }else{
            setValue("Bearer \(UserDefaults.standard.string(forKey: "SECONDTOKEN") ?? "")", forHTTPHeaderField: "Authorization")
            UserDefaults.standard.set(true, forKey: "AfterLog")
            UserDefaults.standard.synchronize()
        }
        
        switch method {
        case .post, .put:
            httpBody = try! JSONSerialization.data(withJSONObject: params, options: [])
            break
        default:
            print(method)
            break
        }
    }
    
}

