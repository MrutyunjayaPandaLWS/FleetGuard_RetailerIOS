//
//  EditProfileVM.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by Arokia-M3 on 23/02/23.
//

import UIKit
import LanguageManager_iOS

class EditProfileVM: popUpDelegate {
    func popupAlertDidTap(_ vc: FG_PopUpVC) {
    }
    
    weak var VC: FG_EditProfileVC?
    var requestAPIs = RestAPI_Requests()
    var parameters = [String: Any]()
    var parameter: JSON?
    func editProfileSubmissionAPI(paramters: JSON){
        DispatchQueue.main.async {
            self.VC?.startLoading()
        }
        self.requestAPIs.editProfileDetailsAPI(parameters: paramters) { (result, error) in
            if error == nil {
                if result != nil{
                    DispatchQueue.main.async {
                        self.VC?.stopLoading()
                        let response = String(result?.returnMessage ?? "")
                        print(response,"dsdhuush")
                        if response.count != 0{
                            if response == "1"{
                                DispatchQueue.main.async{
                                    let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
                                    vc!.delegate = self
                                    vc!.titleInfo = ""
                                    vc!.itsComeFrom = "EDIT"
                                    //vc!.itsFrom = self.VC?.itsComeFrom ?? ""
                                    vc!.descriptionInfo = "edit_Profile_submitted_successfully".localiz()
                                    vc!.modalPresentationStyle = .overCurrentContext
                                    vc!.modalTransitionStyle = .crossDissolve
                                    self.VC?.present(vc!, animated: true, completion: nil)
                                    
                                }
                            }else{
                                DispatchQueue.main.async{
//                                    let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
//                                    vc!.delegate = self
//                                    vc!.titleInfo = ""
//                                    vc!.itsComeFrom = "EDIT"
//                                    //vc!.itsFrom = self.VC?.itsComeFrom ?? ""
//                                    vc!.descriptionInfo = "Failed to submit your details try after some time"
//                                    vc!.modalPresentationStyle = .overCurrentContext
//                                    vc!.modalTransitionStyle = .crossDissolve
//                                    self.VC?.present(vc!, animated: true, completion: nil)
                                    self.VC?.view.makeToast("edit_Profile_submit_failed".localiz(), duration: 3.0, position: .bottom)
                                }
                            }
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
