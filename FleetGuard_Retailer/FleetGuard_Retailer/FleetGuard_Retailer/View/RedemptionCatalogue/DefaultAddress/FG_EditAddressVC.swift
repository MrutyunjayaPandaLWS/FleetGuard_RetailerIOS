//
//  FG_EditAddressVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 24/01/2023.
//

import UIKit
import LanguageManager_iOS
protocol SendUpdatedAddressDelegate: NSObject {
    func updatedAddressDetails(_ vc: FG_EditAddressVC)
}

class FG_EditAddressVC: BaseViewController, UITextFieldDelegate, popUpDelegate, DropDownDelegate{
    func helpTopicDidTap(_ vc: FG_DropDownVC) {
    }
    
    
    func statusDipTap(_ vc: FG_DropDownVC) {}
    func redemptionStatusDidTap(_ vc: FG_DropDownVC) {}
    func stateDidTap(_ vc: FG_DropDownVC) {
        self.selectedStateIdProtocol = vc.selectedStateID
        self.selectedStateID = vc.selectedStateID
        self.stateLbl.text = vc.selectedState
        self.selectedState = vc.selectedState
        self.selectedCityID = 0
        self.selectedCityIdProtocol = 0
        self.selectCityLbl.text = "Select City"
    }
    
    func cityDidTap(_ vc: FG_DropDownVC) {
        //self.cityLbl.text = vc.selectedCity
        self.selectedCityIdProtocol = vc.selectedCityID
        self.selectedCityID = vc.selectedCityID
        self.selectCityLbl.text = vc.selectedCity
        self.selectedCity = vc.selectedCity
    }
    
    func preferredLanguageDidTap(_ vc: FG_DropDownVC) {
    }
    
    func genderDidTap(_ vc: FG_DropDownVC) {
    }
    
    func titleDidTap(_ vc: FG_DropDownVC) {}
    
    func dealerDipTap(_ vc: FG_DropDownVC) {}
    func popupAlertDidTap(_ vc: FG_PopUpVC) {}
    

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var mobileLbl: UILabel!
    @IBOutlet weak var mobileTF: UITextField!
    @IBOutlet weak var emailAddress: UILabel!
    @IBOutlet weak var emailAddressTF: UITextField!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var addressTF: UITextField!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var selectCountry: UILabel!
    
    @IBOutlet weak var headerLbl: UILabel!
    @IBOutlet weak var saveChangesBtn: UIButton!
    @IBOutlet weak var cityTitleLbl: UILabel!
    @IBOutlet weak var selectCityLbl: UILabel!
    @IBOutlet weak var stateLbl: UILabel!
    
    @IBOutlet weak var pincodeLbl: UILabel!
    
    @IBOutlet weak var pincodeTF: UITextField!
    
    
    var selectedStateIdProtocol = -1
    var selectedCityIdProtocol = -1
    
