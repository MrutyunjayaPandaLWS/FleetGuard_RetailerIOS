//
//  FG_NewAdditionVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 19/01/2023.
//

import UIKit

class FG_NewAdditionVC: BaseViewController {

    @IBOutlet weak var segmentController: UISegmentedControl!
    @IBOutlet weak var headerText: UILabel!
    
    var container: ContainerViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        segmentController.selectedSegmentIndex = 0
        let font = UIFont.systemFont(ofSize: 13)
        segmentController.setTitleTextAttributes([NSAttributedString.Key.font: font],
                                                for: .normal)
        segmentController.tintColor = UIColor.systemRed
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        let titleTextAttributes1 = [NSAttributedString.Key.foregroundColor: UIColor.white]
        segmentController.setTitleTextAttributes(titleTextAttributes1, for: .selected)
        segmentController.setTitleTextAttributes(titleTextAttributes, for: .normal)
        
        self.container.segueIdentifierReceivedFromParent("first")
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "container"{
            self.container = segue.destination as? ContainerViewController
        }
    }
    @IBAction func segmentedController(_ sender: Any) {
        if segmentController.selectedSegmentIndex == 0{
            container.segueIdentifierReceivedFromParent("first")
            let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            segmentController.setTitleTextAttributes(titleTextAttributes, for: .selected)
        }else if segmentController.selectedSegmentIndex == 1{
            container.segueIdentifierReceivedFromParent("second")
            let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            segmentController.setTitleTextAttributes(titleTextAttributes, for: .selected)
               
        }
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func languageBtn(_ sender: Any) {
    }
    @IBAction func bellBtn(_ sender: Any) {
    }
}
