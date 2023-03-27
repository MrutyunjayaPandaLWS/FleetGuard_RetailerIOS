//
//  FG_ProductCatalogueFilterVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 24/01/2023.
//

import UIKit

protocol sendProductFilterDelegate {
    func sendProductFilter(_ vc: FG_ProductCatalogueFilterVC)
}


class FG_ProductCatalogueFilterVC: BaseViewController {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var categoryTypeTableView: UITableView!
    @IBOutlet weak var categoryListCollectionView: UICollectionView!
    
    
    var userId = UserDefaults.standard.string(forKey: "UserID") ?? ""
    var loyaltyId = UserDefaults.standard.string(forKey: "LoyaltyId") ?? ""

    var filterHardCodeData = ["Segment","OEM","Model","Product Catagory"]
    var VM = FilterProductCatalogeVM()
    var catagoryName = ""
    var catagoryId = 1
    var catagoryId1 = 0
    var catagoryId2 = 0
    var catagoryId3 = 0
    var catagoryIDs = [String:Any]()
    var catgoryFilter = ""
    var selectedArrayData = ""
    var selectedArrayDataID = 0
    
    var delegate: sendProductFilterDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.VM.VC = self
        
        categoryTypeTableView.delegate = self
        categoryTypeTableView.dataSource = self
        
        categoryListCollectionView.delegate = self
        categoryListCollectionView.dataSource = self
        
        
        categoryTypeTableView.separatorStyle = .none
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (self.view.bounds.width - 100 - (self.categoryListCollectionView.contentInset.left + self.categoryListCollectionView.contentInset.right)) / 2, height: 35)
        layout.minimumLineSpacing = 2.5
        layout.minimumInteritemSpacing = 2.5
        self.categoryListCollectionView.collectionViewLayout = layout
        
        subView.clipsToBounds = true
        subView.layer.cornerRadius = 20
        subView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        mainView.clipsToBounds = true
        mainView.layer.cornerRadius = 20
        mainView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.filterArrayAPI()
        
    }
    
    
    @IBAction func closeBtn(_ sender: Any) {
       
        self.dismiss(animated: true)
    }
    
    @IBAction func clearAllBtbn(_ sender: Any) {
        self.selectedArrayDataID = 0
        self.delegate.sendProductFilter(self)
        self.dismiss(animated: true)
    }
    
    @IBAction func applyBtn(_ sender: Any) {
        self.delegate.sendProductFilter(self)
        self.dismiss(animated: true)
    }
    
    func filterArrayAPI(){
        self.catagoryIDs = [
                "BrandId": "\(0)",
                "Cat1": "\(self.catagoryId)",
                "Cat2": "\(catagoryId1)",
                "Cat3": "\(catagoryId2)",
                "Cat4": "\(catagoryId3)",
                "NlStatus": "NEW",
                "SkuMaxPrice": "\(0)",
                "SkuMinPrice": "\(0)"
        ]as [String: Any]
        
        let parameters = [
            "ActionType": "14",
            "ActorId": "\(userId)",
            "LoyaltyID": "\(loyaltyId)",
            "ProductDetails": self.catagoryIDs
        ]as [String: Any]
        print(parameters)
        self.VM.filterProdListingAPI(parameters: parameters)
    }

    
    
}

extension FG_ProductCatalogueFilterVC: UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterHardCodeData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FG_ProductCatalogueListTVC", for: indexPath) as! FG_ProductCatalogueListTVC
        cell.selectionStyle = .none
        cell.categoryTitleLbl.text = filterHardCodeData[indexPath.row]
        
        if self.catagoryId == 1{
            if indexPath.row == 0{
                cell.categoryTitleLbl.backgroundColor = #colorLiteral(red: 1, green: 0.9647058824, blue: 0.8196078431, alpha: 0.32)
                cell.categoryTitleLbl.textColor = .systemOrange
                cell.categoryTitleLbl.borderColor = #colorLiteral(red: 0.9607843137, green: 0.6392156863, blue: 0.007843137255, alpha: 0.32)
                cell.categoryTitleLbl.borderWidth = 1
            }else{
                cell.categoryTitleLbl.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                cell.categoryTitleLbl.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                cell.categoryTitleLbl.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                cell.categoryTitleLbl.borderWidth = 1
            }
        }else if self.catagoryId1 == 2{
            if indexPath.row == 1{
                cell.categoryTitleLbl.backgroundColor = #colorLiteral(red: 1, green: 0.9647058824, blue: 0.8196078431, alpha: 0.32)
                cell.categoryTitleLbl.textColor = .systemOrange
                cell.categoryTitleLbl.borderColor = #colorLiteral(red: 0.9607843137, green: 0.6392156863, blue: 0.007843137255, alpha: 0.32)
                cell.categoryTitleLbl.borderWidth = 1
            }else{
                cell.categoryTitleLbl.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                cell.categoryTitleLbl.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                cell.categoryTitleLbl.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                cell.categoryTitleLbl.borderWidth = 1
            }
        }else if self.catagoryId2 == 3{
            if indexPath.row == 2{
                cell.categoryTitleLbl.backgroundColor = #colorLiteral(red: 1, green: 0.9647058824, blue: 0.8196078431, alpha: 0.32)
                cell.categoryTitleLbl.textColor = .systemOrange
                cell.categoryTitleLbl.borderColor = #colorLiteral(red: 0.9607843137, green: 0.6392156863, blue: 0.007843137255, alpha: 0.32)
                cell.categoryTitleLbl.borderWidth = 1
            }else{
                cell.categoryTitleLbl.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                cell.categoryTitleLbl.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                cell.categoryTitleLbl.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                cell.categoryTitleLbl.borderWidth = 1
            }
        }else if self.catagoryId3 == 4{
            if indexPath.row == 3{
                cell.categoryTitleLbl.backgroundColor = #colorLiteral(red: 1, green: 0.9647058824, blue: 0.8196078431, alpha: 0.32)
                cell.categoryTitleLbl.textColor = .systemOrange
                cell.categoryTitleLbl.borderColor = #colorLiteral(red: 0.9607843137, green: 0.6392156863, blue: 0.007843137255, alpha: 0.32)
                cell.categoryTitleLbl.borderWidth = 1
            }else{
                cell.categoryTitleLbl.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                cell.categoryTitleLbl.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                cell.categoryTitleLbl.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                cell.categoryTitleLbl.borderWidth = 1
            }
        }else {
            cell.categoryTitleLbl.backgroundColor = #colorLiteral(red: 1, green: 0.9647058824, blue: 0.8196078431, alpha: 0.32)
            cell.categoryTitleLbl.textColor = .systemOrange
            cell.categoryTitleLbl.borderColor = #colorLiteral(red: 0.9607843137, green: 0.6392156863, blue: 0.007843137255, alpha: 0.32)
            cell.categoryTitleLbl.borderWidth = 1
        }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return VM.myfilterListingArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FG_Prod_CatalogueCVC", for: indexPath) as! FG_Prod_CatalogueCVC
        cell.titleLbl.text = VM.myfilterListingArray[indexPath.row].productName ?? ""
        cell.titleLbl.borderColor = .black
        cell.titleLbl.borderWidth = 1
        
