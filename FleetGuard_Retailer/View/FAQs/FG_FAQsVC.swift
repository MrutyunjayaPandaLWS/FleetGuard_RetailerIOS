//
//  FG_FAQsVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 19/01/2023.
//

import UIKit
import WebKit
import LanguageManager_iOS

class FG_FAQsVC: BaseViewController {

   
    @IBOutlet weak var webviewKit: UIWebView!
    
    @IBOutlet weak var headerLbl: UILabel!
    var fromSideMenu = ""
    var languageStatus = UserDefaults.standard.string(forKey: "LanguageName")
    var aboutName = ""{
        didSet{
            if aboutName.count != 0{
                DispatchQueue.main.async {
                    self.webviewKit.loadRequest(NSURLRequest(url: NSURL(fileURLWithPath: Bundle.main.path(forResource: self.aboutName, ofType: "html")!) as URL) as URLRequest)
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        localization()
//        DispatchQueue.main.async {
//            self.stopLoading()
//            self.webviewKit.loadRequest(NSURLRequest(url: NSURL(fileURLWithPath: Bundle.main.path(forResource: "fleetguard-retailer-faq", ofType: "html")!) as URL) as URLRequest)
//        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func localization(){
        headerLbl.text = "FAQs".localiz()
      languageUpdate()
    }
    
    
    func languageUpdate(){
        if languageStatus == "English"{
            aboutName = "fg-retailer-faq-Eng"
        }else if languageStatus == "Hindi"{
            aboutName = "fg-retailer-faq-Hindi"
        }else if languageStatus == "Tamil"{
            aboutName = "fg-retailer-faq-Tamil"
        }else if languageStatus == "Telugu"{
            aboutName = "fg-retailer-faq-Telugu"
        }else if languageStatus == "Bengali"{
            aboutName = "fg-retailer-faq-Bengali"
        }else if languageStatus == "Kannada"{
            aboutName = "fg-retailer-faq-Kannada"
        }else{
            aboutName = "fg-retailer-faq-Eng"
        }
    }

    @IBAction func backBtn(_ sender: Any) {
        if self.fromSideMenu == "SideMenu"{
            NotificationCenter.default.post(name: .sideMenuClosing, object: nil)
            self.navigationController?.popViewController(animated: true)
        }else{
            self.navigationController?.popViewController(animated: true)
        }
    }
    

}
