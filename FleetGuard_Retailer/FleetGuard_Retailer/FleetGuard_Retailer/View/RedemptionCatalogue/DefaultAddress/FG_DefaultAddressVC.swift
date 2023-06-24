//
//  FG_DefaultAddressVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 24/01/2023.
//

import UIKit
import LanguageManager_iOS

class FG_DefaultAddressVC: BaseViewController, SendUpdatedAddressDelegate, popUpDelegate {
    func popupAlertDidTap(_ vc: FG_PopUpVC) {}
    
    func updatedAddressDetails(_ vc: FG_EditAddressVC) {
        self.selectedname = vc.selectedname
        self.selectedemail = vc.selectedemail
        self.selectedmobile = vc.selectedmobile
        self.selectedState = vc.selectedState
        self.selectedStateID = vc.selectedStateID
        self.selectedCity = vc.selectedCity
        self.selectedCityID = vc.selectedCityID
        self.selectedaddress = vc.selectedaddress
        self.selectedpincode = vc.selectedpincode
        self.selectedCountryId = 15
        self.selectedCountry = "India"
        self.addressTextView.text = "\(selectedname),\n\(self.selectedmobile),\n\(self.selectedaddress),\n\(self.selectedCity),\n\(self.selectedState),\n\(self.selectedCountry),\n\(self.selectedemail),\n\(self.selectedpincode)"
    }
    
    
    @IBOutlet weak var redeemablePointTitleLbl: UILabel!
    @IBOutlet weak var confirmBtn: UIButton!
    @IBOutlet weak var defaultAddressTitleLbl: UILabel!
    @IBOutlet weak var editAddressLbl: UILabel!
    @IBOutlet weak var headerLbl: UILabel!
    @IBOutlet weak var addressTextView: UITextView!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var redeemablepts: UILabel!
    var userId = UserDefaults.standard.string(forKey: "UserID") ?? ""
    var loyaltyId = UserDefaults.standard.string(forKey: "LoyaltyId") ?? ""
    var totalPoints = UserDefaults.standard.string(forKey: "totalEarnedPoints") ?? ""
    var totalPts = 0
    var VM = DefaultAddressVM()
    
    var selectedname = ""
    var selectedemail = ""
    var selectedmobile = ""
    var selectedState = ""
    var selectedStateID = -1
    var selectedCity = ""
    var selectedCityID = -1
    var selectedaddress = ""
    var selectedpincode = ""
    var selectedCountryId = -1
    var selectedCountry = ""
    var totalPoint = 0
//    var totalPoints = 0
    
    var dreamGiftID = 0
    var giftName = ""
    var contractorName = ""
    var giftStatusId = 0
    var redemptionTypeId = 0
    
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
            self.VM.VC = self
            self.profileDetailsApi()
            self.redeemablepts.text = "\(self.totalPts)"
            
            NotificationCenter.default.addObserver(self, selector: #selector(afterDismissed), name: Notification.Name.dismissCurrentVC, object: nil)
            
            NotificationCenter.default.addObserver(self, selector: #selector(goToMain), name: Notification.Name.goToMain, object: nil)
        }
    }
    