//        if self.catagoryId == 1{
//            if indexPath.row == 0{
//                cell.titleLbl.backgroundColor = #colorLiteral(red: 1, green: 0.9647058824, blue: 0.8196078431, alpha: 0.32)
//                cell.titleLbl.textColor = .systemOrange
//                cell.titleLbl.borderColor = #colorLiteral(red: 0.9607843137, green: 0.6392156863, blue: 0.007843137255, alpha: 0.32)
//                cell.titleLbl.borderWidth = 1
//            }else{
//                cell.titleLbl.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//                cell.titleLbl.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
//                cell.titleLbl.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
//                cell.titleLbl.borderWidth = 1
//            }
//        }else{
//            cell.titleLbl.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//            cell.titleLbl.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
//            cell.titleLbl.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
//            cell.titleLbl.borderWidth = 1
//        }
        

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.catagoryName = filterHardCodeData[indexPath.row]
        print(self.catagoryName,"Catnamekd")
        if self.catagoryName == "Segment"{
            self.catgoryFilter = filterHardCodeData[indexPath.row]
            self.catagoryId = 1
            self.catagoryId1 = 0
            self.catagoryId2 = 0
            self.catagoryId3 = 0
            self.filterArrayAPI()
            self.categoryListCollectionView.reloadData()
            self.categoryTypeTableView.reloadData()
            
        }else if self.catagoryName == "OEM" {
            self.catagoryId = 0
            self.catagoryId1 = 2
            self.catagoryId2 = 0
            self.catagoryId3 = 0
            self.filterArrayAPI()
            self.categoryListCollectionView.reloadData()
            self.categoryTypeTableView.reloadData()
        }else if self.catagoryName == "Model"{
            self.catagoryId = 0
            self.catagoryId1 = 0
            self.catagoryId2 = 3
            self.catagoryId3 = 0
            
            self.filterArrayAPI()
            self.categoryListCollectionView.reloadData()
            self.categoryTypeTableView.reloadData()

        }else if self.catagoryName == "Product Catagory"{
            self.catagoryId = 0
            self.catagoryId1 = 0
            self.catagoryId2 = 0
            self.catagoryId3 = 4
            self.categoryTypeTableView.reloadData()
            self.filterArrayAPI()
            self.categoryListCollectionView.reloadData()
        }else{
            print(ErrorPointer.self)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if self.catagoryId == 1{
            self.selectedArrayData = VM.myfilterListingArray[indexPath.row].productName ?? ""
            self.selectedArrayDataID = VM.myfilterListingArray[indexPath.row].categoryId ?? 0
            print(selectedArrayData,"dskhdskh")
        }else if self.catagoryId1 == 2{
            self.selectedArrayData = VM.myfilterListingArray[indexPath.row].productName ?? ""
            self.selectedArrayDataID = VM.myfilterListingArray[indexPath.row].categoryId ?? 0
            print(selectedArrayData,"dskhdskh")
            
        }else if self.catagoryId2 == 3{
            self.selectedArrayData = VM.myfilterListingArray[indexPath.row].productName ?? ""
            self.selectedArrayDataID = VM.myfilterListingArray[indexPath.row].categoryId ?? 0
            print(selectedArrayData,"dskhdskh")
            
        }else if self.catagoryId3 == 4{
            self.selectedArrayData = VM.myfilterListingArray[indexPath.row].productName ?? ""
            self.selectedArrayDataID = VM.myfilterListingArray[indexPath.row].categoryId ?? 0
            print(selectedArrayData,"dskhdskh")
            
        }
        
        
    }
    
}
