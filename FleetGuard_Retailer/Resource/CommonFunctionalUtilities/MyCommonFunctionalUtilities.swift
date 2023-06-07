//
//  MyCommonFunctionalUtilities.swift
//  OZFoodHunter
//
//  Created by Siba Prasad Hota on 01/06/17.
//  Copyright © 2017 WeMakeAppz. All rights reserved.
//

import UIKit

class MyCommonFunctionalUtilities: NSObject {
   
    class func isInternetCallTheApi() -> Bool {
        let status = Reach().connectionStatus()
        switch status {
        case .unknown, .offline:
            return false
        case .online(.wwan):
            return true
        case .online(.wiFi):
            return true
        }
    }
}
