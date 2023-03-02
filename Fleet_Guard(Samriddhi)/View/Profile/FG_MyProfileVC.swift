//
//  FG_MyProfileVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 19/01/2023.
//

import UIKit
import Photos

class FG_MyProfileVC: BaseViewController,EditDataDelegate, popUpDelegate {
    func popupAlertDidTap(_ vc: FG_PopUpVC) {
    }
    
    func updatedAddressDetails(_ vc: FG_EditProfileVC) {
        
//        self.firstNameLbl.text = vc.firstNameTF.text ?? ""
//        self.lastNameLbl.text = vc.lastNameTF.text ?? ""
//        self.mobileNumberLbl.text = vc.mobileTF.text ?? ""
//        self.emailLbl.text = vc.emailTF.text ?? ""
//        self.addressLbl.text = vc.addressTF.text ?? ""
//        self.stateLbl.text = vc.selectSateLbl.text ?? ""
//        self.cityLbl.text = vc.selectCityLbl.text ?? ""
//        self.pincodeLbl.text = vc.pincodeTF.text ?? ""
//        self.dobLbl.text = vc.selectDOBLbl.text ?? ""
        //self.preferredLanguageLbl.text = vc.selectPreferredLanguage.text ?? ""
    }
    
    @IBOutlet weak var headerTitleLbl: UILabel!
    
    @IBOutlet weak var personalInfoLbl: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var firstNameTitleLbl: UILabel!
    @IBOutlet weak var lastNameTitleLbl: UILabel!
    @IBOutlet weak var mobileNumberTitleLbl: UILabel!
    @IBOutlet weak var emailTitleLbl: UILabel!
    @IBOutlet weak var dobTitleLbl: UILabel!
    @IBOutlet weak var addressTitleLbl: UILabel!
    @IBOutlet weak var stateTitleLbl: UILabel!
    @IBOutlet weak var cityTitleLbl: UILabel!
    @IBOutlet weak var pincodeTitleLbl: UILabel!
    @IBOutlet weak var preferredLanguageTitleLbl: UILabel!
    @IBOutlet weak var editProfileBtn: UIButton!
    
    @IBOutlet weak var firstNameLbl: UILabel!
    @IBOutlet weak var lastNameLbl: UILabel!
    @IBOutlet weak var mobileNumberLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var dobLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var stateLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var pincodeLbl: UILabel!
    @IBOutlet weak var preferredLanguageLbl: UILabel!
    
    var VM = MyProfileDetailsVM()
    var userId = UserDefaults.standard.string(forKey: "UserID") ?? ""
    var loyaltyId = UserDefaults.standard.string(forKey: "LoyaltyId") ?? ""
    let picker = UIImagePickerController()
    var strdata1 = ""
    var fileType = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.VM.VC = self
        self.picker.delegate = self
        subView.clipsToBounds = true
        subView.layer.cornerRadius = 30
        subView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.profileDetailsAPI()
    }
    

    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func updateImageBtn(_ sender: Any) {
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
    @IBAction func languageBtn(_ sender: Any) {
    }
    @IBAction func bellBtn(_ sender: Any) {
    }
    
    @IBAction func editProfileBtn(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_EditProfileVC") as! FG_EditProfileVC
        vc.delegate = self
        vc.firstName = self.firstNameLbl.text ?? "-"
        vc.lastName = self.lastNameLbl.text ?? "-"
        vc.mobileNumber = self.mobileNumberLbl.text ?? "-"
        vc.emailLbl = self.emailLbl.text ?? "-"
        vc.addressLbl = self.addressLbl.text ?? "-"
        vc.state = self.stateLbl.text ?? "-"
        vc.city = self.cityLbl.text ?? "-"
        vc.pincode = self.pincodeLbl.text ?? "-"
        vc.dob = self.dobLbl.text ?? "-"
        vc.prefLanguage = self.preferredLanguageLbl.text ?? "-"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func profileDetailsAPI(){
        let parameters = [
            "ActionType": "6",
            "CustomerId": "\(userId)"
        ] as [String: Any]
        print(parameters)
        self.VM.myProifleDetails(parameters: parameters)
    }

}
extension FG_MyProfileVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
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
            self.VM.imageSubmissionAPI(base64: self.strdata1)
            self.strdata1 = imageData1.base64EncodedString(options: .lineLength64Characters)
            picker.dismiss(animated: true, completion: nil)
        }
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
   
}

