//
//  FG_DOBVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 04/02/2023.
//

import UIKit
protocol DateSelectedDelegate {
    func acceptDate(_ vc: FG_DOBVC)
    func declineDate(_ vc: FG_DOBVC)
}


class FG_DOBVC: BaseViewController {
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    let date = Date()
    let nameFormatter = DateFormatter()
    var selectedDate = ""
    var isComeFrom = ""
    var delegate: DateSelectedDelegate!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        datePicker.maximumDate = date
    }
    override func touchesBegan(_ touchscreen: Set<UITouch>, with event: UIEvent?)
    {
        let touch = touchscreen.first
        if touch?.view != self.presentingViewController
        {
            self.dismiss(animated: true, completion: nil)

        }
    }
    
    @IBAction func okBtn(_ sender: Any) {
        let today = Date() //Jun 21, 2017, 7:18 PM
        let sevenDaysBeforeToday = Calendar.current.date(byAdding: .year, value: -18, to: today)!
        print(sevenDaysBeforeToday)
        if isComeFrom == "DOB"{
            if datePicker.date > sevenDaysBeforeToday{
                let alert = UIAlertController(title: "", message: "It seems you are less than 18 years of age. You can apply for Fleet Guard membership only if you are 18 years and above", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }else{
                let formatter = DateFormatter()
                formatter.dateFormat = "MM-dd-yyyy"
                selectedDate = formatter.string(from: datePicker.date)
                self.delegate.acceptDate(self)
                self.dismiss(animated: true, completion: nil)
            }
        }else if isComeFrom == "1"{
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            selectedDate = formatter.string(from: datePicker.date)
            self.delegate.acceptDate(self)
            self.dismiss(animated: true, completion: nil)
        }else if isComeFrom == "2"{
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            selectedDate = formatter.string(from: datePicker.date)
            self.delegate.acceptDate(self)
            self.dismiss(animated: true, completion: nil)
        }
        
        
    }
    @IBAction func cancelBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

