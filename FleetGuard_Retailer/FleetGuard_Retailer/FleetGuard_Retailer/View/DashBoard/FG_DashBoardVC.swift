//
//  FG_DashBoardVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 18/01/2023.
//

import UIKit
import ImageSlideshow
import SlideMenuControllerSwift
import Kingfisher
import LanguageManager_iOS
import Alamofire
import Lottie

class FG_DashBoardVC: BaseViewController, LanguageDelegate {
    func didtappedLanguageBtn(item: LanguageVC) {
        self.localization()
    }
    
    @IBOutlet var underMaintananceView: LottieAnimationView!
    
    @IBOutlet var maintananceView: UIView!
    @IBOutlet weak var nodataFoundLbl: UILabel!
    @IBOutlet weak var promotionBtn: UIButton!
    //    @IBOutlet weak var offersandPromLbl: UILabel!
//    @IBOutlet weak var redemptionCatalogueLbl: UILabel!
//    @IBOutlet weak var newRangeAdditionLbl: UILabel!
    @IBOutlet weak var retailerCodeLbl: UILabel!
    @IBOutlet weak var retailerLblTitle: UILabel!
    @IBOutlet weak var rplValueLbl: UILabel!
    @IBOutlet weak var rplNoLbl: UILabel!
    @IBOutlet weak var totalValue: UILabel!
    @IBOutlet weak var totalPtsBalance: UILabel!
    @IBOutlet weak var welcomeTitle: UILabel!
    @IBOutlet weak var welcomeLbl: UILabel!
    @IBOutlet weak var secondLevelView: UIView!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var bannerImage: ImageSlideshow!
    @IBOutlet weak var exploreForMoreLbl: UILabel!
    
    @IBOutlet weak var viewProductButton: UIButton!
    @IBOutlet var emptyImageView: UIImageView!
    @IBOutlet weak var filtrationLbl: UILabel!
    
    @IBOutlet weak var knowMoreLbl: UILabel!
    @IBOutlet weak var redemptionCatalogueLbl: UILabel!
    @IBOutlet weak var redemptionCatalogueBtn: UIButton!
    @IBOutlet weak var orderNowBtn: UIButton!
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBOutlet weak var shopNameTitleLbl: UILabel!
    @IBOutlet var companyNameLbl: UILabel!
    
    @IBOutlet weak var productCatalogueLbl: UILabel!
    @IBOutlet weak var addmoreRangeLbl: UILabel!
    
    @IBOutlet weak var offersAndPromotionsLbl: UILabel!
    
    
    
    var categoryItemArray = ["Filters", "Coolant & Chemicals", "Center Bearing", "Break Liner"]
    var categoryImageArray = ["OUTLINE", "OUTLINE", "OUTLINE","OUTLINE"]
    var dashboardAarray = [ObjCustomerDashboardList]()
    private var animationView: LottieAnimationView?
    
