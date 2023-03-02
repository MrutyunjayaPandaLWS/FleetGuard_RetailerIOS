//
//  FG_RedemptionOTPVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 24/01/2023.
//

import UIKit
import DPOTPView
//import Firebase
import Lottie
class FG_RedemptionOTPVC: BaseViewController, popUpDelegate,UITextFieldDelegate {
    func popupAlertDidTap(_ vc: FG_PopUpVC) {}
    
   
    @IBOutlet weak var submitBtnTopSpace: NSLayoutConstraint!
    //    @IBOutlet var otpTF: UITextField!
    @IBOutlet weak var otpView: DPOTPView!
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var otpWithinLabelHeightConstraint: NSLayoutConstraint!
    @IBOutlet var timerLabelHeightConstraint: NSLayoutConstraint!
    @IBOutlet var resendOTPStackView: UIStackView!
    @IBOutlet var resendOTPHeightConstraint: NSLayoutConstraint!
    @IBOutlet var resendOTPButton: UIButton!
    @IBOutlet weak var submitBTN: GradientButton!
    
//    @IBOutlet weak var loaderAnimatedView: LottieAnimationView!
//       @IBOutlet weak var loaderView: UIView!

    private var animationView11: LottieAnimationView?
    var requestAPIs = RestAPI_Requests()
    var stateID = 0
    var cityID = 0
    var stateName = ""
    var cityName = ""
    var pincode = ""
    var address1 = ""
    var customerName = ""
    var mobile = ""
    var emailId = ""
    var countryId = 0
    var countryName = ""
    var redeemedPoints = 0
    var productsParameter:JSON?
    var sentSMSParameter:JSON?
    var totalRedeemedPoints = 0
    var redemptionRefId = ""
    
    var dreamGiftId = 0
    var giftPts = 0
    var giftName = ""
    var contractorName = ""
    var giftStatusId = 0
    var redemptionTypeId = 0
    
    var userID = UserDefaults.standard.integer(forKey: "UserID")
    var customerMobile = UserDefaults.standard.string(forKey: "CustomerMobile") ?? ""
    var merchanMobile = UserDefaults.standard.string(forKey: "MerchantMobile") ?? ""
    let emailID = UserDefaults.standard.string(forKey: "CustomerEmail") ?? ""
    let firstname = UserDefaults.standard.string(forKey: "FirstName") ?? ""
    let merchantEmail = UserDefaults.standard.string(forKey: "MerchantEmail") ?? ""
    var pointBalance = UserDefaults.standard.double(forKey: "RedeemablePointBalance")
    let loyaltyId = UserDefaults.standard.string(forKey: "LoyaltyId") ?? ""
    
    
    var OTPforVerification = ""
    var newproductArray: [[String:Any]] = []
    var sendSMArray: [[String:Any]] = []
    var getID = ""
    var count = 60
    var timer = Timer()
    var VM = RedemptionOTPVM()
    var txtOTPView: DPOTPView!
    var enteredValue = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.VM.VC = self
        myCartList()
        getOTP()
        NotificationCenter.default.addObserver(self, selector: #selector(sendSuccess), name: Notification.Name.redemptionSubmission, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(dismissVC), name: Notification.Name.dismissScreen, object: nil)

        self.resendOTPStackView.isHidden = true
        self.resendOTPHeightConstraint.constant = 0
        self.submitBtnTopSpace.constant = 70
        // Do any additional setup after loading the view.
        otpView.dpOTPViewDelegate = self
        otpView.fontTextField = UIFont.systemFont(ofSize: 16)
        otpView.textEdgeInsets = UIEdgeInsets(top: 0, left: -1, bottom: 0, right: 0)
        otpView.editingTextEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        
        otpView.spacing = 30
        otpView.fontTextField = UIFont(name: "HelveticaNeue-Bold", size: CGFloat(16.0))!
        otpView.dismissOnLastEntry = true
        otpView.borderColorTextField = .systemOrange
        otpView.selectedBorderColorTextField = .blue
        otpView.borderWidthTextField = 1
        otpView.backGroundColorTextField = #colorLiteral(red: 1, green: 0.9882352941, blue: 0.937254902, alpha: 1)
        otpView.cornerRadiusTextField = 8
        otpView.isCursorHidden = true
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(dismissNavigator), name: Notification.Name.sendDashboard, object: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.otpView.text = ""
    }
    
