//
//  SceneDelegate.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 16/01/2023.
//

import UIKit

import SlideMenuControllerSwift
import IQKeyboardManagerSwift
import LanguageManager_iOS
@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    var slider : SlideMenuController!
    var nav : UINavigationController!
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        IQKeyboardManager.shared.enable = true
        let isUserLoggedIn: Bool = UserDefaults.standard.bool(forKey: "IsloggedIn?")
        print(isUserLoggedIn)
        languageUpdate()
        if isUserLoggedIn {
            self.setHomeAsRootViewController()
        } else {
            self.setInitialViewAsRootViewController()
        }
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
    }
    func setHomeAsRootViewController(){
        languageUpdate()
        let leftVC = storyboard.instantiateViewController(withIdentifier: "FG_SideMenuVC") as! FG_SideMenuVC
        let homeVC = storyboard.instantiateViewController(withIdentifier: "FG_TabbarVc") as! FG_TabbarVc
        slider = SlideMenuController(mainViewController: homeVC, leftMenuViewController: leftVC)
        nav = UINavigationController(rootViewController: slider)
        homeVC.tabBar.layer.masksToBounds = true
        homeVC.tabBar.isTranslucent = true
        homeVC.tabBar.barStyle = .default
        homeVC.tabBar.layer.cornerRadius = 20
        homeVC.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        homeVC.selectedIndex = 1
        nav.isNavigationBarHidden = true
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
    }
    func setInitialViewAsRootViewController(){
      languageUpdate()
        let mainStoryboard = UIStoryboard(name: "Main" , bundle: nil)
        let initialVC = mainStoryboard.instantiateViewController(withIdentifier: "FG_LoginVC") as! FG_LoginVC
        UserDefaults.standard.set("1", forKey: "LanguageLocalizable")
        nav = UINavigationController(rootViewController: initialVC)
        nav.modalPresentationStyle = .overCurrentContext
        nav.modalTransitionStyle = .partialCurl
        nav.isNavigationBarHidden = true
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        
    }
    
    func languageUpdate(){
        var languageStatus = UserDefaults.standard.string(forKey: "LanguageName")
        if languageStatus == "English"{
            LanguageManager.shared.setLanguage(language: .en)
        }else if languageStatus == "Hindi"{
            LanguageManager.shared.setLanguage(language: .hi)
        }else if languageStatus == "Tamil"{
            LanguageManager.shared.setLanguage(language: .taIN)
        }else if languageStatus == "Telugu"{
            LanguageManager.shared.setLanguage(language: .teIN)
        }else if languageStatus == "Bengali"{
            LanguageManager.shared.setLanguage(language: .bnIN)
        }else if languageStatus == "Kannada"{
            LanguageManager.shared.setLanguage(language: .knIN)
        }else{
            LanguageManager.shared.setLanguage(language: .en)
        }
    }
        
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}