    var userId = UserDefaults.standard.string(forKey: "UserID") ?? ""
    var loyaltyId = ""{
        didSet{
            if loyaltyId != "" && loyaltyId != nil{
                pointsAPI()
            }
        }
    }
    var secondToken = UserDefaults.standard.string(forKey: "SECONDTOKEN") ?? ""
    var deviceID =  UserDefaults.standard.string(forKey: "deviceID") ?? ""
    var bannerImagesArray = [ObjImageGalleryList]()
    var sourceArray = [AlamofireSource]()
    var pendingRedemptionBal = 0
    var VM = FG_DashboardVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(navigateToProductsList), name: Notification.Name.navigateToProductList, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(navigateToDashBoard), name: Notification.Name.navigateToDashboard, object: nil)
        if MyCommonFunctionalUtilities.isInternetCallTheApi() == false{
            DispatchQueue.main.async{
                let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "IOS_FG_Internet_Check") as! IOS_FG_Internet_Check
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: true)
            }
        }else{
            self.VM.VC = self
            nodataFoundLbl.isHidden = true
            self.maintananceView.isHidden = true
//            dashboardApi()
            print(deviceID,"kjslk")
            self.emptyImageView.isHidden = true
            subView.clipsToBounds = true
            subView.layer.cornerRadius = 20
            subView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            self.bannerImagesAPI()
            secondLevelView.clipsToBounds = true
            secondLevelView.layer.cornerRadius = 16
            secondLevelView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            self.categoryCollectionView.delegate = self
            self.categoryCollectionView.dataSource = self
            
            let collectionViewFLowLayout = UICollectionViewFlowLayout()
            collectionViewFLowLayout.itemSize = CGSize(width: (self.view.bounds.width - 150 - (self.categoryCollectionView.contentInset.left + self.categoryCollectionView.contentInset.right)) / 2,  height: 105)
            collectionViewFLowLayout.minimumLineSpacing = 2.5
            collectionViewFLowLayout.scrollDirection = .horizontal
            collectionViewFLowLayout.minimumInteritemSpacing = 2.5
            self.categoryCollectionView.collectionViewLayout = collectionViewFLowLayout
            
            NotificationCenter.default.addObserver(self, selector: #selector(logedInByOtherMobile), name: Notification.Name.logedInByOtherMobile, object: nil)
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        observeEvent()
        maintenanceAPI()
        slideMenuController()?.changeLeftViewWidth(self.view.frame.size.width * 0.8)
        SlideMenuOptions.contentViewScale = 1
//        self.tokendata()
        self.promotionBtn.isUserInteractionEnabled = true
        self.orderNowBtn.isUserInteractionEnabled = true
        self.redemptionCatalogueBtn.isUserInteractionEnabled = true
        self.viewProductButton.isUserInteractionEnabled = true
        localization()
        
    }
    
    override func viewDidLayoutSubviews() {
        self.orderNowBtn.layer.cornerRadius = 14
        self.orderNowBtn.clipsToBounds = true
        
    }
    
    func playAnimation(){
        animationView = .init(name: "94350-gears-lottie-animation")
        animationView!.frame = underMaintananceView.bounds
          // 3. Set animation content mode
        animationView!.contentMode = .scaleAspectFit
          // 4. Set animation loop mode
        animationView!.loopMode = .loop
          // 5. Adjust animation speed
        animationView!.animationSpeed = 1
        underMaintananceView.addSubview(animationView!)
          // 6. Play animation
        animationView!.play()

    }
    
    private func localization(){
        nodataFoundLbl.text = "noDataFound".localiz()
        tabBarController?.tabBar.items![0].title = "My_Earnings".localiz()
        tabBarController?.tabBar.items![1].title = "Home".localiz()
        tabBarController?.tabBar.items![2].title = "My_Redemption".localiz()
        self.offersAndPromotionsLbl.text = "offersAndPromotionsText".localiz()
        totalPtsBalance.text = "total_Point_bal".localiz()
        welcomeLbl.text = "welcome".localiz()
        productCatalogueLbl.text = "product_Catalogoue".localiz()
        redemptionCatalogueLbl.text = "redemption_catalogue".localiz()
        knowMoreLbl.text = "know_more".localiz()
        shopNameTitleLbl.text = "Shop_name".localiz()
        addmoreRangeLbl.text  = "Add_More_Range".localiz()
        viewProductButton.setTitle("View_Products".localiz(), for: .normal)
        orderNowBtn.setTitle("Order_Now".localiz(), for: .normal)
        redemptionCatalogueBtn.setTitle("Redeem_Now".localiz(), for: .normal)
        
        
    }
    
    @objc func logedInByOtherMobile() {
//        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_LoginVC") as? FG_LoginVC
//         vc!.modalPresentationStyle = .overFullScreen
//         vc!.modalTransitionStyle = .crossDissolve
//         self.present(vc!, animated: true, completion: nil)
        UserDefaults.standard.set(false, forKey: "IsloggedIn?")
        let languageStatus = UserDefaults.standard.string(forKey: "LanguageName") ?? ""
        if #available(iOS 13.0, *) {
            DispatchQueue.main.async {
                let pushID = UserDefaults.standard.string(forKey: "UD_DEVICE_TOKEN") ?? ""
                let domain = Bundle.main.bundleIdentifier!
                UserDefaults.standard.removePersistentDomain(forName: domain)
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
    }
    

    @IBAction func menuBtn(_ sender: Any) {
        self.openLeft()
    }
    
    @IBAction func viewProductBtn(_ sender: Any) {
        if MyCommonFunctionalUtilities.isInternetCallTheApi() == false{
            DispatchQueue.main.async{
                let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "IOS_FG_Internet_Check") as! IOS_FG_Internet_Check
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: true)
            }
        }else{
            //        self.viewProductButton.isUserInteractionEnabled = false
            let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_NewAdditionVC") as! FG_NewAdditionVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    @IBAction func languageChangeBtn(_ sender: Any) {
        if MyCommonFunctionalUtilities.isInternetCallTheApi() == false{
            DispatchQueue.main.async{
                let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "IOS_FG_Internet_Check") as! IOS_FG_Internet_Check
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: true)
            }
        }else{
            let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "LanguageVC") as? LanguageVC
            vc?.delegate = self
            vc?.modalPresentationStyle = .overFullScreen
            vc?.modalTransitionStyle = .crossDissolve
            present(vc!, animated: true)
        }
        
    }
    
    @IBAction func notificationBell(_ sender: Any) {
        if MyCommonFunctionalUtilities.isInternetCallTheApi() == false{
            DispatchQueue.main.async{
                let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "IOS_FG_Internet_Check") as! IOS_FG_Internet_Check
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: true)
            }
        }else{
            let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "HistoryNotificationsViewController") as? HistoryNotificationsViewController
            navigationController?.pushViewController(vc!, animated: true)
        }
    }

    @IBAction func promotionActBTN(_ sender: Any) {
        if MyCommonFunctionalUtilities.isInternetCallTheApi() == false{
            DispatchQueue.main.async{
                let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "IOS_FG_Internet_Check") as! IOS_FG_Internet_Check
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: true)
            }
        }else{
            self.promotionBtn.isUserInteractionEnabled = false
            let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_MyPromotionsVC") as! FG_MyPromotionsVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func orderNowBtn(_ sender: Any) {
        if MyCommonFunctionalUtilities.isInternetCallTheApi() == false{
            DispatchQueue.main.async{
                let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "IOS_FG_Internet_Check") as! IOS_FG_Internet_Check
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: true)
            }
        }else{
            //        self.startLoading()
            self.orderNowBtn.isUserInteractionEnabled = false
            let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_ProductCatalogueListVC") as! FG_ProductCatalogueListVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func redemptionCatalogueBtn(_ sender: Any) {
        if MyCommonFunctionalUtilities.isInternetCallTheApi() == false{
            DispatchQueue.main.async{
                let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "IOS_FG_Internet_Check") as! IOS_FG_Internet_Check
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: true)
            }
        }else{
            //        self.startLoading()
            self.redemptionCatalogueBtn.isUserInteractionEnabled = false
            let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_RedemptionCatalogueVC") as! FG_RedemptionCatalogueVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func dashboardApi(){
        let parameter = [
            "ActorId":"\(self.userId)"
        ] as [String: Any]
        print(parameter)
        self.VM.dashboardApi(parameter: parameter)
    }
    
    func dashboardPointsApi(){
        let parameter = [
            "ActionType":"1",
            "ActorId":"\(self.userId)",
            "LoyaltyId":"\(self.loyaltyId)"
        ] as [String: Any]
        print(parameter)
        self.VM.dashboardTotalPointsApi(parameter: parameter)
    }
    
    func productsCategoryListApi(){
        let parameter = [
            "ActionType": 155,
            "ActorId":"\(self.userId)"
        ] as [String: Any]
        print(parameter)
        self.VM.productCategoryListingApi(parameter: parameter)
    }
    
    func pointsAPI(){
        UserDefaults.standard.set(true, forKey: "AfterLog")
        UserDefaults.standard.set( 0, forKey: "totalEarnedPoints")
        UserDefaults.standard.set(0, forKey: "redeemablePointsBalance")
        UserDefaults.standard.setValue(0, forKey: "TotalMileStonePoints")
        UserDefaults.standard.synchronize()
        let parameters = [
              "ActionType": "1",
              "LoyaltyId": "\(loyaltyId)"
        ] as [String: Any]
        print(parameters)
//        self.VM.pointBalenceAPI(parameter: parameters)
        self.startLoading()
        self.VM.pointBalance_New_Api(parameters: parameters)
        
    }
    @objc func didTap() {
        if bannerImagesArray.count > 0 {
            print(bannerImage.currentPage)
            if bannerImagesArray[(bannerImage.currentPage ?? 0)].actionImageUrl == "" || bannerImagesArray[(bannerImage.currentPage ?? 0)].actionImageUrl == nil{
                
                let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_FocusGroupVC") as? FG_FocusGroupVC
                vc?.albumID = "\(bannerImagesArray[(bannerImage.currentPage ?? 0)].albumID ?? 0)"
                navigationController?.pushViewController(vc!, animated: true)
                }else{
                    print(bannerImagesArray[(bannerImage.currentPage ?? 0)].actionImageUrl,"imageURL")
                    if let url = URL(string: "\(bannerImagesArray[(bannerImage.currentPage ?? 0)].actionImageUrl ?? "")")
                        {
                            UIApplication.shared.openURL(url)
                        }
                }
        }
    }
    
    @objc func navigateToProductsList(){
                for controller in self.navigationController!.viewControllers as Array {
                    if controller.isKind(of: FG_ProductCatalogueListVC.self) {
                        self.navigationController!.popToViewController(controller, animated: true)
                        break
                    }else if controller.isKind(of: FG_FocusGroupVC.self) {
                        self.navigationController!.popToViewController(controller, animated: true)
                        break
                    }
                }
    }
    @objc func navigateToDashBoard(){
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    func bannerImagesAPI() {
        let parameters = [
                "ObjImageGallery": [
                "AlbumCategoryID": "1",
                "ActorId":"\(userId)"
            ]
            ] as [String: Any]
        print(parameters)
        self.VM.dashboardImagesAPICall(parameters: parameters){ response in
            print(response as Any, "asdfljashdfjadslkfdsalkfjjldsaljfsad")
            if response != nil {
                print("Working Data")
                DispatchQueue.main.async {
                    self.bannerImagesArray = response?.objImageGalleryList ?? []
                    print(self.bannerImagesArray.count, "Banner Image Count")
                    
                    if self.bannerImagesArray.count != 0 {
                        self.ImageSetups()
                        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.didTap))
                        self.bannerImage.addGestureRecognizer(gestureRecognizer)
                        self.bannerImage.isHidden = false
                        self.emptyImageView.isHidden = true
                        
                        self.bannerImage.setImageInputs(self.sourceArray)
                        self.bannerImage.slideshowInterval = 3.0
                        self.bannerImage.zoomEnabled = true
                        self.bannerImage.contentScaleMode = .scaleToFill
                        
                    }else{
                        self.bannerImage.isHidden = true
                        self.emptyImageView.isHidden = false
                        self.emptyImageView.image =  UIImage(named: "ic_default_img")
                    }
                }
               
                
                // self.offersandPromotionsApi()
            }else{
                self.bannerImage.isHidden = true
                self.emptyImageView.isHidden = false
            print("No Resdflksjadfljkasdjflasldjf")
            }
        }
    }
    
    
    func ImageSetups(){
        sourceArray.removeAll()
        if bannerImagesArray.count > 0 {
            for image in bannerImagesArray {
                print(image.imageGalleryUrl,"ImageURL")
                let filterImage = (image.imageGalleryUrl ?? "").dropFirst()
                let images = ("\(Promo_ImageData)\(filterImage)").replacingOccurrences(of: " ", with: "%20")
                print(images,"skjdnj")
                sourceArray.append(AlamofireSource(urlString: images, placeholder: UIImage(named: "ic_default_img"))!)
            //http://fleetguarddemo.loyltwo3ks.com/UploadFiles/ImageGallery/IMAGE_2.jpg
            }
            bannerImage.setImageInputs(sourceArray)
            bannerImage.slideshowInterval = 3.0
            bannerImage.zoomEnabled = false
        } else {
            self.emptyImageView.isHidden = false
        }
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
                    self.dashboardApi()
                    self.dashboardPointsApi()
                    self.productsCategoryListApi()
//                    self.pointsAPI()
                     }catch let parsingError {
                    print("Error", parsingError)
                }
            })
            task.resume()
        }
        }
    
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
                        self.maintananceView.isHidden = false
                        self.playAnimation()
                        
