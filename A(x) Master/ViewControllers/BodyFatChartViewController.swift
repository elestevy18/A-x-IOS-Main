//
//  BodyFatChartViewController.swift
//  A(x) Master
//
//  Created by El Kevin on 6/22/20.
//  Copyright © 2020 Aesthet(X). All rights reserved.
//

import UIKit

class BodyFatChartViewController: UIViewController {
    //variable declarations
    
    
    
    @IBOutlet weak var swipeImageView: UIImageView!
    // Type in the names of your images below
    let imageNames = ["Female Chart.png","Male Chart.jpg"]
    
    var currentImage = 0
    
    
        override func viewDidLoad() {
            //ACtionable code goes here
            

            super.viewDidLoad()
            let swipeRight = UISwipeGestureRecognizer(target: self, action: Selector(("respondToSwipeGesture:")))
            swipeRight.direction = UISwipeGestureRecognizer.Direction.right
            self.view.addGestureRecognizer(swipeRight)

            let swipeLeft = UISwipeGestureRecognizer(target: self, action: Selector(("respondToSwipeGesture:")))
            swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
            self.view.addGestureRecognizer(swipeLeft)
            // Do any additional setup after loading the view, typically from a nib.z
            
         
        }
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {

           if let swipeGesture = gesture as? UISwipeGestureRecognizer {


               switch swipeGesture.direction {
               case UISwipeGestureRecognizer.Direction.left:
                   if currentImage == imageNames.count - 1 {
                       currentImage = 0

                   }else{
                       currentImage += 1
                   }
                   swipeImageView.image = UIImage(named: imageNames[currentImage])

               case UISwipeGestureRecognizer.Direction.right:
                   if currentImage == 0 {
                       currentImage = imageNames.count - 1
                   }else{
                       currentImage -= 1
                   }
                   swipeImageView.image = UIImage(named: imageNames[currentImage])
               default:
                   break
               }
           }
       }
       override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
           // Dispose of any resources that can be recreated.
       }


}
