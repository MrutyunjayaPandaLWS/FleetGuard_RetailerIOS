//
//  FG_TermsandconditionsVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 19/01/2023.
//

import UIKit
import WebKit
import LanguageManager_iOS

protocol CheckBoxSelectDelegate{
    func accept(_ vc: FG_TermsandconditionsVC)
    func decline(_ vc: FG_TermsandconditionsVC)
}



class FG_TermsandconditionsVC: BaseViewController {
    @IBOutlet weak var webviewKit: UIWebView!
    @IBOutlet var termsStackView: UIStackView!
    @IBOutlet weak var headerLbl: UILabel!
    @IBOutlet weak var declineBtn: GradientButton!
    @IBOutlet weak var acceptBtn: GradientButton!
    
    var fromSideMenu = ""
    var boolResult:Bool = false
    var delegate: CheckBoxSelectDelegate!
    
    var comingFrom = ""
    var languageStatus = UserDefaults.standard.string(forKey: "LanguageName")
    var aboutName = ""{
        didSet{
            if aboutName.count != 0{
                DispatchQueue.main.async {
                    self.webviewKit.loadRequest(NSURLRequest(url: NSURL(fileURLWithPath: Bundle.main.path(forResource: self.aboutName, ofType: "html")!) as URL) as URLRequest)
                    self.stopLoading()
                }
            }
        }
    }
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
            self.startLoading()
            if comingFrom == "LoginScreen"{
                self.termsStackView.isHidden = false
            }else{
                self.termsStackView.isHidden = true
            }
            //        DispatchQueue.main.async {
            //            self.stopLoading()
            //            self.webviewKit.loadRequest(NSURLRequest(url: NSURL(fileURLWithPath: Bundle.main.path(forResource: "fleetguard-retailer-t&c", ofType: "html")!) as URL) as URLRequest)
            //        }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        localization()
    }
    
    private func localization(){
        self.headerLbl.text = "termsAndCondition".localiz()
        self.declineBtn.setTitle("Decline".localiz(), for: .normal)
        self.acceptBtn.setTitle("Accept".localiz(), for: .normal)
        languageUpdate()
        
    }
    
    func languageUpdate(){
        if languageStatus == "English"{
            aboutName = "fleetguard-retailer-T&C-Eng"
        }else if languageStatus == "Hindi"{
            aboutName = "fleetguard-retailer-T&C-Hindi"
        }else if languageStatus == "Tamil"{
            aboutName = "fleetguard-retailer-T&C-Tamil"
        }else if languageStatus == "Telugu"{
            aboutName = "fleetguard-retailer-T&C-Telugu"
        }else if languageStatus == "Bengali"{
            aboutName = "fleetguard-retailer-T&C-Bengali"
        }else if languageStatus == "Kannada"{
            aboutName = "fleetguard-retailer-T&C-Kannada"
        }else{
            aboutName = "fleetguard-retailer-T&C-Eng"
        }
    }
    
    
    
    @IBAction func declineBTN(_ sender: Any) {
       
        self.boolResult = false
        self.delegate.decline(self)
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func acceptBTN(_ sender: Any) {
        self.boolResult = true
        self.delegate.accept(self)
        self.dismiss(animated: true, completion: nil)
    }
    

    @IBAction func backBtn(_ sender: Any) {
        if self.fromSideMenu == "SideMenu"{
            NotificationCenter.default.post(name: .sideMenuClosing, object: nil)
            self.navigationController?.popViewController(animated: true)
        }else if self.comingFrom == "LoginScreen"{
            self.dismiss(animated: true, completion: nil)
        }else{
            self.navigationController?.popViewController(animated: true)
        }
    }
    
}
