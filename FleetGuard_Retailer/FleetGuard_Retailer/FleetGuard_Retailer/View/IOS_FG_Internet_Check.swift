//
//  DD_IOS_Internet_Check.swift
//  DD_Motors
//
//  Created by ADMIN on 12/06/2023.
//

import UIKit
import Lottie

class IOS_FG_Internet_Check: UIViewController {

    @IBOutlet weak var lottieImageView: LottieAnimationView!
    
    @IBOutlet weak var noInternetvLbl: UILabel!
    @IBOutlet weak var oopsLbl: UILabel!
    
    var timers = Timer()
    private var loaderAnimationView : LottieAnimationView?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        internetCheck()
        DispatchQueue.main.async{
            self.lottieImageView.clipsToBounds = true
            self.lottieImageView.layer.cornerRadius = 16
            self.lottieImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            self.playAnimation2()
        }
    }
    
    @objc func internetCheck(){
        if MyCommonFunctionalUtilities.isInternetCallTheApi() == false{
            timers = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(internetCheck), userInfo: nil, repeats: true)
        }else{
            dismiss(animated: true)
        }
    }
    
    
    func playAnimation2(){
           loaderAnimationView = .init(name: "no_internet_lottie")
           loaderAnimationView!.frame = lottieImageView.bounds
             // 3. Set animation content mode
           loaderAnimationView!.contentMode = .scaleAspectFill
             // 4. Set animation loop mode
           loaderAnimationView!.loopMode = .loop
             // 5. Adjust animation speed
           loaderAnimationView!.animationSpeed = 0.5
        lottieImageView.addSubview(loaderAnimationView!)
             // 6. Play animation
           loaderAnimationView!.play()
       }
    

}
