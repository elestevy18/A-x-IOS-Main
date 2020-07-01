////
////  Dashboard.swift
////  A(x) Master
////
////  Created by El Kevin on 6/26/20.
////  Copyright © 2020 Aesthet(X). All rights reserved.
////
//
//import UIKit
//
//class Dashboard: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//
//        addNavBarImage()
//    }
//
//    func addNavBarImage() {
//
//           let navController = navigationController!
//
//        let image =  #imageLiteral(resourceName: "icons8-poultry-leg-100")
//           let imageView = UIImageView(image: image)
//
//           let bannerWidth = navController.navigationBar.frame.size.width
//           let bannerHeight = navController.navigationBar.frame.size.height
//
//           let bannerX = bannerWidth / 2 - image.size.width / 2
//           let bannerY = bannerHeight / 2 - image.size.height / 2
//
//           imageView.frame = CGRect(x: bannerX, y: bannerY, width: bannerWidth, height: bannerHeight)
//           imageView.contentMode = .scaleAspectFit
//
//           navigationItem.titleView = imageView
//       }
//
//
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
