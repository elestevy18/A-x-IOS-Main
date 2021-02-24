//
//  MagicFormula.swift
//  AofX
//
//  Created by El Kevin on 6/23/20.
//  Copyright © 2020 Aesthet(X). All rights reserved.
//
//
//  GenericViewController.swift
//  AofX
//
//  Created by El Kevin on 6/24/20.
//  Copyright © 2020 Aesthet(X). All rights reserved.
//

import UIKit

class MagicFormula: UIViewController {
    
    //KEVIN JIMENEZ 06/25/2020 DEFAULTS FOR ACCESING MEMORY AND KEYS FOR MEMORY STORAGE
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
    
    var dailyCaloricDeviance    = 0.00
    var idealBodyWeight         = 0.00
    var totalMuscleGrowth       = 0.00
    var fatLoss                 = 0.00
    var currentMuscleGrowth     = 0.00
    var potentialMuscleGrowth   = 0.00
    var muscleGrowthRate        = 0.00
    var heightBigInCm           = 0.00
    var totalHeightInCm         = 0.00
    var totalHeightInInches     = 0.00
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        //DOWLOAD DATA FROM INTRO PAGE
        
                   var bodyWeight  = defaults.double(forKey: Save.bodyWeight)
                   var heightBig   = defaults.double(forKey: Save.heightBig)
                   var heightSmall = defaults.double(forKey: Save.heightSmall)
                   let experience  = defaults.double(forKey: Save.experience)
                   let composition = defaults.double(forKey: Save.composition)
                   let age         = defaults.double(forKey: Save.age)
                   let sex         = defaults.bool(forKey: Save.sex)
                   let units       = defaults.bool(forKey: Save.unitsBool)
        
        //Turn kilos to pounds first (formula uses pounds)
        
        if (units) {
            print("heightBig", heightBig, "heightSmall", heightSmall)
            bodyWeight = bodyWeight * 2.20462
            heightBigInCm = heightBig * 100.00
            totalHeightInCm = heightBigInCm + heightSmall
            print("totalheoghtcm", totalHeightInCm)
            totalHeightInInches = totalHeightInCm * 0.393701
            print("totalheoghtinches", totalHeightInInches)
            //heightBig is in feet on following line
            heightBig = floor(totalHeightInInches/12)
            heightSmall = totalHeightInInches.truncatingRemainder(dividingBy: 12)
            print ("bodyweight", bodyWeight, "heightBig", heightBig, "heightSmall", heightSmall)
        }
        

