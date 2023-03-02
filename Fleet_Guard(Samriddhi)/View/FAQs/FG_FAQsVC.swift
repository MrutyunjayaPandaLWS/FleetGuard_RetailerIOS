//
//  FG_FAQsVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 19/01/2023.
//

import UIKit
import WebKit

class FG_FAQsVC: BaseViewController {

   
    @IBOutlet weak var webviewKit: UIWebView!
    
    var fromSideMenu = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.stopLoading()
            self.webviewKit.loadRequest(NSURLRequest(url: NSURL(fileURLWithPath: Bundle.main.path(forResource: "fleetguard-retailer-faq", ofType: "html")!) as URL) as URLRequest)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
