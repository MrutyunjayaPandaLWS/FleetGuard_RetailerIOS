//
//  FG_DropDownVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 04/02/2023.
//

import UIKit
protocol DropDownDelegate : AnyObject {
    func stateDidTap(_ vc: FG_DropDownVC)
    func cityDidTap(_ vc: FG_DropDownVC)
    func preferredLanguageDidTap(_ vc: FG_DropDownVC)
    func genderDidTap(_ vc: FG_DropDownVC)
    func titleDidTap(_ vc: FG_DropDownVC)
    func dealerDipTap(_ vc: FG_DropDownVC)
    func statusDipTap(_ vc: FG_DropDownVC)
    func redemptionStatusDidTap(_ vc: FG_DropDownVC)
    func helpTopicDidTap(_ vc: FG_DropDownVC)
}
class FG_DropDownVC: BaseViewController {

    @IBOutlet var heightOfTable: NSLayoutConstraint!
    @IBOutlet var noDataFoundLbl: UILabel!
    @IBOutlet weak var dropDownTableView: UITableView!
 
    weak var delegate:DropDownDelegate?
    var selectedTitle = ""
    var selectedId = ""
    var isComeFrom = 0
    var selectedStateID = -1
    var selectedCityID = -1
    var selectedPreferredID = -1
    var stateIDfromPreviousScreen = -1
    var countryIDfromPreviousScreen = 15
    
    var selectedState = ""
    var selectedCity = ""
    var selectedLanguage = ""
    var selectedGender = ""
    
    var selectedDealerName = ""
    var selectedDealerId = -1
    
    var helpTopicName = ""
    var helpTopicId = 0
    
    
    var seletedRedemptionStatusId = -1
    var selectedRedemptionStatus = ""
    
    var VM = DropDownModels()
    var userID = UserDefaults.standard.string(forKey: "UserID") ?? ""
    var loyaltyID = UserDefaults.standard.string(forKey: "LoyaltyId") ?? ""
    var genderArray = [String]()
    var titleArray = [String]()
    var statusListArray = ["Pending","Approved","Rejected", "Escalated", "Cancelled"]
    var genderList = ["Male", "Female", "Don't want to show"]
    var selectedStatusName = ""
    var selectedStatusId = -1
    override func viewDidLoad() {
        super.viewDidLoad()
        self.VM.VC = self
        self.dropDownTableView.delegate = self
        self.dropDownTableView.dataSource = self
        if isComeFrom == 1{
             self.stateListingAPI(CountryID: countryIDfromPreviousScreen)
         }else if isComeFrom == 2{
             self.cityListingAPI(stateID: stateIDfromPreviousScreen)
         }else if isComeFrom == 3{
            // self.lodgeQueryStatusApi()
         }else if isComeFrom == 4{
             self.getHelpTopicApi()
         }
        print(isComeFrom, "isComeFrom")
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
        {
            let touch = touches.first
            if touch?.view != self.dropDownTableView
            {
                self.dismiss(animated: true, completion: nil) }
        }

    func stateListingAPI(CountryID: Int){
        let parameterJSON = [
            "ActionType":"2",
            "CountryID":15,
            "IsActive":"true",
            "SortColumn":"STATE_NAME",
            "SortOrder":"ASC",
            "StartIndex":"1"
        ] as  [String:Any]
        print(parameterJSON)
        self.VM.statelisting(parameters: parameterJSON)
    }

    func cityListingAPI(stateID: Int){
        let parameterJSON = [
            "ActionType":"2",
            "IsActive":"true",
            "SortColumn":"CITY_NAME",
            "SortOrder":"ASC",
            "StateId":"\(stateIDfromPreviousScreen)"
        ] as  [String:Any]
        print(parameterJSON)
        self.VM.citylisting(parameters: parameterJSON)
    }
    func getHelpTopicApi(){
        let parameter = [
            "ActionType": "4",
            "ActorId": "\(self.userID)",
               "IsActive": "true"
        ] as [String: Any]
        self.VM.helpTopiceListAPi(parameter: parameter)
    }
    
    
    
    
//    func preferredLanguageApi(){
//        let parameterJSON = [
//            "ActionType":24
//        ] as  [String:Any]
//        print(parameterJSON)
//        self.VM.preferredLanguageApi(parameters: parameterJSON)
//    }
//    func lodgeQueryStatusApi(){
//        let parameterJSON = [
//            "ActionType": 150
//        ] as  [String:Any]
//        print(parameterJSON)
//        self.VM.myRedemptionListApi(parameters: parameterJSON)
//    }
//    func myRedemptionStatusApi(){
//        let parameterJSON = [
//            "ActionType": 138
//        ] as  [String:Any]
//        print(parameterJSON)
//        self.VM.myRedemptionListApi(parameters: parameterJSON)
//    }
//    func claimPointsDealerApi(){
//        self.VM.myClaimsPointsDelarArray.removeAll()
//        let parameters = [
//                "ActionType": 68,
//                "ActorId": "\(userID)"
//                ] as [String : Any]
//                print(parameters)
//                self.VM.claimPointsDelarAPI(parameters: parameters) { response in
//                    self.VM.myClaimsPointsDelarArray = response?.lstAttributesDetails ?? []
//                    print(self.VM.myClaimsPointsDelarArray.count, "")
//                    DispatchQueue.main.async {
//                        if self.VM.myClaimsPointsDelarArray.count != 0 {
//                            self.dropDownTableView.isHidden = false
//                            self.dropDownTableView.reloadData()
//                            self.noDataFoundLbl.isHidden = true
//                            //self.heightOfTable.constant =
//                            if self.VM.myClaimsPointsDelarArray.count < 10 {
//                                for item in self.VM.myClaimsPointsDelarArray {
//                                    self.heightOfTable.constant = CGFloat(self.VM.myClaimsPointsDelarArray.count * 30)
//                                }
//                            }else{
//                                self.heightOfTable.constant = 350
//                            }
//
//                        }else{
//                            self.dropDownTableView.isHidden = true
//                            self.noDataFoundLbl.isHidden = false
//                            //self.dismiss(animated: true)
//                            //self.view.makeToast("No Data Found !!", duration: 0.2, position: .center)
//                        }
//                        self.stopLoading()
//                    }
//                }
//    }
    
    

}
extension FG_DropDownVC: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(isComeFrom, "Its From")
        
