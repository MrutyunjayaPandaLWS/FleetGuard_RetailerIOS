//
//  FG_SideMenuVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 18/01/2023.
//

import UIKit
import SlideMenuControllerSwift
import LanguageManager_iOS
import Photos
class FG_SideMenuVC: BaseViewController, popUpDelegate {
    func popupAlertDidTap(_ vc: FG_PopUpVC) {
        self.closeLeft()
        
        UserDefaults.standard.set(false, forKey: "IsloggedIn?")
        let languageStatus = UserDefaults.standard.string(forKey: "LanguageName") ?? ""
        if #available(iOS 13.0, *) {
            DispatchQueue.main.async {
                let pushID = UserDefaults.standard.string(forKey: "UD_DEVICE_TOKEN") ?? ""
                let domain = Bundle.main.bundleIdentifier!
                UserDefaults.standard.removePersistentDomain(forName: domain)
                UserDefaults.standard.set(true, forKey: "AfterLog")
                UserDefaults.standard.set(languageStatus, forKey: "LanguageName")
                UserDefaults.standard.setValue(pushID, forKey: "UD_DEVICE_TOKEN")
                UserDefaults.standard.synchronize()
                let sceneDelegate = self.view.window?.windowScene?.delegate as! SceneDelegate
                sceneDelegate.setInitialViewAsRootViewController()
             //   self.clearTable2()
            }
        } else {
            DispatchQueue.main.async {
                let pushID = UserDefaults.standard.string(forKey: "UD_DEVICE_TOKEN") ?? ""
                let domain = Bundle.main.bundleIdentifier!
                UserDefaults.standard.removePersistentDomain(forName: domain)
                UserDefaults.standard.set(true, forKey: "AfterLog")
                UserDefaults.standard.set(languageStatus, forKey: "LanguageName")
                UserDefaults.standard.synchronize()
                UserDefaults.standard.setValue(pushID, forKey: "UD_DEVICE_TOKEN")
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.setInitialViewAsRootViewController()
                
              //  self.clearTable2()
            }
        }
    }
    

    @IBOutlet weak var sideMenuTableHeight: NSLayoutConstraint!
    @IBOutlet weak var passbookNumber: UILabel!
    @IBOutlet weak var passbookNum: UILabel!
    @IBOutlet weak var totalBalance: UILabel!
    @IBOutlet weak var totalBalanceLbl: UILabel!
    @IBOutlet weak var sinceLbl: UILabel!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var sideMenuTableView: UITableView!
    var requestApis = RestAPI_Requests()
    var parameters: JSON?
    var sideMenuArray = [ "Profile", "My_Earnings", "My_Redemption_History", "Redemption_Catalogue", "My_Milestone_Redemption", "My_Promotions", "RPL_Statement", "My_Orders", "My_Billings", "Lodge_Query", "About", "FAQs", "T&C", "Logout","Delete"]
    
    var sideMenuTitleArray = [String]()
    var userId = UserDefaults.standard.string(forKey: "UserID") ?? ""
    var loyaltyId = UserDefaults.standard.string(forKey: "LoyaltyId") ?? ""
    var userSince = UserDefaults.standard.string(forKey: "MemberSince") ?? "-"
    var VM = FG_DashboardVM()
    var pointBalence = [ObjCustomerDashboardList11]()
    let picker = UIImagePickerController()
    var strdata1 = "", maintanance = ""
