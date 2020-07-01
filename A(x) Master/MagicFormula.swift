//
//  MagicFormula.swift
//  A(x) Master
//
//  Created by El Kevin on 6/23/20.
//  Copyright © 2020 Aesthet(X). All rights reserved.
//
//
//  GenericViewController.swift
//  A(x) Master
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
        
                   var bodyWeight =         defaults.double(forKey: "bodyweight")
                   var heightBig =          defaults.double(forKey: "heightbig")
                   var heightSmall =        defaults.double(forKey: "heightsmall")
                   let experience =         defaults.double(forKey: "experience")
                   let composition =        defaults.double(forKey: "composition")
                   let age =                defaults.double(forKey: "age")
                   let thereAreTwoGenders = defaults.bool(forKey: "therearetwogenders")
                   let units =              defaults.bool(forKey: "unitsbool")
        
        //Turn kilos to pounds first (formula uses pupunds)
        
        if (units) {
            bodyWeight = bodyWeight * 0.453592
            heightBigInCm = heightBig * 100.00
            totalHeightInCm = heightBig + heightSmall
            totalHeightInInches = totalHeightInCm * 0.393701
            //heightBig is in feet on following line
            heightBig = floor(totalHeightInInches/12)
            heightSmall = totalHeightInInches.truncatingRemainder(dividingBy: 12)
        }
        

        if (thereAreTwoGenders){
            
            heightSmall = heightSmall + (heightBig * 12.00)
                        let height = (heightSmall * 2.54)
            let baseLeanMass = (1930121 + (44.90097 - 1930121) / (1.00 + (pow(height / 4275.865, 3.168493)))) * 0.93
            muscleGrowthRate = (((3.00 * (37037.00.squareRoot)()) / (200.00 * (experience + 1.00.squareRoot()))))
            let totalMuscleGrowth =  40.00
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
            bodyWeight            = bodyWeight * 2.20462
            totalMuscleGrowth     = totalMuscleGrowth * 2.20462
            idealBodyWeight       = idealBodyWeight * 2.20462
            fatLoss               = fatLoss * 2.20462
            currentMuscleGrowth   = currentMuscleGrowth * 2.20462
            potentialMuscleGrowth = potentialMuscleGrowth * 2.20462
            muscleGrowthRate      = muscleGrowthRate * 2.20462
            idealBodyWeight       = idealBodyWeight * 2.20462
        }
        
                   defaults.set(totalMuscleGrowth, forKey: Keys.totalMuscleGrowth)
                   defaults.set(idealBodyWeight, forKey: Keys.idealBodyWeight)
                   defaults.set(fatLoss, forKey: Keys.fatLoss)
                   defaults.set(currentMuscleGrowth, forKey: Keys.currentMuscleGrowth)
                   defaults.set(potentialMuscleGrowth, forKey: Keys.potentialMuscleGrowth)
                   defaults.set(muscleGrowthRate, forKey: Keys.muscleGrowthRate )
                   defaults.set(dailyCaloricDeviance, forKey: Keys.dailyCaloricDeviance)
                   defaults.set(idealBodyWeight, forKey: Keys.idealBodyWeight)
                   defaults.set(age, forKey: Keys.age)
        
        // @second delay for the normies
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.performSegue(withIdentifier: "ToDashoards", sender: nil)
        }
        
    
}
    

}