        if isComeFrom == 1{
            return self.VM.stateArray.count
        }else if isComeFrom == 2{
            return self.VM.cityArray.count
        }else if self.isComeFrom == 4{
            return self.VM.helpTopicListArray.count
        }else if self.isComeFrom == 5{
            return genderList.count
        }else{
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FG_DropDownTVC", for: indexPath) as? FG_DropDownTVC
        cell!.selectionStyle = .none
        if isComeFrom == 1{
            cell!.dropdownInfo.text = self.VM.stateArray[indexPath.row].stateName ?? ""
        }else if isComeFrom == 2{
            cell!.dropdownInfo.text = self.VM.cityArray[indexPath.row].cityName ?? ""
        }else if isComeFrom == 3{
            //cell!.dropdownInfo.text = self.VM.myRedemptionListArray[indexPath.row].attributeValue ?? ""
        }else if self.isComeFrom == 4{
            cell!.dropdownInfo.text = self.VM.helpTopicListArray[indexPath.row].helpTopicName ?? ""
        }else if self.isComeFrom == 5{
            cell!.dropdownInfo.text = self.genderList[indexPath.row]
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isComeFrom == 1{
            self.selectedState = self.VM.stateArray[indexPath.row].stateName ?? ""
            self.selectedStateID = self.VM.stateArray[indexPath.row].stateId ?? -1
            self.delegate?.stateDidTap(self)
            self.dismiss(animated: true, completion: nil)
        }else if isComeFrom == 2{
            self.selectedCity = self.VM.cityArray[indexPath.row].cityName ?? ""
            self.selectedCityID = self.VM.cityArray[indexPath.row].cityId ?? -1
            self.delegate?.cityDidTap(self)
            self.dismiss(animated: true, completion: nil)
        }else if isComeFrom == 3{
            //            self.selectedRedemptionStatus = self.VM.myRedemptionListArray[indexPath.row].attributeValue ?? ""
            //            self.seletedRedemptionStatusId = self.VM.myRedemptionListArray[indexPath.row].attributeId ?? -1
            //            self.delegate?.redemptionStatusDidTap(self)
            self.dismiss(animated: true, completion: nil)
            
        }else if isComeFrom == 4{
            self.helpTopicName = self.VM.helpTopicListArray[indexPath.row].helpTopicName ?? ""
            self.helpTopicId = self.VM.helpTopicListArray[indexPath.row].helpTopicId ?? -1
            self.delegate?.helpTopicDidTap(self)
            self.dismiss(animated: true, completion: nil)
        }else if isComeFrom == 5 {
            self.selectedGender = self.genderList[indexPath.row]
            self.delegate?.genderDidTap(self)
            self.dismiss(animated: true, completion: nil)
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
}
