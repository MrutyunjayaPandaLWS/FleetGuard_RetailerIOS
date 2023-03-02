//
//  MyProfileDetailModels.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by Arokia-M3 on 23/02/23.
//

import UIKit
import Kingfisher

class MyProfileDetailsVM: popUpDelegate{
    
    func popupAlertDidTap(_ vc: FG_PopUpVC) {
    }
    
    
    var userId = UserDefaults.standard.string(forKey: "UserID") ?? ""
    var loyaltyId = UserDefaults.standard.string(forKey: "LoyaltyId") ?? ""
    weak var VC: FG_MyProfileVC?
    var requestAPIs = RestAPI_Requests()
    var myProfileDetailsarray = [LstCustomerOfficalInfoJson1]()
    
    
    func myProifleDetails(parameters:JSON) -> (){
        DispatchQueue.main.async {
              self.VC?.startLoading()
         }
        self.requestAPIs.myProfile(parameters: parameters) { (result, error) in
            if error == nil{
                if result != nil{
                    DispatchQueue.main.async {
                        self.VC?.stopLoading()
                        self.VC?.firstNameLbl.text = result?.lstCustomerJson?[0].firstName ?? "-"
                        self.VC?.lastNameLbl.text = result?.lstCustomerJson?[0].lastName ?? "-"
                        self.VC?.mobileNumberLbl.text = result?.lstCustomerJson?[0].mobile ?? "-"
                        self.VC?.emailLbl.text = result?.lstCustomerJson?[0].email ?? "-"
                        //self.dateOfBirthTF.text = response?.lstCustomerJson?[0].dob ?? "-"
                        self.VC?.addressLbl.text = result?.lstCustomerJson?[0].address1 ?? "-"
                        self.VC?.stateLbl.text = result?.lstCustomerJson?[0].stateName ?? "-"
                        self.VC?.cityLbl.text = result?.lstCustomerJson?[0].cityName ?? "-"
                        self.VC?.pincodeLbl.text = result?.lstCustomerJson?[0].zip ?? "-"
                        let createdDate = (result?.lstCustomerJson?[0].jdob ?? "-").split(separator: " ")
                        self.VC?.dobLbl.text = "\(createdDate[0])"
                        let profileDetails = result?.lstCustomerJson ?? []
                        let customerImage = String(profileDetails[0].profilePicture ?? "").dropFirst()
                        self.VC?.profileImage.kf.setImage(with: URL(string: "\(PROMO_IMG1)\(customerImage)"), placeholder: UIImage(named: "ic_default_img"));
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
    
    //Image Submission
//    func imageSubmissionAPI(base64: String) {
//        DispatchQueue.main.async {
//              self.VC?.startLoading()
//              self.VC?.loaderView.isHidden = false
//              self.VC?.playAnimation()
//         }
//        let parameters = [
//            "ActorId": "\(UserDefaults.standard.string(forKey: "UserID") ?? "")",
//            "ObjCustomerJson": [
//                "DisplayImage": "\(base64)",
//                "LoyaltyId": "\(UserDefaults.standard.string(forKey: "LoyaltyID") ?? "")"
//            ]
//        ]as [String : Any]
//        print(parameters,"imageAPI")
//        self.requestAPIs.imageSavingAPI(parameters: parameters) { (result, error) in
//            if error == nil{
//                if result != nil{
//                    DispatchQueue.main.async {
//                        print(result?.returnMessage ?? "", "ReturnMessage")
//                        if result?.returnMessage ?? "" == "1"{
//                            DispatchQueue.main.async{
//                                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "PopupAlertOne_VC") as? PopupAlertOne_VC
//                                vc!.delegate = self
//                                vc!.titleInfo = ""
//                                vc!.itsComeFrom = "MyProfileImage"
//                                vc!.descriptionInfo = "Profile image updated successfully"
//                                vc!.modalPresentationStyle = .overFullScreen
//                                vc!.modalTransitionStyle = .crossDissolve
//                                self.VC?.present(vc!, animated: true, completion: nil)
//                            }
////                            NotificationCenter.default.post(name: .goToDashBoardAPI, object: nil)
//                        }else{
//                            DispatchQueue.main.async{
//                                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "PopupAlertOne_VC") as? PopupAlertOne_VC
//                                vc!.delegate = self
//                                vc!.titleInfo = ""
//                                vc!.itsComeFrom = "MyProfileImage"
//                                vc!.descriptionInfo = "Profile image update Failed"
//                                vc!.modalPresentationStyle = .overFullScreen
//                                vc!.modalTransitionStyle = .crossDissolve
//                                self.VC?.present(vc!, animated: true, completion: nil)
//                            }
//                        }
//                        self.VC?.loaderView.isHidden = true
//                        self.VC?.stopLoading()
//                    }
//                }else{
//                    DispatchQueue.main.async {
//                        self.VC?.loaderView.isHidden = true
//                        self.VC?.stopLoading()
//                    }
//                }
//
//            }else{
//                DispatchQueue.main.async {
//                    self.VC?.loaderView.isHidden = true
//                    self.VC?.stopLoading()
//                }
//            }
//        }
//    }
//
    
    
    
    
    //Image Submission
    func imageSubmissionAPI(base64: String) {
        DispatchQueue.main.async {
            self.VC?.startLoading()
         }
        let parameters = [
            "ActorId": "\(UserDefaults.standard.string(forKey: "UserID") ?? "")",
            "ObjCustomerJson": [
                "DisplayImage": "\(VC?.strdata1 ?? "")",
                "LoyaltyId": "\(loyaltyId)"
            ]
        ]as [String : Any]
        print(parameters,"imageAPI")
        self.requestAPIs.imageSavingAPI(parameters: parameters) { (result, error) in
            if error == nil{
                if result != nil{
                    DispatchQueue.main.async {
                        print(result?.returnMessage ?? "", "ReturnMessage")
                        if result?.returnMessage ?? "" == "1"{
                            DispatchQueue.main.async{
                                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
                                vc!.delegate = self
                                vc!.titleInfo = ""
                                vc!.itsComeFrom = "MyProfileImage"
                                vc!.descriptionInfo = "Profile image updated successfully"
                                vc!.modalPresentationStyle = .overFullScreen
                                vc!.modalTransitionStyle = .crossDissolve
                                self.VC?.present(vc!, animated: true, completion: nil)
                            }
//                            NotificationCenter.default.post(name: .goToDashBoardAPI, object: nil)
                        }else{
                            DispatchQueue.main.async{
                                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
                                vc!.delegate = self
                                vc!.titleInfo = ""
                                vc!.itsComeFrom = "MyProfileImage"
                                vc!.descriptionInfo = "Profile image update Failed"
                                vc!.modalPresentationStyle = .overFullScreen
                                vc!.modalTransitionStyle = .crossDissolve
                                self.VC?.present(vc!, animated: true, completion: nil)
                            }
                        }
                        
                        self.VC?.stopLoading()
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
