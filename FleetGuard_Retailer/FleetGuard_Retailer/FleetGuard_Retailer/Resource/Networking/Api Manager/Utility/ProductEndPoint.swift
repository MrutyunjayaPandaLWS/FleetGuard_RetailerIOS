//  ProductEndPoint.swift
//  New Api model
//
//  Created by admin on 05/09/23.
//

import Foundation

enum ProductEndPoint {
    case PointsBalance
    case dashboard
}

extension ProductEndPoint: EndPointType {
    
    
    var path: String {
        switch self {
        case .PointsBalance:
            return "getTotalPointMobileApp_FleetGuard"
        default:
            return "error"
        }
    }

    var baseURL: String {
        switch self {
        case .PointsBalance:
            return myEarningsBaseURL
        default:
            return baseURl
        }
    }

    var url: URL? {
        return URL(string: "\(baseURL)\(path)")
    }

    var method: HTTPMethods {
        switch self {
        default:
            return .post
        }
    }

    var body: Encodable? {
        return nil
    }

    var headers: [String : String]? {
        APIManager.commonHeaders
    }
    
    var token: String {
        switch self{
        case .PointsBalance:
            return "\(UserDefaults.standard.string(forKey: "SECONDTOKEN") ?? "")"
        default:
            return "\(UserDefaults.standard.string(forKey: "TOKEN") ?? "")"
        }
    }
}