    func localization(){
        redeemablePointTitleLbl.text = "Redeemable_Points".localiz()
        confirmBtn.setTitle("Confirm_Order".localiz(), for: .normal)
        headerLbl.text = "redemption_catalogue".localiz()
        defaultAddressTitleLbl.text = "Default_Address".localiz()
        editAddressLbl.text = "Edit_Address".localiz()
    }
    
    
    @objc func goToMain(){
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func afterDismissed(){
        self.profileDetailsApi()
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func editAddressBtn(_ sender: Any) {
        if MyCommonFunctionalUtilities.isInternetCallTheApi() == false{
            DispatchQueue.main.async{
                let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "IOS_FG_Internet_Check") as! IOS_FG_Internet_Check
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: true)
            }
        }else{
            let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_EditAddressVC") as! FG_EditAddressVC
            vc.delegate = self
            vc.selectedname = self.VM.defaultAddressArray[0].firstName ?? "-"
            vc.selectedemail = self.VM.defaultAddressArray[0].email ?? "-"
            vc.selectedmobile = self.VM.defaultAddressArray[0].mobile ?? "-"
            vc.selectedState = self.VM.defaultAddressArray[0].stateName ?? "-"
            vc.selectedStateID = self.VM.defaultAddressArray[0].stateId ?? 0
            vc.selectedCity = self.VM.defaultAddressArray[0].cityName ?? "-"
            vc.selectedCityID = self.VM.defaultAddressArray[0].cityId ?? 0
            vc.selectedaddress = self.VM.defaultAddressArray[0].address1 ?? "-"
            vc.selectedpincode = self.VM.defaultAddressArray[0].zip ?? "-"
            vc.selectedCountryId = self.VM.defaultAddressArray[0].countryId ?? 0
            vc.selectedCountry = self.VM.defaultAddressArray[0].countryName ?? "-"
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func processToCheckOut(_ sender: Any) {
        if MyCommonFunctionalUtilities.isInternetCallTheApi() == false{
            DispatchQueue.main.async{
                let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "IOS_FG_Internet_Check") as! IOS_FG_Internet_Check
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: true)
            }
        }else{
            print(selectedStateID)
            print(selectedCityID)
            print(selectedaddress)
            print(selectedpincode)
            print(selectedmobile)
            
            if UserDefaults.standard.string(forKey: "verificationStatus") == "1"{
                if selectedStateID == -1 || selectedCityID == -1 || selectedaddress == "" || selectedpincode == "" || selectedmobile == ""{
                    DispatchQueue.main.async{
                        //                      let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
                        //                      vc!.delegate = self
                        //                      vc!.titleInfo = ""
                        //                      vc!.descriptionInfo = "Shipping address requires: State,City,Address,Pin code and Mobile Number,details,Click on 'Edit' to edit and add details"
                        //                      vc!.modalPresentationStyle = .overCurrentContext
                        //                      vc!.modalTransitionStyle = .crossDissolve
                        //                      self.present(vc!, animated: true, completion: nil)
                        
                        self.view.makeToast("Shipping_address_requires".localiz(), duration: 3.0, position: .bottom)
                    }
                }else{
                    let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_RedemptionOTPVC") as? FG_RedemptionOTPVC
                    vc!.stateID = self.selectedStateID
                    vc!.cityID = self.selectedCityID
                    vc!.stateName = self.selectedState
                    vc!.cityName = self.selectedCity
                    vc!.pincode = self.selectedpincode
                    vc!.address1 = self.selectedaddress
                    vc!.customerName = self.userNameLbl.text ?? ""
                    vc!.mobile = self.selectedmobile
                    vc!.emailId = self.selectedemail
                    vc!.countryId = self.selectedCountryId
                    vc!.countryName = self.selectedCountry
                    vc!.redeemedPoints = self.totalPoint
                    self.navigationController?.pushViewController(vc!, animated: true)
                }
                
            }else{
                DispatchQueue.main.async{
                    //                  let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
                    //                  vc!.delegate = self
                    //                  vc!.titleInfo = ""
                    //                  vc!.descriptionInfo = "Your account is unverified! Kindly contact the administrator to access the redemption Catalogue"
                    //                  vc!.modalPresentationStyle = .overCurrentContext
                    //                  vc!.modalTransitionStyle = .crossDissolve
                    //                  self.present(vc!, animated: true, completion: nil)
                    self.view.makeToast("your_account_is_unverified_for_redeemption".localiz(), duration: 3.0, position: .bottom)
                }
            }
            
        }
    }
    
    func profileDetailsApi(){
        let parameter = [
            "ActionType": "6",
            "CustomerId": "\(self.userId)"
        ] as [String: Any]
        self.VM.myProfileDetailsApi(parameter: parameter)
    }
    
}
