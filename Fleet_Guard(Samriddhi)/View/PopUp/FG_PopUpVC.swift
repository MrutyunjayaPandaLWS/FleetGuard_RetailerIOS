//
//  FG_PopUpVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 19/01/2023.
//

import UIKit
protocol popUpDelegate : AnyObject {
    func popupAlertDidTap(_ vc: FG_PopUpVC)
}

class FG_PopUpVC: BaseViewController {

    @IBOutlet weak var okBtn: UIButton!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var successImage: UIImageView!
    
    var descriptionInfo = ""
    weak var delegate:popUpDelegate?
    var itsComeFrom = ""
    var titleInfo = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subView.clipsToBounds = true
        subView.layer.cornerRadius = 20
        subView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        self.titleLbl.text = descriptionInfo
        self.okBtn.setTitle("OK", for: .normal)
        
        if itsComeFrom == "DeviceLogedIn"{
            self.successImage.image = UIImage(named: "high-priority-48")
        }
        
    }
    

    @IBAction func okBtn(_ sender: Any) {
        if itsComeFrom == "LodgeQuery" {
            NotificationCenter.default.post(name: .sendBackTOQuery, object: nil)
            self.dismiss(animated: true)
        } else if itsComeFrom == "DeviceLogedIn"{
            NotificationCenter.default.post(name: .logedInByOtherMobile, object: nil)
            self.dismiss(animated: true)
        }else if itsComeFrom == "Registration"{
            NotificationCenter.default.post(name: .redirectingToLogin, object: nil)
            self.dismiss(animated: true)
        }else{
            self.dismiss(animated: true)
        }
        
    }
}
