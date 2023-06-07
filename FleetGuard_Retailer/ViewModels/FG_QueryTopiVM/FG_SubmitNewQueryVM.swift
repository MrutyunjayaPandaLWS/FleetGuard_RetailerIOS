//
//  DD_QueryTopicVM.swift
//  DD_Motors
//
//  Created by ADMIN on 28/12/2022.
//

import UIKit
import Toast_Swift
import LanguageManager_iOS

class FG_SubmitNewQueryVM: popUpDelegate {
    func popupAlertDidTap(_ vc: FG_PopUpVC) {}
    
    
    weak var VC: FG_CreatenewqueryVC?
    var pushID = UserDefaults.standard.string(forKey: "DEVICE_TOKEN") ?? ""
    var requestAPIs = RestAPI_Requests()
    var helpTopicListArray = [ObjHelpTopicList]()
    
    func querySubmissionApi(parameter: JSON){
    self.VC?.startLoading()
    self.requestAPIs.newQuerySubmission(parameters: parameter) { (result, error) in
        if error == nil{
            if result != nil{
                DispatchQueue.main.async {
                    self.VC?.stopLoading()
                    
                    print(result?.returnMessage ?? "")
                    if result?.returnMessage ?? "" != "" || result?.returnMessage ?? nil != nil{
                    //self.VC!.view.makeToast("Query Submitted successfully!", duration: 3.0, position: .bottom)
                        DispatchQueue.main.async{
                           let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
                            vc!.delegate = self
                            vc!.itsComeFrom = "LodgeQuery"
                            vc!.descriptionInfo = "Query_Submitted_successfully".localiz()
                            vc!.modalPresentationStyle = .overFullScreen
                            vc!.modalTransitionStyle = .crossDissolve
                            self.VC?.present(vc!, animated: true, completion: nil)
                        }
//                        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
//                            self.VC?.navigationController?.popViewController(animated: true)
//                        })
                        
                }else{
                    self.VC!.view.makeToast("Something_went_wrong_error".localiz(), duration: 3.0, position: .bottom)
                    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4), execute: {
                        self.VC?.navigationController?.popViewController(animated: true)
                    })
                }
              }
            }else{
                DispatchQueue.main.async {
                self.VC?.stopLoading()
                }
            }
        }else{
            DispatchQueue.main.async {
            self.VC?.stopLoading()
            }
        }
    }
}

}
