//
//  SubscriptionsViewController.swift
//  AofX
//
//  Created by Kevin Jimenez on 8/19/20.
//  Copyright © 2020 Aesthet(X). All rights reserved.
//

import UIKit
class SubscriptionsViewController: UIViewController {

    @IBOutlet weak var hspromobtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        IAPService.shared.getProducts()
        IAPService.shared.restorePurchases()
        
     

        
    }
    

    @IBAction func hspromoclick(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let calculatingPerfection = storyboard.instantiateViewController(identifier: "promoCode")
                        
                        self.show(calculatingPerfection, sender: self)
    }
    @IBAction func MonthlyClicked(_ sender: Any) {
        IAPService.shared.purchase(product: .monthly)
    }
    
    @IBAction func BiannualluyClicked(_ sender: Any) {
        IAPService.shared.purchase(product: .biannuallly)
    }
    
    @IBAction func AnnuallyClicked(_ sender: Any) {
        IAPService.shared.purchase(product: .annually)
    }
    @IBAction func PrivacyPolicyTaC(_ sender: Any) {
        guard let url = URL(string: "http://aesthet-x.com/privacy-policy-terms-and-conditions/") else {
                       return //be safe
                     }

                     if #available(iOS 10.0, *) {
                         UIApplication.shared.open(url, options: [:], completionHandler: nil)
                     } else {
                         UIApplication.shared.openURL(url)
                     }
    }
}
