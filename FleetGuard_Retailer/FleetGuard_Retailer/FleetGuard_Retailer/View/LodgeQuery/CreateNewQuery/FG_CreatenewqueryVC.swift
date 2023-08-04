//
//  FG_CreatenewqueryVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 31/01/2023.
//

import UIKit
import Photos
import LanguageManager_iOS

class FG_CreatenewqueryVC: BaseViewController, popUpDelegate, DropDownDelegate,UITextViewDelegate {
    func stateDidTap(_ vc: FG_DropDownVC) {}
    
    func cityDidTap(_ vc: FG_DropDownVC) {}
    
    func preferredLanguageDidTap(_ vc: FG_DropDownVC) {}
    
    func genderDidTap(_ vc: FG_DropDownVC) {}
    
    func titleDidTap(_ vc: FG_DropDownVC) {}
    
    func dealerDipTap(_ vc: FG_DropDownVC) {}
    
    func statusDipTap(_ vc: FG_DropDownVC) {}
    
    func redemptionStatusDidTap(_ vc: FG_DropDownVC) {}
    func popupAlertDidTap(_ vc: FG_PopUpVC) {}
    
    
    func helpTopicDidTap(_ vc: FG_DropDownVC) {
        self.selectedTopic = vc.helpTopicName
        self.selectedTopicId = vc.helpTopicId
        self.selectTopicLbl.text = self.selectedTopic
        self.selectTopicLbl.textColor = .black
    }
    
    @IBOutlet weak var imageUploadInfoLbl: UILabel!
    @IBOutlet weak var uploadImageTitleLbl: UILabel!
    @IBOutlet weak var submitBtn: GradientButton!
    @IBOutlet weak var queryDetailsTitleLbl: UILabel!
    @IBOutlet weak var selectTopicTitleLbl: UILabel!
    @IBOutlet weak var headerLvl: UILabel!
    @IBOutlet weak var queryDetailsView: UITextView!
    @IBOutlet weak var selectReasonLbl: UILabel!
    @IBOutlet weak var selectTopicLbl: UILabel!
    @IBOutlet weak var selectSubmitQueryLbl: UILabel!
    @IBOutlet var imageDisplatOutBtn: UIButton!
    
    
    let picker = UIImagePickerController()
    var strBase64 = ""
    var userId = UserDefaults.standard.string(forKey: "UserID") ?? ""
    var loyaltyId = UserDefaults.standard.string(forKey: "LoyaltyId") ?? ""
    var selectedTopic = ""
    var selectedTopicId = 0
    var VM = FG_SubmitNewQueryVM()
    
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
            self.picker.delegate = self
            self.queryDetailsView.textColor = .gray
            self.queryDetailsView.text = "enter_Details".localiz()
            self.queryDetailsView.delegate = self
            NotificationCenter.default.addObserver(self, selector: #selector(navigateToProductsList), name: Notification.Name.sendBackTOQuery, object: nil)
        }
    }
    
    private func localization(){
        headerLvl.text = "Lodge_Query".localiz()
        selectSubmitQueryLbl.text = "createLodgequeryInfo".localiz()
        selectTopicTitleLbl.text = "select_your_topic".localiz()
        selectTopicLbl.text = "select_topic".localiz()
        queryDetailsTitleLbl.text = "Query_Details".localiz()
        queryDetailsView.text = "enter_Details".localiz()
        uploadImageTitleLbl.text = "UploadImage".localiz()
        imageUploadInfoLbl.text = "imageUploadInfo".localiz()
        submitBtn.setTitle("submit".localiz(), for: .normal)
    }
    
    @objc func navigateToProductsList() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if self.queryDetailsView.text == "enter_Details".localiz(){
            self.queryDetailsView.text = ""
            self.queryDetailsView.textColor = .black
        }
    }
    
    @IBAction func notificationBellBtn(_ sender: Any) {
    }
    @IBAction func languageTranslationBtn(_ sender: Any) {
    }
    @IBAction func imageChangebtn(_ sender: Any) {
        let alert = UIAlertController(title: "Chooseanyoption", message: "", preferredStyle: .actionSheet)
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
    @IBAction func selectYourTopicButton(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_DropDownVC") as! FG_DropDownVC
        vc.delegate = self
        vc.isComeFrom = 4
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true)
    }
    @IBAction func submitBtn(_ sender: Any) {
        if MyCommonFunctionalUtilities.isInternetCallTheApi() == false{
            DispatchQueue.main.async{
                let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "IOS_FG_Internet_Check") as! IOS_FG_Internet_Check
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: true)
            }
        }else{
            if self.selectTopicLbl.text == "" || self.selectTopicLbl.text == "select_topic".localiz(){
                DispatchQueue.main.async{
                    //                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
                    //                vc!.delegate = self
                    //                vc!.descriptionInfo = "Select query topic"
                    //                vc!.modalPresentationStyle = .overFullScreen
                    //                vc!.modalTransitionStyle = .crossDissolve
                    //                self.present(vc!, animated: true, completion: nil)
                    
                    self.view.makeToast("Select_query_topic".localiz(), duration: 3.0, position: .bottom)
                }
            }else if self.queryDetailsView.text!.count == 0 || self.queryDetailsView.text == "-" || self.queryDetailsView.text == "enter_Details".localiz(){
                DispatchQueue.main.async{
                    //                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
                    //                vc!.delegate = self
                    //                vc!.descriptionInfo = "Enter query Details"
                    //                vc!.modalPresentationStyle = .overFullScreen
                    //                vc!.modalTransitionStyle = .crossDissolve
                    //                self.present(vc!, animated: true, completion: nil)
                    
                    self.view.makeToast("Enter_query_Details".localiz(), duration: 3.0, position: .bottom)
                }
                
            }else{
                let parameter = [
                    "IsQueryFromMobile": "true",
                    "ActorId": "\(self.userId)",
                    "CustomerName": "",
                    "Email": "",
                    "HelpTopic": "\(self.selectedTopic)",
                    "HelpTopicID": "\(self.selectedTopicId)",
                    "QueryDetails": "\(self.queryDetailsView.text!)",
                    "QuerySummary": "\(self.queryDetailsView.text!)",
                    "ImageUrl": "\(self.strBase64)",
                    "LoyaltyID": "\(self.loyaltyId)",
                    "SourceType": "3",
                    "ActionType": "0"
                ] as [String: Any]
                print(parameter,"dsljd")
                self.VM.querySubmissionApi(parameter: parameter)
            }
        }
    }
}


