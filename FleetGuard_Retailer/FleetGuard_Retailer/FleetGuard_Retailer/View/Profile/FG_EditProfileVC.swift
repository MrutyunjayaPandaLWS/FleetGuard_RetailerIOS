//
//  FG_EditProfileVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 19/01/2023.
//

import UIKit
import LanguageManager_iOS

protocol EditDataDelegate {
    func updatedAddressDetails(_ vc: FG_EditProfileVC)
}


class FG_EditProfileVC: BaseViewController, DateSelectedDelegate, DropDownDelegate, popUpDelegate {
    func popupAlertDidTap(_ vc: FG_PopUpVC) {}
    
    func stateDidTap(_ vc: FG_DropDownVC) {
        self.selectedStateId = vc.selectedStateID
        self.selectSateLbl.text = vc.selectedState
        self.selectCityLbl.text = "Select"
        self.selectedCityId = -1
    }
    
    func cityDidTap(_ vc: FG_DropDownVC) {
        self.selectCityLbl.text = vc.selectedCity
        self.selectedCityId = vc.selectedCityID
    }
    
    func preferredLanguageDidTap(_ vc: FG_DropDownVC) {
        self.selectPreferredLanguage.text = vc.selectedLanguage
        self.selectedLanguageId = vc.selectedPreferredID
    }
    
    func genderDidTap(_ vc: FG_DropDownVC) {
        self.selectGenderLbl.text = vc.selectedGender
        genderName = vc.selectedGender
    }
    
    func titleDidTap(_ vc: FG_DropDownVC) {}
    
    func dealerDipTap(_ vc: FG_DropDownVC) {}
    
    func statusDipTap(_ vc: FG_DropDownVC) {}
    
    func redemptionStatusDidTap(_ vc: FG_DropDownVC) {}
    
    func helpTopicDidTap(_ vc: FG_DropDownVC) {}
    
    func acceptDate(_ vc: FG_DOBVC) {
        //if vc.isComeFrom == "1"{
            self.selectDOBLbl.text = vc.selectedDate
        dob = vc.selectedDate
//        }else{
//            print("ItsNotHappening")
//        }
    }
    func declineDate(_ vc: FG_DOBVC) {
        self.dismiss(animated: true)
    }
    

    @IBOutlet weak var headerLbl: UILabel!
    @IBOutlet weak var firstNameLbl: UILabel!
    @IBOutlet weak var lastNameLbl: UILabel!
    @IBOutlet weak var mobileNumberLbl: UILabel!
    @IBOutlet weak var emailAddessLbl: UILabel!
    @IBOutlet weak var dobLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!
    @IBOutlet weak var preferredLanguageLbl: UILabel!
    @IBOutlet weak var countryLbl: UILabel!
    @IBOutlet weak var stateLbl: UILabel!
    @IBOutlet weak var pincodeLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    
    @IBOutlet weak var selectCountryLbl: UILabel!
    @IBOutlet weak var selectGenderLbl: UILabel!
    @IBOutlet weak var selectDOBLbl: UILabel!
    @IBOutlet weak var savebtn: UIButton!
    
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var mobileTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var selectPreferredLanguage: UILabel!
    @IBOutlet weak var pincodeTF: UITextField!
    @IBOutlet weak var selectCityLbl: UILabel!
    @IBOutlet weak var selectSateLbl: UILabel!
    @IBOutlet var addressTF: UITextField!
    @IBOutlet var addressDataLbl: UILabel!
    
    var firstName = ""
    var lastName = ""
    var mobileNumber = ""
    var emailLbl = ""
    var addressLbl = ""
    var state = ""
    var city = ""
    var pincode = ""
    var dob = ""
    var prefLanguage = "Select Preferred Language"
    var genderName = ""
    
    
    var selectedStateId = -1
    var selectedCityId = -1
    var selectedLanguageId = -1
    var enteredMobileNumber = ""
    var genderArray:[String] = ["Male", "Female", "Don't want to show"]
    var titleArray:[String] = ["Mr.", "Ms.", "Mrs.", "Miss."]
    var itsFrom = ""
    var itsComeFrom = ""
    let userID = UserDefaults.standard.string(forKey: "UserID") ?? ""
    let loyaltyId = UserDefaults.standard.string(forKey: "LoyaltyId") ?? ""
    var profileDetails: ProfileDetailsModels?
    
