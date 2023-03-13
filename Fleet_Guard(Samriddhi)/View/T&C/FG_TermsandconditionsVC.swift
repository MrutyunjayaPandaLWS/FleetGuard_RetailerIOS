//
//  FG_TermsandconditionsVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 19/01/2023.
//

import UIKit
import WebKit


protocol CheckBoxSelectDelegate{
    func accept(_ vc: FG_TermsandconditionsVC)
    func decline(_ vc: FG_TermsandconditionsVC)
}



class FG_TermsandconditionsVC: BaseViewController {
    @IBOutlet weak var webviewKit: UIWebView!
    @IBOutlet var termsStackView: UIStackView!
    var fromSideMenu = ""
    var boolResult:Bool = false
    var delegate: CheckBoxSelectDelegate!
    
    var comingFrom = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startLoading()
        if comingFrom == "LoginScreen"{
            self.termsStackView.isHidden = false
        }else{
            self.termsStackView.isHidden = true
        }
        DispatchQueue.main.async {
            self.stopLoading()
            self.webviewKit.loadRequest(NSURLRequest(url: NSURL(fileURLWithPath: Bundle.main.path(forResource: "fleetguard-retailer-t&c", ofType: "html")!) as URL) as URLRequest)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
        }else{
            self.navigationController?.popViewController(animated: true)
        }
    }
    
}
