//
//  FG_RegistrationVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 18/01/2023.
//

import UIKit

class FG_RegistrationVC: BaseViewController, popUpDelegate, DropDownDelegate, UITextFieldDelegate {
    func stateDidTap(_ vc: FG_DropDownVC) {
        self.selectedStateID = vc.selectedStateID
        self.selectStateLbl.text = vc.selectedState
        self.selectedState = vc.selectedState
        self.selectedCityID = 0
        self.selectedCityIdProtocol = 0
        self.selectCityLbl.text = "Select City"
    }
    
    func cityDidTap(_ vc: FG_DropDownVC) {
        self.selectedCityID = vc.selectedCityID
        self.selectCityLbl.text = vc.selectedCity
        self.selectedCity = vc.selectedCity
    }
    
    func preferredLanguageDidTap(_ vc: FG_DropDownVC) {
        
    }
    
    func genderDidTap(_ vc: FG_DropDownVC) {
        
    }
    
    func titleDidTap(_ vc: FG_DropDownVC) {
        
    }
    
    func dealerDipTap(_ vc: FG_DropDownVC) {
        
    }
    
    func statusDipTap(_ vc: FG_DropDownVC) {
        
    }
    
    func redemptionStatusDidTap(_ vc: FG_DropDownVC) {
        
    }
    
    func helpTopicDidTap(_ vc: FG_DropDownVC) {
        
    }
    
    func popupAlertDidTap(_ vc: FG_PopUpVC) {
        
    }
    

    @IBOutlet weak var newToSamriddhiLbl: UILabel!
    @IBOutlet weak var welocomeLbl: UILabel!
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var contactUsNowLbl: UILabel!
    
    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var mobileNumberLbl: UILabel!
    
    @IBOutlet weak var mobileTF: UITextField!
    
    @IBOutlet weak var stateLbl: UILabel!
    
    @IBOutlet weak var cityLbl: UILabel!
    
    @IBOutlet weak var selectCityLbl: UILabel!
    @IBOutlet weak var selectStateLbl: UILabel!
    
    @IBOutlet weak var commetsTF: UITextField!
    @IBOutlet weak var commentsLbl: UILabel!
    
    @IBOutlet weak var loginNowBtn: UIButton!
    @IBOutlet weak var alreadyMemberLbl: UILabel!
    @IBOutlet weak var submitBtn: UIButton!
    
    
    var token = UserDefaults.standard.string(forKey: "TOKEN") ?? ""
    
    var selectedStateIdProtocol = 0
    var selectedStateID = 0
    var selectedState = ""
    var selectedCityID = 0
    var selectedCityIdProtocol = 0
    var selectedCity = ""
    
    var VM = RegistrationVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.stopLoading()
        self.VM.VC = self
        self.mobileTF.delegate = self
        self.nameTF.setLeftPaddingPoints(13)
        self.mobileTF.setLeftPaddingPoints(13)
        self.commetsTF.setLeftPaddingPoints(13)
        self.selectStateLbl.text = "Select State"
        self.selectCityLbl.text = "Select City"
        
        NotificationCenter.default.addObserver(self, selector: #selector(redirectingToLogin), name: Notification.Name.redirectingToLogin, object: nil)
    }
    
