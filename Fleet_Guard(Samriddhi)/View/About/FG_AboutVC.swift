//
//  FG_AboutVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 19/01/2023.
//

import UIKit
import WebKit

class FG_AboutVC: BaseViewController {

    @IBOutlet var aboutWebview: UIWebView!
    
    var fromSideMenu = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async {
            self.stopLoading()
            self.aboutWebview.loadRequest(NSURLRequest(url: NSURL(fileURLWithPath: Bundle.main.path(forResource: "about", ofType: "html")!) as URL) as URLRequest)
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
