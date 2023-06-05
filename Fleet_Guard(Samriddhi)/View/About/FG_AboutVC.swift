//
//  FG_AboutVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 19/01/2023.
//

import UIKit
import WebKit
import LanguageManager_iOS

class FG_AboutVC: BaseViewController {

    @IBOutlet weak var headerLbl: UILabel!
    @IBOutlet var aboutWebview: UIWebView!
    var languageStatus = UserDefaults.standard.string(forKey: "LanguageName")
    var fromSideMenu = ""
    var aboutName = ""{
        didSet{
            if aboutName.count != 0{
                self.aboutWebview.loadRequest(NSURLRequest(url: NSURL(fileURLWithPath: Bundle.main.path(forResource: aboutName, ofType: "html")!) as URL) as URLRequest)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        localization()
        DispatchQueue.main.async {
            self.stopLoading()
            
            
        }
        
    }
    
    
    private func localization(){
        headerLbl.text = "About".localiz()
        languageUpdate()
    }
    
    func languageUpdate(){
        if languageStatus == "English"{
            aboutName = "fg-retailer-about-Eng"
        }else if languageStatus == "Hindi"{
            aboutName = "fg-retailer-about-Hindi"
        }else if languageStatus == "Tamil"{
            aboutName = "fg-retailer-about-Tamil"
        }else if languageStatus == "Telugu"{
            aboutName = "fg-retailer-about-Telugu"
        }else if languageStatus == "Bengali"{
            aboutName = "fg-retailer-about-Bengali"
        }else if languageStatus == "Kannada"{
            aboutName = "fg-retailer-about-Kannada"
        }else{
            aboutName = "fg-retailer-about-Eng"
        }
    }
    
    @IBAction func backBtn(_ sender: Any) {
        
        if self.fromSideMenu == "SideMenu"{
            NotificationCenter.default.post(name: .sideMenuClosing, object: nil)
            self.navigationController?.popViewController(animated: true)
        }else{
            self.navigationController?.popViewController(animated: true)
        }
       // self.navigationController?.popToRootViewController(animated: true)
    }
    
}
