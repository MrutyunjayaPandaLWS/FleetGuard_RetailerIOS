//
//  FG_ProductCatalogueListVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 24/01/2023.
//

import UIKit

class FG_ProductCatalogueListVC: BaseViewController, SendDataToDetailsDelegate,sendProductFilterDelegate {
    func sendProductFilter(_ vc: FG_ProductCatalogueFilterVC) {
        self.VM.productsArray.removeAll()
        self.VM.productListArray.removeAll()
        if vc.catagoryId == 1{
            self.categoryId = vc.selectedArrayDataID
            self.categoryId1 = 0
            self.categoryId2 = 0
            self.categoryId3 = 0
        }else if vc.catagoryId1 == 2{
            self.categoryId = 0
            self.categoryId2 = 0
            self.categoryId3 = 0
            self.categoryId1 = vc.selectedArrayDataID
        }else if vc.catagoryId2 == 3{
            self.categoryId = 0
            self.categoryId1 = 0
            self.categoryId3 = 0
            self.categoryId2 = vc.selectedArrayDataID
        }else if vc.catagoryId3 == 4{
            self.categoryId = 0
            self.categoryId1 = 0
            self.categoryId2 = 0
            self.categoryId3 = vc.selectedArrayDataID
        }
        self.productListApi(startIndex: startindex, searchText: self.searchTF.text ?? "")
    }
  
    @IBOutlet weak var headerText: UILabel!
    @IBOutlet weak var countLbl: UILabel!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchTF: UITextField!
    @IBOutlet weak var nodatafoundLbl: UILabel!
    @IBOutlet weak var productCatalgoueTableView: UITableView!
 
    var VM = FG_ProductListVM()
    var userId = UserDefaults.standard.string(forKey: "UserID") ?? ""
    var loyaltyId = UserDefaults.standard.string(forKey: "LoyaltyId") ?? ""
    var noofelements = 0
    var startindex = 0
    
