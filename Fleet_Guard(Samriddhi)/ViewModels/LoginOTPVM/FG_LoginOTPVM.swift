//
//  FG_LoginOTPVM.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 01/02/2023.
//

import UIKit


class FG_LoginOTPVM: popUpDelegate {
    func popupAlertDidTap(_ vc: FG_PopUpVC) {}
    
    weak var VC: FG_LoginOTPVC?
    
    var pushID = UserDefaults.standard.string(forKey: "DEVICE_TOKEN") ?? ""
    var requestAPIs = RestAPI_Requests()
    var count = 0
    var timer = Timer()
    var otpData = ""
    var otpVerify = ""
    
    func loginOTPApi(parameter: JSON){
        DispatchQueue.main.async {
            self.VC?.startLoading()
        }
        self.requestAPIs.otp_Post_API(parameters: parameter) { (result, error) in
            if error == nil{
                if result != nil{
                    DispatchQueue.main.async {
                    let response = result?.returnMessage ?? ""
                        print(response, "- OTP")
                        self.otpVerify = result?.returnMessage ?? ""
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
    func loginSubmissionApi(parameter: JSON){
        DispatchQueue.main.async {
            self.VC?.startLoading()
        }
        self.requestAPIs.loginApi(parameters: parameter) { (result, error) in
            if error == nil{
                if result != nil{
                    let response = result
                    DispatchQueue.main.async{
                        self.VC?.stopLoading()
                        print(response?.userList?[0].isDelete ?? 0)
                        print(response?.userList?[0].verifiedStatus ?? 0)
                        print(response?.userList?[0].isUserActive ?? 0)
                        print(response?.userList?[0].result
                              ?? 0)
                        
                        if response?.userList?[0].isDelete ?? 0 == 1{
                            DispatchQueue.main.async{
//                                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
//                                vc!.delegate = self
//                                vc!.descriptionInfo = "Your account has been deleted. Kindly contact your administrator."
//                                vc!.modalPresentationStyle = .overCurrentContext
//                                vc!.modalTransitionStyle = .crossDissolve
//                                self.VC?.present(vc!, animated: true, completion: nil)
                                
                                self.VC?.view.makeToast("Your account has been deleted. Kindly contact your administrator.", duration: 4.0, position: .bottom)
                                self.VC?.stopLoading()
                            }
                        }
                        else if response?.userList?[0].verifiedStatus ?? 0 != 1 && response?.userList?[0].isUserActive ?? 0 != 1 {
                            
//                            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
//                            vc!.delegate = self
//
//                            vc!.descriptionInfo = "Your account has been deleted. Kindly contact your administrator."
//                            vc!.modalPresentationStyle = .overCurrentContext
//                            vc!.modalTransitionStyle = .crossDissolve
//                            self.VC?.present(vc!, animated: true, completion: nil)
                            self.VC?.view.makeToast("Your account has been deactivated. Kindly contact your administrator to activate your account", duration: 4.0, position: .bottom)
                            
                        }
                        else if response?.userList?[0].verifiedStatus ?? 0 != 1 && response?.userList?[0].verifiedStatus ?? 0 != 4 && response?.userList?[0].isUserActive ?? 0 != 1 {
                            
//                            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
//                            vc!.delegate = self
//                            vc!.descriptionInfo = "Your account is not activated! Kindly activate your account."
//                            vc!.modalPresentationStyle = .overCurrentContext
//                            vc!.modalTransitionStyle = .crossDissolve
//                            self.VC?.present(vc!, animated: true, completion: nil)
                            
                            self.VC?.view.makeToast("Your account is in verification pending. Kindly contact your administrator to verify your account.", duration: 4.0, position: .bottom)
                            
                        }else if response?.userList?[0].isUserActive ?? 0 != 1 {
                            
//                            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
//                            vc!.delegate = self
//                            vc!.descriptionInfo = "Your account is not activated! Kindly activate your account."
//
//                            vc!.modalPresentationStyle = .overCurrentContext
//                            vc!.modalTransitionStyle = .crossDissolve
//                            self.VC?.present(vc!, animated: true, completion: nil)
                            
                            self.VC?.view.makeToast("Your account has been deactivated. Kindly contact your administrator to activate your account", duration: 4.0, position: .bottom)
                            
                        }else{
                            if response?.userList?[0].isUserActive ?? 0 == 1 && response?.userList?[0].verifiedStatus ?? 0 == 1 && response?.userList?[0].result ?? 0 == 1 || response?.userList?[0].result ?? 0 == 1{
                                
                                UserDefaults.standard.set(response?.userList?[0].userId ?? -1, forKey: "UserID")
                                UserDefaults.standard.set(response?.userList?[0].mobile ?? "", forKey: "Mobile_Login")
                                UserDefaults.standard.set(response?.userList?[0].customerTypeID ?? -1, forKey: "CustomerTypeID")
                                UserDefaults.standard.set(response?.userList?[0].name ?? -1, forKey: "UserName")
                                
                                UserDefaults.standard.set(response?.userList?[0].userType ?? "", forKey: "UserType")
                                UserDefaults.standard.set(response?.userList?[0].userLastName ?? "", forKey: "UserLastName")
                                UserDefaults.standard.set(response?.userList?[0].custAccountNumber ?? "", forKey: "CustomerAccountNumber")
                                UserDefaults.standard.set(response?.userList?[0].email ?? "", forKey: "EmailID")
                                UserDefaults.standard.set(response?.userList?[0].merchantMobileNo ?? "", forKey: "merchantMobileNo")
                                UserDefaults.standard.set(response?.userList?[0].merchantEmailID ?? "", forKey: "merchantEmailID")
                                UserDefaults.standard.set(response?.userList?[0].userName ?? "", forKey: "userName")
                                UserDefaults.standard.synchronize()
                                
                                UserDefaults.standard.set(true, forKey: "IsloggedIn?")
                                DispatchQueue.main.async{
                                    if #available(iOS 13.0, *) {
                                        let sceneDelegate = self.VC?.view.window?.windowScene?.delegate as! SceneDelegate
                                        sceneDelegate.setHomeAsRootViewController()
                                    } else {
                                        let appDelegate = UIApplication.shared.delegate as! AppDelegate
                                        appDelegate.setHomeAsRootViewController()
                                    }
                                }
                               
                            }else{
//                                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
//                                vc!.delegate = self
//                                vc!.descriptionInfo = "Your account is not activated! Kindly activate your account."
//                                vc!.modalPresentationStyle = .overCurrentContext
//                                vc!.modalTransitionStyle = .crossDissolve
//                                self.VC?.present(vc!, animated: true, completion: nil)
                                
                                self.VC?.view.makeToast("Your account has been deactivated. Kindly contact your administrator to activate your account", duration: 4.0, position: .bottom)
                            }
                            
                        }
                       
                    }
                }else{
                    DispatchQueue.main.async {
                        print("ERROR_ \(error)")
                        self.VC?.stopLoading()
                    }
                    
                }
            }else{
                
                DispatchQueue.main.async {
                    print("ERROR_ \(error)")
                    self.VC?.stopLoading()
                }
                
            }
        }
    }

    func otpTimer(){
        //self.VC?.submitBTN.isEnabled = true
        self.count = 60
        self.VC?.enteredValue = ""
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
    }
    @objc func update() {
        if(count > 1) {
            count = count - 1
            if count <= 10{
                self.VC?.timerLbl.text = "00:0\(count - 1)"
            }else{
                self.VC?.timerLbl.text = "00:\(count - 1)"
            }
            
            self.VC?.resendBtn.isHidden = true
            self.VC?.otpValueLbl.isHidden = false
        }else{
            self.VC?.resendBtn.isHidden = false
            self.VC?.otpValueLbl.isHidden = true
            self.timer.invalidate()
          
        }
    }
}