//    UserDefaults.standard.set(result?.objCustomerDashboardList?[0].redeemablePointsBalance, forKey: "redeemablePointsBalance")
//    self.VC?.totalValue.text = "\(result?.objCustomerDashboardList?[0].totalEarnedPoints ?? 0)"
//    UserDefaults.standard.set(result?.objCustomerDashboardList?[0].totalEarnedPoints, forKey: "totalEarnedPoints")
    let redeemablePointsBalance = UserDefaults.standard.string(forKey: "redeemablePointsBalance") ?? "0"
    let totalEarnedPoints = UserDefaults.standard.string(forKey: "totalEarnedPoints") ?? "0"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.VM.VC1 = self
        picker.delegate = self
        self.sideMenuTableView.delegate = self
        self.sideMenuTableView.dataSource = self
        //self.sideMenuTableView.reloadData()
        self.maintenanceAPI()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if MyCommonFunctionalUtilities.isInternetCallTheApi() == false{
            DispatchQueue.main.async{
                let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "IOS_FG_Internet_Check") as! IOS_FG_Internet_Check
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: true)
            }
        }else{
            self.menuTitleArray()
            print(CGFloat(sideMenuArray.count * 50))
            self.sideMenuTableHeight.constant = 750
            localization()
            dashboardApi()
            pointsAPI()
        }
    }
    
    private func localization(){
        self.passbookNum.text = "Retailer_code".localiz()
        self.totalBalanceLbl.text = "RLP_No".localiz()
        
        
    }
    
    
    @IBAction func didTappedProfileImageUpdate(_ sender: Any) {
        let alert = UIAlertController(title: "Choose any option", message: "", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default , handler:{ (UIAlertAction)in
            self.openCamera()
        }))
        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler:{ (UIAlertAction)in
            self.openGallery()
        }))
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler:{ (UIAlertAction)in
        }))
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
    }
    
    
    func dashboardApi(){
        let parameter = [
            "ActorId":"\(self.userId)"
        ] as [String: Any]
        print(parameter)
        self.requestApis.dashboardApi(parameters: parameter) { (result, error) in
            if error == nil{
                self.stopLoading()
                if result != nil{
                    self.stopLoading()
                DispatchQueue.main.async {
                   let dashboardDetails = result?.objCustomerDashboardList ?? []
                    if dashboardDetails.count != 0 {
                        self.userNameLbl.text = result?.lstCustomerFeedBackJsonApi?[0].firstName ?? "-"
                        self.passbookNumber.text = result?.lstCustomerFeedBackJsonApi?[0].loyaltyId ?? "-"
                        //self.totalBalance.text = "\(self.totalEarnedPoints)"
                        self.totalBalance.text = "\(result?.lstCustomerFeedBackJsonApi?[0].passBookNumber ?? "-")"
                        let imageData = (result?.lstCustomerFeedBackJsonApi?[0].customerImage)?.dropFirst(1) ?? ""
                        self.profileImage.kf.setImage(with: URL(string: "\(Promo_ImageData)\(imageData)"), placeholder: UIImage(named: "ic_default_img"));
                        self.sinceLbl.text = "\("Since".localiz()) \(result?.objCustomerDashboardList?[0].memberSince ?? "")"
                    }
                    self.stopLoading()
                }
                }else{
                    DispatchQueue.main.async {
                    self.stopLoading()
                    }
                }
            }else{
                DispatchQueue.main.async {
                self.stopLoading()
                }
            }
        }
        
    }
    func pointsAPI(){
        UserDefaults.standard.set(false, forKey: "AfterLog")
        UserDefaults.standard.synchronize()
        let parameters = [
              "ActionType": "1",
              "LoyaltyId": "\(loyaltyId)"
        ] as [String: Any]
        print(parameters)
        self.requestApis.pointBalenceAPI(parameters: parameters) { (result, error) in
            if error == nil{
                if result != nil{
                DispatchQueue.main.async {
                    self.stopLoading()
                    self.pointBalence = result?.objCustomerDashboardList ?? []
                    
                    if result?.objCustomerDashboardList?.count != 0 {
                       // self.totalBalance.text = "\(result?.objCustomerDashboardList?[0].totalEarnedPoints ?? 0)"
                        
//                        self.totalBalance.text = "\(result?.lstCustomerFeedBackJsonApi?[0].passBookNumber ?? 0)"
                        UserDefaults.standard.set(true, forKey: "AfterLog")
                        UserDefaults.standard.synchronize()
                    }
                   
                }
                }else{
                    DispatchQueue.main.async {
                    self.stopLoading()
                    }
                }
            }else{
                DispatchQueue.main.async {
                self.stopLoading()
                }
            }
        }
        
    }
    
    func menuTitleArray(){
        self.sideMenuTitleArray.removeAll()
        for data in self.sideMenuArray{
            sideMenuTitleArray.append(data)
        }
        self.sideMenuTableView.reloadData()
       
    }
    
