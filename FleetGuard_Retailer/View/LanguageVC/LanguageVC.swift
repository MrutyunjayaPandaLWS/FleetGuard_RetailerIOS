//
//  LanguageVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by admin on 02/06/23.
//

import UIKit
import LanguageManager_iOS
protocol LanguageDelegate{
    func didtappedLanguageBtn(item: LanguageVC )
}
class LanguageVC: UIViewController, UITableViewDelegate, UITableViewDataSource {



    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var languageTV: UITableView!
    @IBOutlet weak var selectLanguageTitleLbl: UILabel!
    var languageNameArray = ["English","हिंदी","தமிழ்","తెలుగు","বাংলা","ಕನ್ನಡ"]
    var languageIcon = ["A","अ","அ","అ","অ","ಅ"]
    var language = ""
    var delegate: LanguageDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.VM.VC = self
        languageTV.delegate = self
        languageTV.dataSource = self
        tableViewHeight.constant = CGFloat(52*languageNameArray.count)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if touch?.view == self.view{
            dismiss(animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languageNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LanguageTVC", for: indexPath) as! LanguageTVC
        cell.selectionStyle = .none
        cell.languageName.text = languageNameArray[indexPath.row]
        
        cell.languageIconLbl.text = languageIcon[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        language = languageNameArray[indexPath.row]
        
        if indexPath.row == 0{
            LanguageManager.shared.setLanguage(language: .en)
            UserDefaults.standard.set("English", forKey: "LanguageName")
            UserDefaults.standard.synchronize()
        }else if indexPath.row == 1{
            LanguageManager.shared.setLanguage(language: .hi)
            UserDefaults.standard.set("Hindi", forKey: "LanguageName")
            UserDefaults.standard.synchronize()
        }else if indexPath.row == 2{
            LanguageManager.shared.setLanguage(language: .taIN)
            UserDefaults.standard.set("Tamil", forKey: "LanguageName")
            UserDefaults.standard.synchronize()
        }else if indexPath.row == 3{
            LanguageManager.shared.setLanguage(language: .teIN)
            UserDefaults.standard.set("Telugu", forKey: "LanguageName")
            UserDefaults.standard.synchronize()
        }else if indexPath.row == 4{
            LanguageManager.shared.setLanguage(language: .bnIN)
            UserDefaults.standard.set("Bengali", forKey: "LanguageName")
            UserDefaults.standard.synchronize()
        }else if indexPath.row == 5{
            LanguageManager.shared.setLanguage(language: .knIN)
            UserDefaults.standard.set("Kannada", forKey: "LanguageName")
            UserDefaults.standard.synchronize()
        }else{
            LanguageManager.shared.setLanguage(language: .en)
            UserDefaults.standard.set("English", forKey: "LanguageName")
            UserDefaults.standard.synchronize()
        }

        delegate?.didtappedLanguageBtn(item: self)
        dismiss(animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 52
    }
}

