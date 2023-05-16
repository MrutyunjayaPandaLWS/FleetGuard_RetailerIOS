//
//  HistoryNotificationsViewController.swift
//  CenturyPly_JSON
//
//  Created by Arokia-M3 on 03/03/22.
//

import UIKit
import Lottie
//import SDWebImage
import Kingfisher
import Firebase

class HistoryNotificationsViewController: BaseViewController, notificationDelgate {
    func didTappedNotificationimage(cell: HistoryNotificationsTableViewCell) {
        let secondaryIMG = cell.imageUrl.dropFirst(1)
        expandedimageview.kf.setImage(with: URL(string: "\(Promo_ImageData)\(secondaryIMG)"), placeholder: UIImage(named: "no_image1.jpg"))
        expandedview.isHidden = false
    }
    
    
    @IBOutlet weak var expandedview: UIView!
    @IBOutlet weak var animationLottieView: LottieAnimationView!
    private var animationView: LottieAnimationView?
    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var NotificationstableView: UITableView!
    @IBOutlet weak var noDataFound: UILabel!
    
    @IBOutlet weak var expandedimageview: UIImageView!
    @IBAction func closeexpandedview(_ sender: Any) {
        expandedview.isHidden = true
    }
    
    let userID = UserDefaults.standard.string(forKey: "UserID") ?? ""
    let loyaltyId = UserDefaults.standard.string(forKey: "LoyaltyId") ?? ""
    var VM = HistoryNotificationsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.VM.VC = self
        expandedview.isHidden = true
        self.noDataFound.isHidden = true
        self.NotificationstableView.register(UINib(nibName: "HistoryNotificationsTableViewCell", bundle: nil), forCellReuseIdentifier: "HistoryNotificationsTableViewCell")
        notificationListApi()
        self.NotificationstableView.delegate = self
        self.NotificationstableView.dataSource = self
        languagelocalization()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        guard let tracker = GAI.sharedInstance().defaultTracker else { return }
//        tracker.set(kGAIScreenName, value: "My Notifications")
//
//        guard let builder = GAIDictionaryBuilder.createScreenView() else { return }
//        tracker.send(builder.build() as [NSObject : AnyObject])

        tabBarController?.tabBar.isHidden =  true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    func playAnimation(){
        animationView = .init(name: "lf30_editor_jh47f7lt")
          animationView!.frame = animationLottieView.bounds
          // 3. Set animation content mode
          animationView!.contentMode = .scaleAspectFit
          // 4. Set animation loop mode
          animationView!.loopMode = .loop
          // 5. Adjust animation speed
          animationView!.animationSpeed = 0.5
        animationLottieView.addSubview(animationView!)
          // 6. Play animation
          animationView!.play()

    }
    
    func languagelocalization(){
        if UserDefaults.standard.string(forKey: "LanguageLocalizable") == "1"{
            self.header.text = "Notification"
            
        }else if UserDefaults.standard.string(forKey: "LanguageLocalizable") == "2"{
            self.header.text = "अधिसूचना"
            
        }else if UserDefaults.standard.string(forKey: "LanguageLocalizable") == "3"{
            self.header.text = "বিজ্ঞপ্তি"
        }else{
            self.header.text = "నోటిఫికేషన్"
        }
    }
    
    func notificationListApi(){
        let parameters = [
            "ActionType": 0,
            "ActorId": self.userID,
            "LoyaltyId": self.loyaltyId
        ] as [String: Any]
        print(parameters)
        self.VM.notificationListApi(parameters: parameters) { response in
            self.VM.notificationListArray = response?.lstPushHistoryJson ?? []
            print(self.VM.notificationListArray.count)
            if self.VM.notificationListArray.count != 0 {
                DispatchQueue.main.async {
                    self.NotificationstableView.isHidden = false
                    self.noDataFound.isHidden = true
                    self.NotificationstableView.reloadData()
                }
            }else{
                self.noDataFound.isHidden = false
                self.NotificationstableView.isHidden = true
                
            }
        }
        
    }
    
    @IBAction func backBTN(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
extension HistoryNotificationsViewController : UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.VM.notificationListArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryNotificationsTableViewCell") as! HistoryNotificationsTableViewCell
        cell.createdDate.text = self.VM.notificationListArray[indexPath.row].jCreatedDate ?? ""
        let header = self.VM.notificationListArray[indexPath.row].title ?? ""
        let message = self.VM.notificationListArray[indexPath.row].pushMessage ?? ""
        if header.count != 0{
            cell.notificationHeader.isHidden = false
            cell.notificationHeader.text = header
        }else{
            cell.notificationHeader.isHidden = true
        }
        if message.count != 0{
            cell.notificationMessage.isHidden = false
            cell.notificationMessage.text = message
        }else{
            cell.notificationMessage.isHidden = true
        }
        
        
//        cell.notificationImg.sd_setImage(with: URL(string: PROMO_IMG + receivedImage), placeholderImage: UIImage(named: "no_image1.jpg"))
        let receivedImage = String(self.VM.notificationListArray[indexPath.row].imagesURL ?? "")
        if  receivedImage != ""{
            cell.imageView1.isHidden = false
            cell.notificationImg.kf.setImage(with: URL(string: "\(Promo_ImageData)\(receivedImage.dropFirst(1))"), placeholder: UIImage(named: "no_image1.jpg"))
        }else{
            cell.imageView1.isHidden = true
        }
        cell.imageUrl = receivedImage
        cell.delegate = self
        return cell
        
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 140
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if  self.VM.notificationListArray[indexPath.item].imagesURL != nil {
//            var secondaryIMG = self.VM.notificationListArray[indexPath.item].imagesURL?.dropFirst(1) ?? ""
////            let splited = secondaryIMG.components(separatedBy: "~")
////            print("\(PROMO_IMG)\(splited[1])")
////            expandedimageview.sd_setImage(with: URL(string: "\(PROMO_IMG)\(secondaryIMG)"), placeholderImage: UIImage(named: "no_image1.jpg"))
//            expandedimageview.kf.setImage(with: URL(string: "\(Promo_ImageData)\(secondaryIMG)"), placeholder: UIImage(named: "no_image1.jpg"))
//            expandedview.isHidden = false
//            return
//        }else{
//            return
//        }

    }
}