//    func dashboardAPI() {
//        DispatchQueue.main.asyncAfter(deadline: .now()+0.3, execute: {
//          self.startLoading()
//        let parameters = [
//            "ActorId":"\(userId)"
//        ] as [String: Any]
//        print(parameters,"Dash")
//        self.VM.dashboardApi(parameters: parameters) { (response, error) in
//
//            DispatchQueue.main.async {
//                self.userNameLbl.text = response?.lstCustomerFeedBackJsonApi?[0].firstName ?? "-"
//                let customerImage = String(response?.lstCustomerFeedBackJsonApi?[0].customerImage ?? "").dropFirst(1)
//
//                let imageData = customerImage.split(separator: "~")
//                if imageData.count >= 2 {
//                    print(imageData[1],"jdsnjkdn")
//                    let totalImgURL = PROMO_IMG1 + (imageData[1])
//                    print(totalImgURL, "Total Image URL")
//                    //self.profileImage.kf_setImage(with: URL(string: totalImgURL), placeholderImage: UIImage(named: "icons8-life-cycle-96"))
//                }else{
//                    let totalImgURL = PROMO_IMG1 + customerImage
//                    print(totalImgURL, "Total Image URL")
//                    self.userImage.sd_setImage(with: URL(string: totalImgURL), placeholderImage: UIImage(named: "icons8-life-cycle-96"))
//                }
//                self.customerIDLbl.text = response?.lstCustomerFeedBackJsonApi?[0].loyaltyId ?? ""
//                self.totalPointsLbl.text = "Total Points \(response?.objCustomerDashboardList?[0].totalRedeemed ?? 0)"
//                self.loaderView.isHidden = true
//                self.stopLoading()
//            }
//        }
//    })
//}
    func maintenanceAPI(){
        guard let url = URL(string: "http://appupdate.arokiait.com/updates/serviceget?pid=com.loyaltyWorks.Fleet-Guard-Samriddhi") else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                  error == nil else {
                print(error?.localizedDescription ?? "Response Error")
                return }
            do{
                //here dataResponse received from a network request
                let jsonResponse = try JSONSerialization.jsonObject(with:dataResponse, options: [])
                print(jsonResponse)
                let isMaintenanceValue = ((jsonResponse as AnyObject).value(forKeyPath: "Result.is_maintenance") as? String)
                let forceupdatevalue = ((jsonResponse as AnyObject).value(forKeyPath: "Result.version_number") as? String)
                print(forceupdatevalue)
                if isMaintenanceValue == "1"{
                    print(isMaintenanceValue)
                    DispatchQueue.main.async {
//                        self.maintananceView.isHidden = false
//                        self.playAnimation()
                        self.maintanance = "1"

                    }
                }else if isMaintenanceValue == "0"{
//                    self.tokendata()
//                    self.animationView?.stop()
                }
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
    }
    
    
    
    
}
extension FG_SideMenuVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sideMenuTitleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FG_SideMenuTVC", for: indexPath) as! FG_SideMenuTVC
        cell.titleLbl.text = self.sideMenuTitleArray[indexPath.row].localiz()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            self.closeLeft()
            let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_MyProfileVC") as! FG_MyProfileVC
            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 1{
            self.closeLeft()
            let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_MyEarningVC") as! FG_MyEarningVC
            vc.itsFrom = "SideMenu"
            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 2{
            self.closeLeft()
            let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_MyRedemptionVC") as! FG_MyRedemptionVC
            vc.itsFrom = "SideMenu"
            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 3{
            self.closeLeft()
            let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_RedemptionCatalogueVC") as! FG_RedemptionCatalogueVC
            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 4{
            self.closeLeft()
            let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_MyMilestoneRedemptionVC") as! FG_MyMilestoneRedemptionVC
            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 5{
            self.closeLeft()
            let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_MyPromotionsVC") as! FG_MyPromotionsVC
            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 6{
            self.closeLeft()
            let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "RPLStatementVC") as! RPLStatementVC
            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 7{
            self.closeLeft()
            let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_MyOrdersVC") as! FG_MyOrdersVC
            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 8{
            self.closeLeft()
            let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_MyBillingsVC") as! FG_MyBillingsVC
            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 9{
            self.closeLeft()
            let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_LodgeQueryVC") as! FG_LodgeQueryVC
            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 10{
            self.closeLeft()
            let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_AboutVC") as! FG_AboutVC
            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 11{
            self.closeLeft()
            let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_FAQsVC") as! FG_FAQsVC
            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 12{
            self.closeLeft()
            let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_TermsandconditionsVC") as! FG_TermsandconditionsVC
            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 13{
            self.closeLeft()
            
            UserDefaults.standard.set(false, forKey: "IsloggedIn?")
            let languageStatus = UserDefaults.standard.string(forKey: "LanguageName") ?? ""
            if #available(iOS 13.0, *) {
                DispatchQueue.main.async {
                    let pushID = UserDefaults.standard.string(forKey: "UD_DEVICE_TOKEN") ?? ""
                    let domain = Bundle.main.bundleIdentifier!
                    UserDefaults.standard.removePersistentDomain(forName: domain)
                    UserDefaults.standard.set(true, forKey: "AfterLog")
                    UserDefaults.standard.set(languageStatus, forKey: "LanguageName")
                    UserDefaults.standard.synchronize()
                    UserDefaults.standard.setValue(pushID, forKey: "UD_DEVICE_TOKEN")
                    let sceneDelegate = self.view.window?.windowScene?.delegate as! SceneDelegate
                    sceneDelegate.setInitialViewAsRootViewController()
                 //   self.clearTable2()
                }
            } else {
                DispatchQueue.main.async {
                    let pushID = UserDefaults.standard.string(forKey: "UD_DEVICE_TOKEN") ?? ""
                    let domain = Bundle.main.bundleIdentifier!
                    UserDefaults.standard.removePersistentDomain(forName: domain)
                    UserDefaults.standard.set(true, forKey: "AfterLog")
                    UserDefaults.standard.set(languageStatus, forKey: "LanguageName")
                    UserDefaults.standard.synchronize()
                    UserDefaults.standard.setValue(pushID, forKey: "UD_DEVICE_TOKEN")
                    if #available(iOS 13.0, *) {
                        let appDelegate = UIApplication.shared.delegate as! AppDelegate
                        appDelegate.setInitialViewAsRootViewController()
                    } else {
                        // Fallback on earlier versions
                    }
                    
                  //  self.clearTable2()
                }
            }
        }else if indexPath.row == 14{
            print("did tapped delet account")
            deleteAccount()
        }
        
    }

    func deleteAccount(){
        if MyCommonFunctionalUtilities.isInternetCallTheApi() == false{
            DispatchQueue.main.async{

                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
                vc!.descriptionInfo = "No_Internet".localiz()
                vc!.itsComeFrom = ""
                vc!.modalPresentationStyle = .overCurrentContext
                vc!.modalTransitionStyle = .crossDissolve
                self.present(vc!, animated: true, completion: nil)
                
            }
        }else{
            let alert = UIAlertController(title: "", message: "are_sure_delete_account".localiz(), preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { UIAlertAction in
            self.parameters = [
                "ActionType": 1,
                "userid":"\(self.userId)"
            ] as [String : Any]
            print(self.parameters!)
                self.VM.deleteAccount(parameters: self.parameters!) { response in
                    DispatchQueue.main.async {
                        print(response?.returnMessage ?? "-1")
                        if response?.returnMessage ?? "-1" == "1"{
                            DispatchQueue.main.async{
                                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
                                vc!.delegate = self
                                vc!.descriptionInfo = "Account_deleted_successfully".localiz()
                                vc!.itsComeFrom = "AccounthasbeenDeleted"
                                vc!.modalPresentationStyle = .overCurrentContext
                                vc!.modalTransitionStyle = .crossDissolve
                                self.present(vc!, animated: true, completion: nil)
                                }
                        }else{
                            DispatchQueue.main.async{
                                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
                                vc!.delegate = self
                                vc!.descriptionInfo = "Something_went_wrong_error".localiz()
                                vc!.itsComeFrom = ""
                                vc!.modalPresentationStyle = .overCurrentContext
                                vc!.modalTransitionStyle = .crossDissolve
                                self.present(vc!, animated: true, completion: nil)
                                
                                }
                        }
                      self.stopLoading()
                        }
                }
        }))
            alert.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)

        }

    }
    
    
}


extension FG_SideMenuVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func openGallery() {
        PHPhotoLibrary.requestAuthorization({
            (newStatus) in
            if newStatus ==  PHAuthorizationStatus.authorized {
                DispatchQueue.main.async {
                    self.picker.allowsEditing = false
                    self.picker.sourceType = .savedPhotosAlbum
                    self.picker.mediaTypes = ["public.image"]
                    self.present(self.picker, animated: true, completion: nil)
                }
            }else{
                DispatchQueue.main.async {
                    let alertVC = UIAlertController(title: "Need Gallary access", message: "Allow Gallery access", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "Allow", style: UIAlertAction.Style.default) {
                        UIAlertAction in
                        DispatchQueue.main.async {
                            UIApplication.shared.open(URL.init(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
                        }
                    }
                    let cancelAction = UIAlertAction(title: "DisAllow", style: UIAlertAction.Style.cancel) {
                        UIAlertAction in

                    }
                    alertVC.addAction(okAction)
                    alertVC.addAction(cancelAction)
                    self.present(alertVC, animated: true, completion: nil)

                }
            }
        })
    }

    func openCamera(){
        DispatchQueue.main.async {
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                AVCaptureDevice.requestAccess(for: AVMediaType.video) { response in
                    if response {
                        if AVCaptureDevice.authorizationStatus(for: AVMediaType.video) ==  AVAuthorizationStatus.authorized {
                            DispatchQueue.main.async {

                                self.picker.allowsEditing = false
                                self.picker.sourceType = .camera
                                self.picker.mediaTypes = ["public.image"]
                                self.present(self.picker,animated: true,completion: nil)
                            }
                        }
                    } else {
                        DispatchQueue.main.async {
                            let alertVC = UIAlertController(title: "Need Camera access", message: "Allow", preferredStyle: .alert)
                            let okAction = UIAlertAction(title: "Allow", style: UIAlertAction.Style.default) {
                                UIAlertAction in
                                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                            }
                            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) {
                                UIAlertAction in
                            }
                            alertVC.addAction(okAction)
                            alertVC.addAction(cancelAction)
                            self.present(alertVC, animated: true, completion: nil)

                        }
                    }
                }} else {
                    DispatchQueue.main.async {
                        self.noCamera()
                    }
                }
        }

    }


    func opencamera() {
        DispatchQueue.main.async {
            if AVCaptureDevice.authorizationStatus(for: AVMediaType.video) ==  AVAuthorizationStatus.authorized {
                DispatchQueue.main.async {
                    self.picker.allowsEditing = false
                    self.picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: self.picker.sourceType)!
                    self.picker.sourceType = UIImagePickerController.SourceType.camera
                    self.picker.cameraCaptureMode = .photo
                    self.present(self.picker,animated: true,completion: nil)
                }
            }else{
                DispatchQueue.main.async {
                    let alertVC = UIAlertController(title: "Need Camera access", message: "", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "Allow", style: UIAlertAction.Style.default) {
                        UIAlertAction in
                        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                    }
                    let cancelAction = UIAlertAction(title: "Disallow", style: UIAlertAction.Style.cancel) {
                        UIAlertAction in
                    }
                    alertVC.addAction(okAction)
                    alertVC.addAction(cancelAction)
                    self.present(alertVC, animated: true, completion: nil)
                }
            }
        }
    }
    func noCamera(){
        let alertVC = UIAlertController(title: "No Camera", message: "Sorrnodevice", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style:.default, handler: nil)
        alertVC.addAction(okAction)
        present(alertVC, animated: true, completion: nil)
    }
    //MARK: - UIImagePickerControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        DispatchQueue.main.async { [self] in
            guard let selectedImage = info[.originalImage] as? UIImage else {
                return
            }
            let imageData = selectedImage.resized(withPercentage: 0.1)
            let imageData1: NSData = imageData!.pngData()! as NSData
            self.profileImage.image = selectedImage
            self.strdata1 = imageData1.base64EncodedString(options: .lineLength64Characters)
            self.VM.imageSubmissionAPI(loyaltyID: self.loyaltyId ,base64: self.strdata1)
            picker.dismiss(animated: true, completion: nil)
        }
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
   
}
