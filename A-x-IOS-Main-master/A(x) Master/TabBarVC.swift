//
//  TabBarVC.swift
//  AofX
//
//  Created by Kevin Jimenez on 7/15/21.
//  Copyright © 2021 Aesthet(X). All rights reserved.
//

import UIKit

class TabBarVC: UITabBarController {
    
    
    let defaults        = UserDefaults.standard
    var firstBoot = true
    let nc = NotificationCenter.default
    var willDisplayGenerator: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstBoot = defaults.bool(forKey: Save.firstBoot)
    }
    

    override func viewWillAppear(_ animated: Bool) {
        nc.addObserver(self, selector: #selector(displayGenerator), name: Notification.Name("UserLoggedIn"), object: nil)
        DispatchQueue.main.async {
            self.willDisplayGenerator = UserDefaults.standard.bool(forKey: Save.displayGenerator)
            self.defaults.set(false, forKey: Save.displayGenerator)
        }
      
        if firstBoot == false {
            self.selectedIndex = 1
            defaults.set(true, forKey: Save.firstBoot)
        } else {
            willDisplayGenerator = UserDefaults.standard.bool(forKey: Save.displayGenerator)
            self.selectedIndex = 2
            if willDisplayGenerator ?? false {
                self.selectedIndex = 3
            }
           
        }
        }
    
    @objc func displayGenerator() {
        self.willDisplayGenerator = true
    }
    }


