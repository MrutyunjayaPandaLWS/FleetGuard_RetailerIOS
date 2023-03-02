//
//  FG_LodgeQueryVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 19/01/2023.
//

import UIKit

class FG_LodgeQueryVC: BaseViewController, DateSelectedDelegate {
    
     func acceptDate(_ vc: FG_DOBVC) {
         if vc.isComeFrom == "1"{
             self.selectedFromDate = vc.selectedDate
             self.fromDateBtn.setTitle("\(vc.selectedDate)", for: .normal)
         }else{
             self.selectedToDate = vc.selectedDate
             self.toDateBtn.setTitle("\(vc.selectedDate)", for: .normal)
         }
     }
     func declineDate(_ vc: FG_DOBVC) {
         self.dismiss(animated: true)
     }
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var filterTitle: UILabel!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var filterView: UIView!
    @IBOutlet weak var headerText: UILabel!
    @IBOutlet weak var lodgeQueryListTableView: UITableView!

    @IBOutlet weak var fromDateBtn: UIButton!

    @IBOutlet weak var toDateBtn: UIButton!

    @IBOutlet weak var filterByStatusLbl: UILabel!

    @IBOutlet weak var pendingBtn: UIButton!

    @IBOutlet weak var approvedBtn: UIButton!

    @IBOutlet weak var cancelledBtn: UIButton!

    @IBOutlet weak var lodgeQueryBtn: GradientButton!
    @IBOutlet weak var resolveFollowUpBtn: UIButton!
    @IBOutlet weak var reopenBtn: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var applyBtn: UIButton!
    
    @IBOutlet weak var filterClickBTN: UIButton!
    
    var itsFrom = ""
    var VM = FG_QueryListVM()
    var selectedQueryTopic = ""
    var selectedQueryTopicId = -1
    var selectedStatusId = -1
    var selectedFromDate = ""
    var selectedToDate = ""
    var status = ""
    var noofelements = 0
    var startindex = 1
    
    
    var userId = UserDefaults.standard.string(forKey: "UserID") ?? ""
    var loyaltyId = UserDefaults.standard.string(forKey: "LoyaltyId") ?? ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.VM.VC = self
        lodgeQueryListTableView.delegate = self
        lodgeQueryListTableView.dataSource = self
        
        self.subView.isHidden = true
        self.filterView.isHidden = true
        subView.clipsToBounds = true
        subView.layer.cornerRadius = 20
        subView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        filterView.clipsToBounds = true
        filterView.layer.cornerRadius = 20
        filterView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        lodgeQueryBtn.clipsToBounds = true
        lodgeQueryBtn.layer.cornerRadius = 16
        lodgeQueryBtn.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        if self.itsFrom == "SideMenu"{
            self.backBtn.isHidden = false
        }else{
            self.backBtn.isHidden = false
        }
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.queryListApi(queryTopic: self.selectedQueryTopicId, statusId: self.selectedStatusId, StartIndex: startindex)
    }
    
//
//    "ActionType": "1",
//               "ActorId": "45822",
//               "HelpTopicID": ""

    func queryListApi(queryTopic: Int, statusId: Int,StartIndex: Int){
        let parameter = [
            "ActionType": "1",
            "ActorId": "\(self.userId)",
            "HelpTopicID": queryTopic,
            "JFromDate":"\(selectedFromDate)",
            "JToDate":"\(selectedToDate)",
            "PageSize": 20,
            "StartIndex": StartIndex,
            "TicketStatusId": "\(self.status)"
        ] as [String: Any]
        print(parameter)
        self.VM.querListsApi(parameter: parameter)
    }
    
    
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func languageBtn(_ sender: Any) {
    }
    @IBAction func notificationBtn(_ sender: Any) {
    }
    @IBAction func filterBtn(_ sender: Any) {
        if self.filterView.isHidden == false{
            self.filterView.isHidden = true
        }else{
            self.filterView.isHidden = false
        }
}
@IBAction func closeBtn(_ sender: Any) {
    self.filterView.isHidden = true
}

@IBAction func fromDateButton(_ sender: Any) {
    
    let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_DOBVC") as? FG_DOBVC
    vc!.delegate = self
    vc!.isComeFrom = "1"
    vc!.modalPresentationStyle = .overCurrentContext
    vc!.modalTransitionStyle = .coverVertical
    self.present(vc!, animated: true, completion: nil)
    
}

@IBAction func toDateButton(_ sender: Any) {
    let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_DOBVC") as? FG_DOBVC
    vc!.delegate = self
    vc!.isComeFrom = "2"
    vc!.modalPresentationStyle = .overCurrentContext
    vc!.modalTransitionStyle = .coverVertical
    self.present(vc!, animated: true, completion: nil)
}

