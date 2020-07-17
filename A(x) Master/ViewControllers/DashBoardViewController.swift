//
//  DashBoardViewController.swift
//  A(x) Master
//
//  Created by Kevin Jimenez on 7/10/20.
//  Copyright © 2020 Aesthet(X). All rights reserved.
//

import UIKit

class DashBoardViewController: UIViewController {
    
    //Outlets for buttons
    @IBOutlet weak var IBWButton: UIButton!
    @IBOutlet weak var GrowthRateButton: UIButton!
    @IBOutlet weak var PotentialFatloss: UIButton!
    @IBOutlet weak var CurrentMuscleGrowth: UIButton!
    
   //Outlets for labels
    @IBOutlet weak var IBWLabel: UILabel!
    @IBOutlet weak var MonthlyPotentialMuscleGrowthLabel: UILabel!
    @IBOutlet weak var FAQButton: UIButton!
    
    @IBOutlet weak var FatlossLabel: UILabel!

    @IBOutlet weak var ToInfobutton: UIButton!
    
    @IBOutlet weak var RookieLabel: UILabel!
    
    @IBOutlet weak var CircleText: UILabel!
    
    
    let defaults = UserDefaults.standard
       
       struct Keys {
               static let bodyWeight            = "bodyweight"
               static let heightBig             = "heightbig"
               static let heightSmall           = "heightsmall"
               static let experience            = "experience"
               static let composition           = "composition"
               static let age                   = "age"
               static let sex                   = "sex"
               static let activityLevel         = "activitylevel"
               static let totalMuscleGrowth     = "totalmusclegrowth"
               static let idealBodyWeight       = "idealbodyweight"
               static let fatLoss               = "fatloss"
               static let currentMuscleGrowth   = "currentmusclegrowth"
               static let potentialMuscleGrowth = "potentialmusclegrowth"
               static let muscleGrowthRate      = "musclegrowthrate"
               static let dailyCaloricDeviance  = "dailycaloricdeviance"
               static let unitsBool             = "unitsBool"
       }
    
      let shapeLayer = CAShapeLayer()

