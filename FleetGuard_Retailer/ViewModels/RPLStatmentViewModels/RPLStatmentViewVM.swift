//
//  RPLStatmentViewVM.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by Arokia-M3 on 24/02/23.
//

import UIKit

class RPLStatmentViewVM {
        
    weak var VC: FG_StatementVC?
    var requestAPIs = RestAPI_Requests()
    var rlpStatemnetArray = [LstRetailerBonding2]()
    
    func rplStatemnetViewAPI(parameters: JSON) -> (){
        DispatchQueue.main.async {
            self.VC?.startLoading()
        }
        self.requestAPIs.rplStatmentViewAPI(parameters: parameters) { (result, error) in
            if error == nil{
                if result != nil {
                    DispatchQueue.main.async {
                        self.VC?.stopLoading()
                        self.rlpStatemnetArray = result?.lstRetailerBonding ?? []
                        print(self.rlpStatemnetArray.count,"dlskjdkj")
                        if self.rlpStatemnetArray.count != 0 {
                            self.VC?.statementTableView.isHidden = false
                            self.VC?.statementTableView.reloadData()
                            
                        }else{
                           // self.VC?.view.makeToast("Datas not available !", duration: 2.0, position: .bottom)
                            self.VC?.statementTableView.isHidden = true
                            
                        }
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
