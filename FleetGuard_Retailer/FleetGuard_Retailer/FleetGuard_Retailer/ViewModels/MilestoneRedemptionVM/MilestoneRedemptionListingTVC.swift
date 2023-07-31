//
//  MilestoneRedemptionListingTVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by Arokia-M3 on 28/02/23.
//

import UIKit
import LanguageManager_iOS

protocol mileStoneDelegateData{
    
    func doenloadData(_ cell: MilestoneRedemptionListingTVC)
}

class MilestoneRedemptionListingTVC: UITableViewCell {
    
    
    @IBOutlet var milestoneCodeHeadingLbl: UILabel!
    @IBOutlet var milestoneCodeDataLbl: UILabel!
    
    @IBOutlet var levelPointsHeadingLbl: UILabel!
    @IBOutlet var leavelPointsLbl: UILabel!
    
    @IBOutlet var validityHeadingLbl: UILabel!
    @IBOutlet var validityDataLbl: UILabel!
    
    @IBOutlet var descriptionDataLbl: UILabel!
    @IBOutlet var descriptionHeadingLbl: UILabel!
    
    var delegate:mileStoneDelegateData!
    var levelpoints = 0
    
    @IBOutlet var downloadBTN: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        localization()
    }
    
    private func localization(){
        milestoneCodeHeadingLbl.text = "Milestone code".localiz()
        levelPointsHeadingLbl.text = "Level Points".localiz()
        validityHeadingLbl.text = "Validity".localiz()
        downloadBTN.setTitle("Redeem".localiz(), for: .normal)
        descriptionHeadingLbl.text = "Description".localiz()
    }

    @IBAction func downloadActBtn(_ sender: Any) {
        self.delegate.doenloadData(self)
    }
}