        if (sex){
            
            
            
            heightSmall = heightSmall + (heightBig * 12.00)
                        var height = (heightSmall * 2.54)
          
            let baseLeanMass = (1930121 + (44.90097 - 1930121) / (1.00 + (pow(height / 4275.865, 3.168493)))) * 0.93
            muscleGrowthRate = (((3.00 * (37037.00.squareRoot)()) / (200.00 * (experience + 1.00.squareRoot()))))
            totalMuscleGrowth =  40.00
            let developedLeanMass = baseLeanMass + totalMuscleGrowth
            idealBodyWeight = developedLeanMass * 1.12
            fatLoss = ((bodyWeight * (composition * 0.01)) - (bodyWeight * 0.12))
            let mgConstant = (1.00 + (experience / 31.72432))
            
            
                        if (experience == 0) {
                            currentMuscleGrowth = 0.00
                            muscleGrowthRate =  2.2
                        } else if (experience <= 6 && experience > 0) {
                            currentMuscleGrowth =  ((69.98 + (-0.00531397 - 67.38605) / pow(mgConstant, 0.8790314))) - 2.2
                        } else if (experience > 6 && experience < 12) {
                            currentMuscleGrowth =  ((69.98 + (-0.00531397 - 67.38605) / pow(mgConstant, 0.8790314))) - 1.05
                        } else if (experience >= 12) {
                            currentMuscleGrowth =  ((69.98 + (-0.00531397 - 67.38605) / pow(mgConstant, 0.8790314)))
                        }
            
            
                        if (composition <= 12) {
                            dailyCaloricDeviance = (muscleGrowthRate * 2500.00) / 31.00;
                        } else {
                            dailyCaloricDeviance = ((((idealBodyWeight - bodyWeight) / (48 - experience)) * 3500) / 31);
                        }
            
            
             potentialMuscleGrowth = (totalMuscleGrowth - currentMuscleGrowth);
        
        } else {
            
                heightSmall = heightSmall + (heightBig * 12.00)
                            let height = (heightSmall * 2.54)
                let baseLeanMass = (1930121 + (44.90097 - 1930121) / (1.00 + (pow(height / 4275.865, 3.168493)))) * 0.93
                muscleGrowthRate = (((3.00 * (37037.00.squareRoot)()) / (200.00 * (experience + 1.00.squareRoot())))/2)
                let totalMuscleGrowth =  20.00
                let developedLeanMass = baseLeanMass + totalMuscleGrowth
                idealBodyWeight = developedLeanMass * 1.2
                fatLoss = ((bodyWeight * (composition * 0.01)) - (bodyWeight * 0.20))
                let mgConstant = (1.00 + (experience / 31.72432))
                
                
                            if (experience == 0) {
                                currentMuscleGrowth = 0.00
                                muscleGrowthRate =  1.1
                            } else if (experience <= 6 && experience > 0) {
                                currentMuscleGrowth =  ((69.98 + (-0.00531397 - 67.38605) / pow(mgConstant, 0.8790314))) - 1.1
                            } else if (experience > 6 && experience < 12) {
                                currentMuscleGrowth =  ((69.98 + (-0.00531397 - 67.38605) / pow(mgConstant, 0.8790314))) - 0.55
                            } else if (experience >= 12) {
                                currentMuscleGrowth =  ((69.98 + (-0.00531397 - 67.38605) / pow(mgConstant, 0.8790314)))
                            }
                
                
                            if (composition <= 20) {
                                dailyCaloricDeviance = (muscleGrowthRate * 2500.00) / 31.00;
                            } else {
                                dailyCaloricDeviance = ((((idealBodyWeight - bodyWeight) / (48 - experience)) * 3500) / 31);
                            }
                
                
                 potentialMuscleGrowth = (totalMuscleGrowth - currentMuscleGrowth);
            
            
        }
        
        // 0625/2020 Unit conversion for  metric
        
        if(units){
           // bodyWeight            = bodyWeight * 2.20462
             //bodyWeight           = bodyWeight * 2.20462
            totalMuscleGrowth     = totalMuscleGrowth * 0.454
            idealBodyWeight       = idealBodyWeight * 0.454
            fatLoss               = fatLoss * 0.4542
            currentMuscleGrowth   = currentMuscleGrowth * 0.454
            potentialMuscleGrowth = potentialMuscleGrowth * 0.454
            muscleGrowthRate      = muscleGrowthRate * 0.454
            //idealBodyWeight       = idealBodyWeight * 2.20462
        }
        
                   defaults.set(totalMuscleGrowth, forKey: Save.totalMuscleGrowth)
                   defaults.set(idealBodyWeight, forKey: Save.idealBodyWeight)
                   defaults.set(fatLoss, forKey: Save.fatLoss)
                   defaults.set(currentMuscleGrowth, forKey: Save.currentMuscleGrowth)
                   defaults.set(potentialMuscleGrowth, forKey: Save.potentialMuscleGrowth)
                   defaults.set(muscleGrowthRate, forKey: Save.muscleGrowthRate )
                   defaults.set(dailyCaloricDeviance, forKey: Save.dailyCaloricDeviance)
                   //defaults.set(idealBodyWeight, forKey: Save.idealBodyWeight)
                   defaults.set(age, forKey: Save.age)
        
        // @second delay for the normies
        
        let cameFromMealPlan = defaults.bool(forKey: Save.CameFromMealPlan)
        
        if cameFromMealPlan == true {
            defaults.setValue(false, forKey: Save.CameFromMealPlan)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let dashBoard = storyboard.instantiateViewController(identifier: "MealPlanViewController")
                //self.present(calculatingPerfection, animated: true, completion: nil)
                self.show(dashBoard, sender: self)
                self.dismiss(animated: true, completion: nil)
            }
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let dashBoard = storyboard.instantiateViewController(identifier: "dashBoard")
                    //self.present(calculatingPerfection, animated: true, completion: nil)
                    self.show(dashBoard, sender: self)
                    self.dismiss(animated: true, completion: nil)
                
                }
            }
        }
}
    

