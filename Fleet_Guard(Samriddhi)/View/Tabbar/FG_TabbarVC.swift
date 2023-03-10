//
//  FG_TabbarVc.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 18/01/2023.
//

import UIKit

class FG_TabbarVc: UITabBarController {

    
    var comingFrom = ""
    override func viewDidLoad() {
        super.viewDidLoad()
//        if self.comingFrom == "DelegateData"{
//            _ = self.tabBarController?.selectedIndex = 1
//        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
     
    }

}
struct Constants{
    static var tabbarVC : FG_TabbarVc!
}