    @objc func redirectingToLogin(){
        self.navigationController?.popViewController(animated: true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 10
        let currentString: NSString = (self.mobileTF.text ?? "") as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    
    
    
    @IBAction func mobileNumberDidEnd(_ sender: Any) {
        if self.mobileTF.text!.count == 0{
            DispatchQueue.main.async{
//                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
//                vc!.delegate = self
//                vc!.titleInfo = ""
//                vc!.descriptionInfo = "Enter mobile number"
//                vc!.modalPresentationStyle = .overCurrentContext
//                vc!.modalTransitionStyle = .crossDissolve
//                self.present(vc!, animated: true, completion: nil)
                self.view.makeToast("Enter mobile number", duration: 3.0, position: .bottom)
            }
        }else if self.mobileTF.text!.count != 10{
            DispatchQueue.main.async{
//                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
//                vc!.delegate = self
//                vc!.titleInfo = ""
//                vc!.descriptionInfo = "Enter valid mobile number"
//                vc!.modalPresentationStyle = .overCurrentContext
//                vc!.modalTransitionStyle = .crossDissolve
//                self.present(vc!, animated: true, completion: nil)
                self.view.makeToast("Enter valid mobile number", duration: 3.0, position: .bottom)
            }
        }else{
            let parameterJSON = [
                    "ActionType":"57",
                    "Location":[
                        "UserName":"\(self.mobileTF.text ?? "")"
                    ]
            ] as [String:Any]
            print(parameterJSON)
            self.VM.verifyUserExistency(parameters: parameterJSON)
        }
    }
    
    
    
    
    
    @IBAction func selectStateBtn(_ sender: Any) {
            if MyCommonFunctionalUtilities.isInternetCallTheApi() == false {
                DispatchQueue.main.async{
//                    let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
//                    vc!.delegate = self
//                        vc!.descriptionInfo = "No Internet"
//                    vc!.modalPresentationStyle = .overCurrentContext
//                    vc!.modalTransitionStyle = .crossDissolve
//                    self.present(vc!, animated: true, completion: nil)
                    self.view.makeToast("No Internet", duration: 3.0, position: .bottom)
                }
            }else{
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_DropDownVC") as? FG_DropDownVC
                vc!.delegate = self
                vc!.isComeFrom = 1
                vc!.modalPresentationStyle = .overCurrentContext
                vc!.modalTransitionStyle = .crossDissolve
                self.present(vc!, animated: true, completion: nil)
            }
        
    }
    
    @IBAction func selectCityBtn(_ sender: Any) {
        print(self.selectedStateID,"ID")
            if MyCommonFunctionalUtilities.isInternetCallTheApi() == false{
                DispatchQueue.main.async{
//                    let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
//                    vc!.delegate = self
//                        vc!.descriptionInfo = "No Internet"
//
//                    vc!.modalPresentationStyle = .overCurrentContext
//                    vc!.modalTransitionStyle = .crossDissolve
//                    self.present(vc!, animated: true, completion: nil)
                    
                    self.view.makeToast("No Internet", duration: 3.0, position: .bottom)
                }
            }else{
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_DropDownVC") as? FG_DropDownVC
                vc!.delegate = self
                vc!.isComeFrom = 2
                vc!.stateIDfromPreviousScreen = selectedStateID
                vc!.modalPresentationStyle = .overCurrentContext
                vc!.modalTransitionStyle = .crossDissolve
                self.present(vc!, animated: true, completion: nil)
            }
    }
    
    @IBAction func submitButton(_ sender: Any) {
        
        if nameTF.text == "" {
            DispatchQueue.main.async{
//                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
//                vc!.delegate = self
//                    vc!.descriptionInfo = "Please enter name"
//
//                vc!.modalPresentationStyle = .overCurrentContext
//                vc!.modalTransitionStyle = .crossDissolve
//                self.present(vc!, animated: true, completion: nil)
                self.view.makeToast("Please enter name", duration: 3.0, position: .bottom)
            }
        }else if mobileTF.text?.count == 0 {
            DispatchQueue.main.async{
//                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
//                vc!.delegate = self
//                vc!.descriptionInfo = "Please enter mobile number"
//                vc!.modalPresentationStyle = .overCurrentContext
//                vc!.modalTransitionStyle = .crossDissolve
//                self.present(vc!, animated: true, completion: nil)
                self.view.makeToast("Please enter mobile number", duration: 3.0, position: .bottom)
            }
        }else if selectStateLbl.text == "Select State" {
            DispatchQueue.main.async{
//                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
//                vc!.delegate = self
//                vc!.descriptionInfo = "Please select state"
//                vc!.modalPresentationStyle = .overCurrentContext
//                vc!.modalTransitionStyle = .crossDissolve
//                self.present(vc!, animated: true, completion: nil)
                self.view.makeToast("Please select state", duration: 3.0, position: .bottom)
            }
        }else if selectCityLbl.text == "Select City" {
            DispatchQueue.main.async{
//                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
//                vc!.delegate = self
//                vc!.descriptionInfo = "Please select city"
//                vc!.modalPresentationStyle = .overCurrentContext
//                vc!.modalTransitionStyle = .crossDissolve
//                self.present(vc!, animated: true, completion: nil)
                self.view.makeToast("Please select city", duration: 3.0, position: .bottom)
            }
        }else {
            self.registerationAPI()
        }
        
    }
    
    
    func registerationAPI(){
        let parameters = [
            "ActionType":"0",
            "QuerySummary":"\(commetsTF.text ?? "")",
            "CustomerMobile":"\(mobileTF.text ?? "")",
            "CustomerName":"\(nameTF.text ?? "")",
            "StateId":"\(selectedStateID)",
            "CityId":"\(selectedCityID)",
            "HelpTopicID":"1"
        ] as [String: Any]
        print(parameters)
        self.VM.myRegistrationAPI(parameter: parameters)
        
    }
    
    @IBAction func loginNowButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
