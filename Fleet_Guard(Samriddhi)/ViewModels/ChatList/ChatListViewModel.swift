//
//  ChatListViewController.swift
//  CenturyPly_JSON
//
//  Created by Arokia-M3 on 03/03/22.
//

import UIKit

class ChatListViewModel{
    
    weak var VC: ChatListViewController?
    var requestAPIs = RestAPI_Requests()
    var chatListingArray = [ObjQueryResponseJsonList]()
    
    func chatDetails(parameters: JSON, completion: @escaping (ChatDetailsModels?) -> ()){
        DispatchQueue.main.async {
              self.VC?.startLoading()
         }
        self.requestAPIs.chatDetailsApi(parameters: parameters) { (result, error) in
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
    
    func newChatSubmission(parameters: JSON, completion: @escaping (NewChatSubmission?) -> ()){
        DispatchQueue.main.async {
              self.VC?.startLoading()
              
         }
        self.requestAPIs.newChatSubmissio(parameters: parameters) { (result, error) in
            if error == nil{
                if result != nil {
                    DispatchQueue.main.async {
                        completion(result)
                        
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
    
    func newPictureSubmission(parameters: JSON, completion: @escaping (NewChatSubmission?) -> ()){
        DispatchQueue.main.async {
              self.VC?.startLoading()
         }
        self.requestAPIs.newChatSubmissio(parameters: parameters) { (result, error) in
            if error == nil{
                if result != nil {
                    DispatchQueue.main.async {
                        completion(result)
                        
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