    var categoryId = 0
    var categoryId1 = 0
    var categoryId2 = 0
    var categoryId3 = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.VM.VC = self
        productCatalgoueTableView.delegate = self
        productCatalgoueTableView.dataSource = self
        self.subView.clipsToBounds = true
        self.subView.layer.cornerRadius = 20
        self.subView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        self.nodatafoundLbl.isHidden = true
        self.countLbl.isHidden = true
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.productListApi(startIndex: startindex, searchText: self.searchTF.text ?? "")
        self.myCartApi()
    }
    
    @IBAction func filterButton(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_ProductCatalogueFilterVC") as! FG_ProductCatalogueFilterVC
        vc.delegate = self
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true)
    }
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cartBtn(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_ProductCatalogueMyCartVC") as! FG_ProductCatalogueMyCartVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func productListApi(startIndex: Int, searchText: String){
        let parameter = [
                    "ActionType": "12",
                    "ActorId": "\(self.userId)",
                    "SearchText": searchText,
                    "LoyaltyID": "\(self.loyaltyId)",
                    "StartIndex":startIndex,
                    "PageSize": 20,
                    "ProductDetails": [
                        "BrandId": 0,
                        "Cat1": "\(categoryId)",
                        "Cat2": "\(categoryId1)",
                        "Cat3": "\(categoryId2)",
                        "Cat4": "\(categoryId3)",
                        "NlStatus": "NEW",
                        "SkuMaxPrice": 0,
                        "SkuMinPrice": 0
                    ]
        ] as [String: Any]
        print(parameter)
        self.VM.productListApi(parameter: parameter)
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
        self.VM.mycartListAPi(parameter: parameter)
    }
    
    func sendDataToDetails(_ cell: FG_ProdCatalogueTVC) {
        guard let tappedIndexPath = self.productCatalgoueTableView.indexPath(for: cell) else{return}
        if cell.nextButton.tag == tappedIndexPath.row{
            let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_ProductCatalogueDetailsVC") as! FG_ProductCatalogueDetailsVC
            vc.productImageURL = self.VM.productListArray[tappedIndexPath.row].productImg ?? ""
            vc.productName = self.VM.productListArray[tappedIndexPath.row].productName ?? ""
            vc.partNo = self.VM.productListArray[tappedIndexPath.row].productCode ?? ""
            vc.shortDesc = self.VM.productListArray[tappedIndexPath.row].productShortDesc ?? ""
            vc.dap = "\(self.VM.productListArray[tappedIndexPath.row].salePrice ?? 0)"
            vc.mrp = "\(self.VM.productListArray[tappedIndexPath.row].mrp ?? "")"
            vc.productId = "\(self.VM.productListArray[tappedIndexPath.row].productId ?? 0)"
            vc.productDesc = "\(self.VM.productListArray[tappedIndexPath.row].productDesc ?? "")"
//            vc.cateogryId = "\(self.VM.productListArray[tappedIndexPath.row].category ?? 0)"
         
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        
    }
    
    
    @IBAction func searchByEditingChanged(_ sender: Any) {
        
        if self.searchTF.text!.count != 0 || self.searchTF.text ?? "" != ""{
            if self.VM.productListArray.count > 0 {
                let arr = self.VM.productListArray.filter{ ($0.productName!.localizedCaseInsensitiveContains(self.searchTF.text!))}
                print(arr.count,"skdjhkdsjh")
                if self.searchTF.text! != ""{
                    if arr.count > 0 {
                        self.VM.productListArray.removeAll(keepingCapacity: true)
                        print(VM.productListArray.count,"jshdhs")
                        self.VM.productListArray = arr
                        self.productCatalgoueTableView.reloadData()
                        self.productCatalgoueTableView.isHidden = false
                        self.nodatafoundLbl.isHidden = true
                    }else {
                        self.VM.productListArray = self.VM.productsArray
                        self.productCatalgoueTableView.reloadData()
                        self.productCatalgoueTableView.isHidden = true
                        self.nodatafoundLbl.isHidden = false
                    }
                }else{
                    self.VM.productListArray = self.VM.productsArray
                    self.productCatalgoueTableView.reloadData()
                    productCatalgoueTableView.isHidden = false
                    nodatafoundLbl.isHidden = true
                }
                let searchText = self.searchTF.text!
                if searchText.count > 0 || self.VM.productListArray.count == self.VM.productsArray.count {
                    self.productCatalgoueTableView.reloadData()
                }
            }
        }else{
            self.VM.productListArray.removeAll()
            self.productCatalgoueTableView.reloadData()
            productListApi(startIndex: self.startindex, searchText: self.searchTF.text ?? "")
            nodatafoundLbl.isHidden = true
        }
    }
    
    
}
extension FG_ProductCatalogueListVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.VM.productListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FG_ProdCatalogueTVC", for: indexPath) as! FG_ProdCatalogueTVC
        cell.selectionStyle = .none
        cell.delegate = self
        cell.productName.text = self.VM.productListArray[indexPath.row].productName ?? ""
        cell.partNoLbl.text = self.VM.productListArray[indexPath.row].productCode ?? ""
        cell.dapValue.text = "\(self.VM.productListArray[indexPath.row].salePrice ?? 0)"
        cell.mrpValue.text = "\(self.VM.productListArray[indexPath.row].mrp ?? "")"
        cell.productName.backgroundColor = .white
//        vc.dap = "\(self.VM.productListArray[tappedIndexPath.row].salePrice ?? 0)"
//        vc.mrp = "\(self.VM.productListArray[tappedIndexPath.row].mrp ?? "")"
        cell.nextButton.tag = indexPath.row
        
//        @IBOutlet weak var productImage: UIImageView!
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //guard let tappedIndexPath = self.productCatalgoueTableView.indexPath(for: cell) else{return}
        //if cell.nextButton.tag == tappedIndexPath.row{
            let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_ProductCatalogueDetailsVC") as! FG_ProductCatalogueDetailsVC
            vc.productImageURL = self.VM.productListArray[indexPath.row].productImg ?? ""
            vc.productName = self.VM.productListArray[indexPath.row].productName ?? ""
            vc.partNo = self.VM.productListArray[indexPath.row].productCode ?? ""
            vc.shortDesc = self.VM.productListArray[indexPath.row].productShortDesc ?? ""
            vc.dap = "\(self.VM.productListArray[indexPath.row].salePrice ?? 0)"
            vc.mrp = "\(self.VM.productListArray[indexPath.row].mrp ?? "")"
            vc.productId = "\(self.VM.productListArray[indexPath.row].productId ?? 0)"
            vc.productDesc = "\(self.VM.productListArray[indexPath.row].productDesc ?? "")"
//          vc.cateogryId = "\(self.VM.productListArray[tappedIndexPath.row].category ?? 0)"
         
            self.navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            if indexPath.row == VM.productListArray.count - 2{
                if noofelements == 20{
                    startindex = startindex + 1
                    self.productListApi(startIndex: startindex, searchText: self.searchTF.text ?? "")
                }else if noofelements < 20{
                    return
                }else{
                    print("n0 more elements")
                    return
                }
            }
        }
    
    
    
}