    var addressId: Int = 0
    var customerTypeID = 0
    var customerType = 1
    var isactive = 1
    var loyaltyAutoGen = 1
    var merchantId = 1
    var countryId = -1
    var locationCode = 1
    
    var VM = EditProfileVM()
    
    var delegate: EditDataDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.VM.VC = self
        localization()
        self.firstNameTF.text = "\(firstName)"
        self.lastNameTF.text = lastName
        self.mobileTF.text = mobileNumber
        self.emailTF.text = emailLbl
        emailTF.keyboardType = .emailAddress
        self.selectSateLbl.text = state
        self.selectCityLbl.text = city
        self.pincodeTF.text = pincode
        self.selectDOBLbl.text = dob
        self.selectCountryLbl.text = "India"
        self.addressTF.text = self.addressLbl
        
        genderName == "-" ? (self.selectGenderLbl.text = "Select Gender") : (self.selectGenderLbl.text = genderName)
        dob == "-" ? (self.selectDOBLbl.text = "Select_DOB".localiz()) : (self.selectDOBLbl.text = dob)
        prefLanguage == "-" ? (self.selectPreferredLanguage.text = "Select Preferred Language") : (self.selectPreferredLanguage.text = prefLanguage)
        
        addressId = profileDetails?.lstCustomerJson?[0].addressId ?? 0
        customerTypeID = profileDetails?.lstCustomerJson?[0].customerTypeID ?? 54
        customerType = profileDetails?.lstCustomerJson?[0].customerId ?? 0
//        isactive = profileDetails?.lstCustomerJson?[0].isActive ?? 1
//        loyaltyAutoGen = profileDetails?.lstCustomerJson?[0].loyaltyIdAutoGen ?? 1
//        merchantId = profileDetails?.lstCustomerJson?[0].merchantId ?? 1
        countryId = profileDetails?.lstCustomerJson?[0].countryId ?? -1
        locationCode = profileDetails?.lstCustomerJson?[0].locationId ?? -1
        selectedStateId = profileDetails?.lstCustomerJson?[0].stateId ?? -1
        selectedCityId = profileDetails?.lstCustomerJson?[0].cityId ?? -1
    }
    
   
    
    private func localization(){
        self.headerLbl.text = "Profile".localiz()
        self.firstNameLbl.text = "First_Name".localiz()
        self.lastNameLbl.text = "Last_Name".localiz()
        self.mobileNumberLbl.text = "Mobilenumber".localiz()
        self.emailAddessLbl.text  = "Email_address".localiz()
        self.addressDataLbl.text = "Address".localiz()
        self.dobLbl.text = "DOB".localiz()
        self.genderLbl.text = "Gender".localiz()
        self.preferredLanguageLbl.text = "preferred_Language".localiz()
        self.countryLbl.text = "Country".localiz()
        self.stateLbl.text = "state".localiz()
        self.cityLbl.text = "city".localiz()
        self.pincodeLbl.text = "pincode".localiz()
        self.savebtn.setTitle("Save_changes".localiz(), for: .normal)
        
        
        
        
    }
    
    @IBAction func didTappedemailTF(_ sender: Any) {
        
        if emailTF.text?.count != 0{
            if emailTF.text?.isValidEmail == true{
                
            }else{
                self.view.makeToast("Please enter a valid email adress",duration: 2.0,position: .bottom)
                emailTF.text = ""
            }
        }
        
    }
    
    
    
    @IBAction func backBtn(_ sender: Any) {
        self.delegate?.updatedAddressDetails(self)
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func translateBtn(_ sender: Any) {
    }
    @IBAction func bellBtn(_ sender: Any) {
    }
    
    @IBAction func dobBtn(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_DOBVC") as? FG_DOBVC
        vc!.delegate = self
        vc!.isComeFrom = "DOB"
        vc!.modalPresentationStyle = .overCurrentContext
        vc!.modalTransitionStyle = .crossDissolve
        self.present(vc!, animated: true, completion: nil)
    }
    @IBAction func genderBtn(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_DropDownVC") as? FG_DropDownVC
        vc!.delegate = self
        vc!.isComeFrom = 5
        vc!.genderArray = genderArray
        vc!.modalPresentationStyle = .overCurrentContext
        vc!.modalTransitionStyle = .crossDissolve
        self.present(vc!, animated: true, completion: nil)
    }
    
    @IBAction func selectCountryBtn(_ sender: Any) {
        
    }
    
    @IBAction func preferredLanguageBtn(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_DropDownVC") as? FG_DropDownVC
        vc!.delegate = self
        vc!.isComeFrom = 6
        vc!.modalPresentationStyle = .overCurrentContext
        vc!.modalTransitionStyle = .crossDissolve
        self.present(vc!, animated: true, completion: nil)
    }
    
    @IBAction func selectStatebtn(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_DropDownVC") as? FG_DropDownVC
        vc!.delegate = self
        vc!.isComeFrom = 1
        vc!.modalPresentationStyle = .overCurrentContext
        vc!.modalTransitionStyle = .crossDissolve
        self.present(vc!, animated: true, completion: nil)
    }
    @IBAction func selectCityBtn(_ sender: Any) {
        
        if self.selectedStateId == -1{
            DispatchQueue.main.async{
                
                self.view.makeToast("Please_select_state".localiz(), duration: 3.0, position: .bottom)
            }
        }else{
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_DropDownVC") as? FG_DropDownVC
            vc!.delegate = self
            vc!.isComeFrom = 2
            vc!.stateIDfromPreviousScreen = selectedStateId
            vc!.modalPresentationStyle = .overCurrentContext
            vc!.modalTransitionStyle = .crossDissolve
            self.present(vc!, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func saveChangesBtn(_ sender: Any) {
        self.editDataAPI()
    }
    
    
    
    func editDataAPI(){
        let parameters : [String : Any] = [
            "ActionType": "4",
            "ActorId": "\(userID)",
            "IsMobileRequest": 1,
            "ObjCustomerDetails": [
                "Gender": genderName,
                "LanguageID": selectedLanguageId
            ],
            "ObjCustomerJson": [
                "Address1": addressTF.text ?? "",
                "AddressId": addressId,
                "CustomerId": customerType,
                "CustomerTypeID": customerTypeID,
                "Email": emailTF.text ?? "",
                "FirstName": firstNameTF.text ?? "",
                "LastName": lastNameTF.text ?? "",
                "IsActive": "1",
                "JDOB": dob,
                "LoyaltyIdAutoGen": 1,
                "MerchantId": 1,
                "CountryId": countryId,
                "LocationId": locationCode ,
                "Mobile": mobileTF.text ?? "",
                "RegStatusid": 1,
                "RegistrationSource": "3",
                "StateId": selectedStateId,
                "Zip": pincodeTF.text ?? "",
                "cityid": selectedCityId
            ]
        ]
//    ["ActionType":"4","ActorId":"8389","IsMobileRequest":1,"ObjCustomerDetails":["Gender":"","LanguageID":1],"ObjCustomerJson":["Address1":"CHANDWAD VADNER BHAIRAO NASHIK","AddressId":158261,"CustomerId":"70613","CustomerTypeID":55,"Email":"","FirstName":"Vivek","LastName":"Niphade","IsActive":"1","JDOB":"12/3/1998","LoyaltyIdAutoGen":"1","MerchantId":1,"CountryId":15,"LocationId":9213,"Mobile":"9145593821","RegStatusid":1,"RegistrationSource":"5","StateId":"376","Zip":"422003","cityid":"27826"]]
        
//        ["ObjCustomerDetails": ["Gender": "Male", "LanguageID": 2], "ObjCustomerJson": ["AddressId": 172489, "LastName": "Niphade", "FirstName": "Vivek", "RegStatusid": 1, "MerchantId": 1, "CustomerId": 75884, "JDOB": "19/06/1967", "CustomerTypeID": 55, "CountryId": 15, "RegistrationSource": "3", "StateId": 376, "Zip": "422003", "Mobile": "9145593821", "Address1": "MUMBAI AGRA ROAD SHOP NU 5 APP ASHOK LEYLAND SHOWROOM NASHIK", "IsActive": "1", "cityid": 26915, "Email": "hhhh@gmail.com", "LocationId": 10043, "LoyaltyIdAutoGen": 1], "ActionType": "4", "IsMobileRequest": 1, "ActorId": "91037"]
        
        print(parameters)
        self.VM.editProfileSubmissionAPI(paramters: parameters)
    }
    
    
    
    
}
