//
//  FG_NewAdditionVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 19/01/2023.
//

import UIKit
import LanguageManager_iOS

class FG_NewAdditionVC: BaseViewController {

    @IBOutlet weak var myCartBadgesLbl: UILabel!
    @IBOutlet weak var segmentController: UISegmentedControl!
    @IBOutlet weak var headerText: UILabel!
    
    var container: ContainerViewController!
    var loyaltyId = UserDefaults.standard.string(forKey: "LoyaltyId") ?? ""
    var requestApis = RestAPI_Requests()
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
        segmentController.setTitle("Counter Gap".localiz(), forSegmentAt: 0)
        segmentController.setTitle("Market Gap".localiz(), forSegmentAt: 1)
        self.container.segueIdentifierReceivedFromParent("first")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        myCartApi()
        localization()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "container"{
            self.container = segue.destination as? ContainerViewController
        }
    }
    
    private func localization(){
        headerText.text = "New Range Addition".localiz()
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
    
    @IBAction func selectMyCartBtn(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_ProductCatalogueMyCartVC") as! FG_ProductCatalogueMyCartVC
        self.navigationController?.pushViewController(vc, animated: true)

    }
    
    
    @IBAction func languageBtn(_ sender: Any) {
    }
    @IBAction func bellBtn(_ sender: Any) {
    }
    
    func myCartApi(){
        let parameter = [
              "ActionType": "9",
              "LoyaltyId": "\(self.loyaltyId)",
              "CartProductDetails": [
                  "CategoryId": "0",
                  "SubCategoryId": "0",
                  "BrandId": "0",
                  "OrderSchemeID": "0"
              ]
        ] as [String: Any]
        print(parameter)
        self.mycartListAPi(parameter: parameter)
    }
    
}

extension FG_NewAdditionVC{
    func mycartListAPi(parameter: JSON){
        DispatchQueue.main.async {
            self.startLoading()
        }
        self.requestApis.myCartListApi(parameters: parameter) { (result, error) in
            if error == nil{
                if result != nil{
                    DispatchQueue.main.async {
                        self.stopLoading()
                        let myCartListArray = result?.lstCustomerCart ?? []
                        print(myCartListArray.count, "MyCart Count")
                        if myCartListArray.count != 0 {
                            self.myCartBadgesLbl.isHidden = false
                            self.myCartBadgesLbl.text = "\(myCartListArray.count)"
                            
                        }else{
                            self.myCartBadgesLbl.isHidden = true
                        }
                    }
                    
                }else{
                    DispatchQueue.main.async {
                        self.stopLoading()
                        print("\(error)")
                    }
                }
            }else{
                DispatchQueue.main.async {
                    self.stopLoading()
                    print("\(error)")
                }
            }
        }
    }
}
