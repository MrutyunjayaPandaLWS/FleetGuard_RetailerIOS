//
//  FG_MyPromotionDetailsVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 19/01/2023.
//

import UIKit

class FG_MyPromotionDetailsVC: BaseViewController {

    @IBOutlet weak var termsandconditionLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var pointsLbl: UILabel!
    @IBOutlet weak var offerNameLbl: UILabel!
    @IBOutlet weak var categoryTitle: UILabel!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var headerText: UILabel!
    @IBOutlet weak var headerImage: UIImageView!
    
    var promotionId = 0
    var selectedTitle = ""
    var selectedOfferId = ""
    var selectedLongDesc = ""
    var selectedShortDesc = ""
    var selectedImage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.termsandconditionLbl.text = selectedLongDesc
        self.descriptionLbl.text = self.selectedShortDesc
        self.offerNameLbl.text  = self.selectedTitle
        
        let imageURL = self.selectedImage
        if imageURL != ""{
            let filteredURLArray = imageURL.dropFirst(2)
            let urltoUse = String(PROMO_IMG1 + filteredURLArray).replacingOccurrences(of: " ", with: "%20")
            let urlt = URL(string: "\(urltoUse)")
            print(urlt)
            self.headerImage.kf.setImage(with: URL(string: "\(String(describing: urlt))"), placeholder: UIImage(named: "Asset 2"));
        }
        
        self.subView.clipsToBounds = false
        self.subView.layer.cornerRadius = 36
        self.subView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        subView.layer.shadowOffset = CGSize(width: 0.1, height: 0.1)
        subView.layer.shadowOpacity = 0.4
        subView.layer.shadowRadius = 0.4
        subView.layer.shadowColor = UIColor.darkGray.cgColor
    }
    
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func languageBtn(_ sender: Any) {
    }
    
    
    
}
