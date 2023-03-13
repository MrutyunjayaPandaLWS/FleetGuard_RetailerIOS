//
//  FG_NotificationVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by Arokia-M3 on 13/03/23.
//

import UIKit

class FG_NotificationVC: BaseViewController {
    
    @IBOutlet weak var notificationListTableView: UITableView!
    @IBOutlet weak var noDataFoundLbl: UILabel!
    
    
    var userID = UserDefaults.standard.string(forKey: "UserID") ?? ""
    var loyaltyId = UserDefaults.standard.string(forKey: "LoyaltyId") ?? ""
    
    var VM = HistoryNotificationsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.VM.VC = self
        self.notificationListTableView.separatorStyle = .none
        self.notificationListTableView.register(UINib(nibName: "MSP_NotificationTVC", bundle: nil), forCellReuseIdentifier: "MSP_NotificationTVC")
        self.notificationListTableView.delegate = self
        self.notificationListTableView.dataSource = self
        self.notificationListTableView.separatorStyle = .none
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.9, execute: {
            self.notificationListApi()
        })
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func notificationListApi(){
        DispatchQueue.main.async {
            self.startLoading()
        }
        let parameters = [
            "ActionType": 0,
            "ActorId": "\(userID)",
            "LoyaltyId": self.loyaltyId
        ] as [String: Any]
        print(parameters)
        self.VM.notificationListApi(parameters: parameters) { response in
            self.VM.notificationListArray = response?.lstPushHistoryJson ?? []
            print(self.VM.notificationListArray.count)
            DispatchQueue.main.async {
                if self.VM.notificationListArray.count != 0 {
                    DispatchQueue.main.async {
                        self.notificationListTableView.isHidden = false
                        self.noDataFoundLbl.isHidden = true
                        self.notificationListTableView.reloadData()
                    }
                }else{
                    self.noDataFoundLbl.isHidden = false
                    self.notificationListTableView.isHidden = true
                    
                }
                
                self.stopLoading()
            }
        }
        
    }
    
}
extension FG_NotificationVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return VM.notificationListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FG_NotificationTVC") as? FG_NotificationTVC
        cell?.selectionStyle = .none
        cell?.customerNameLbl.text = VM.notificationListArray[indexPath.row].title ?? "-"
        let receivedDate = (self.VM.notificationListArray[indexPath.row].jCreatedDate ?? "").split(separator: " ")
        cell?.dataLbl.text = self.VM.notificationListArray[indexPath.row].jCreatedDate
        cell?.pushMessageLbl.text = self.VM.notificationListArray[indexPath.row].pushMessage
        //        let imageurl = VM.notificationListArray[indexPath.row].imagesURL ?? ""
        //        let totalImgURL = PROMO_IMG1 + imageurl
        //        print(totalImgURL, "Total Image URL")
        //        cell?.productImage.sd_setImage(with: URL(string: totalImgURL), placeholderImage: UIImage(named: "icons8-life-cycle-96"))
        return cell!
    }
    
    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        return 100
    //    }
    
    //        func playAnimation(){
    //            animationView11 = .init(name: "Loader_v4")
    //            animationView11!.frame = loaderAnimatedView.bounds
    //            // 3. Set animation content mode
    //            animationView11!.contentMode = .scaleAspectFit
    //            // 4. Set animation loop mode
    //            animationView11!.loopMode = .loop
    //            // 5. Adjust animation speed
    //            animationView11!.animationSpeed = 0.5
    //            loaderAnimatedView.addSubview(animationView11!)
    //            // 6. Play animation
    //            animationView11!.play()
    //
    //        }
    
}
