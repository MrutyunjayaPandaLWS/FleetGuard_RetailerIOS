//
//  FG_CatalogueFilterView.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 23/01/2023.
//

import UIKit

protocol sendProductDelegate {
    func prodiuctDetails(_ vc:FG_CatalogueFilterView)
}

class FG_CatalogueFilterView: BaseViewController {
    
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
    
    var productCategoryListArray = [ProductCateogryModels]()
    var VM = FilterRedemptionCatVM()
    var userId = UserDefaults.standard.string(forKey: "UserID") ?? ""
    var loyaltyId = UserDefaults.standard.string(forKey: "LoyaltyId") ?? ""
    var totalPoints = UserDefaults.standard.string(forKey: "totalEarnedPoints") ?? ""
    
    var collectionViewData = ""
    var tableViewData = "Points Range"
    var categoriesId = 1
    var categoryId = 1
    var categoryID = 0
    var delegate: sendProductDelegate!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.VM.VC = self
        categoryTypeTableView.dataSource = self
        categoryTypeTableView.delegate = self
        categoryListCollectionView.dataSource = self
        categoryListCollectionView.delegate = self
        
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
        
        self.redemptionCategoryList()
    }
    
//    {
//        "ActionType": "12",
//        "ActorId": "34902",
//        "SearchText": "",
//        "LoyaltyID": "0F728M3-R000419",
//        "StartIndex":"2",
//        "PageSize":"20",
//        "ProductDetails": {
//            "BrandId": 0,
//            "Cat1": 0,
//            "Cat2": 0,
//             "Cat3": 0,
//            "Cat4": 0,
//            "NlStatus": "NEW",
//            "SkuMaxPrice": 0,
//            "SkuMinPrice": 0
//
//        }
    
//    func redemptionCatalogueListApi(){
//
//        let parameter = [
//                "ActionType": "6",
//                "ActorId": "\(self.userId)",
//                "NoOfRows": 10,
//                "ObjCatalogueDetails": [
//                    "MerchantId": 1,
//                    "CatogoryId": -1,
//                    "MultipleRedIds": ""
//                ],
//                "SearchText": "",
//                "Domain": "FLEET_GUARD",
//                "StartIndex": 1,
//                "Sort": ""
//        ] as [String: Any]
//        print(parameter)
//        self.VM.redemptionCatalogueListApi(parameter: parameter)
//    }
    

    
    func redemptionCategoryList(){
        let parameters = [
            "ActionType": "1",
            "ActorId": "\(userId)",
            "IsActive": 1
        ] as [String: Any]
        print(parameters)
        self.VM.redemptionCateogry(parameters: parameters)
    }

    
    @IBAction func closeBtn(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func clearAllBtbn(_ sender: Any) {
        collectionViewData = ""
        tableViewData = ""
        categoryID = 0
        self.delegate.prodiuctDetails(self)
        self.dismiss(animated: true)
    }
    
    @IBAction func applyBtn(_ sender: Any) {
        self.delegate.prodiuctDetails(self)
        self.dismiss(animated: true)
    }
    
    @IBAction func editDidBeginMinValueTF(_ sender: Any) {
        self.tableViewData = "Points Range"
        self.categoryTypeTableView.reloadData()
        self.categoryListCollectionView.reloadData()
    }
    
    @IBAction func editDidBeginMaxTF(_ sender: Any) {
        self.tableViewData = "Points Range"
        self.categoryTypeTableView.reloadData()
        self.categoryListCollectionView.reloadData()
    }
    
}
extension FG_CatalogueFilterView: UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pointsCatagoryArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FG_CatalogueCategoryTypeTVC", for: indexPath) as! FG_CatalogueCategoryTypeTVC
        cell.categoryTitleLbl.text = self.pointsCatagoryArray[indexPath.row]
        print(tableViewData,"slkdls")
        if tableViewData == "Points Range"{
            if indexPath.row == 0{
                cell.categoryTitleLbl.backgroundColor = #colorLiteral(red: 1, green: 0.9647058824, blue: 0.8196078431, alpha: 0.32)
                cell.categoryTitleLbl.textColor = #colorLiteral(red: 0.9607843137, green: 0.6392156863, blue: 0.007843137255, alpha: 0.32)
                cell.categoryTitleLbl.borderColor = #colorLiteral(red: 0.9607843137, green: 0.6392156863, blue: 0.007843137255, alpha: 0.32)
                cell.categoryTitleLbl.borderWidth = 1
            }else{
                cell.categoryTitleLbl.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                cell.categoryTitleLbl.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                cell.categoryTitleLbl.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                cell.categoryTitleLbl.borderWidth = 1
            }
            
        }else if tableViewData == "Category"{
            if indexPath.row == 1{
                cell.categoryTitleLbl.backgroundColor = #colorLiteral(red: 1, green: 0.9647058824, blue: 0.8196078431, alpha: 0.32)
                cell.categoryTitleLbl.textColor = #colorLiteral(red: 0.9607843137, green: 0.6392156863, blue: 0.007843137255, alpha: 0.32)
                cell.categoryTitleLbl.borderColor = #colorLiteral(red: 0.9607843137, green: 0.6392156863, blue: 0.007843137255, alpha: 0.32)
                cell.categoryTitleLbl.borderWidth = 1
            }else{
                cell.categoryTitleLbl.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                cell.categoryTitleLbl.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                cell.categoryTitleLbl.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                cell.categoryTitleLbl.borderWidth = 1
            }
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableViewData = self.pointsCatagoryArray[indexPath.row]
        print(tableViewData,"lsjidlsd")
        collectionViewData = ""
        self.redemptionCategoryList()
        self.categoryListCollectionView.reloadData()
        self.categoryTypeTableView.reloadData()
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      
        print(tableViewData,"skjd")
        if self.tableViewData == "Category" {
            return self.VM.redemptionCategoryArray.count
        }else if self.tableViewData == "Points Range" {
            return self.filterByRangeArray.count
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FG_CategoryCVC", for: indexPath) as! FG_CategoryCVC
        if tableViewData == "Points Range"{
            cell.titleLbl.text = self.filterByRangeArray[indexPath.row]
            
        }else if tableViewData == "Category"{
            cell.titleLbl.text = VM.redemptionCategoryArray[indexPath.row].catogoryName ?? ""
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if tableViewData == "Points Range"{
//            self.collectionViewData = self.filterByRangeArray[indexPath.row]
//            print(collectionViewData,"ksjsdkj")
            self.categoryID = 0
            let selectedData = self.filterByRangeArray[indexPath.row]
        
            if selectedData == "All Points"{
                self.collectionViewData = "0-1000000"
            }else if selectedData == "Under 1000 pts"{
                self.collectionViewData = "10-999"
            }else if selectedData == "1000 - 4999 pts"{
                self.collectionViewData = "1000-4999"
            }else if selectedData == "5000 - 24999 pts"{
                self.collectionViewData = "5000-24999"
            }else if selectedData == "25000 & Above pts"{
                self.collectionViewData = "25000 - 999999999"
            }
            //categoryTypeTableView.reloadData()
            
        }else if tableViewData == "Category"{
            self.collectionViewData = ""
            self.categoryID = self.VM.redemptionCategoryArray[indexPath.row].catogoryId ?? 0
            categoryTypeTableView.reloadData()
        }
    }
}