    var selectedname = ""
    var selectedemail = ""
    var selectedmobile = ""
    var selectedState = ""
    var selectedStateID = 0
    var countryId = 15
    var countryName = ""
    var selectedCity = ""
    var selectedCityID = 0
    var selectedaddress = ""
    var selectedpincode = ""
    var selectedCountryId = 0
    var selectedCountry = ""
    var isComeFrom = 0
    var userId = UserDefaults.standard.string(forKey: "UserID") ?? ""
    var loyaltyId = UserDefaults.standard.string(forKey: "LoyaltyId") ?? ""
    var totalPoints = UserDefaults.standard.string(forKey: "totalEarnedPoints") ?? ""
    var delegate: SendUpdatedAddressDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if MyCommonFunctionalUtilities.isInternetCallTheApi() == false{
            DispatchQueue.main.async{
                let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "IOS_FG_Internet_Check") as! IOS_FG_Internet_Check
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: true)
            }
        }else{
            localization()
            self.pincodeTF.keyboardType = .numberPad
            self.mobileTF.keyboardType = .numberPad
            self.pincodeTF.delegate = self
            self.mobileTF.delegate = self
            self.nameTF.text = selectedname
            self.mobileTF.text = selectedmobile
            self.emailAddressTF.text = selectedemail
            self.addressTF.text = selectedaddress
            self.selectCountry.text = "India"
            self.selectCountry.isEnabled = false
            self.stateLbl.text = selectedState
            self.selectCityLbl.text = selectedCity
            self.pincodeTF.text = selectedpincode
            emailAddressTF.keyboardType = .emailAddress
            
        }
    }
    
    private func localization(){
        nameLbl.text = "name".localiz()
        mobileLbl.text = "Mobilenumber".localiz()
        emailAddress.text = "Email_address".localiz()
        address.text = "Address".localiz()
        country.text = "Country".localiz()
        stateLbl.text = "state".localiz()
        cityTitleLbl.text = "city".localiz()
        pincodeLbl.text = "pincode".localiz()
        saveChangesBtn.setTitle("Save_changes".localiz(), for: .normal)
        headerLbl.text = "Edit_Address".localiz()
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func countryButton(_ sender: Any) {
    }
    
    @IBAction func stateBtn(_ sender: Any) {
        if self.selectedCountryId == 0{
            DispatchQueue.main.async{
//                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
//                vc!.delegate = self
//                vc!.descriptionInfo = "Select Country"
//                vc!.modalPresentationStyle = .overCurrentContext
//                vc!.modalTransitionStyle = .crossDissolve
//                self.present(vc!, animated: true, completion: nil)
                self.view.makeToast("Select Country", duration: 3.0, position: .bottom)
            }
        }else{
            if MyCommonFunctionalUtilities.isInternetCallTheApi() == false{
                DispatchQueue.main.async{
//                    let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
//                    vc!.delegate = self
//                        vc!.descriptionInfo = "No_Internet".localiz()
//                    vc!.modalPresentationStyle = .overCurrentContext
//                    vc!.modalTransitionStyle = .crossDissolve
//                    self.present(vc!, animated: true, completion: nil)
                    self.view.makeToast("No_Internet".localiz(), duration: 4.0, position: .bottom)
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
//
    }
    
    @IBAction func cityBtn(_ sender: Any) {
        print(self.selectedStateID,"ID")
        if self.selectedStateID == 0 || self.selectedCountryId == 0{
            DispatchQueue.main.async{
//                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
//                vc!.delegate = self
//                    vc!.descriptionInfo = "Select State"
//                vc!.modalPresentationStyle = .overCurrentContext
//                vc!.modalTransitionStyle = .crossDissolve
//                self.present(vc!, animated: true, completion: nil)
                self.view.makeToast("Please_select_state".localiz(), duration: 3.0, position: .bottom)
            }
        }else{
            if MyCommonFunctionalUtilities.isInternetCallTheApi() == false{
                DispatchQueue.main.async{
//                    let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
//                    vc!.delegate = self
//                        vc!.descriptionInfo = "No_Internet".localiz()
//
//                    vc!.modalPresentationStyle = .overCurrentContext
//                    vc!.modalTransitionStyle = .crossDissolve
//                    self.present(vc!, animated: true, completion: nil)
                    
                    self.view.makeToast("No_Internet".localiz(), duration: 4.0, position: .bottom)
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
    }
    
    @IBAction func saveChangesBtn(_ sender: Any) {
        
        if nameTF.text?.count == 0{
            DispatchQueue.main.async{
//                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
//                vc!.delegate = self
//                vc!.descriptionInfo = "Enter Name"
//                vc!.modalPresentationStyle = .overFullScreen
//                vc!.modalTransitionStyle = .crossDissolve
//                self.present(vc!, animated: true, completion: nil)
                
                self.view.makeToast("Please_enter_name".localiz(), duration: 3.0, position: .bottom)
            }

        }else if mobileTF.text?.count == 0 {
            DispatchQueue.main.async{
//                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
//                vc!.delegate = self
//                vc!.descriptionInfo = "Enter Mobile Number"
//                vc!.modalPresentationStyle = .overFullScreen
//                vc!.modalTransitionStyle = .crossDissolve
//                self.present(vc!, animated: true, completion: nil)
                self.view.makeToast("Enteryourmobilenumber".localiz(), duration: 3.0, position: .bottom)
            }

        }else if mobileTF.text?.count != 10 {
            DispatchQueue.main.async{
//                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
//                vc!.delegate = self
//                vc!.descriptionInfo = "Enter Valid Mobile Number"
//                vc!.modalPresentationStyle = .overFullScreen
//                vc!.modalTransitionStyle = .crossDissolve
//                self.present(vc!, animated: true, completion: nil)
                
                self.view.makeToast("Enter_valid_mobile_number".localiz(), duration: 3.0, position: .bottom)
            }

        }
//        else if emailTF.text?.count == 0{
//            DispatchQueue.main.async{
//                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "PopupAlertOne_VC") as? PopupAlertOne_VC
//                vc!.delegate = self
//                vc!.titleInfo = ""
//                vc!.descriptionInfo = "Enter EmailID"
//                vc!.modalPresentationStyle = .overFullScreen
//                vc!.modalTransitionStyle = .crossDissolve
//                self.present(vc!, animated: true, completion: nil)
//            }
//
//        }
//        else  if !isValidEmail(emailTF.text ?? "") {
//            DispatchQueue.main.async{
//                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "PopupAlertOne_VC") as? PopupAlertOne_VC
//                vc!.delegate = self
//                vc!.titleInfo = ""
//                vc!.descriptionInfo = "Enter Valid EmailID"
//                vc!.modalPresentationStyle = .overCurrentContext
//                vc!.modalTransitionStyle = .crossDissolve
//                self.present(vc!, animated: true, completion: nil)
//                }
//            }
       else if addressTF.text?.count == 0{
            DispatchQueue.main.async{
//                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
//                vc!.delegate = self
//                    vc!.descriptionInfo = "Enter Address"
//
//                vc!.modalPresentationStyle = .overFullScreen
//                vc!.modalTransitionStyle = .crossDissolve
//                self.present(vc!, animated: true, completion: nil)
                
                self.view.makeToast("Enter_Address".localiz(), duration: 3.0, position: .bottom)
            }

       }else if self.stateLbl.text == "Select State" || self.stateLbl.text == "" || self.stateLbl.text == nil{
            DispatchQueue.main.async{
//                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
//                vc!.delegate = self
//                    vc!.descriptionInfo = "Select State"
//
//                vc!.modalPresentationStyle = .overFullScreen
//                vc!.modalTransitionStyle = .crossDissolve
//                self.present(vc!, animated: true, completion: nil)
                
                self.view.makeToast("Please_select_state".localiz(), duration: 3.0, position: .bottom)
            }

       }else if self.selectCityLbl.text == "Select City" || self.selectCityLbl.text == "" || self.selectCityLbl.text == nil{
            DispatchQueue.main.async{
//                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
//                vc!.delegate = self
//                    vc!.descriptionInfo = "Select City"
//
//                vc!.modalPresentationStyle = .overFullScreen
//                vc!.modalTransitionStyle = .crossDissolve
//                self.present(vc!, animated: true, completion: nil)
                
                self.view.makeToast("Please_select_city".localiz(), duration: 3.0, position: .bottom)
            }

        }else if pincodeTF.text?.count == 0{
            DispatchQueue.main.async{
//                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
//                vc!.delegate = self
//                    vc!.descriptionInfo = "Enter Pin"
//
//                vc!.modalPresentationStyle = .overFullScreen
//                vc!.modalTransitionStyle = .crossDissolve
//                self.present(vc!, animated: true, completion: nil)
                
                self.view.makeToast("Enter_Pin".localiz(), duration: 3.0, position: .bottom)
            }

        }else if pincodeTF.text?.count != 6{
            DispatchQueue.main.async{
//                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
//                vc!.delegate = self
//                vc!.descriptionInfo = "Enter Valid Zip"
//                vc!.modalPresentationStyle = .overFullScreen
//                vc!.modalTransitionStyle = .crossDissolve
//                self.present(vc!, animated: true, completion: nil)
                
                self.view.makeToast("Enter_Valid_Zip".localiz(), duration: 3.0, position: .bottom)
            }

        }else{
          print(self.addressTF.text ?? "")
            print(self.mobileTF.text ?? "")
            print(self.emailAddressTF.text ?? "")
            print(self.selectedCity)
            print(self.selectedState)
            print(self.pincodeTF.text ?? "")

            self.selectedname = self.nameTF.text ?? ""
            self.selectedmobile = self.mobileTF.text ?? ""
            self.selectedemail = self.emailAddressTF.text ?? ""
            self.selectedpincode = self.pincodeTF.text ?? ""
            self.selectedaddress = self.addressTF.text ?? ""
           self.delegate?.updatedAddressDetails(self)
            self.navigationController?.popViewController(animated: true)
        }
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
      let aSet = NSCharacterSet(charactersIn:"0123456789").inverted
      let compSepByCharInSet = string.components(separatedBy: aSet)
      let numberFiltered = compSepByCharInSet.joined(separator: "")
      if string == numberFiltered {
          if textField == mobileTF{
              let currentText = mobileTF.text ?? ""
              guard let stringRange = Range(range, in: currentText) else { return false }
              let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
              return updatedText.count <= 10
          }else if textField == pincodeTF {
              let currentText = pincodeTF.text ?? ""
              guard let stringRange = Range(range, in: currentText) else { return false }
              let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
              return updatedText.count <= 6
          }
      
      } else {
        return false
      }
        return false
    }
    func isValidPhone(testStr:String) -> Bool {
        let phoneRegEx = "^[6-9]\\d{9}$"
        let phoneNumber = NSPredicate(format:"SELF MATCHES %@", phoneRegEx)
        return phoneNumber.evaluate(with: testStr)
    }
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

}
