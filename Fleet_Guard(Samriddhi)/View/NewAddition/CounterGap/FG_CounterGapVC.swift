//
//  FG_CounterGapVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 19/01/2023.
//

import UIKit

class FG_CounterGapVC: BaseViewController {
    
    @IBOutlet weak var CounterGapTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CounterGapTableView.delegate = self
        CounterGapTableView.dataSource = self
    }
    
}
extension FG_CounterGapVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FG_CounterGapTVC", for: indexPath) as! FG_CounterGapTVC
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}