extension FG_CreatenewqueryVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
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
                        let alertVC = UIAlertController(title: "NeedGallaryaccess".localiz(), message: "AllowGalleryaccess".localiz(), preferredStyle: .alert)
                        let okAction = UIAlertAction(title: "Allow".localiz(), style: UIAlertAction.Style.default) {
                            UIAlertAction in
                            DispatchQueue.main.async {
                                UIApplication.shared.open(URL.init(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
                            }
                        }
                        let cancelAction = UIAlertAction(title: "DisAllow".localiz(), style: UIAlertAction.Style.cancel) {
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
                                let alertVC = UIAlertController(title: "NeedCameraAccess".localiz(), message: "Allow".localiz(), preferredStyle: .alert)
                                let okAction = UIAlertAction(title: "Allow".localiz(), style: UIAlertAction.Style.default) {
                                    UIAlertAction in
                                    UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                                }
                                let cancelAction = UIAlertAction(title: "Cancel".localiz(), style: UIAlertAction.Style.cancel) {
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
                        let alertVC = UIAlertController(title: "HRJohnsonneedtoaccesscameraGallery".localiz(), message: "", preferredStyle: .alert)
                        let okAction = UIAlertAction(title: "Allow".localiz(), style: UIAlertAction.Style.default) {
                            UIAlertAction in
                            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                        }
                        let cancelAction = UIAlertAction(title: "Disallow".localiz(), style: UIAlertAction.Style.cancel) {
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
            let alertVC = UIAlertController(title: "NoCamera".localiz(), message: "Sorrynodevice".localiz(), preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK".localiz(), style:.default, handler: nil)
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
                self.strBase64 = imageData1.base64EncodedString(options: .lineLength64Characters)
                self.imageDisplatOutBtn.setImage(selectedImage, for: .normal)
                picker.dismiss(animated: true, completion: nil)
                self.dismiss(animated: true, completion: nil)
                
            }
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            dismiss(animated: true, completion: nil)
        }
    }
