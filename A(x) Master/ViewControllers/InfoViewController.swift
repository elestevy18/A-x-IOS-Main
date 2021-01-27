//
//  InfoViewController.swift
//  AofX
//
//  Created by Kevin Jimenez on 7/26/20.
//  Copyright © 2020 Aesthet(X). All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    struct Keys{
        static let infoTapped            = "infotapped"
    }
    
    let defaults = UserDefaults.standard
    
    
    @IBOutlet weak var explainText: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
            let infoString = defaults.string(forKey: Keys.infoTapped)
        
        let notesTxts = defaults.object(forKey: Save.noteTxts) as? [String]
        let tablePosition = defaults.integer(forKey: Save.notePosition)
        
        
        if (infoString == "ibw"){

            explainText?.text = "     Aesthet(x) is software designed for individuals who want to achieve a substance free aesthetic physique. We believe an aesthetic physique shows as much muscle definition without compromising health. Such a physique requires well-developed lean mass and around 12% body fat for males or 20% body fat for females. Body fat percentage is also known as body composition. \n\n     If your goal is to achieve a different body composition check out our meal plan calculator. \n\n    It is important to clarify that an ideal physique is that which you believe is the best. Aesthet(x) was developed by a hobbyist natural bodybuilder and engineering student who enjoys a muscular look and quantified the process natural bodybuilding to share with others."
        } else if (infoString == "growthrate"){
    
    explainText?.text = "     This number is the muscle growth you should expect this month assuming proper training and nutrition.\n\n     Your monthly muscle growth is determined by a formula factoring in sex and experience. Most male individuals experience an average of 20, 10, 5 and 2.5 pounds of muscle growth in their first, second, third and fourth year respectively. About half that growth is expected for females."
    
    } else if (infoString == "fatloss"){
      
      explainText?.text = "    This number is your current fat loss potential to achieve 12% bodyfat if you’re a male and 20% bodyfat if you’re female."
      
    } else if (infoString == "currentgrowth"){
    
    explainText?.text = " Your current growth is calculated based on the premise that a male builds 20, 10 ,5, and 2.5 pounds of muscle in their first, second, third, and fourth year respectively.About half that growth is expected for females. \n\n     The total growth described here is assumed to be 45 pounds in 4 years for males and 22.5 pounds for females."
    
    }  else{
       let notePosition = notesTxts!.count - tablePosition-1
      explainText?.text = notesTxts?[notePosition]
      
    }
    
        defaults.removeObject(forKey: Keys.infoTapped)
    }

}
