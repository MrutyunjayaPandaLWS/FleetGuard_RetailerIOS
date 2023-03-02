//
//  NotificationExtension.swift
//  Quba Safalta
//
//  Created by Arkmacbook on 31/03/21.
//

import Foundation

extension Notification.Name{
    static let loginRegister = Notification.Name(rawValue: "loginRegister")
    static let resendOTP = Notification.Name(rawValue: "resendOTP")
    static let dismissQuery = Notification.Name(rawValue: "dismissQuery")
    static let addToCart = Notification.Name(rawValue: "addToCart")
    static let restartScan = Notification.Name(rawValue: "restartScan")
    static let scanAccess = Notification.Name(rawValue: "scanAccess")
    static let redemptionSuccess = Notification.Name(rawValue: "redemptionSuccess")
    static let startVideo = Notification.Name(rawValue: "StartVideo")
    static let bankSubmission = Notification.Name(rawValue: "bankSubmission")
    static let sideMenuEN = Notification.Name(rawValue: "sideMenuEN")
    static let sideMenuHI = Notification.Name(rawValue: "sideMenuHI")
    static let afterRegister = Notification.Name(rawValue: "afterRegister")
    static let querySubmission = Notification.Name(rawValue: "querySubmission")
    static let validateForScannedCode = Notification.Name(rawValue: "validateForScannedCode")
    static let validateForUploadCode = Notification.Name(rawValue: "validateForUploadCode")
    static let cartCount = Notification.Name(rawValue: "cartCount")
    static let showPopUp = Notification.Name(rawValue: "showPopUp")
    static let dismissView = Notification.Name(rawValue: "dismissView")
    static let refreshView = Notification.Name(rawValue: "refreshView")
    
    static let evoucherListApi = Notification.Name(rawValue: "evoucherListApi")
    static let evoucherDetailsApi = Notification.Name(rawValue: "evoucherDetailsApi")
    static let plannerList = Notification.Name(rawValue: "plannerList")
    static let deleteAccount = Notification.Name(rawValue: "deleteAccount")
    static let sideMenuClosing = Notification.Name(rawValue: "sideMenuClosing")
    static let profileImageUpdate = Notification.Name(rawValue: "profileImageUpdate")
    static let dismissCurrentVC = Notification.Name(rawValue: "dismissCurrentVC")
    static let deactivatedAcc = Notification.Name(rawValue: "deactivatedAcc")
    static let goToMain = Notification.Name(rawValue: "GoToMain")
    static let designUpdate = Notification.Name(rawValue: "designUpdate")
    static let navigateToProductList = Notification.Name(rawValue: "navigateToProductList")
    static let navigateToDashboard = Notification.Name(rawValue: "navigateToDashboard")
    static let redemptionSubmission = Notification.Name(rawValue: "redemptionSubmission")
    static let dismissScreen = Notification.Name(rawValue: "dismissScreen")
    static let sendDashboard = Notification.Name(rawValue: "sendDashboard")
    static let sendBackTOQuery = Notification.Name(rawValue: "sendBackTOQuery")
    static let logedInByOtherMobile = Notification.Name(rawValue: "logedInByOtherMobile")
    
}