    @IBOutlet weak var goToInfoCollection: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true);
        
        
        //RETRIEVE DATA TO DISPLAY
        let totalMuscleGrowth           = defaults.double(forKey: Keys.totalMuscleGrowth)
        var totalMuscleGrowthString     = String(format: "%.2f", totalMuscleGrowth)
        let idealBodyWeight             = defaults.double(forKey: Keys.idealBodyWeight)
        var idealBodyWeightString       = String(format: "%.2f", idealBodyWeight)
        let fatLoss                     = round(defaults.double(forKey: Keys.fatLoss))
        var fatLossString               = String(format: "%.2f", fatLoss)
        let currentMuscleGrowth         = defaults.double(forKey: Keys.currentMuscleGrowth)
        var currentMuscleGrowthString   = String(format: "%.2f", currentMuscleGrowth)
        let potentialMuscleGrowth       = defaults.double(forKey: Keys.potentialMuscleGrowth)
        let muscleGrowthRate            = defaults.double(forKey: Keys.muscleGrowthRate)
        var muscleGrowthRateString      = String(format: "%.2f", muscleGrowthRate)
        let dailyCaloricDeviance        = defaults.data(forKey: Keys.dailyCaloricDeviance)
        let units                       = defaults.bool(forKey: Keys.unitsBool)
        
        //String for circle progress bar
        
        let circleString =  currentMuscleGrowthString + "/\n" + totalMuscleGrowthString
        
        CircleTextPlacement(label: CircleText)
        CircleText.text = circleString
       
        
        //Ideal Bodyweight Display
        styleButton(button: IBWButton)
        IBWButton.contentHorizontalAlignment = .left
        IBWButton.layer.cornerRadius = 50
        setIBWPosition(button: IBWButton)
        
    
        
        //Growth rate dispaly button
          styleButton(button: GrowthRateButton)
          setGrowthRatePosition(button: GrowthRateButton)
          GrowthRateButton.layer.cornerRadius = 30
        
        
    // POTENTIAL FATLOSS BUTTON
        styleButton(button: PotentialFatloss)
        PotentialFatloss.layer.cornerRadius = 30
        setFatLossPosition(button: PotentialFatloss)
       
        
        // CURRENT MUSCLE GROWTH
        styleButton(button: CurrentMuscleGrowth)
        setCurrentGrowthPosition(button: CurrentMuscleGrowth)
        CurrentMuscleGrowth.layer.cornerRadius = 50
        CurrentMuscleGrowth.contentHorizontalAlignment = .left
        
        //INPUT INFORMATION BUTTON
        updateInfoButton(button: ToInfobutton)
        //FAQBUTTON
        FAQButtonPlacement(button: FAQButton)
        
        RookiePlacement(label: RookieLabel)
        
        //LABELS
        setIBWNumberLabel(label: IBWLabel)
        setGrowthRateLabel(label: MonthlyPotentialMuscleGrowthLabel)
        setFatLossLabel(label: FatlossLabel)
        IBWLabel.text = idealBodyWeightString
        MonthlyPotentialMuscleGrowthLabel.text = muscleGrowthRateString
        FatlossLabel.text = fatLossString
        
        //CODE FOR CIRCULAR PROGRESS BAR
        
        //Math to ilustrate progress
       let growthPercentage = Double((2 * CGFloat.pi))
        let  endPoint = (((currentMuscleGrowth * 100) / totalMuscleGrowth) * 0.01) * growthPercentage
              
        
        
                
                // let's start by drawing a circle somehow
                
                let screenHeight = UIScreen.main.bounds.size.height
                let screenWidth = UIScreen.main.bounds.size.width
                let center = CGPoint(x: screenWidth/1.5, y: screenHeight/1.42)
                
                
                // create my track layer
                let trackLayer = CAShapeLayer()
                
        let circularPath = UIBezierPath(arcCenter: center, radius: screenHeight/12, startAngle: 0, endAngle: CGFloat(endPoint), clockwise: true)
                trackLayer.path = UIBezierPath(arcCenter: center, radius: screenHeight/12, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true).cgPath
                
                trackLayer.strokeColor = UIColor.darkGray.cgColor
                trackLayer.lineWidth = 5
                trackLayer.fillColor = UIColor.clear.cgColor
                trackLayer.lineCap = CAShapeLayerLineCap.round
                view.layer.addSublayer(trackLayer)
                
        //        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
                shapeLayer.path = circularPath.cgPath
                
        
        let percentage =  ((currentMuscleGrowth * 100) / totalMuscleGrowth) * 0.01
        
        if(percentage <= 0.33){
            shapeLayer.strokeColor = Colors.aXOrange.cgColor
        } else if (percentage > 0.33 && percentage <= 0.66) {
            shapeLayer.strokeColor = UIColor.yellow.cgColor
        } else {
            shapeLayer.strokeColor = Colors.aXPink.cgColor
        }
                shapeLayer.lineWidth = 5
                shapeLayer.fillColor = UIColor.clear.cgColor
                shapeLayer.lineCap = CAShapeLayerLineCap.round
                
                shapeLayer.strokeEnd = 0
                
                view.layer.addSublayer(shapeLayer)
                
                handleTap()
    }
    
    
    func styleButton(button: UIButton){
        button.backgroundColor = .clear
        
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        
    }
    
    func setIBWPosition(button: UIButton) {
        
        let screenHeight = UIScreen.main.bounds.size.height
        let screenWidth = UIScreen.main.bounds.size.width
        button.frame = CGRect(x: 20, y: screenHeight/8, width: screenWidth * 0.9, height: screenHeight * 0.15)
        
    }
    
 
    func setGrowthRatePosition(button: UIButton) {
         
          let screenHeight = UIScreen.main.bounds.size.height
               let screenWidth = UIScreen.main.bounds.size.width
        button.frame = CGRect(x: 20, y: screenHeight/3.5, width: screenWidth * 0.9, height: screenHeight * 0.15)
               
     }
    
    func setFatLossPosition(button: UIButton) {
          
           let screenHeight = UIScreen.main.bounds.size.height
                let screenWidth = UIScreen.main.bounds.size.width
        button.frame = CGRect(x: 20, y: screenHeight/2.24, width: screenWidth * 0.9, height: screenHeight * 0.15)
                
      }
    
    func setCurrentGrowthPosition(button: UIButton) {
            let screenHeight = UIScreen.main.bounds.size.height
                 let screenWidth = UIScreen.main.bounds.size.width
        button.frame = CGRect(x: 20, y: screenHeight/1.649, width: screenWidth * 0.9, height: screenHeight * 0.2)
       }
    
    func updateInfoButton(button: UIButton) {
         let screenHeight = UIScreen.main.bounds.size.height
              let screenWidth = UIScreen.main.bounds.size.width
        button.frame = CGRect(x: screenWidth/1.38, y: screenHeight/1.21, width: 80, height: 50)
    }
    
    func FAQButtonPlacement(button: UIButton) {
         let screenHeight = UIScreen.main.bounds.size.height
              let screenWidth = UIScreen.main.bounds.size.width
        button.frame = CGRect(x: 20, y: screenHeight/1.21, width: 80, height: 50)
    }
    //Functions to place Labels
    
      func setIBWNumberLabel(label: UILabel) {
            
            let screenHeight = UIScreen.main.bounds.size.height
            let screenWidth = UIScreen.main.bounds.size.width
        label.frame = CGRect(x: 265, y: screenHeight/5.55, width: 80, height: 30)
            
        }
    
    func setGrowthRateLabel(label: UILabel) {
               
               let screenHeight = UIScreen.main.bounds.size.height
               let screenWidth = UIScreen.main.bounds.size.width
        label.frame = CGRect(x: (screenWidth/2)-23, y: screenHeight/2.8, width: 47, height: 30)
               
           }
    
           func setFatLossLabel(label: UILabel) {
                        
                        let screenHeight = UIScreen.main.bounds.size.height
                        let screenWidth = UIScreen.main.bounds.size.width
            label.frame = CGRect(x: (screenWidth/2)-23, y: screenHeight/1.92, width: 60, height: 30)
                        
                    }
    
    func RookiePlacement(label: UILabel) {
            let screenHeight = UIScreen.main.bounds.size.height
                 let screenWidth = UIScreen.main.bounds.size.width
           label.frame = CGRect(x: (screenWidth/2) - 98, y: screenHeight/1.23, width: 193, height: 70)
       }
    
    func CircleTextPlacement(label: UILabel) {
               let screenHeight = UIScreen.main.bounds.size.height
                    let screenWidth = UIScreen.main.bounds.size.width
        label.frame = CGRect(x: screenWidth/1.71, y: screenHeight/1.489, width: 63, height: 50)
    
          }
    
        

 
    @IBAction func ToInfoTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                   let infoCollection = storyboard.instantiateViewController(identifier: "infoCollection")
                   self.show(infoCollection, sender: self)
       // self.present(calculatingPerfection, animated: true, completion: nil)
    }

    
    @objc private func handleTap() {
           print("Attempting to animate stroke")
           
           let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
           
           basicAnimation.toValue = 1
           
           basicAnimation.duration = 2
           
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
           basicAnimation.isRemovedOnCompletion = false
           
           shapeLayer.add(basicAnimation, forKey: "urSoBasic")
       }
}