//                        if let tapGestureRecognizers = self.maintananceView.gestureRecognizers?.compactMap({ $0 as? UITapGestureRecognizer }) {
//                            for tapGestureRecognizer in tapGestureRecognizers {
//                                // Remove the tap gesture recognizer
//                                self.maintananceView.removeGestureRecognizer(tapGestureRecognizer)
//                            }
//                        }

                    }
                }else if isMaintenanceValue == "0"{
                    self.tokendata()
                    self.isUpdateAvailable()
                    self.animationView?.stop()
                }
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
    }
    
    func isUpdateAvailable() {
        let bundleId = Bundle.main.infoDictionary!["CFBundleIdentifier"] as! String
        print(bundleId)
        Alamofire.request("https://itunes.apple.com/in/lookup?bundleId=\(bundleId)").responseJSON { response in
            if let json = response.result.value as? NSDictionary, let results = json["results"] as? NSArray, let entry = results.firstObject as? NSDictionary, let appStoreVersion = entry["version"] as? String,let appstoreid = entry["trackId"], let trackUrl = entry["trackViewUrl"], let installedVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
                let installed = Int(installedVersion.replacingOccurrences(of: ".", with: "")) ?? 0
                print(installed)
                let appStore = Int(appStoreVersion.replacingOccurrences(of: ".", with: "")) ?? 0
                print(appStore)
                print(appstoreid)
                if appStore>installed {
                        let alertController = UIAlertController(title: "New update Available!", message: "Update is available to download. Downloading the latest update you will get the latest features, improvements and bug fixes of Fleet Guard APP", preferredStyle: .alert)

                        // Create the actions
                        let okAction = UIAlertAction(title: "Update Now", style: UIAlertAction.Style.default) {
                            UIAlertAction in
                            UIApplication.shared.openURL(NSURL(string: "\(trackUrl)")! as URL)

                        }
                        //                     Add the actions
                        alertController.addAction(okAction)
                        // Present the controller
                        self.present(alertController, animated: true, completion: nil)

                }else{
                    print("no updates")

                }
            }
        }
    }
    
    
    
    
}
extension FG_DashBoardVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.VM.categoryListArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FG_CategoryCVC", for: indexPath) as! FG_CategoryCVC
        cell.titleLbl.text = "\(self.VM.categoryListArray[indexPath.row].attributeNames ?? "")      "