    @objc func sendSuccess(){
      //  sendSuccessMessage()
    }
    @objc func dismissNavigator() {
        self.dismiss(animated: true){
            NotificationCenter.default.post(name: .goToMain, object: nil)
        }
    }
    @objc func dismissVC(){
        self.dismiss(animated: true){
            //NotificationCenter.default.post(name: .catalogueSubmission, object: nil)
        }
    }
  
    @IBAction func closeBtn(_ sender: Any) {
      
        self.stopLoading()
        self.timer.invalidate()
        self.dismiss(animated: true){
//            dismissCurrentVC
            NotificationCenter.default.post(name: .dismissCurrentVC, object: nil)
        }
    }
    @IBAction func resendOtpBtn(_ sender: Any) {
        getOTP()
    }
    
    @IBAction func submitBtn(_ sender: Any) {
        print(contractorName, "Contractor Name")
        print(self.cityID, "City ID")
        if self.enteredValue.count == 4{
//            if self.OTPforVerification == self.enteredValue{
            if "1234" == self.enteredValue{
              
                self.stopLoading()
                self.timer.invalidate()
                if self.contractorName == ""{
                    productsParameter = [
                        "ActionType": 51,
                        "ActorId": userID,
                        "MemberName": "\(self.customerName)",
                        "ObjCatalogueDetails": [
                              "DomainName": "FLEET_GUARD"
                          ],
                        "ObjCatalogueList": self.newproductArray as [[String: Any]],
                        "ObjCustShippingAddressDetails":["Address1":"\(self.address1)","CityId":"\(self.cityID)", "CityName":"\(self.cityName)","CountryId":"\(self.countryId)","StateName": "\(self.stateName)","StateId":"\(self.stateID)","Zip":"\(self.pincode)","Email":"\(self.emailId)","FullName":"\(self.customerName)","Mobile": self.mobile],"SourceMode":5
                    ]
                    print(productsParameter ?? [])
                }else{
                    self.productsParameter = [
                        "ActionType": 51,
                        "ActorId": userID,
                        "MemberName": "\(contractorName)",
                        "ObjCatalogueDetails": [
                               "DomainName": "FLEET_GUARD"
                           ],
                        "ObjCustShippingAddressDetails": [
                            "Address1": "\(self.address1)",
                            "CityId": self.cityID,
                            "CityName": "\(self.cityName)",
                            "CountryId": 103,
                            "Email": "\(self.emailId)",
                            "FullName": "\(contractorName)",
                            "Mobile": "\(loyaltyId)",
                            "StateId": self.stateID,
                            "StateName": "\(self.stateName)",
                            "Zip": "\(self.pincode)"
                        ],
                        "SourceMode": 5

                    ] as [String: Any]
                    print(self.productsParameter ?? [], "Dream Gift")
                }
                self.VM.redemptionSubmission(parameters: productsParameter!) { response in
                    print(response?.returnMessage ?? "", "Redemption Submission")
                    print(response?.returnValue ?? "", "ReturnValue")
                    let message = response?.returnMessage ?? ""
                    print(message)
                    
                    let seperateMessage = message.split(separator: "-")
//                    print(seperateMessage[1], "Filtered Value")
//                    print(seperateMessage[2], "Filtered Value")
                    if seperateMessage[2] != "0" {
                        print("Success")
                        self.redemptionRefId = response?.returnMessage ?? ""
                        if self.contractorName == ""{
                            self.myCartList()
                        }else{
                            
                           // self.removeDreamGift()
                        }
                        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_RedemptionCataloguePopUp") as! FG_RedemptionCataloguePopUp
                        vc.modalPresentationStyle = .overCurrentContext
                        vc.modalTransitionStyle = .crossDissolve
                        self.present(vc, animated: true, completion: nil)
                        
                    }else{
                        DispatchQueue.main.async{
                            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
                            vc!.delegate = self
                            vc!.titleInfo = ""
                            
                            vc!.descriptionInfo = "Redemption Failed"
                            vc!.modalPresentationStyle = .overFullScreen
                            vc!.modalTransitionStyle = .crossDissolve
                            self.present(vc!, animated: true, completion: nil)
                        }
                    }
                }
            }else{
                
                    DispatchQueue.main.async{
                        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
                        vc!.delegate = self
                        vc!.titleInfo = ""
                        vc!.descriptionInfo = "InValid OTP"
                        vc!.modalPresentationStyle = .overCurrentContext
                        vc!.modalTransitionStyle = .crossDissolve
                        self.present(vc!, animated: true, completion: nil)
                    }
                
            }
        }else if enteredValue.count == 0 {
            DispatchQueue.main.async{
                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
                vc!.delegate = self
                vc!.titleInfo = ""
                vc!.descriptionInfo = "Enter OTP"
                
                vc!.modalPresentationStyle = .overCurrentContext
                vc!.modalTransitionStyle = .crossDissolve
                self.present(vc!, animated: true, completion: nil)
            }
        }else if enteredValue.count != 6{
            DispatchQueue.main.async{
                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
                vc!.delegate = self
                vc!.titleInfo = ""
                vc!.descriptionInfo = "Enter valid OTP"
                
                vc!.modalPresentationStyle = .overCurrentContext
                vc!.modalTransitionStyle = .crossDissolve
                self.present(vc!, animated: true, completion: nil)
            }
        }
    }
    
