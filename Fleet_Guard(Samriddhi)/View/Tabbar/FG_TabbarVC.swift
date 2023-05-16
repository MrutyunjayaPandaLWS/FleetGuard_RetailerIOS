//
//  FG_TabbarVc.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 18/01/2023.
//

import UIKit

class FG_TabbarVc: UITabBarController {

    var tabbarColor = #colorLiteral(red: 0.4714589119, green: 0.7416548133, blue: 0.2673548758, alpha: 1)
    var comingFrom = ""
    override func viewDidLoad() {
        super.viewDidLoad()
//        if self.comingFrom == "DelegateData"{
//            _ = self.tabBarController?.selectedIndex = 1
//        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if #available(iOS 13.0, *) {
            let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
            tabBarAppearance.backgroundColor = tabbarColor
            UITabBar.appearance().standardAppearance = tabBarAppearance

            if #available(iOS 15.0, *) {
                UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            }
        }
     
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if self.selectedIndex == 0 {
            self.tabBarController?.selectedIndex = selectedIndex
        }else if self.selectedIndex == 1{
            let rootView = self.viewControllers![self.selectedIndex] as! UINavigationController
            rootView.popToRootViewController(animated: false)
        }else if self.selectedIndex == 2{
            self.tabBarController?.selectedIndex = selectedIndex
        }
    }

}
struct Constants{
    static var tabbarVC : FG_TabbarVc!
}
