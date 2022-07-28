//
//  BodyFatChartViewController.swift
//  AofX
//
//  Created by El Kevin on 6/22/20.
//  Copyright © 2020 Aesthet(X). All rights reserved.
//

import UIKit

class BodyFatChartViewController: UIViewController {
    //variable declarations
    
    
    
    @IBOutlet weak var swipeImageView: UIImageView!
    
    // Type in the names of your images below
    //JUSTINO CODE
   // let imageNames = ["male_bodyfat_chart", "female_bodyfat_chart"]
   // var currentImage = 0
    
    var imageList:[String] = ["male_bodyfat_chart", "female_bodyfat_chart"]
    var maxImages: Int = 1
    static var imageIndex: NSInteger = 0
    
    

    
        override func viewDidLoad() {
            //ACtionable code goes here
            

            super.viewDidLoad()
            
            setGestures()
           
            swipeImageView.image = UIImage(named:"male_bodyfat_chart")
            
            //JUSTINO CODE
//            let swipeRight = UISwipeGestureRecognizer(target: self, action: Selector(("respondToSwipeGesture:")))
//            swipeRight.direction = UISwipeGestureRecognizer.Direction.right
//            self.view.addGestureRecognizer(swipeRight)
//
//            let swipeLeft = UISwipeGestureRecognizer(target: self, action: Selector(("respondToSwipeGesture:")))
//            swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
//            self.view.addGestureRecognizer(swipeLeft)
            // Do any additional setup after loading the view, typically from a nib.z
            
         
        }
    
    
    func setGestures(){
           let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swiped)) // put : at the end of method name
           swipeRight.direction = UISwipeGestureRecognizer.Direction.right
           self.view.addGestureRecognizer(swipeRight)

           let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swiped)) // put : at the end of method name
           swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
           self.view.addGestureRecognizer(swipeLeft)

       }
    
    @objc func swiped(gesture: UIGestureRecognizer) {

    if let swipeGesture = gesture as? UISwipeGestureRecognizer {
        switch swipeGesture.direction {
        case UISwipeGestureRecognizer.Direction.right :
            //print("User swiped right")
            // decrease index first
            MuscleInfoViewController.imageIndex-=1
            // check if index is in range
            if MuscleInfoViewController.imageIndex < 0 {
                MuscleInfoViewController.imageIndex = maxImages
            }
            swipeImageView.image = UIImage(named: imageList[MuscleInfoViewController.imageIndex])

        case UISwipeGestureRecognizer.Direction.left:
            //print("User swiped Left")
            // increase index first
            MuscleInfoViewController.imageIndex += 1
            // check if index is in range
            if MuscleInfoViewController.imageIndex > maxImages {
                MuscleInfoViewController.imageIndex = 0
            }

           swipeImageView.image = UIImage(named: imageList[MuscleInfoViewController.imageIndex])

        default:
            break //stops the code/codes nothing.

        }

    }


    }
    //JUSTINO CODE
//    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
//
//           if let swipeGesture = gesture as? UISwipeGestureRecognizer {
//
//
//               switch swipeGesture.direction {
//               case UISwipeGestureRecognizer.Direction.left:
//                   if currentImage == imageNames.count - 1 {
//                       currentImage = 0
//
//                   }else{
//                       currentImage += 1
//                   }
//                   swipeImageView.image = UIImage(named: imageNames[currentImage])
//
//               case UISwipeGestureRecognizer.Direction.right:
//                   if currentImage == 0 {
//                       currentImage = imageNames.count - 1
//                   }else{
//                       currentImage -= 1
//                   }
//                   swipeImageView.image = UIImage(named: imageNames[currentImage])
//               default:
//                   break
//               }
//           }
       }
       


