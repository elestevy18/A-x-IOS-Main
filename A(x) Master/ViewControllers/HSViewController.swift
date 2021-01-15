//
//  HSViewController.swift
//  AofX
//
//  Created by Kevin Jimenez on 9/15/20.
//  Copyright © 2020 Aesthet(X). All rights reserved.
//

import UIKit

class HSViewController: UIViewController {
    
    struct Keys {
           static let HSPromo                      = "hspromo"
        static let promoLength                      = "promolength"
        static let installDate                      = "installdate"
        
    }
    
     let defaults        = UserDefaults.standard

    @IBOutlet weak var freshman: UIButton!
    @IBOutlet weak var sophomore: UIButton!
    @IBOutlet weak var junior: UIButton!
    @IBOutlet weak var senior: UIButton!
    @IBOutlet weak var submit: UIButton!
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
        freshmanBool = Bool(true)
        UserDefaults.standard.set(Date(), forKey: Keys.installDate)
            freshman.isSelected = !freshman.isSelected;
            if(sophomore.isSelected){
                sophomore.sendActions(for: .touchUpInside)
            }
        if(junior.isSelected){
            junior.sendActions(for: .touchUpInside)
        }
        if(senior.isSelected){
                   senior.sendActions(for: .touchUpInside)
               }
        
    }
    @IBAction func sophomoreClk(_ sender: Any) {
        sophomoreBool = Bool(true)
        UserDefaults.standard.set(Date(), forKey: Keys.installDate)
                   sophomore.isSelected = !sophomore.isSelected;
                   if(freshman.isSelected){
                       freshman.sendActions(for: .touchUpInside)
                   }
               if(junior.isSelected){
                   junior.sendActions(for: .touchUpInside)
               }
        if(senior.isSelected){
            senior.sendActions(for: .touchUpInside)
        }
    }
    @IBAction func juniorClk(_ sender: Any) {
        juniorBool = Bool(true)
        UserDefaults.standard.set(Date(), forKey: Keys.installDate)
                   junior.isSelected = !junior.isSelected;
                   if(freshman.isSelected){
                       freshman.sendActions(for: .touchUpInside)
                   }
               if(sophomore.isSelected){
                   sophomore.sendActions(for: .touchUpInside)
               }
        if(senior.isSelected){
            senior.sendActions(for: .touchUpInside)
        }
    }
    
    @IBAction func seniorClk(_ sender: Any) {
        seniorBool = Bool(true)
       defaults.set(Date(), forKey: Keys.installDate)
                   senior.isSelected = !senior.isSelected;
                   if(freshman.isSelected){
                       freshman.sendActions(for: .touchUpInside)
                   }
               if(junior.isSelected){
                   junior.sendActions(for: .touchUpInside)
               }
        if(sophomore.isSelected){
            sophomore.sendActions(for: .touchUpInside)
        }
    }
    
    @IBAction func submitClk(_ sender: Any) {
        
        if (freshman.isSelected || sophomore.isSelected || junior.isSelected || senior.isSelected){
            if (promocodeIn.text!.contains("ax20")) {
               defaults.set(true, forKey: Keys.HSPromo)
                print("Promo code works")
                //DATE
                if(freshman.isSelected){
                    let alertController = UIAlertController(title: "Reset app", message:
                        "Enjoy going ad free. Reset the app to see changes.", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                    defaults.set(4.00, forKey: Keys.promoLength)
                    print("Freshman")
                } else if (sophomore.isSelected){
                    defaults.set(3.00, forKey: Keys.promoLength)
                    print("Sophomore")
                } else if (junior.isSelected){
                    defaults.set(2.00, forKey: Keys.promoLength)
                    print("Junior")
                } else if (senior.isSelected){
                        defaults.set(1.00, forKey: Keys.promoLength)
                    print("Senior")
                }
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let toHome = storyboard.instantiateViewController(identifier: "dashBoard")
                
                self.show(toHome, sender: self)
                
            } else {
                let alertController = UIAlertController(title: "Invalid Promo Code", message:
                                               "Please type a valid promo code", preferredStyle: .alert)
                                           alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            }
        } else {
            let alertController = UIAlertController(title: "Select year", message:
                 "Please select your year", preferredStyle: .alert)
             alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))

             self.present(alertController, animated: true, completion: nil)
        }
        
        
    }
    
}
