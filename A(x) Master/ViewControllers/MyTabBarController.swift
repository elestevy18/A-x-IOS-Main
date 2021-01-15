//
//  MyTabBarController.swift
//  AofX
//
//  Created by Kevin Jimenez on 8/21/20.
//  Copyright © 2020 Aesthet(X). All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController, UITabBarControllerDelegate  {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("tabbarcontroller")

        // tell our UITabBarController subclass to handle its own delegate methods
        self.delegate = self
    }

    // called whenever a tab button is tapped
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {

        if let firstVC = viewController as? DashBoardViewController {
            //firstVC.doSomeAction()
        }

        if viewController is DashBoardViewController {
            print("First tab")
        } else if viewController is VideoListScreen {
            print("Second tab")
        }
    }

    // alternate method if you need the tab bar item
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.tag{
        case 2: print("history")
            break
            
        default: break
        }
    }

}