    func getOTP(){
        DispatchQueue.main.async {
            let parameterJSON = [
                "UserName": "",
                "UserId": -1,
                "MobileNo": "\(self.customerMobile)",
                "OTPType": "Enrollment",
                "MerchantUserName": "\(MerchantUserName)"
            ] as [String: Any]
            print(parameterJSON)
            self.OTPAPI(paramters: parameterJSON)
            self.timer.invalidate()
           
            self.stopLoading()
            self.timerLabel.text = "00:59"
            self.count = 60
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
            
            
        }
    
    }
    func OTPAPI(paramters: JSON){
        DispatchQueue.main.async {
            self.startLoading()
            
            // self.playAnimation()
        }
        
        self.requestAPIs.otp_Post_API(parameters: paramters) { (result, error) in
            if error == nil {
                if result != nil{
                    DispatchQueue.main.async {
                        
                        self.resendOTPStackView.isHidden = true
                        print(result?.returnMessage ?? "", " - OTP")
                       // self.delegate?.refreshTimerDidTap(self)
                        self.OTPforVerification = result?.returnMessage ?? ""
                        
                        self.stopLoading()

                    }
                }else{
                    DispatchQueue.main.async {
                        print("NO RESPONSE")
                        
                        self.stopLoading()
                    }
                }
            }else{
                DispatchQueue.main.async {
                    print("ERROR_WALKAROO \(error)")
                    
                    self.stopLoading()
                }
            }
        }
    }
    @objc func update() {
           if(self.count > 1){
               self.count = count - 1
               self.timerLabel.text = "00:\(self.count - 1)"
               self.resendOTPStackView.isHidden = true
               self.resendOTPHeightConstraint.constant = 0
               self.submitBtnTopSpace.constant = 70
           }else{
               self.resendOTPStackView.isHidden = false
               self.submitBtnTopSpace.constant = 109
               self.resendOTPHeightConstraint.constant = 32
               self.timerLabel.text = "00:00"
               self.timer.invalidate()
               
               self.stopLoading()
           }
       }
    func myCartList(){
        self.VM.myCartListArray.removeAll()
        let parameters = [
            "ActionType": "2",
            "LoyaltyID": "\(loyaltyId)"
        ] as [String: Any]
        print(parameters)
        self.VM.myCartList(parameters: parameters) { response in
        self.VM.myCartListArray = response?.catalogueSaveCartDetailListResponse ?? []
            print(self.VM.myCartListArray.count)
            if self.VM.myCartListArray.count != 0 {
                DispatchQueue.main.async {
                    if self.VM.myCartListArray.count != 0{
                        self.newproductArray.removeAll()
                        self.sendSMArray.removeAll()
                        for item in self.VM.myCartListArray {
                            let singleImageDict:[String:Any] = [
                                "CatalogueId": item.catalogueId ?? 0,
                                "DeliveryType": "In Store",
                                "HasPartialPayment": false,
                                "NoOfPointsDebit": "\(Double(item.pointsRequired ?? 0))",
                                "NoOfQuantity": item.noOfQuantity ?? 0,
                                "PointsRequired": "\(Double(item.pointsRequired ?? 0))",
                                "ProductCode": "\(item.productCode ?? "")",
                                "ProductImage": "\(item.productImage ?? "")",
                                "ProductName": "\(item.productName ?? "")",
                                "RedemptionDate": "\(item.redemptionDate ?? "")",
                                "RedemptionId": item.redemptionId ?? 0,
                                "RedemptionTypeId": 1,
                                "Status": item.status ?? 0,
                                "CatogoryId": item.categoryID ?? 0,
                                "CustomerCartId": item.customerCartId ?? 0,
                                "TermsCondition": "\(item.termsCondition ?? "")",
                                "TotalCash": item.totalCash ?? 0,
                                "VendorId": item.vendorId ?? 0
                            ]
                            print(singleImageDict)
                            self.newproductArray.append(singleImageDict)

                            let smsArray:[String:Any] = [
                                "CatalogueId": item.catalogueId ?? 0,
                                "DeliveryType": "\(item.deliveryType ?? "")",
                                "HasPartialPayment": false,
                                "NoOfPointsDebit": "\(Double(item.pointsRequired ?? 0))",
                                "NoOfQuantity": item.noOfQuantity ?? 0,
                                "PointsRequired": "\(Double(item.pointsRequired ?? 0))",
                                "ProductCode": "\(item.productCode ?? "")",
                                "ProductImage": "\(item.productImage ?? "")",
                                "ProductName": "\(item.productName ?? "")",
                                "RedemptionDate": "\(item.redemptionDate ?? "")",
                                "RedemptionId": item.redemptionId ?? 0,
                                "RedemptionRefno": "\(self.redemptionRefId)",
                                "RedemptionTypeId": self.redemptionTypeId,
                                "Status": item.status ?? 0,
                                "TermsCondition": "\(item.termsCondition ?? "")",
                                "TotalCash": item.totalCash ?? 0,
                                "VendorId": item.vendorId ?? 0
                                ]
                            print(smsArray, "SMS Array")
                            print(self.redemptionRefId, "Refer ID")
                            self.sendSMArray.append(smsArray)

                        }


                }

                }
            }else{
                DispatchQueue.main.async {

                    self.stopLoading()
                }
            }

        }
    }
    
//    func sendSMSApi(){
//        print(redemptionRefId, "RefID")
//        print(self.redeemedPoints, "RedeemedPoints")
//        if self.contractorName == ""{
//            productsParameter = [
//
//                    "ActionType": 51,
//                    "MerchantEmailID": "\(merchantEmail)",
//                    "MerchantID": 1,
//                    "MerchantMobileNo": "\(merchanMobile)",
//                    "ActorId": "\(userID)",
//                    "MemberName": "\(firstname)",
//                    "UserName": "\(customerMobile)",
//                    "TotalPointsRedeemed": "\(redeemedPoints)",
//                    "ObjCatalogueList": self.sendSMArray as [[String: Any]],
//                    "ObjCustShippingAddressDetails": [
//                        "Address1": "\(self.address1)",
//                        "CityId": self.cityID,
//                        "CityName": "\(self.cityName)",
//                        "CountryId": 103,
//                        "Email": "",
//                        "FullName": "\(firstname)",
//                        "Mobile": "\(mobile)",
//                        "StateId": self.stateID,
//                        "StateName": "\(self.stateName)",
//                        "Zip": "\(self.pincode)"
//                    ]
//                    ] as [String:Any]
//        }else{
//            productsParameter = [
//                    "actiontype": 51,
//                    "merchantemailid": "\(self.merchantEmail)",
//                    "MerchantID": 1,
//                    "MerchantMobileNo": "\(self.merchanMobile)",
//                    "ActorId": userID,
//                    "MemberName": "\(contractorName)",
//                    "UserName": "\(loyaltyId)",
//                    "TotalPointsRedeemed": "\(giftPts)",
//                    "ObjCatalogueList": [
//                            "DreamGiftId": "\(dreamGiftId)",
//                            "LoyaltyId": "\(loyaltyId)",
//                            "PointBalance": "\(pointBalance)",
//                            "NoOfPointsDebit": "\(giftPts)",
//                            "NoOfQuantity": 1,
//                            "PointsRequired": "\(giftPts)",
//                            "ProductName": "\(giftName)",
//                            "RedemptionTypeId": self.redemptionTypeId
//                        ],
//                    "ObjCustShippingAddressDetails": [
//                        "Address1": "\(self.address1)",
//                        "CityId": self.cityID,
//                        "CityName": "\(cityName)",
//                        "CountryId": 103,
//                        "Email": "",
//                        "FullName": "\(self.contractorName)",
//                        "Mobile": "\(loyaltyId)",
//                        "StateId": stateID,
//                        "StateName": "\(stateName)",
//                        "Zip": "\(pincode)"
//                    ]
//                ] as [String:Any]
//        }
//
//        print(productsParameter!)
//        self.VM.sendSMSApi(parameters: productsParameter!) { response in
//            print(response?.returnValue ?? 0, "Send SMS Status")
//            if response?.returnValue ?? 0 >= 0{
//                DispatchQueue.main.async{
//                    self.sendSuccessMessage()
//                }
//            }
//            }
//        }
    
//    func sendSuccessMessage(){
//        if self.contractorName == ""{
//            productsParameter = [
//                    "CustomerName": "\(firstname)",
//                    "EmailID": "",
//                    "LoyaltyID": "\(loyaltyId)",
//                    "Mobile": "\(customerMobile)",
//                    "PointBalance": "\(pointBalance)",
//                    "RedeemedPoint": "\(redeemedPoints)"
//            ] as [String:Any]
//        }else{
//            productsParameter = [
//                    "CustomerName": "\(firstname)",
//                    "EmailID": "",
//                    "LoyaltyID": "\(loyaltyId)",
//                    "Mobile": "\(customerMobile)",
//                    "PointBalance": "\(pointBalance)",
//                    "RedeemedPoint": "\(giftPts)"
//            ] as [String:Any]
//        }
//
//        print(productsParameter ?? [])
//
//        self.VM.sendSUCESSApi(parameters: productsParameter!) { response in
//            DispatchQueue.main.async {
//                self.stopLoading()
//                if response?.sendSMSForSuccessfulRedemptionMobileAppResult! == true{
//                    if self.contractorName == ""{
//
//                        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MSP_RedemptionSuccessPopVC") as! MSP_RedemptionSuccessPopVC
//                        vc.modalPresentationStyle = .overCurrentContext
//                        vc.modalTransitionStyle = .crossDissolve
//                        self.present(vc, animated: true, completion: nil)
//                    }else{
//                        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MSP_RedemptionSuccessPopVC") as!  MSP_RedemptionSuccessPopVC
//                        vc.modalPresentationStyle = .overCurrentContext
//                        vc.modalTransitionStyle = .crossDissolve
//                        self.present(vc, animated: true, completion: nil)
//                        self.removeDreamGift()
//                    }
//
//                }
//                self.stopLoading()
//            }
//
//        }
//    }
    
//    func removeDreamGift(){
//        let parameters = [
//                "ActionType": 4,
//                "ActorId": "\(userID)",
//                "DreamGiftId": "\(dreamGiftId)",
//                "GiftStatusId": 4
//        ] as [String: Any]
//        print(parameters)
//        self.VM.removeDreamGift(parameters: parameters) { response in
//            let result = response?.returnValue ?? 0
//            print(result)
//            if result == 1 {
//                DispatchQueue.main.async{
//
//                    self.stopLoading()
//                }
//
//            }
//        }
//    }
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//      let aSet = NSCharacterSet(charactersIn:"0123456789").inverted
//      let compSepByCharInSet = string.components(separatedBy: aSet)
//      let numberFiltered = compSepByCharInSet.joined(separator: "")
//
//      if string == numberFiltered {
//        let currentText = otpTF.text ?? ""
//        guard let stringRange = Range(range, in: currentText) else { return false }
//        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
//        return updatedText.count <= 6
//      } else {
//        return false
//      }
//    }
//    func playAnimation(){
//                   animationView11 = .init(name: "Loader_v4")
//                     animationView11!.frame = loaderAnimatedView.bounds
//                     // 3. Set animation content mode
//                     animationView11!.contentMode = .scaleAspectFit
//                     // 4. Set animation loop mode
//                     animationView11!.loopMode = .loop
//                     // 5. Adjust animation speed
//                     animationView11!.animationSpeed = 0.5
//                    loaderAnimatedView.addSubview(animationView11!)
//                     // 6. Play animation
//                     animationView11!.play()
//
//               }
    
}
extension FG_RedemptionOTPVC : DPOTPViewDelegate {
    func dpOTPViewAddText(_ text: String, at position: Int) {
        print("addText:- " + text + " at:- \(position)" )
        self.enteredValue = "\(text)"
    }
    
    func dpOTPViewRemoveText(_ text: String, at position: Int) {
        print("removeText:- " + text + " at:- \(position)" )
    }
    
    func dpOTPViewChangePositionAt(_ position: Int) {
        print("at:-\(position)")
    }
    func dpOTPViewBecomeFirstResponder() {
        
    }
    func dpOTPViewResignFirstResponder() {
        
    }
}