@IBAction func pendingButton(_ sender: Any) {
    
    //    1 Pending
    //    2 Re-Open
    //    3 Resolved
    //    4 Closed
    //    5 Resolved-Follow Up

    self.status = "1"
    self.approvedBtn.backgroundColor = .white
    self.pendingBtn.backgroundColor = .systemOrange
    self.cancelledBtn.backgroundColor = .white
    self.cancelledBtn.backgroundColor = .white
    self.reopenBtn.backgroundColor = .white
    self.resolveFollowUpBtn.backgroundColor = .white
}

@IBAction func approvedButton(_ sender: Any) {
    
    self.status = "3"
    self.approvedBtn.backgroundColor = .systemOrange
    self.pendingBtn.backgroundColor = .white
    self.cancelledBtn.backgroundColor = .white
    self.reopenBtn.backgroundColor = .white
    self.resolveFollowUpBtn.backgroundColor = .white
}

@IBAction func cancelledButton(_ sender: Any) {
    
    self.status = "4"
    self.approvedBtn.backgroundColor = .white
    self.pendingBtn.backgroundColor = .white
    self.cancelledBtn.backgroundColor = .systemOrange
    self.reopenBtn.backgroundColor = .white
    self.resolveFollowUpBtn.backgroundColor = .white
}

    @IBAction func reopenBtn(_ sender: Any) {
        self.status = "2"
        self.approvedBtn.backgroundColor = .white
        self.pendingBtn.backgroundColor = .white
        self.cancelledBtn.backgroundColor = .white
        self.reopenBtn.backgroundColor = .systemOrange
        self.resolveFollowUpBtn.backgroundColor = .white
    }
    
    @IBAction func resolveFollowUpBtn(_ sender: Any) {
        self.status = "5"
        self.approvedBtn.backgroundColor = .white
        self.pendingBtn.backgroundColor = .white
        self.cancelledBtn.backgroundColor = .white
        self.reopenBtn.backgroundColor = .white
        self.resolveFollowUpBtn.backgroundColor = .systemOrange
    }
    
    @IBAction func createNewQueryBtn(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_CreatenewqueryVC") as! FG_CreatenewqueryVC
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
@IBAction func applyButton(_ sender: Any) {
    print(status,"srjdh")
    print(self.selectedFromDate,"slkdls")
    print(selectedToDate,"lskdjsldm")
    self.queryListApi(queryTopic: self.selectedQueryTopicId, statusId: self.selectedStatusId, StartIndex: startindex)
    self.filterView.isHidden = true
}
@IBAction func clearbtn(_ sender: Any) {
    
    self.status = ""
    self.fromDateBtn.setTitle("From Date", for: .normal)
    self.toDateBtn.setTitle("To Date", for: .normal)
    self.approvedBtn.backgroundColor = .white
    self.pendingBtn.backgroundColor = .white
    self.cancelledBtn.backgroundColor = .white
    self.filterView.isHidden = true
}
}

extension FG_LodgeQueryVC: UITableViewDelegate, UITableViewDataSource{
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return VM.queryListArray.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "FG_LodgeQueryTVC", for: indexPath) as! FG_LodgeQueryTVC
    cell.selectionStyle = .none
    
    cell.queryId.text = VM.queryListArray[indexPath.row].customerTicketRefNo ?? ""
    cell.statusLbl.text = VM.queryListArray[indexPath.row].ticketStatus ?? "-"
    
    let querydateAndTime = VM.queryListArray[indexPath.row].jCreatedDate ?? ""
    let querydateAndTimeArray = querydateAndTime.components(separatedBy: " ")
    cell.dateLbl.text = "\(querydateAndTimeArray[0])"
    
    cell.queryInfoLbl.text = VM.queryListArray[indexPath.row].helpTopic ?? "-"
    cell.timeLbl.text = "\(querydateAndTimeArray[1])"

    return cell
}

func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 160
}
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let centerviewcontroller = storyboard!.instantiateViewController(withIdentifier: "ChatListViewController") as! ChatListViewController
//        print(VM.queryListArray[indexPath.section].customerTicketID ?? 0)
//        centerviewcontroller.CustomerTicketIDchatvc = "\(VM.queryListArray[indexPath.row].customerTicketID ?? 0)"
//        centerviewcontroller.helptopicid = "\(VM.queryListArray[indexPath.row].helpTopicID ?? 0)"
//        centerviewcontroller.querysummary = VM.queryListArray[indexPath.row].querySummary ?? ""
//        centerviewcontroller.helptopicdetails = VM.queryListArray[indexPath.row].helpTopic ?? ""
//        centerviewcontroller.querydetails = VM.queryListArray[indexPath.row].queryDetails ?? ""
//        self.navigationController?.pushViewController(centerviewcontroller, animated: true)
    }
    
    
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            if indexPath.row == VM.queryListArray.count - 2{
                if noofelements == 20{
                    startindex = startindex + 1
                    self.queryListApi(queryTopic: self.selectedQueryTopicId, statusId: self.selectedStatusId, StartIndex: startindex)
                }else if noofelements < 20{
                    return
                }else{
                    print("n0 more elements")
                    return
                }
            }
        }
    
}
