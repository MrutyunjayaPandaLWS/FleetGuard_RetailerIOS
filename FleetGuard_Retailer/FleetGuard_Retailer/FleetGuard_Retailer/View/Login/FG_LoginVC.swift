//
//  ViewController.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 16/01/2023.
//

import UIKit
import AdSupport

import LanguageManager_iOS
class FG_LoginVC: BaseViewController, popUpDelegate, UITextFieldDelegate, CheckBoxSelectDelegate {
    func decline(_ vc: FG_TermsandconditionsVC) {
        self.termsAndConOutlet.setImage(UIImage(named: "UnChecked Box"), for: .normal)
    }
    func accept(_ vc: FG_TermsandconditionsVC) {
        print(vc.boolResult)
        if vc.boolResult == true{
            self.boolResult = true
            self.termsAndConOutlet.setImage(UIImage(named: "checked-checkbox"), for: .normal)
            return
        }else{
            self.termsAndConOutlet.setImage(UIImage(named: "UnChecked Box"), for: .normal)
            self.boolResult = false
            return
        }
    }

    
    func popupAlertDidTap(_ vc: FG_PopUpVC) {}
    
    @IBOutlet weak var welcomeToLbl: UILabel!
    @IBOutlet weak var alreadyAMemberLbl: UILabel!
    @IBOutlet weak var loginNowLbl: UILabel!
    @IBOutlet weak var mobileNumberLbl: UILabel!
    
    @IBOutlet weak var termAndCondLbl: UILabel!
    @IBOutlet weak var contactUsBtn: UIButton!
    @IBOutlet weak var newToSamriddhiLbl: UILabel!
    @IBOutlet weak var sendOtpBtn: UIButton!
    @IBOutlet weak var mobileTF: UITextField!
    
    @IBOutlet var termsAndConLbl: UILabel!
    @IBOutlet weak var termsAndConOutlet: UIButton!
    
    var boolResult:Bool = false
    var VM = FG_LoginVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.VM.VC = self
        self.mobileTF.setLeftPaddingPoints(13)
        self.mobileTF.keyboardType = .asciiCapableNumberPad
        self.mobileTF.delegate = self
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.contactUsBtn.isUserInteractionEnabled = true
        self.localization()
        self.tokendata()
    }
    
    func localization() {
        self.welcomeToLbl.text = "welcome".localiz()
        self.alreadyAMemberLbl.text = "AlreadyaMember".localiz()
        self.loginNowLbl.text = "LoginNow".localiz()
        self.mobileNumberLbl.text = "Mobilenumber".localiz()
        self.sendOtpBtn.setTitle("SendOTP".localiz(), for: .normal)
        self.newToSamriddhiLbl.text = "NewtoSamriddhi".localiz()
        self.contactUsBtn.setTitle("Contactusnow".localiz(), for: .normal)
        self.mobileTF.placeholder = "enter_mobile_number".localiz()
        self.termsAndConLbl.text = "accept_Terms_Cond".localiz()
    }
    
    
    @IBAction func termsAndConditionBTN(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_TermsandconditionsVC") as! FG_TermsandconditionsVC
        vc.comingFrom = "LoginScreen"
        vc.delegate = self
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    @IBAction func sendOTPBtn(_ sender: Any) {
        if self.mobileTF.text!.count == 0 {
            DispatchQueue.main.async{
//               let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
//                vc!.delegate = self
//                vc!.descriptionInfo = "Enter mobile number"
//                vc!.modalPresentationStyle = .overFullScreen
//                vc!.modalTransitionStyle = .crossDissolve
//                self.present(vc!, animated: true, completion: nil)
                self.view.makeToast("Enteryourmobilenumber".localiz(), duration: 3.0, position: .bottom)
            }
        }
//        else if self.boolResult == false{
//            self.view.makeToast("Accept Terms and Conditions", duration: 3.0, position: .bottom)
//        }
//        else if self.mobileTF.text!.count != 10 {
//            DispatchQueue.main.async{
//               let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
//                vc!.delegate = self
//                vc!.descriptionInfo = "Enter valid mobile number"
//                vc!.modalPresentationStyle = .overFullScreen
//                vc!.modalTransitionStyle = .crossDissolve
//                self.present(vc!, animated: true, completion: nil)
//            }
//        }
        else{
            let parameter = [
                    "ActionType": "57",
                    "Location": [
                        "UserName": "\(self.mobileTF.text ?? "")"
                    ]
            ] as [String: Any]
            print(parameter)
            self.VM.verifyMobileNumberAPI(paramters: parameter)
           
        }
       
    }
    
    @IBAction func contactUsNowBtn(_ sender: Any) {
        self.contactUsBtn.isUserInteractionEnabled = false
//        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_RegistrationVC") as! FG_RegistrationVC
            self.navigationController?.pushViewController(vc, animated: true)
//        })
        
    }
    
    @IBAction func mobileNumberEditingDidEnd(_ sender: Any) {
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 10
        let currentString: NSString = (self.mobileTF.text ?? "") as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    
    
    func tokendata(){
            if MyCommonFunctionalUtilities.isInternetCallTheApi() == false{
            }else{
                let parameters : Data = "username=\(username)&password=\(password)&grant_type=password".data(using: .utf8)!

            let url = URL(string: tokenURL)!
            let session = URLSession.shared
            var request = URLRequest(url: url)
            request.httpMethod = "POST"

            do {
                request.httpBody = parameters
            } catch let error {
                print(error.localizedDescription)
            }
            request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
           
            let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in

                guard error == nil else {
                    return
                }
                guard let data = data else {
                    return
                }
                do{
                    let parseddata = try JSONDecoder().decode(TokenModels.self, from: data)
                        print(parseddata.access_token ?? "", "- Token")
                        UserDefaults.standard.setValue(parseddata.access_token ?? "", forKey: "TOKEN")
                        UserDefaults.standard.set(true, forKey: "AfterLog")
                        UserDefaults.standard.synchronize()
                  
                     }catch let parsingError {
                    print("Error", parsingError)
                }
            })
            task.resume()
        }
        }
    
    
 
}



