//
//  RedemptionFilterView.swift
//  FleetGuard_Retailer
//
//  Created by admin on 07/09/23.
//

import UIKit

class RedemptionFilterView: UIViewController {
    @IBOutlet weak var choosePointRangeLbl: UILabel!
    @IBOutlet weak var applyBtn: UIButton!
    @IBOutlet weak var clearAllBtn: UIButton!
    @IBOutlet weak var filterTitle: UILabel!
    @IBOutlet weak var categoryListTopConstraints: NSLayoutConstraint!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var subView: UIView!
    
    @IBOutlet weak var choosePointView: UIView!
    @IBOutlet weak var categoryTypeTableView: UITableView!
    
    @IBOutlet var minimumValueTF: UITextField!
    @IBOutlet var maximumValueTF: UITextField!
    
    
    @IBOutlet weak var categoryListCollectionView: UICollectionView!
    
    var pointsCatagoryArray = ["Points Range","Category"]
    var selectedPtsRange1 = "All Points"
    var filterByRangeArray = ["All Points", "Under 1000 pts", "1000 - 4999 pts", "5000 - 24999 pts", "25000 & Above pts"]
    
    var productCategory = ""
    var selectedColor = #colorLiteral(red: 0.9607843137, green: 0.6392156863, blue: 0.007843137255, alpha: 0.32)
    var sectedBackgroundcolor = #colorLiteral(red: 1, green: 0.9647058824, blue: 0.8196078431, alpha: 0.32)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
