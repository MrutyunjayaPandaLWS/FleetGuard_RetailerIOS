//
//  ServiceError.swift
//  TestApp
//
//  Created by Arokia IT on 8/5/20.
//  Copyright © 2020 Arokiait Pvt Ltd. All rights reserved.
//

import UIKit

enum ServiceError: Error {
    case noInternetConnection
    case custom(String)
    case other
}

extension ServiceError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .noInternetConnection:
            return "No Internet connection"
        case .other:
            return "Something went wrong"
        case .custom(let message):
            return message
        }
    }
}


extension ServiceError {
    init(json: JSON) {
        if let message =  json["message"] as? String {
            self = .custom(message)
        } else {
            self = .other
        }
    }
}
