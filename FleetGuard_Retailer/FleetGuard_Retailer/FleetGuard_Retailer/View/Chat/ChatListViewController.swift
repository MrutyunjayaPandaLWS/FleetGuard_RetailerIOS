//
//  ChatListViewController.swift
//  CenturyPly_JSON
//
//  Created by Arokia-M3 on 03/03/22.
//

import UIKit
import NotificationCenter
import Photos
import AVFoundation
//import Firebase
import Kingfisher
import Lottie

class ChatListViewController: BaseViewController,UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate, popUpDelegate {
    func popupAlertDidTap(_ vc: FG_PopUpVC) {
    }
    
    @IBOutlet var labelView: UIView!
    
    //    let activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView();
    var storyboard1 = UIStoryboard(name: "Main", bundle: nil)
    
    @IBOutlet var chatTableView: UITableView!
    @IBOutlet weak var textfieldview: UIView!
    @IBOutlet weak var titlelabel: UILabel!
    @IBOutlet weak var querySummarylabel: UILabel!
    @IBOutlet weak var commenttextfield: UITextField!
    @IBOutlet weak var sendbutton: UIButton!
    @IBOutlet weak var notificationLBL: UILabel!
    
    @IBOutlet weak var loaderAnimatedView: LottieAnimationView!
       @IBOutlet weak var loaderView: UIView!
    
    private var animationView11: LottieAnimationView?
    
