//
//  FG_StatementVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 25/01/2023.
//

import UIKit

class FG_StatementVC: BaseViewController,StatementViewDelegate{
    func viewActBTN(_ cell: FG_StatementTVC) {
            guard let tappedIndexPath = statementTableView.indexPath(for: cell) else { return }
        let urlData = self.VM.rlpStatemnetArray[tappedIndexPath.row].pdF_LINK ?? ""
            print(urlData)
            let urlString = urlData
            let url = URL(string: urlString)
            let fileName = String((url!.lastPathComponent)) as NSString
            // Create destination URL
            let documentsUrl:URL =  (FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first as URL?)!
            let destinationFileUrl = documentsUrl.appendingPathComponent("\(fileName)")
            //Create URL to the source file you want to download
            let fileURL = URL(string: urlString)
            let sessionConfig = URLSessionConfiguration.default
            let session = URLSession(configuration: sessionConfig)
            let request = URLRequest(url:fileURL!)
            let task = session.downloadTask(with: request) { (tempLocalUrl, response, error) in
                if let tempLocalUrl = tempLocalUrl, error == nil {
                    // Success
                    if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                        print("Successfully downloaded. Status code: \(statusCode)")
                        let statusData = statusCode
                        if statusData == 404 {
                            DispatchQueue.main.async {
                                self.view.makeToast("Failed To Download PDF", duration: 2.0, position: .bottom)
                                self.stopLoading()
                            }
                        }else{
                            print("Successfully downloaded. Status code: \(statusCode)")
                        }
                    }
                    do {
                        try FileManager.default.copyItem(at: tempLocalUrl, to: destinationFileUrl)
                        do {
                            //Show UIActivityViewController to save the downloaded file
                            let contents  = try FileManager.default.contentsOfDirectory(at: documentsUrl, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
                            for indexx in 0..<contents.count {
                                DispatchQueue.main.async {
                                    
                                    if contents[indexx].lastPathComponent == destinationFileUrl.lastPathComponent {
                                        let activityViewController = UIActivityViewController(activityItems: [contents[indexx]], applicationActivities: nil)
                                        activityViewController.modalTransitionStyle = .coverVertical
                                        activityViewController.modalPresentationStyle = .overFullScreen
                                        self.present(activityViewController, animated: true, completion: nil)
                                        self.stopLoading()
                                    }
                                }
                               
                            }
                        }
                        catch (let err) {
                            print("error: \(err)")
                        }
                    } catch (let writeError) {
                        print("Error creating a file \(destinationFileUrl) : \(writeError)")
                    }
                } else {
                    print("Error took place while downloading a file. Error description: \(error?.localizedDescription ?? "")")
                }
            }
            task.resume()
    }
    

    @IBOutlet weak var statementTableView: UITableView!
    @IBOutlet weak var viewLbl: UILabel!
    @IBOutlet weak var balanceLbl: UILabel!
    @IBOutlet weak var ptsEarnedLbl: UILabel!
    @IBOutlet weak var monthLbl: UILabel!
    @IBOutlet weak var headerText: UILabel!
    var VM = RPLStatmentViewVM()
    
    var userId = UserDefaults.standard.string(forKey: "UserID") ?? ""
    var loyaltyId = UserDefaults.standard.string(forKey: "LoyaltyId") ?? ""
    let passBookNumber = UserDefaults.standard.string(forKey: "passBookNumber") ?? ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.VM.VC = self
        self.statementTableView.delegate = self
        self.statementTableView.dataSource = self
        self.rlpStatemnet()
    }
        
    func rlpStatemnet(){
        let parameters = [
            "ActionType": "4",
            "ActorId":"\(userId)"
        ] as [String: Any]
        print(parameters)
        self.VM.rplStatemnetViewAPI(parameters: parameters)
    }
    

    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
extension FG_StatementVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return VM.rlpStatemnetArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FG_StatementTVC", for: indexPath) as! FG_StatementTVC
        cell.delegate = self
        cell.balanceLbl.text = "\(VM.rlpStatemnetArray[indexPath.row].previousOpeningBalance ?? 0)"
        let date = (VM.rlpStatemnetArray[indexPath.row].date ?? "").split(separator: " ")
        cell.monthLbl.text = "\(date[0])"
        cell.pointEarnedLbl.text = "\(VM.rlpStatemnetArray[indexPath.row].pointsEarned ?? 0)"
        
//        if (indexPath.row) % 2 == 0{
//            cell.balanceLbl.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//            cell.monthLbl.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//            cell.pointEarnedLbl.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//            cell.viewOutBtn.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        }else{
//            cell.balanceLbl.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1100084647, alpha: 0.3161562484)
//            cell.monthLbl.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.6862745098, blue: 0.1098039216, alpha: 0.32)
//            cell.pointEarnedLbl.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.6862745098, blue: 0.1098039216, alpha: 0.32)
//            cell.viewOutBtn.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.6862745098, blue: 0.1098039216, alpha: 0.32)
//        }
        
        return cell
    }
    
    
}
