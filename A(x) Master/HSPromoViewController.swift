//
//  HSViewController.swift
//  AofX
//
//  Created by Kevin Jimenez on 9/15/20.
//  Copyright © 2020 Aesthet(X). All rights reserved.
//

import UIKit

class HSPromoViewController: UIViewController {
    
    let defaults  = UserDefaults.standard
    
    @IBOutlet weak var freshman: UIButton!
    @IBOutlet weak var sophomore: UIButton!
    @IBOutlet weak var junior: UIButton!
    @IBOutlet weak var senior: UIButton!
    @IBOutlet weak var promocodeIn: UITextField!
    
    var freshmanBool = false
    var sophomoreBool = false
    var juniorBool = false
    var seniorBool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func freshmanClk(_ sender: Any) {
        if (promocodeIn.text!.contains("ax20")) {
            
            // print("Promo code works " )
            
            let alertController = UIAlertController(title: "Reset app", message:
                                                        "Enjoy going ad free. Reset the app to see changes.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            UserDefaults.standard.set(Date(), forKey: Save.installDate)
            defaults.set(4.00, forKey: Save.promoLength)
            defaults.set(true, forKey: Save.HSPromo)
            /// print("Freshman")
            
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let toHome = storyboard.instantiateViewController(identifier: "dashBoard")
            self.show(toHome, sender: self)
            
        }
        let alertController = UIAlertController(title: "Invalid Promo Code", message:
                                                    "Please type a valid promo code", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        
    }
    
    @IBAction func sophomoreClk(_ sender: Any) {
       // print("Promo code works " )
    
        let alertController = UIAlertController(title: "Reset app", message:
                                                    "Enjoy going ad free. Reset the app to see changes.", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        UserDefaults.standard.set(Date(), forKey: Save.installDate)
        defaults.set(3.00, forKey: Save.promoLength)
        defaults.set(true, forKey: Save.HSPromo)
        /// print("Freshman")
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let toHome = storyboard.instantiateViewController(identifier: "dashBoard")
        self.show(toHome, sender: self)
        
    }

    @IBAction func juniorClk(_ sender: Any) {
        // print("Promo code works " )
        
        let alertController = UIAlertController(title: "Reset app", message:
                                                    "Enjoy going ad free. Reset the app to see changes.", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        UserDefaults.standard.set(Date(), forKey: Save.installDate)
        defaults.set(2.00, forKey: Save.promoLength)
        defaults.set(true, forKey: Save.HSPromo)
        /// print("Freshman")
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let toHome = storyboard.instantiateViewController(identifier: "dashBoard")
        self.show(toHome, sender: self)
        
    }
    
    @IBAction func seniorClk(_ sender: Any) {
        // print("Promo code works " )
        
        let alertController = UIAlertController(title: "Reset app", message:
                                                    "Enjoy going ad free. Reset the app to see changes.", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        UserDefaults.standard.set(Date(), forKey: Save.installDate)
        defaults.set(1.00, forKey: Save.promoLength)
        defaults.set(true, forKey: Save.HSPromo)
        /// print("Freshman")
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let toHome = storyboard.instantiateViewController(identifier: "dashBoard")
        self.show(toHome, sender: self)
        
    }

}
