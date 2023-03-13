//
//  ViewController.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by Arokia-M3 on 13/03/23.
//

import UIKit

class HistoryNotificationsViewModel{
    
    weak var VC: FG_NotificationVC?
    var requestAPIs = RestAPI_Requests()
    var notificationListArray = [LstPushHistoryJson]()
    
    func notificationListApi(parameters: JSON, completion: @escaping (NotificationModels?) -> ()){
        DispatchQueue.main.async {
              self.VC?.startLoading()
         }
        self.requestAPIs.notificationList(parameters: parameters) { (result, error) in
            if error == nil{
                if result != nil {
                    DispatchQueue.main.async {
                        completion(result)
                        self.VC?.stopLoading()
                    }
                } else {
                    print("No Response")
                    DispatchQueue.main.async {
                        self.VC?.stopLoading()
                    }
                }
            }else{
                print("ERROR_Login \(error)")
                DispatchQueue.main.async {
                    self.VC?.stopLoading()
                }

        }
    }
    
    }

}