//        cell.categoryImage.image = UIImage(named: "\(self.categoryImageArray[indexPath.row])")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_ProductCatalogueListVC") as! FG_ProductCatalogueListVC
        //vc.titleDataFromDashBoard = "\(self.VM.categoryListArray[indexPath.row].attributeNames ?? "")
        vc.categoryId3 = Int(self.VM.categoryListArray[indexPath.row].attributeValue ?? "") ?? 0
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}

extension FG_DashBoardVC{
    func observeEvent() {
        VM.eventHandler = { [weak self] event in
            guard let self = self else { return }
            switch event {
            case .loading:
                self.startLoading()
                print("Product loading....")
            case .stopLoading:
                self.stopLoading()
                print("Stop loading...")
            case .dataLoaded:
                print("Data loaded...")
            case .error(let error):
                print(error ?? "")
            case .pointsBalance(let product):
                print("Data loaded")
                pointBalabceData(dashboardDetails: product)
            }
        }
    }
    
    
    func pointBalabceData(dashboardDetails: [ObjCustomerDashboardList11] ){
        if dashboardDetails.count != 0 {
            DispatchQueue.main.async {
            print("\(dashboardDetails[0].totalEarnedPoints ?? 0), Total Earned Points")
                self.totalValue.text = "\(Int(dashboardDetails[0].totalEarnedPoints ?? 0))"
                UserDefaults.standard.set(((dashboardDetails[0].totalEarnedPoints ?? 0) - self.pendingRedemptionBal), forKey: "totalEarnedPoints")
                UserDefaults.standard.set(((dashboardDetails[0].totalEarnedPoints ?? 0) - self.pendingRedemptionBal), forKey: "redeemablePointsBalance")
                UserDefaults.standard.setValue((dashboardDetails[0].totalMileStonePoints ?? 0), forKey: "TotalMileStonePoints")
                UserDefaults.standard.synchronize()
            }
        }
    }
}
