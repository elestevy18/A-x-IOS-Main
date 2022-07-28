//
//  SettingsVC.swift
//  AofX
//
//  Created by Kevin Jimenez on 7/16/21.
//  Copyright © 2021 Aesthet(X). All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func rewatchPressed(_ sender: Any) {
        UserDefaults.standard.setValue(false, forKey: Save.firstTimeShowcase)
    }
}
