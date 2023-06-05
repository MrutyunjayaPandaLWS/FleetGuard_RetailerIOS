//
//  SearchProjectDetailsVC.swift
//  EuroBond_Customer
//
//  Created by Arokia-M3 on 03/05/23.
//

import UIKit
import LanguageManager_iOS
import Kingfisher

class FG_ProductImageDetailsVC: BaseViewController,UIScrollViewDelegate {
    
    @IBOutlet weak var headerNameLbl: UILabel!
    @IBOutlet var imageZoom: UIView!
    @IBOutlet var scrollviewToZoom: UIScrollView!
    @IBOutlet var collectionImageView: UIImageView!

    let pageIndicator = UIPageControl()
    let headerName = "Product Image"
    var imageUrl = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollviewToZoom.delegate = self
        scrollviewToZoom.minimumZoomScale = 1.0
        scrollviewToZoom.maximumZoomScale = 10.0
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        headerNameLbl.text = headerName
        
    }

    @IBAction func backBTN(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    func configure(){
        imageUrl = "\(imageUrl.replacingOccurrences(of: " ", with: "%20"))"
        collectionImageView.kf.setImage(with: URL(string: "\(imageUrl)") , placeholder: UIImage(named: "Image 3"))
    }
   
     
     func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
         return self.collectionImageView
     }
     func viewForZooming(in scrollView: UIScrollView) -> UIView? {
         return self.collectionImageView
     }
 
}