    var CustomerTicketIDchatvc = ""
    var helptopicid = ""
    var strdata1 = ""
    var helptopicdetails = ""
    var querysummary = ""
    var querydetails = ""
    //    let fromURL = HTTPHelper()
    //    var chatlistingArray = [chatlistingdetails]()
    var VM = ChatListViewModel()
    let userID = UserDefaults.standard.string(forKey: "UserID") ?? ""
    let picker = UIImagePickerController()
    var FileType = ""
    let loyaltyId = UserDefaults.standard.string(forKey: "LoyaltyId") ?? ""
    //var VM1 = HistoryNotificationsViewModel()
    
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
            self.VM.VC = self
            self.loaderView.isHidden = true
            self.labelView.isHidden = true
            chatTableView.register(UINib(nibName: "senderInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "senderInfoTableViewCell")
            chatTableView.register(UINib(nibName: "otherInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "otherInfoTableViewCell")
            chatTableView.register(UINib(nibName: "senderImageTableViewCell", bundle: nil), forCellReuseIdentifier: "senderImageTableViewCell")
            chatTableView.register(UINib(nibName: "otherImageTableViewCell", bundle: nil), forCellReuseIdentifier: "otherImageTableViewCell")
            chatTableView.register(UINib(nibName: "senderInfoImageTableViewCell", bundle: nil), forCellReuseIdentifier: "senderInfoImageTableViewCell")
            chatTableView.register(UINib(nibName: "otherInfoImageTableViewCell", bundle: nil), forCellReuseIdentifier: "otherInfoImageTableViewCell")
            self.commenttextfield.delegate = self
            chatTableView.estimatedRowHeight = 70
            chatTableView.rowHeight = UITableView.automaticDimension
            expandedview.isHidden = true
            NotificationCenter.default.addObserver(self, selector: #selector(self.methodOfReceivedNotification1012(notification:)), name: Notification.Name("NotificationIdentifierinternet"), object: nil)
            self.picker.delegate = self
            setuppriortoLaunch()
            chatTableView?.delegate = self
            chatTableView?.dataSource = self
            print(CustomerTicketIDchatvc)
            
            self.loaderView.isHidden = false
            self.playAnimation()
            DispatchQueue.main.asyncAfter(deadline: .now()+0.9, execute: {
                self.chatListingAPI()
            })
            
            
            titlelabel.text = helptopicdetails
            //self.querySummarylabel.text = "Query Summary : \(querysummary)"
            self.titlelabel.text = "Chat"
            self.commenttextfield.placeholder = "Write query details"
            self.commenttextfield.attributedPlaceholder = NSAttributedString(
                string: "Write query details",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
            )
            self.commenttextfield.textColor = .white
            
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
     //   self.notificationListApi()
//        guard let tracker = GAI.sharedInstance().defaultTracker else { return }
//        tracker.set(kGAIScreenName, value: "LordgeQuery Chat")
//
//        guard let builder = GAIDictionaryBuilder.createScreenView() else { return }
//        tracker.send(builder.build() as [NSObject : AnyObject])
    }
    
    func chatListingAPI(){
        DispatchQueue.main.async {
            self.startLoading()
        }

        let parameters = [
            "ActionType": "6",
            "ActorId": "\(userID)",
            "CustomerTicketID": "\(CustomerTicketIDchatvc)"
        ] as [String: Any]
        print(parameters)
        self.VM.chatDetails(parameters: parameters) { response in
            self.VM.chatListingArray = response?.objQueryResponseJsonList ?? []
            print(self.VM.chatListingArray.count,"hisdh")
            DispatchQueue.main.async {
                if self.VM.chatListingArray.count != 0 {
                    self.chatTableView?.reloadData()
                    self.scrollToBottom()
                }
                self.loaderView.isHidden = true
                self.stopLoading()
            }
          
            
        }
    }
    @objc func methodOfReceivedNotification1012(notification: Notification) {
        self.loaderView.isHidden = true
        stopLoading()
    }
    
    
    @IBOutlet weak var expandedview: UIView!
    @IBOutlet weak var expandedimageview: UIImageView!
    @IBAction func closeexpandedview(_ sender: Any) {
        expandedview.isHidden = true
    }
    func scrollToBottom(){
        DispatchQueue.main.async {
            let indexPath = IndexPath(row:  self.VM.chatListingArray.count-1, section: 0)
            self.chatTableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
    func setuppriortoLaunch(){
        //        chatTableView.backgroundColor = UIColor.black
        chatTableView?.alwaysBounceVertical = true
    }
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        commenttextfield.resignFirstResponder()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.VM.chatListingArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let verifyusertype = self.VM.chatListingArray[indexPath.row].userType ?? ""
        print(verifyusertype, "Customer TYpe")
        print(self.VM.chatListingArray[indexPath.item].imageUrl ?? "", "Image URL")
        print(self.VM.chatListingArray[indexPath.row].queryResponseInfo ?? "", "ResponseText")
        if verifyusertype == "Customer" || verifyusertype == "CUSTOMER"{
            if self.VM.chatListingArray[indexPath.row].queryResponseInfo != nil  && self.VM.chatListingArray[indexPath.row].imageUrl == nil ||  self.VM.chatListingArray[indexPath.row].queryResponseInfo != ""  && self.VM.chatListingArray[indexPath.row].imageUrl == "" {
                let cell = tableView.dequeueReusableCell(withIdentifier: "senderInfoTableViewCell") as? senderInfoTableViewCell
                cell?.itemTime.text = self.VM.chatListingArray[indexPath.row].jCreatedDate ?? ""
                cell?.itemcustomer.text = self.VM.chatListingArray[indexPath.row].repliedBy ?? ""
                cell?.itemText.text = self.VM.chatListingArray[indexPath.row].queryResponseInfo ?? ""
                cell?.layoutIfNeeded()
                print(cell?.frame.height)
                print(cell?.itemText.frame.height)
                
                return cell!
            }else if self.VM.chatListingArray[indexPath.row].queryResponseInfo == nil  && self.VM.chatListingArray[indexPath.row].imageUrl != nil || self.VM.chatListingArray[indexPath.row].queryResponseInfo == ""  && self.VM.chatListingArray[indexPath.row].imageUrl != ""{
                print("Imageasdfasdfs")
                let cell = tableView.dequeueReusableCell(withIdentifier: "senderImageTableViewCell") as? senderImageTableViewCell
                cell?.itemTime.text = self.VM.chatListingArray[indexPath.row].jCreatedDate ?? ""
                cell?.itemcustomer.text = self.VM.chatListingArray[indexPath.row].repliedBy ?? ""
                var secondaryIMG = self.VM.chatListingArray[indexPath.item].imageUrl ?? ""
                let splited = secondaryIMG.components(separatedBy: "~")
                print("\(PROMO_IMG1)\(splited[1])")
                //cell?.itemimage.sd_setImage(with: URL(string: "\(PROMO_IMG1)\(splited[1])"), placeholderImage: UIImage(named: "icons8-life-cycle-96"))
                cell?.itemimage.kf.setImage(with: URL(string: "\(PROMO_IMG1)\(splited[1])"), placeholder: UIImage(named: "icons8-life-cycle-96"));
                return cell!
            }else if self.VM.chatListingArray[indexPath.row].queryResponseInfo != nil  && self.VM.chatListingArray[indexPath.row].imageUrl != nil || self.VM.chatListingArray[indexPath.row].queryResponseInfo != ""  && self.VM.chatListingArray[indexPath.row].imageUrl != ""{
                print("Check Again")
                let cell = tableView.dequeueReusableCell(withIdentifier: "otherInfoImageTableViewCell") as? otherInfoImageTableViewCell
                cell?.itemTime.text = self.VM.chatListingArray[indexPath.row].jCreatedDate ?? ""
                cell?.itemcustomer.text = self.VM.chatListingArray[indexPath.row].repliedBy ?? ""
                cell?.itemtext.text = self.VM.chatListingArray[indexPath.row].queryResponseInfo ?? ""
                var secondaryIMG = self.VM.chatListingArray[indexPath.item].imageUrl ?? ""
                let splited = secondaryIMG.components(separatedBy: "~")
                print("\(PROMO_IMG1)\(splited[1])")
                //cell?.itemimage.sd_setImage(with: URL(string: "\(PROMO_IMG1)\(splited[1])"), placeholderImage: UIImage(named: "icons8-life-cycle-96"))
                cell?.itemimage.kf.setImage(with: URL(string: "\(PROMO_IMG1)\(splited[1])"), placeholder: UIImage(named: "icons8-life-cycle-96"));
                return cell!
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "senderInfoTableViewCell") as? senderInfoTableViewCell
                cell?.itemTime.text = self.VM.chatListingArray[indexPath.row].jCreatedDate ?? ""
                cell?.itemcustomer.text = self.VM.chatListingArray[indexPath.row].repliedBy ?? ""
                cell?.itemText.text = self.VM.chatListingArray[indexPath.row].queryResponseInfo ?? ""
                return cell!
            }
        }else if verifyusertype == "Merchant" || verifyusertype == "SuperAdmin" || verifyusertype == "User" || verifyusertype == "Location" || verifyusertype == "" {
            if self.VM.chatListingArray[indexPath.row].queryResponseInfo != nil  && self.VM.chatListingArray[indexPath.row].imageUrl == nil{
                let cell = tableView.dequeueReusableCell(withIdentifier: "otherInfoTableViewCell") as? otherInfoTableViewCell
                cell?.itemTime.text = self.VM.chatListingArray[indexPath.row].createdDate ?? ""
                cell?.itemcustomer.text = self.VM.chatListingArray[indexPath.row].repliedBy ?? ""
                cell?.itemText.text = self.VM.chatListingArray[indexPath.row].queryResponseInfo ?? ""
                return cell!
            }else if self.VM.chatListingArray[indexPath.row].queryResponseInfo != nil  && self.VM.chatListingArray[indexPath.row].imageUrl != nil{
                let cell = tableView.dequeueReusableCell(withIdentifier: "senderInfoImageTableViewCell") as? senderInfoImageTableViewCell
                cell?.itemTime.text = self.VM.chatListingArray[indexPath.row].createdDate ?? ""
                cell?.itemcustomer.text = self.VM.chatListingArray[indexPath.row].repliedBy ?? ""
                cell?.itemtext.text = self.VM.chatListingArray[indexPath.row].queryResponseInfo ?? ""
                var secondaryIMG = self.VM.chatListingArray[indexPath.item].imageUrl ?? ""
                let splited = secondaryIMG.components(separatedBy: "~")
                //cell?.itemimage.sd_setImage(with: URL(string: "\(PROMO_IMG1)\(splited[1])"), placeholderImage: UIImage(named: "icons8-life-cycle-96"))
                cell?.itemimage.kf.setImage(with: URL(string: "\(PROMO_IMG1)\(splited[1])"), placeholder: UIImage(named: "icons8-life-cycle-96"));
                return cell!
            }else if self.VM.chatListingArray[indexPath.row].queryResponseInfo == nil  && self.VM.chatListingArray[indexPath.row].imageUrl != nil{
                let cell = tableView.dequeueReusableCell(withIdentifier: "otherImageTableViewCell") as? otherImageTableViewCell
                cell?.itemTime.text = self.VM.chatListingArray[indexPath.row].createdDate ?? ""
                cell?.itemcustomer.text = self.VM.chatListingArray[indexPath.row].repliedBy ?? ""
                var secondaryIMG = self.VM.chatListingArray[indexPath.item].imageUrl ?? ""
                let splited = secondaryIMG.components(separatedBy: "~")
                //cell?.itemimage.sd_setImage(with: URL(string: "\(PROMO_IMG1)\(splited[1])"), placeholderImage: UIImage(named: "icons8-life-cycle-96"))
                cell?.itemimage.kf.setImage(with: URL(string: "\(PROMO_IMG1)\(splited[1])"), placeholder: UIImage(named: "icons8-life-cycle-96"));
                return cell!
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "otherInfoTableViewCell") as? otherInfoTableViewCell
                cell?.itemTime.text = self.VM.chatListingArray[indexPath.row].jCreatedDate ?? ""
                cell?.itemcustomer.text = self.VM.chatListingArray[indexPath.row].repliedBy ?? ""
                cell?.itemText.text = self.VM.chatListingArray[indexPath.row].queryResponseInfo ?? ""
                return cell!
            }
            
            
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "otherInfoTableViewCell") as? otherInfoTableViewCell
            cell?.itemTime.text = convertDateFormater(self.VM.chatListingArray[indexPath.row].jCreatedDate ?? "")
            cell?.itemcustomer.text = self.VM.chatListingArray[indexPath.row].repliedBy ?? ""
            cell?.itemText.text = self.VM.chatListingArray[indexPath.row].queryResponseInfo ?? ""
            return cell!
        }
    }
    override func convertDateFormater(_ date: String) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy HH:mm:ss a"
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss a"
        return  dateFormatter.string(from: date!)
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if   self.VM.chatListingArray[indexPath.item].imageUrl != nil {
            var secondaryIMG = self.VM.chatListingArray[indexPath.item].imageUrl ?? ""
            let splited = secondaryIMG.components(separatedBy: "~")
            print("\(PROMO_IMG1)\(splited[1])")
            //expandedimageview.sd_setImage(with: URL(string: "\(PROMO_IMG1)\(splited[1])"), placeholderImage: UIImage(named: "no_image1.jpg"))
            expandedimageview.kf.setImage(with: URL(string: "\(PROMO_IMG1)\(splited[1])"), placeholder: UIImage(named: "icons8-life-cycle-96"));
            expandedview.isHidden = false
            return
        }else{
            return
        }
        
    }
    
    func estimateframefromtext(text:String) -> CGRect{
        let size = CGSize(width: 200.0, height: 1000.0)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        return NSString(string: text).boundingRect(with: size,
                                                   options: options,
                                                   attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)],
                                                   context: nil)
    }
    
    @IBAction func attachmentButton(_ sender: Any) {
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
    
    
    @IBAction func backbutton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func sendbutton(_ sender: Any) {
        if commenttextfield.text == ""{
            DispatchQueue.main.async{
//                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
//                vc!.delegate = self
//                vc!.titleInfo = ""
//                vc!.descriptionInfo = "Please enter something..."
//                vc!.modalPresentationStyle = .overCurrentContext
//                vc!.modalTransitionStyle = .crossDissolve
//                self.present(vc!, animated: true, completion: nil)
                self.view.makeToast("Please enter something...", duration: 3.0, position: .bottom)
            }
        }else{
            DispatchQueue.main.async {
              self.startLoading()
                    self.loaderView.isHidden = false
                    self.playAnimation()
            }
            
            newChatSubmissiongApi()
        }
    }
    @IBAction func notificationActBTN(_ sender: Any) {
//        let vc = storyboard?.instantiateViewController(withIdentifier: "MSP_NotificationVC") as! MSP_NotificationVC
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //API:-
    
    func newChatSubmissiongApi(){

        let parameters = [
            
            "ActionType": "4",
            "ActorId": "\(userID)",
            "CustomerTicketID": "\(CustomerTicketIDchatvc)",
            "HelpTopic": "\(helptopicdetails)",
            "HelpTopicID": "\(helptopicid)",
            "IsQueryFromMobile": "false",
            "QueryDetails": "\(commenttextfield.text ?? "")",
            "QueryStatus": "1"
            
        ] as [String: Any]
        print(parameters)
        self.VM.newChatSubmission(parameters: parameters) { response in
            DispatchQueue.main.async {
                self.loaderView.isHidden = true
                self.stopLoading()
                print(response?.returnMessage,"returnMessage")
                if response?.returnMessage ?? "" == "1~Message posted successfully"{
                    //self.navigationController?.popViewController(animated: true)
                    self.commenttextfield.text = ""
                    self.chatListingAPI()
                }else{
                    self.chatListingAPI()
                    let alertVC = UIAlertController(title: "", message: "Something went wrong. Try Again!", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "OK", style:.default, handler: nil)
                    alertVC.addAction(okAction)
                    self.present(alertVC, animated: true, completion: nil)
                }
            }
        }
        
    }

    
    
//    func notificationListApi(){
//        let parameters = [
//            "ActionType": 0,
//            "ActorId": "\(userID)",
//            "LoyaltyId": self.loyaltyId
//        ] as [String: Any]
//        print(parameters)
//        self.VM1.notificationListApi(parameters: parameters) { response in
//            self.VM1.notificationListArray = response?.lstPushHistoryJson ?? []
//            print(self.VM1.notificationListArray.count)
//            if self.VM1.notificationListArray.count > 0{
//                self.notificationLBL.text = "\(self.VM1.notificationListArray.count)"
//            }else{
//                self.notificationLBL.isHidden = true
//            }
//        }
//    }
}

extension ChatListViewController{
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
                            let alertVC = UIAlertController(title: "Need Camera Access", message: "Allow", preferredStyle: .alert)
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
                    let alertVC = UIAlertController(title: "Century Pro Club to access camera Gallery", message: "", preferredStyle: .alert)
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
        let alertVC = UIAlertController(title: "No Camera", message: "Sorry no device", preferredStyle: .alert)
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
            self.FileType = "JPG"
            let imageData = selectedImage.resized(withPercentage: 0.1)
            let imageData1: NSData = imageData!.pngData()! as NSData
            self.strdata1 = imageData1.base64EncodedString(options: .lineLength64Characters)
            picker.dismiss(animated: true, completion: nil)
            self.dismiss(animated: true, completion: nil)
            DispatchQueue.main.async {
              self.startLoading()
                    self.loaderView.isHidden = false
                    self.playAnimation()
            }
            let parameterJSON = [
                "ActionType": "4",
                "FileType": "\(FileType)",
                "ImageUrl": "\(strdata1)",
                "ActorId": "\(userID)",
                "CustomerTicketID": "\(CustomerTicketIDchatvc)",
                "HelpTopic": "\(helptopicdetails)",
                "HelpTopicID": "\(helptopicid)",
                "IsQueryFromMobile": true,
                "QueryStatus": "1"
            ] as! [String:Any]
            print(parameterJSON)
            self.VM.newChatSubmission(parameters: parameterJSON) { response in
                DispatchQueue.main.async {
                    self.loaderView.isHidden = true
                    self.stopLoading()
                    if response?.returnMessage ?? "" == "1~Message posted successfully"{
                        //self.navigationController?.popViewController(animated: true)
                        self.chatListingAPI()
                    }else{
                        self.chatListingAPI()
                        let alertVC = UIAlertController(title: "", message: "Something went wrong. Try Again!", preferredStyle: .alert)
                        let okAction = UIAlertAction(title: "OK", style:.default, handler: nil)
                        alertVC.addAction(okAction)
                        self.present(alertVC, animated: true, completion: nil)
                        
                    }
                }
            }
            
            
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    func playAnimation(){
                   animationView11 = .init(name: "Loader_v4")
                     animationView11!.frame = loaderAnimatedView.bounds
                     // 3. Set animation content mode
                     animationView11!.contentMode = .scaleAspectFit
                     // 4. Set animation loop mode
                     animationView11!.loopMode = .loop
                     // 5. Adjust animation speed
                     animationView11!.animationSpeed = 0.5
                    loaderAnimatedView.addSubview(animationView11!)
                     // 6. Play animation
                     animationView11!.play()

               }

    
    
}
