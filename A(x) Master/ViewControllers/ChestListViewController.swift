//
//  ChestExercisesViewController.swift
//  BeginnerTableView
//
//  Created by Kevin Jimenez on 7/3/20.
//  Copyright © 2020 Sean Allen. All rights reserved.
//


import UIKit

class ChestListViewController: UIViewController {
    
    @IBOutlet weak var chestTableView: UITableView!
    
 
    
//creates array to populate exercise list cells
       var gymExercises: [Exercises] = []
       var bodyWeightExercises: [Exercises] = []
       let defaults = UserDefaults.standard
    
     struct Keys {
        //Keys for muscle group to be displayed
     
        //Keys for tally that returns integer value to volume tracker to add volume to progress bars
       
        
        //keys for progress bar
       
        static let firstBoot = "firstBoot"
        
           static let muscle                      = "muscle"
                static let chestTally                  = "chesttally"
                static let chestProgress               = "chestprogress"
                static let chestMax                    = "chestmax"
                static let chest                       = "chest"
                static let bicepsTally                 = "bicepstally"
                static let bicepsProgress              = "bicepsprogress"
                static let bicepsMax                   = "bicepsmax"
                static let biceps                      = "biceps"
                static let latsTally                   = "latstally"
                static let latsProgress                = "latsprogress"
                static let latsMax                     = "latsmax"
                static let lats                        = "lats"
                static let glutesTally                 = "glutestally"
                static let glutesProgress              = "glutesprogress"
                static let glutesMax                   = "glutesmax"
                static let glutes                      = "glutes"
                static let gluteMediusTally            = "glutemediustally"
                static let gluteMediusProgress         = "glutemediusprogress"
                static let gluteMediusMax              = "glutemediusmax"
                static let gluteMedius                 = "glutemedius"
                static let hamstringsTally             = "hamstringstally"
                static let hamstringsProgress          = "hamstringsprogress"
                static let hamstringsMax               = "hamstringsmax"
                static let hamstrings                  = "hamstrings"
                static let frontShoulderTally          = "frontshouldertally"
                static let frontShoulderProgress       = "frontshoulderprogress"
                static let frontShoulderMax            = "frontshouldermax"
                static let frontShoulder               = "frontshoulder"
                static let lateralShoulderTally        = "lateralshouldertally"
                static let lateralShoulderProgress     = "lateralshoulderprogress"
                static let lateralShoulderMax          = "lateralshouldermax"
                static let lateralShoulder             = "lateralshoulder"
                static let backShoulderTally           = "backshouldertally"
                static let backShoulderProgress        = "backshoulderprogress"
                static let backShoulderMax             = "backshouldermax"
                static let backShoulder                = "backshoulder"
                static let rotatorCuffTally            = "rotatorCufftally"
                static let rotatorCuffProgress         = "rotatorCuffprogress"
                static let rotatorCuffMax              = "rotatorCuffmax"
                static let rotatorCuff                 = "rotatorCuff"
                static let quadsTally                  = "quadstally"
                static let quadsProgress               = "quadsprogress"
                static let quadsMax                    = "quadsmax"
                static let quads                       = "quads"
                static let absTally                    = "abstally"
                static let absProgress                 = "absprogress"
                static let absMax                      = "absmax"
                static let abs                         = "abs"
                static let obliquesTally               = "obliquestally"
                static let obliquesProgress            = "obliquesprogress"
                static let obliquesMax                 = "obliquesmax"
                static let obliques                    = "obliques"
                static let serratusTally               = "serratustally"
                static let serratusProgress            = "serratusprogress"
                static let serratusMax                 = "serratusmax"
                static let serratus                    = "serratus"
                static let transverseAbTally           = "transverseabtally"
                static let transverseAbProgress        = "transverseabprogress"
                static let transverseAbMax             = "transverseabmax"
                static let transverseAb                = "transverseab"
        //        static let hamstringsTally             = "hamstringstally"
        //        static let hamstringsProgress          = "hamstringsprogress"
        //        static let hamstringsMax               = "hamstringsmax"
                static let calvesTally                 = "calvestally"
                static let calvesProgress              = "calvesprogress"
                static let calvesMax                   = "calvesmax"
                static let calves                      = "calves"
                static let neckTally                   = "necktally"
                static let neckProgress                = "neckprogress"
                static let neckMax                     = "neckmax"
                static let neck                        = "neck"
                static let forearmExtensorsTally       = "forearmextensorstally"
                static let forearmExtensorsProgress    = "forearmextensorsprogress"
                static let forearmExtensorsMax         = "forearmextensorsmax"
                static let forearmExtensor             = "forearmextensor"
                static let ulnarForearmTally           = "ulnarforearmtally"
                static let ulnarForearmProgress        = "ulnarforearmprogress"
                static let ulnarForearmMax             = "ulnarforearmmax"
                static let ulnarForearm                = "ulnarforearm"
                static let forearmFlexorsTally         = "forearmflexorstally"
                static let forearmFlexorsProgress      = "forearmflexorsprogress"
                static let forearmFlexorsMax           = "forearmflexorsmax"
                static let forearmFlexors              = "forearmflexors"
                static let radialForearmTally          = "radialforearmtally"
                static let radialForearmProgress       = "radialforearmprogress"
                static let radialForearmMax            = "radialforearmmax"
                static let radialForearm               = "radialForearm"
                static let spinalErectorsTally         = "spinalerectorstally"
                static let spinalErectorsProgress      = "spinalerectorsprogress"
                static let spinalErectorsMax           = "spinalerectorsmax"
                static let spinalErector               = "spinalerector"
                static let upperTrapsTally             = "uppertrapstally"
                static let upperTrapsProgress          = "uppertrapsprogress"
                static let upperTrapsMax               = "uppertrapsmax"
                static let upperTrap                   = "uppertraps"
                static let lowerTrapsTally             = "lowertrapstally"
                static let lowerTrapsProgress          = "lowertrapsprogress"
                static let lowerTrapsMax               = "lowertrapsmax"
                static let lowerTraps                  = "lowertraps"
                static let tricepsTally                = "tricepstally"
                static let tricepsProgress             = "tricepsprogress"
                static let tricepsMax                  = "tricepsmax"
                static let triceps                     = "triceps"
        
     }
     
    override func viewDidLoad() {
        super.viewDidLoad()
      
        let muscleGroup = defaults.string(forKey:Keys.muscle)
        if (muscleGroup == "Chest"){
        gymExercises = createChestArray()
        bodyWeightExercises = createBWChestArray()
        }  else if (muscleGroup == "Biceps"){
            gymExercises = createBicepsArray()
            bodyWeightExercises = createBWBicepsArray()
        } else if (muscleGroup == "Lats"){
            gymExercises = createLatsArray()
            bodyWeightExercises = createBWLatsArray()
        } else if (muscleGroup == "Glutes"){
            gymExercises = createGlutesArray()
            bodyWeightExercises = createBWGlutesArray()
        } else if (muscleGroup == "Glute Medius"){
            gymExercises = createGluteMediusArray()
            bodyWeightExercises = createBWGluteMediusArray()
        } else if (muscleGroup == "Hamstrings"){
            gymExercises = createHamstringsArray()
            bodyWeightExercises = createBWHamstringsArray()
        } else if (muscleGroup == "Front Shoulder"){
            gymExercises = createFrontShoulderArray()
            bodyWeightExercises = createBWFrontShoulderArray()
        } else if (muscleGroup == "Lateral Shoulder"){
            gymExercises = createLateralShoulderArray()
            bodyWeightExercises = createBWLateralShoulderArray()
        } else if (muscleGroup == "Back Shoulder"){
            gymExercises = createBackShoulderArray()
            bodyWeightExercises = createBWBackShoulderArray()
        } else if (muscleGroup == "Rotator Cuff"){
            gymExercises = createRotatorCuffArray()
            bodyWeightExercises = createBWRotatorCuffArray()
        } else if (muscleGroup == "Triceps"){
            gymExercises = createTricepsArray()
            bodyWeightExercises = createBWTricepsArray()
        } else if (muscleGroup == "Quads"){
            gymExercises = createQuadsArray()
            bodyWeightExercises = createBWQuadsArray()
        } else if (muscleGroup == "Abs"){
            gymExercises = createAbsArray()
            bodyWeightExercises = createBWAbsArray()
        } else if (muscleGroup == "Obliques"){
            gymExercises = createObliquesArray()
            bodyWeightExercises = createBWObliquesArray()
        } else if (muscleGroup == "Serratus"){
            gymExercises = createSerratusArray()
            bodyWeightExercises = createBWSerratusArray()
        } else if (muscleGroup == "Transverse Ab"){
            gymExercises = createTransverseAbArray()
            bodyWeightExercises = createBWTransverseAbArray()
        } else if (muscleGroup == "Calves"){
            gymExercises = createCalvesArray()
            bodyWeightExercises = createBWCalvesArray()
        } else if (muscleGroup == "Neck"){
            gymExercises = createNeckArray()
            bodyWeightExercises = createBWNeckArray()
        } else if (muscleGroup == "Forearm Extensors"){
            gymExercises = createForearmExtensorsArray()
            bodyWeightExercises = createBWForearmExtensorsArray()
        } else if (muscleGroup == "Ulnar Forearm"){
            gymExercises = createUlnarForearmArray()
            bodyWeightExercises = createBWUlnarForearmArray()
        } else if (muscleGroup == "Forearm Flexors"){
            gymExercises = createForearmFlexorsArray()
            bodyWeightExercises = createBWForearmFlexorsArray()
        } else if (muscleGroup == "Radial Forearm"){
            gymExercises = createRadialForearmArray()
            bodyWeightExercises = createBWRadialForearmArray()
        } else if (muscleGroup == "Spinal Erectors"){
            gymExercises = createSpinalErectorsArray()
            bodyWeightExercises = createBWSpinalErectorsArray()
        } else if (muscleGroup == "Upper Traps"){
            gymExercises = createUpperTrapsArray()
            bodyWeightExercises = createBWUpperTrapsArray()
        } else if (muscleGroup == "Lower Traps"){
            gymExercises = createLowerTrapsArray()
            bodyWeightExercises = createBWLowerTrapsArray()
        }
    }
    
    
    //---------------------------------------------BEGIN SHENANIGANS-----------------------------------------------------------------
    //Folowing Functions contain all exercises. Will display only the muscle group selected in the volume tracker
    func createChestArray() -> [Exercises] {
        let exercise0 = Exercises(title: "Chest", musclesWorked: "A single set towards chest")
         //Netral Position
        let exercise1 = Exercises(title: "Bench Press",             musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
        let exercise2 = Exercises(title: "Dumbell Bench Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
        let exercise3 = Exercises(title: "Machine Chest Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
        let exercise4 = Exercises(title: "Nuetral Cable Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
        let exercise5 = Exercises(title: "Neutral Crossover Flyes", musclesWorked: "Middle Pectoral")
        
        //Incline
        let exercise6 = Exercises(title: "Incline Bench Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
        let exercise7 = Exercises(title: "Incline Dumbell Bench Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
        let exercise8 = Exercises(title: "Incline Machine Chest Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
        let exercise9 = Exercises(title: "Incline Cable Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
        let exercise10 = Exercises(title: "Incline Crossover Flyes",    musclesWorked: "Upper Pectoral")
        
        //Decline
      
        let exercise11 = Exercises(title: "Decline Bench Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
        let exercise12 = Exercises(title: "Decline Dumbell Bench Press", musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
        let exercise13 = Exercises(title: "Decline Cable Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
        let exercise14 = Exercises(title: "Decline Crossover Flyes",     musclesWorked: "Lower Pectoral")
        
        //Miscellaneuos
        let exercise15 = Exercises(title: "Chest Pullover", musclesWorked: "Upper Pectoral, Triceps Secondary: Lats")
       
        return [exercise0, exercise1, exercise2, exercise3, exercise4, exercise5
                , exercise6, exercise7, exercise8, exercise9, exercise10,
                exercise11, exercise12, exercise13, exercise14, exercise15]
    }
    
    func createBWChestArray() -> [Exercises] {
          let exercise0 = Exercises(title: "Push-Ups",     musclesWorked:   "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
          let exercise1 = Exercises(title: "Wide Dips",    musclesWorked:  "Chest Secondary: Lateral and Medial Triceps")
          let exercise2 = Exercises(title: "Banded Fly",   musclesWorked: "Upper/Middle/Lower Pectoral")
         
          return [exercise0, exercise1, exercise2]
      }
    
    func createBicepsArray() -> [Exercises] {
        let exercise0 = Exercises(title: "Biceps", musclesWorked: "A single set towards Biceps")
         //Netral Position
        let exercise1 = Exercises(title: "Bench Press",             musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
        let exercise2 = Exercises(title: "Dumbell Bench Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
        let exercise3 = Exercises(title: "Machine Chest Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
        let exercise4 = Exercises(title: "Nuetral Cable Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
        let exercise5 = Exercises(title: "Neutral Crossover Flyes", musclesWorked: "Middle Pectoral")
        
        //Incline
        let exercise6 = Exercises(title: "Incline Bench Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
        let exercise7 = Exercises(title: "Incline Dumbell Bench Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
        let exercise8 = Exercises(title: "Incline Machine Chest Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
        let exercise9 = Exercises(title: "Incline Cable Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
        let exercise10 = Exercises(title: "Incline Crossover Flyes",    musclesWorked: "Upper Pectoral")
        
        //Decline
      
        let exercise11 = Exercises(title: "Decline Bench Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
        let exercise12 = Exercises(title: "Decline Dumbell Bench Press", musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
        let exercise13 = Exercises(title: "Decline Cable Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
        let exercise14 = Exercises(title: "Decline Crossover Flyes",     musclesWorked: "Lower Pectoral")
        
        //Miscellaneuos
        let exercise15 = Exercises(title: "Chest Pullover", musclesWorked: "Upper Pectoral, Triceps Secondary: Lats")
       
        return [exercise0, exercise1, exercise2, exercise3, exercise4, exercise5
                , exercise6, exercise7, exercise8, exercise9, exercise10,
                exercise11, exercise12, exercise13, exercise14, exercise15]
    }
    
    func createBWBicepsArray() -> [Exercises] {
          let exercise0 = Exercises(title: "Push-Ups",     musclesWorked:   "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
          let exercise1 = Exercises(title: "Wide Dips",    musclesWorked:  "Chest Secondary: Lateral and Medial Triceps")
          let exercise2 = Exercises(title: "Banded Fly",   musclesWorked: "Upper/Middle/Lower Pectoral")
         
          return [exercise0, exercise1, exercise2]
      }
    
    func createLatsArray() -> [Exercises] {
        let exercise0 = Exercises(title: "Lats", musclesWorked: "One set towards Lats")
         //Neutral Position
        let exercise1 = Exercises(title: "Bench Press",             musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
        let exercise2 = Exercises(title: "Dumbell Bench Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
        let exercise3 = Exercises(title: "Machine Chest Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
        let exercise4 = Exercises(title: "Nuetral Cable Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
        let exercise5 = Exercises(title: "Neutral Crossover Flyes", musclesWorked: "Middle Pectoral")
        
        //Incline
        let exercise6 = Exercises(title: "Incline Bench Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
        let exercise7 = Exercises(title: "Incline Dumbell Bench Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
        let exercise8 = Exercises(title: "Incline Machine Chest Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
        let exercise9 = Exercises(title: "Incline Cable Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
        let exercise10 = Exercises(title: "Incline Crossover Flyes",    musclesWorked: "Upper Pectoral")
        
        //Decline
      
        let exercise11 = Exercises(title: "Decline Bench Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
        let exercise12 = Exercises(title: "Decline Dumbell Bench Press", musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
        let exercise13 = Exercises(title: "Decline Cable Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
        let exercise14 = Exercises(title: "Decline Crossover Flyes",     musclesWorked: "Lower Pectoral")
        
        //Miscellaneuos
        let exercise15 = Exercises(title: "Chest Pullover", musclesWorked: "Upper Pectoral, Triceps Secondary: Lats")
       
        return [exercise0, exercise1, exercise2, exercise3, exercise4, exercise5
                , exercise6, exercise7, exercise8, exercise9, exercise10,
                exercise11, exercise12, exercise13, exercise14, exercise15]
    }
    
    func createBWLatsArray() -> [Exercises] {
          let exercise0 = Exercises(title: "Pull Ups",     musclesWorked:   "Lats n stuff")
          let exercise1 = Exercises(title: "Wide Dips",    musclesWorked:  "Chest Secondary: Lateral and Medial Triceps")
          let exercise2 = Exercises(title: "Banded Fly",   musclesWorked: "Upper/Middle/Lower Pectoral")
         
          return [exercise0, exercise1, exercise2]
      }
    
    func createGlutesArray() -> [Exercises] {
        let exercise0 = Exercises(title: "Glutes", musclesWorked: "A single set towards Glutes")
         //Netral Position
        let exercise1 = Exercises(title: "Bench Press",             musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
        let exercise2 = Exercises(title: "Dumbell Bench Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
        let exercise3 = Exercises(title: "Machine Chest Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
        let exercise4 = Exercises(title: "Nuetral Cable Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
        let exercise5 = Exercises(title: "Neutral Crossover Flyes", musclesWorked: "Middle Pectoral")
        
        //Incline
        let exercise6 = Exercises(title: "Incline Bench Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
        let exercise7 = Exercises(title: "Incline Dumbell Bench Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
        let exercise8 = Exercises(title: "Incline Machine Chest Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
        let exercise9 = Exercises(title: "Incline Cable Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
        let exercise10 = Exercises(title: "Incline Crossover Flyes",    musclesWorked: "Upper Pectoral")
        
        //Decline
      
        let exercise11 = Exercises(title: "Decline Bench Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
        let exercise12 = Exercises(title: "Decline Dumbell Bench Press", musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
        let exercise13 = Exercises(title: "Decline Cable Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
        let exercise14 = Exercises(title: "Decline Crossover Flyes",     musclesWorked: "Lower Pectoral")
        
        //Miscellaneuos
        let exercise15 = Exercises(title: "Chest Pullover", musclesWorked: "Upper Pectoral, Triceps Secondary: Lats")
       
        return [exercise0, exercise1, exercise2, exercise3, exercise4, exercise5
                , exercise6, exercise7, exercise8, exercise9, exercise10,
                exercise11, exercise12, exercise13, exercise14, exercise15]
    }
    
    func createBWGlutesArray() -> [Exercises] {
          let exercise0 = Exercises(title: "Bodyweight Hip Thrusts",     musclesWorked:   "Glutes n stuff")
          let exercise1 = Exercises(title: "Wide Dips",    musclesWorked:  "Chest Secondary: Lateral and Medial Triceps")
          let exercise2 = Exercises(title: "Banded Fly",   musclesWorked: "Upper/Middle/Lower Pectoral")
         
          return [exercise0, exercise1, exercise2]
      }
    
    func createGluteMediusArray() -> [Exercises] {
         let exercise0 = Exercises(title: "Glute Medius", musclesWorked: "A single set towards Glute Medius")
          //Netral Position
         let exercise1 = Exercises(title: "Bench Press",             musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
         let exercise2 = Exercises(title: "Dumbell Bench Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
         let exercise3 = Exercises(title: "Machine Chest Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
         let exercise4 = Exercises(title: "Nuetral Cable Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
         let exercise5 = Exercises(title: "Neutral Crossover Flyes", musclesWorked: "Middle Pectoral")
         
         //Incline
         let exercise6 = Exercises(title: "Incline Bench Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
         let exercise7 = Exercises(title: "Incline Dumbell Bench Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
         let exercise8 = Exercises(title: "Incline Machine Chest Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
         let exercise9 = Exercises(title: "Incline Cable Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
         let exercise10 = Exercises(title: "Incline Crossover Flyes",    musclesWorked: "Upper Pectoral")
         
         //Decline
       
         let exercise11 = Exercises(title: "Decline Bench Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
         let exercise12 = Exercises(title: "Decline Dumbell Bench Press", musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
         let exercise13 = Exercises(title: "Decline Cable Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
         let exercise14 = Exercises(title: "Decline Crossover Flyes",     musclesWorked: "Lower Pectoral")
         
         //Miscellaneuos
         let exercise15 = Exercises(title: "Chest Pullover", musclesWorked: "Upper Pectoral, Triceps Secondary: Lats")
        
         return [exercise0, exercise1, exercise2, exercise3, exercise4, exercise5
                 , exercise6, exercise7, exercise8, exercise9, exercise10,
                 exercise11, exercise12, exercise13, exercise14, exercise15]
     }
     
     func createBWGluteMediusArray() -> [Exercises] {
           let exercise0 = Exercises(title: "Banded Lateral Walk",     musclesWorked:   "Glute Medius")
           let exercise1 = Exercises(title: "Wide Dips",    musclesWorked:  "Chest Secondary: Lateral and Medial Triceps")
           let exercise2 = Exercises(title: "Banded Fly",   musclesWorked: "Upper/Middle/Lower Pectoral")
          
           return [exercise0, exercise1, exercise2]
       }
     
     func createHamstringsArray() -> [Exercises] {
         let exercise0 = Exercises(title: "Hamstrings", musclesWorked: "A single set towards Hamstrings")
          //Netral Position
         let exercise1 = Exercises(title: "Bench Press",             musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
         let exercise2 = Exercises(title: "Dumbell Bench Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
         let exercise3 = Exercises(title: "Machine Chest Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
         let exercise4 = Exercises(title: "Nuetral Cable Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
         let exercise5 = Exercises(title: "Neutral Crossover Flyes", musclesWorked: "Middle Pectoral")
         
         //Incline
         let exercise6 = Exercises(title: "Incline Bench Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
         let exercise7 = Exercises(title: "Incline Dumbell Bench Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
         let exercise8 = Exercises(title: "Incline Machine Chest Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
         let exercise9 = Exercises(title: "Incline Cable Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
         let exercise10 = Exercises(title: "Incline Crossover Flyes",    musclesWorked: "Upper Pectoral")
         
         //Decline
       
         let exercise11 = Exercises(title: "Decline Bench Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
         let exercise12 = Exercises(title: "Decline Dumbell Bench Press", musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
         let exercise13 = Exercises(title: "Decline Cable Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
         let exercise14 = Exercises(title: "Decline Crossover Flyes",     musclesWorked: "Lower Pectoral")
         
         //Miscellaneuos
         let exercise15 = Exercises(title: "Chest Pullover", musclesWorked: "Upper Pectoral, Triceps Secondary: Lats")
        
         return [exercise0, exercise1, exercise2, exercise3, exercise4, exercise5
                 , exercise6, exercise7, exercise8, exercise9, exercise10,
                 exercise11, exercise12, exercise13, exercise14, exercise15]
     }
     
     func createBWHamstringsArray() -> [Exercises] {
           let exercise0 = Exercises(title: "Hamstring Curls",     musclesWorked:   "Hamstrings n stuff")
           let exercise1 = Exercises(title: "Wide Dips",    musclesWorked:  "Chest Secondary: Lateral and Medial Triceps")
           let exercise2 = Exercises(title: "Banded Fly",   musclesWorked: "Upper/Middle/Lower Pectoral")
          
           return [exercise0, exercise1, exercise2]
       }
     
     func createFrontShoulderArray() -> [Exercises] {
         let exercise0 = Exercises(title: "Front Shoulder", musclesWorked: "One set towards Anterior Deltoids ")
          //Netral Position
         let exercise1 = Exercises(title: "Bench Press",             musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
         let exercise2 = Exercises(title: "Dumbell Bench Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
         let exercise3 = Exercises(title: "Machine Chest Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
         let exercise4 = Exercises(title: "Nuetral Cable Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
         let exercise5 = Exercises(title: "Neutral Crossover Flyes", musclesWorked: "Middle Pectoral")
         
         //Incline
         let exercise6 = Exercises(title: "Incline Bench Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
         let exercise7 = Exercises(title: "Incline Dumbell Bench Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
         let exercise8 = Exercises(title: "Incline Machine Chest Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
         let exercise9 = Exercises(title: "Incline Cable Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
         let exercise10 = Exercises(title: "Incline Crossover Flyes",    musclesWorked: "Upper Pectoral")
         
         //Decline
       
         let exercise11 = Exercises(title: "Decline Bench Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
         let exercise12 = Exercises(title: "Decline Dumbell Bench Press", musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
         let exercise13 = Exercises(title: "Decline Cable Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
         let exercise14 = Exercises(title: "Decline Crossover Flyes",     musclesWorked: "Lower Pectoral")
         
         //Miscellaneuos
         let exercise15 = Exercises(title: "Chest Pullover", musclesWorked: "Upper Pectoral, Triceps Secondary: Lats")
        
         return [exercise0, exercise1, exercise2, exercise3, exercise4, exercise5
                 , exercise6, exercise7, exercise8, exercise9, exercise10,
                 exercise11, exercise12, exercise13, exercise14, exercise15]
     }
     
     func createBWFrontShoulderArray() -> [Exercises] {
           let exercise0 = Exercises(title: "Pike Push-Up",     musclesWorked:   "Anterior Delts n stuff")
           let exercise1 = Exercises(title: "Wide Dips",    musclesWorked:  "Chest Secondary: Lateral and Medial Triceps")
           let exercise2 = Exercises(title: "Banded Fly",   musclesWorked: "Upper/Middle/Lower Pectoral")
          
           return [exercise0, exercise1, exercise2]
       }
     
     func createLateralShoulderArray() -> [Exercises] {
         let exercise0 = Exercises(title: "Lateral Shouder", musclesWorked: "A single set towards Lateral Deltoids")
          //Netral Position
         let exercise1 = Exercises(title: "Bench Press",             musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
         let exercise2 = Exercises(title: "Dumbell Bench Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
         let exercise3 = Exercises(title: "Machine Chest Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
         let exercise4 = Exercises(title: "Nuetral Cable Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
         let exercise5 = Exercises(title: "Neutral Crossover Flyes", musclesWorked: "Middle Pectoral")
         
         //Incline
         let exercise6 = Exercises(title: "Incline Bench Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
         let exercise7 = Exercises(title: "Incline Dumbell Bench Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
         let exercise8 = Exercises(title: "Incline Machine Chest Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
         let exercise9 = Exercises(title: "Incline Cable Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
         let exercise10 = Exercises(title: "Incline Crossover Flyes",    musclesWorked: "Upper Pectoral")
         
         //Decline
       
         let exercise11 = Exercises(title: "Decline Bench Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
         let exercise12 = Exercises(title: "Decline Dumbell Bench Press", musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
         let exercise13 = Exercises(title: "Decline Cable Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
         let exercise14 = Exercises(title: "Decline Crossover Flyes",     musclesWorked: "Lower Pectoral")
         
         //Miscellaneuos
         let exercise15 = Exercises(title: "Chest Pullover", musclesWorked: "Upper Pectoral, Triceps Secondary: Lats")
        
         return [exercise0, exercise1, exercise2, exercise3, exercise4, exercise5
                 , exercise6, exercise7, exercise8, exercise9, exercise10,
                 exercise11, exercise12, exercise13, exercise14, exercise15]
     }
     
     func createBWLateralShoulderArray() -> [Exercises] {
           let exercise0 = Exercises(title: "Lateral Raise",     musclesWorked:   "Lateral Detoid")
           let exercise1 = Exercises(title: "Wide Dips",         musclesWorked:  "Chest Secondary: Lateral and Medial Triceps")
           let exercise2 = Exercises(title: "Banded Fly",        musclesWorked: "Upper/Middle/Lower Pectoral")
          
           return [exercise0, exercise1, exercise2]
       }

    func createBackShoulderArray() -> [Exercises] {
           let exercise0 = Exercises(title: "Back Shoulder", musclesWorked: "A single set towards Posterior Deltoids")
            //Netral Position
           let exercise1 = Exercises(title: "Bench Press",             musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
           let exercise2 = Exercises(title: "Dumbell Bench Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
           let exercise3 = Exercises(title: "Machine Chest Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
           let exercise4 = Exercises(title: "Nuetral Cable Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
           let exercise5 = Exercises(title: "Neutral Crossover Flyes", musclesWorked: "Middle Pectoral")
           
           //Incline
           let exercise6 = Exercises(title: "Incline Bench Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
           let exercise7 = Exercises(title: "Incline Dumbell Bench Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
           let exercise8 = Exercises(title: "Incline Machine Chest Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
           let exercise9 = Exercises(title: "Incline Cable Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
           let exercise10 = Exercises(title: "Incline Crossover Flyes",    musclesWorked: "Upper Pectoral")
           
           //Decline
         
           let exercise11 = Exercises(title: "Decline Bench Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
           let exercise12 = Exercises(title: "Decline Dumbell Bench Press", musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
           let exercise13 = Exercises(title: "Decline Cable Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
           let exercise14 = Exercises(title: "Decline Crossover Flyes",     musclesWorked: "Lower Pectoral")
           
           //Miscellaneuos
           let exercise15 = Exercises(title: "Chest Pullover", musclesWorked: "Upper Pectoral, Triceps Secondary: Lats")
          
           return [exercise0, exercise1, exercise2, exercise3, exercise4, exercise5
                   , exercise6, exercise7, exercise8, exercise9, exercise10,
                   exercise11, exercise12, exercise13, exercise14, exercise15]
       }
       
       func createBWBackShoulderArray() -> [Exercises] {
             let exercise0 = Exercises(title: "Floor T's",     musclesWorked:   "Post Delt n stuff")
             let exercise1 = Exercises(title: "Wide Dips",    musclesWorked:  "Chest Secondary: Lateral and Medial Triceps")
             let exercise2 = Exercises(title: "Banded Fly",   musclesWorked: "Upper/Middle/Lower Pectoral")
            
             return [exercise0, exercise1, exercise2]
         }
       
       func createRotatorCuffArray() -> [Exercises] {
           let exercise0 = Exercises(title: "Rotator Cuff", musclesWorked: "A single set towards Rotator Cuffs")
            //Netral Position
           let exercise1 = Exercises(title: "Bench Press",             musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
           let exercise2 = Exercises(title: "Dumbell Bench Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
           let exercise3 = Exercises(title: "Machine Chest Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
           let exercise4 = Exercises(title: "Nuetral Cable Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
           let exercise5 = Exercises(title: "Neutral Crossover Flyes", musclesWorked: "Middle Pectoral")
           
           //Incline
           let exercise6 = Exercises(title: "Incline Bench Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
           let exercise7 = Exercises(title: "Incline Dumbell Bench Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
           let exercise8 = Exercises(title: "Incline Machine Chest Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
           let exercise9 = Exercises(title: "Incline Cable Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
           let exercise10 = Exercises(title: "Incline Crossover Flyes",    musclesWorked: "Upper Pectoral")
           
           //Decline
         
           let exercise11 = Exercises(title: "Decline Bench Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
           let exercise12 = Exercises(title: "Decline Dumbell Bench Press", musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
           let exercise13 = Exercises(title: "Decline Cable Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
           let exercise14 = Exercises(title: "Decline Crossover Flyes",     musclesWorked: "Lower Pectoral")
           
           //Miscellaneuos
           let exercise15 = Exercises(title: "Chest Pullover", musclesWorked: "Upper Pectoral, Triceps Secondary: Lats")
          
           return [exercise0, exercise1, exercise2, exercise3, exercise4, exercise5
                   , exercise6, exercise7, exercise8, exercise9, exercise10,
                   exercise11, exercise12, exercise13, exercise14, exercise15]
       }
       
       func createBWRotatorCuffArray() -> [Exercises] {
             let exercise0 = Exercises(title: "Ring Facepull",     musclesWorked:   "RotatorCuff and stuff")
             let exercise1 = Exercises(title: "Wide Dips",    musclesWorked:  "Chest Secondary: Lateral and Medial Triceps")
             let exercise2 = Exercises(title: "Banded Fly",   musclesWorked: "Upper/Middle/Lower Pectoral")
            
             return [exercise0, exercise1, exercise2]
         }
       
       func createTricepsArray() -> [Exercises] {
           let exercise0 = Exercises(title: "Triceps", musclesWorked: "One set towards Triceps")
            //Netral Position
           let exercise1 = Exercises(title: "Bench Press",             musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
           let exercise2 = Exercises(title: "Dumbell Bench Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
           let exercise3 = Exercises(title: "Machine Chest Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
           let exercise4 = Exercises(title: "Nuetral Cable Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
           let exercise5 = Exercises(title: "Neutral Crossover Flyes", musclesWorked: "Middle Pectoral")
           
           //Incline
           let exercise6 = Exercises(title: "Incline Bench Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
           let exercise7 = Exercises(title: "Incline Dumbell Bench Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
           let exercise8 = Exercises(title: "Incline Machine Chest Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
           let exercise9 = Exercises(title: "Incline Cable Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
           let exercise10 = Exercises(title: "Incline Crossover Flyes",    musclesWorked: "Upper Pectoral")
           
           //Decline
         
           let exercise11 = Exercises(title: "Decline Bench Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
           let exercise12 = Exercises(title: "Decline Dumbell Bench Press", musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
           let exercise13 = Exercises(title: "Decline Cable Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
           let exercise14 = Exercises(title: "Decline Crossover Flyes",     musclesWorked: "Lower Pectoral")
           
           //Miscellaneuos
           let exercise15 = Exercises(title: "Chest Pullover", musclesWorked: "Upper Pectoral, Triceps Secondary: Lats")
          
           return [exercise0, exercise1, exercise2, exercise3, exercise4, exercise5
                   , exercise6, exercise7, exercise8, exercise9, exercise10,
                   exercise11, exercise12, exercise13, exercise14, exercise15]
       }
       
       func createBWTricepsArray() -> [Exercises] {
             let exercise0 = Exercises(title: "Triceps Extension",     musclesWorked:   "Triceps")
             let exercise1 = Exercises(title: "Wide Dips",    musclesWorked:  "Chest Secondary: Lateral and Medial Triceps")
             let exercise2 = Exercises(title: "Banded Fly",   musclesWorked: "Upper/Middle/Lower Pectoral")
            
             return [exercise0, exercise1, exercise2]
         }
       
       func createQuadsArray() -> [Exercises] {
           let exercise0 = Exercises(title: "Quads", musclesWorked: "A single set towards Quads")
            //Netral Position
           let exercise1 = Exercises(title: "Bench Press",             musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
           let exercise2 = Exercises(title: "Dumbell Bench Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
           let exercise3 = Exercises(title: "Machine Chest Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
           let exercise4 = Exercises(title: "Nuetral Cable Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
           let exercise5 = Exercises(title: "Neutral Crossover Flyes", musclesWorked: "Middle Pectoral")
           
           //Incline
           let exercise6 = Exercises(title: "Incline Bench Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
           let exercise7 = Exercises(title: "Incline Dumbell Bench Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
           let exercise8 = Exercises(title: "Incline Machine Chest Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
           let exercise9 = Exercises(title: "Incline Cable Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
           let exercise10 = Exercises(title: "Incline Crossover Flyes",    musclesWorked: "Upper Pectoral")
           
           //Decline
         
           let exercise11 = Exercises(title: "Decline Bench Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
           let exercise12 = Exercises(title: "Decline Dumbell Bench Press", musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
           let exercise13 = Exercises(title: "Decline Cable Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
           let exercise14 = Exercises(title: "Decline Crossover Flyes",     musclesWorked: "Lower Pectoral")
           
           //Miscellaneuos
           let exercise15 = Exercises(title: "Chest Pullover", musclesWorked: "Upper Pectoral, Triceps Secondary: Lats")
          
           return [exercise0, exercise1, exercise2, exercise3, exercise4, exercise5
                   , exercise6, exercise7, exercise8, exercise9, exercise10,
                   exercise11, exercise12, exercise13, exercise14, exercise15]
       }
       
       func createBWQuadsArray() -> [Exercises] {
             let exercise0 = Exercises(title: "Banded Lunges",     musclesWorked:   "Quads")
             let exercise1 = Exercises(title: "Wide Dips",    musclesWorked:  "Chest Secondary: Lateral and Medial Triceps")
             let exercise2 = Exercises(title: "Banded Fly",   musclesWorked: "Upper/Middle/Lower Pectoral")
            
             return [exercise0, exercise1, exercise2]
         }
       
       func createAbsArray() -> [Exercises] {
            let exercise0 = Exercises(title: "Abs", musclesWorked: "A single set towards Abs")
             //Netral Position
            let exercise1 = Exercises(title: "Bench Press",             musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
            let exercise2 = Exercises(title: "Dumbell Bench Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
            let exercise3 = Exercises(title: "Machine Chest Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
            let exercise4 = Exercises(title: "Nuetral Cable Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
            let exercise5 = Exercises(title: "Neutral Crossover Flyes", musclesWorked: "Middle Pectoral")
            
            //Incline
            let exercise6 = Exercises(title: "Incline Bench Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
            let exercise7 = Exercises(title: "Incline Dumbell Bench Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
            let exercise8 = Exercises(title: "Incline Machine Chest Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
            let exercise9 = Exercises(title: "Incline Cable Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
            let exercise10 = Exercises(title: "Incline Crossover Flyes",    musclesWorked: "Upper Pectoral")
            
            //Decline
          
            let exercise11 = Exercises(title: "Decline Bench Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
            let exercise12 = Exercises(title: "Decline Dumbell Bench Press", musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
            let exercise13 = Exercises(title: "Decline Cable Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
            let exercise14 = Exercises(title: "Decline Crossover Flyes",     musclesWorked: "Lower Pectoral")
            
            //Miscellaneuos
            let exercise15 = Exercises(title: "Chest Pullover", musclesWorked: "Upper Pectoral, Triceps Secondary: Lats")
           
            return [exercise0, exercise1, exercise2, exercise3, exercise4, exercise5
                    , exercise6, exercise7, exercise8, exercise9, exercise10,
                    exercise11, exercise12, exercise13, exercise14, exercise15]
        }
        
        func createBWAbsArray() -> [Exercises] {
              let exercise0 = Exercises(title: "Leg Raises",     musclesWorked:   "Abs and stuff")
              let exercise1 = Exercises(title: "Wide Dips",    musclesWorked:  "Chest Secondary: Lateral and Medial Triceps")
              let exercise2 = Exercises(title: "Banded Fly",   musclesWorked: "Upper/Middle/Lower Pectoral")
             
              return [exercise0, exercise1, exercise2]
          }
        
        func createObliquesArray() -> [Exercises] {
            let exercise0 = Exercises(title: "Obliques", musclesWorked: "A single set towards Obliques")
             //Netral Position
            let exercise1 = Exercises(title: "Bench Press",             musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
            let exercise2 = Exercises(title: "Dumbell Bench Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
            let exercise3 = Exercises(title: "Machine Chest Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
            let exercise4 = Exercises(title: "Nuetral Cable Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
            let exercise5 = Exercises(title: "Neutral Crossover Flyes", musclesWorked: "Middle Pectoral")
            
            //Incline
            let exercise6 = Exercises(title: "Incline Bench Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
            let exercise7 = Exercises(title: "Incline Dumbell Bench Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
            let exercise8 = Exercises(title: "Incline Machine Chest Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
            let exercise9 = Exercises(title: "Incline Cable Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
            let exercise10 = Exercises(title: "Incline Crossover Flyes",    musclesWorked: "Upper Pectoral")
            
            //Decline
          
            let exercise11 = Exercises(title: "Decline Bench Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
            let exercise12 = Exercises(title: "Decline Dumbell Bench Press", musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
            let exercise13 = Exercises(title: "Decline Cable Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
            let exercise14 = Exercises(title: "Decline Crossover Flyes",     musclesWorked: "Lower Pectoral")
            
            //Miscellaneuos
            let exercise15 = Exercises(title: "Chest Pullover", musclesWorked: "Upper Pectoral, Triceps Secondary: Lats")
           
            return [exercise0, exercise1, exercise2, exercise3, exercise4, exercise5
                    , exercise6, exercise7, exercise8, exercise9, exercise10,
                    exercise11, exercise12, exercise13, exercise14, exercise15]
        }
        
        func createBWObliquesArray() -> [Exercises] {
              let exercise0 = Exercises(title: "Twisting Leg Raise",     musclesWorked:   "Obliques n stuff")
              let exercise1 = Exercises(title: "Wide Dips",    musclesWorked:  "Chest Secondary: Lateral and Medial Triceps")
              let exercise2 = Exercises(title: "Banded Fly",   musclesWorked: "Upper/Middle/Lower Pectoral")
             
              return [exercise0, exercise1, exercise2]
          }
        
        func createSerratusArray() -> [Exercises] {
            let exercise0 = Exercises(title: "Serratus", musclesWorked: "One set towards Serratus")
             //Netral Position
            let exercise1 = Exercises(title: "Bench Press",             musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
            let exercise2 = Exercises(title: "Dumbell Bench Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
            let exercise3 = Exercises(title: "Machine Chest Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
            let exercise4 = Exercises(title: "Nuetral Cable Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
            let exercise5 = Exercises(title: "Neutral Crossover Flyes", musclesWorked: "Middle Pectoral")
            
            //Incline
            let exercise6 = Exercises(title: "Incline Bench Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
            let exercise7 = Exercises(title: "Incline Dumbell Bench Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
            let exercise8 = Exercises(title: "Incline Machine Chest Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
            let exercise9 = Exercises(title: "Incline Cable Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
            let exercise10 = Exercises(title: "Incline Crossover Flyes",    musclesWorked: "Upper Pectoral")
            
            //Decline
          
            let exercise11 = Exercises(title: "Decline Bench Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
            let exercise12 = Exercises(title: "Decline Dumbell Bench Press", musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
            let exercise13 = Exercises(title: "Decline Cable Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
            let exercise14 = Exercises(title: "Decline Crossover Flyes",     musclesWorked: "Lower Pectoral")
            
            //Miscellaneuos
            let exercise15 = Exercises(title: "Chest Pullover", musclesWorked: "Upper Pectoral, Triceps Secondary: Lats")
           
            return [exercise0, exercise1, exercise2, exercise3, exercise4, exercise5
                    , exercise6, exercise7, exercise8, exercise9, exercise10,
                    exercise11, exercise12, exercise13, exercise14, exercise15]
        }
        
        func createBWSerratusArray() -> [Exercises] {
              let exercise0 = Exercises(title: "Floor/Bar Protraction",     musclesWorked:   "Serratus n stuff")
              let exercise1 = Exercises(title: "Wide Dips",    musclesWorked:  "Chest Secondary: Lateral and Medial Triceps")
              let exercise2 = Exercises(title: "Banded Fly",   musclesWorked: "Upper/Middle/Lower Pectoral")
             
              return [exercise0, exercise1, exercise2]
          }
        
        func createTransverseAbArray() -> [Exercises] {
            let exercise0 = Exercises(title: "Transverse Ab", musclesWorked: "A single set towards Transverse Ab")
             //Netral Position
            let exercise1 = Exercises(title: "Bench Press",             musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
            let exercise2 = Exercises(title: "Dumbell Bench Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
            let exercise3 = Exercises(title: "Machine Chest Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
            let exercise4 = Exercises(title: "Nuetral Cable Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
            let exercise5 = Exercises(title: "Neutral Crossover Flyes", musclesWorked: "Middle Pectoral")
            
            //Incline
            let exercise6 = Exercises(title: "Incline Bench Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
            let exercise7 = Exercises(title: "Incline Dumbell Bench Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
            let exercise8 = Exercises(title: "Incline Machine Chest Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
            let exercise9 = Exercises(title: "Incline Cable Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
            let exercise10 = Exercises(title: "Incline Crossover Flyes",    musclesWorked: "Upper Pectoral")
            
            //Decline
          
            let exercise11 = Exercises(title: "Decline Bench Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
            let exercise12 = Exercises(title: "Decline Dumbell Bench Press", musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
            let exercise13 = Exercises(title: "Decline Cable Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
            let exercise14 = Exercises(title: "Decline Crossover Flyes",     musclesWorked: "Lower Pectoral")
            
            //Miscellaneuos
            let exercise15 = Exercises(title: "Chest Pullover", musclesWorked: "Upper Pectoral, Triceps Secondary: Lats")
           
            return [exercise0, exercise1, exercise2, exercise3, exercise4, exercise5
                    , exercise6, exercise7, exercise8, exercise9, exercise10,
                    exercise11, exercise12, exercise13, exercise14, exercise15]
        }
        
        func createBWTransverseAbArray() -> [Exercises] {
              let exercise0 = Exercises(title: "Vacuums",     musclesWorked:   "Transverse Abdominus")
              let exercise1 = Exercises(title: "Wide Dips",         musclesWorked:  "Chest Secondary: Lateral and Medial Triceps")
              let exercise2 = Exercises(title: "Banded Fly",        musclesWorked: "Upper/Middle/Lower Pectoral")
             
              return [exercise0, exercise1, exercise2]
          }
    
    func createCalvesArray() -> [Exercises] {
           let exercise0 = Exercises(title: "Calves", musclesWorked: "A single set towards Calves")
            //Netral Position
           let exercise1 = Exercises(title: "Bench Press",             musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
           let exercise2 = Exercises(title: "Dumbell Bench Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
           let exercise3 = Exercises(title: "Machine Chest Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
           let exercise4 = Exercises(title: "Nuetral Cable Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
           let exercise5 = Exercises(title: "Neutral Crossover Flyes", musclesWorked: "Middle Pectoral")
           
           //Incline
           let exercise6 = Exercises(title: "Incline Bench Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
           let exercise7 = Exercises(title: "Incline Dumbell Bench Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
           let exercise8 = Exercises(title: "Incline Machine Chest Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
           let exercise9 = Exercises(title: "Incline Cable Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
           let exercise10 = Exercises(title: "Incline Crossover Flyes",    musclesWorked: "Upper Pectoral")
           
           //Decline
         
           let exercise11 = Exercises(title: "Decline Bench Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
           let exercise12 = Exercises(title: "Decline Dumbell Bench Press", musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
           let exercise13 = Exercises(title: "Decline Cable Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
           let exercise14 = Exercises(title: "Decline Crossover Flyes",     musclesWorked: "Lower Pectoral")
           
           //Miscellaneuos
           let exercise15 = Exercises(title: "Chest Pullover", musclesWorked: "Upper Pectoral, Triceps Secondary: Lats")
          
           return [exercise0, exercise1, exercise2, exercise3, exercise4, exercise5
                   , exercise6, exercise7, exercise8, exercise9, exercise10,
                   exercise11, exercise12, exercise13, exercise14, exercise15]
       }
       
       func createBWCalvesArray() -> [Exercises] {
             let exercise0 = Exercises(title: "Calf Raises",     musclesWorked:   "Calves")
             let exercise1 = Exercises(title: "Wide Dips",    musclesWorked:  "Chest Secondary: Lateral and Medial Triceps")
             let exercise2 = Exercises(title: "Banded Fly",   musclesWorked: "Upper/Middle/Lower Pectoral")
            
             return [exercise0, exercise1, exercise2]
         }
       
       func createNeckArray() -> [Exercises] {
           let exercise0 = Exercises(title: "Neck", musclesWorked: "A single set towards Neck")
            //Netral Position
           let exercise1 = Exercises(title: "Bench Press",             musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
           let exercise2 = Exercises(title: "Dumbell Bench Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
           let exercise3 = Exercises(title: "Machine Chest Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
           let exercise4 = Exercises(title: "Nuetral Cable Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
           let exercise5 = Exercises(title: "Neutral Crossover Flyes", musclesWorked: "Middle Pectoral")
           
           //Incline
           let exercise6 = Exercises(title: "Incline Bench Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
           let exercise7 = Exercises(title: "Incline Dumbell Bench Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
           let exercise8 = Exercises(title: "Incline Machine Chest Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
           let exercise9 = Exercises(title: "Incline Cable Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
           let exercise10 = Exercises(title: "Incline Crossover Flyes",    musclesWorked: "Upper Pectoral")
           
           //Decline
         
           let exercise11 = Exercises(title: "Decline Bench Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
           let exercise12 = Exercises(title: "Decline Dumbell Bench Press", musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
           let exercise13 = Exercises(title: "Decline Cable Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
           let exercise14 = Exercises(title: "Decline Crossover Flyes",     musclesWorked: "Lower Pectoral")
           
           //Miscellaneuos
           let exercise15 = Exercises(title: "Chest Pullover", musclesWorked: "Upper Pectoral, Triceps Secondary: Lats")
          
           return [exercise0, exercise1, exercise2, exercise3, exercise4, exercise5
                   , exercise6, exercise7, exercise8, exercise9, exercise10,
                   exercise11, exercise12, exercise13, exercise14, exercise15]
       }
       
       func createBWNeckArray() -> [Exercises] {
             let exercise0 = Exercises(title: "HeadFloats",     musclesWorked:   "Neck")
             let exercise1 = Exercises(title: "Wide Dips",    musclesWorked:  "Chest Secondary: Lateral and Medial Triceps")
             let exercise2 = Exercises(title: "Banded Fly",   musclesWorked: "Upper/Middle/Lower Pectoral")
            
             return [exercise0, exercise1, exercise2]
         }
       
       func createForearmExtensorsArray() -> [Exercises] {
           let exercise0 = Exercises(title: "Forearm Extensor", musclesWorked: "One set towards Forearm Extensors")
            //Netral Position
           let exercise1 = Exercises(title: "Bench Press",             musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
           let exercise2 = Exercises(title: "Dumbell Bench Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
           let exercise3 = Exercises(title: "Machine Chest Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
           let exercise4 = Exercises(title: "Nuetral Cable Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
           let exercise5 = Exercises(title: "Neutral Crossover Flyes", musclesWorked: "Middle Pectoral")
           
           //Incline
           let exercise6 = Exercises(title: "Incline Bench Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
           let exercise7 = Exercises(title: "Incline Dumbell Bench Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
           let exercise8 = Exercises(title: "Incline Machine Chest Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
           let exercise9 = Exercises(title: "Incline Cable Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
           let exercise10 = Exercises(title: "Incline Crossover Flyes",    musclesWorked: "Upper Pectoral")
           
           //Decline
         
           let exercise11 = Exercises(title: "Decline Bench Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
           let exercise12 = Exercises(title: "Decline Dumbell Bench Press", musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
           let exercise13 = Exercises(title: "Decline Cable Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
           let exercise14 = Exercises(title: "Decline Crossover Flyes",     musclesWorked: "Lower Pectoral")
           
           //Miscellaneuos
           let exercise15 = Exercises(title: "Chest Pullover", musclesWorked: "Upper Pectoral, Triceps Secondary: Lats")
          
           return [exercise0, exercise1, exercise2, exercise3, exercise4, exercise5
                   , exercise6, exercise7, exercise8, exercise9, exercise10,
                   exercise11, exercise12, exercise13, exercise14, exercise15]
       }
       
       func createBWForearmExtensorsArray() -> [Exercises] {
             let exercise0 = Exercises(title: "Forearm Extension",     musclesWorked:   "Forearm Extensors n stuff")
             let exercise1 = Exercises(title: "Wide Dips",    musclesWorked:  "Chest Secondary: Lateral and Medial Triceps")
             let exercise2 = Exercises(title: "Banded Fly",   musclesWorked: "Upper/Middle/Lower Pectoral")
            
             return [exercise0, exercise1, exercise2]
         }
       
       func createUlnarForearmArray() -> [Exercises] {
           let exercise0 = Exercises(title: "UlnarForearm", musclesWorked: "A single set towards Ulnar Forearm")
            //Netral Position
           let exercise1 = Exercises(title: "Bench Press",             musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
           let exercise2 = Exercises(title: "Dumbell Bench Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
           let exercise3 = Exercises(title: "Machine Chest Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
           let exercise4 = Exercises(title: "Nuetral Cable Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
           let exercise5 = Exercises(title: "Neutral Crossover Flyes", musclesWorked: "Middle Pectoral")
           
           //Incline
           let exercise6 = Exercises(title: "Incline Bench Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
           let exercise7 = Exercises(title: "Incline Dumbell Bench Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
           let exercise8 = Exercises(title: "Incline Machine Chest Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
           let exercise9 = Exercises(title: "Incline Cable Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
           let exercise10 = Exercises(title: "Incline Crossover Flyes",    musclesWorked: "Upper Pectoral")
           
           //Decline
         
           let exercise11 = Exercises(title: "Decline Bench Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
           let exercise12 = Exercises(title: "Decline Dumbell Bench Press", musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
           let exercise13 = Exercises(title: "Decline Cable Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
           let exercise14 = Exercises(title: "Decline Crossover Flyes",     musclesWorked: "Lower Pectoral")
           
           //Miscellaneuos
           let exercise15 = Exercises(title: "Chest Pullover", musclesWorked: "Upper Pectoral, Triceps Secondary: Lats")
          
           return [exercise0, exercise1, exercise2, exercise3, exercise4, exercise5
                   , exercise6, exercise7, exercise8, exercise9, exercise10,
                   exercise11, exercise12, exercise13, exercise14, exercise15]
       }
       
       func createBWUlnarForearmArray() -> [Exercises] {
             let exercise0 = Exercises(title: "UlnarForearm",     musclesWorked:   "UlnarForearm n stuff")
             let exercise1 = Exercises(title: "Wide Dips",    musclesWorked:  "Chest Secondary: Lateral and Medial Triceps")
             let exercise2 = Exercises(title: "Banded Fly",   musclesWorked: "Upper/Middle/Lower Pectoral")
            
             return [exercise0, exercise1, exercise2]
         }
       
       func createForearmFlexorsArray() -> [Exercises] {
            let exercise0 = Exercises(title: "Forearm Flexors", musclesWorked: "A single set towards Forearm Flexors")
             //Netral Position
            let exercise1 = Exercises(title: "Bench Press",             musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
            let exercise2 = Exercises(title: "Dumbell Bench Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
            let exercise3 = Exercises(title: "Machine Chest Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
            let exercise4 = Exercises(title: "Nuetral Cable Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
            let exercise5 = Exercises(title: "Neutral Crossover Flyes", musclesWorked: "Middle Pectoral")
            
            //Incline
            let exercise6 = Exercises(title: "Incline Bench Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
            let exercise7 = Exercises(title: "Incline Dumbell Bench Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
            let exercise8 = Exercises(title: "Incline Machine Chest Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
            let exercise9 = Exercises(title: "Incline Cable Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
            let exercise10 = Exercises(title: "Incline Crossover Flyes",    musclesWorked: "Upper Pectoral")
            
            //Decline
          
            let exercise11 = Exercises(title: "Decline Bench Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
            let exercise12 = Exercises(title: "Decline Dumbell Bench Press", musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
            let exercise13 = Exercises(title: "Decline Cable Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
            let exercise14 = Exercises(title: "Decline Crossover Flyes",     musclesWorked: "Lower Pectoral")
            
            //Miscellaneuos
            let exercise15 = Exercises(title: "Chest Pullover", musclesWorked: "Upper Pectoral, Triceps Secondary: Lats")
           
            return [exercise0, exercise1, exercise2, exercise3, exercise4, exercise5
                    , exercise6, exercise7, exercise8, exercise9, exercise10,
                    exercise11, exercise12, exercise13, exercise14, exercise15]
        }
        
        func createBWForearmFlexorsArray() -> [Exercises] {
              let exercise0 = Exercises(title: "ForearmFlexors",     musclesWorked:   "ForearmFlexors")
              let exercise1 = Exercises(title: "Wide Dips",    musclesWorked:  "Chest Secondary: Lateral and Medial Triceps")
              let exercise2 = Exercises(title: "Banded Fly",   musclesWorked: "Upper/Middle/Lower Pectoral")
             
              return [exercise0, exercise1, exercise2]
          }
        
        func createRadialForearmArray() -> [Exercises] {
            let exercise0 = Exercises(title: "Radial Forearm", musclesWorked: "A single set towards Radial Forearm")
             //Netral Position
            let exercise1 = Exercises(title: "Bench Press",             musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
            let exercise2 = Exercises(title: "Dumbell Bench Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
            let exercise3 = Exercises(title: "Machine Chest Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
            let exercise4 = Exercises(title: "Nuetral Cable Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
            let exercise5 = Exercises(title: "Neutral Crossover Flyes", musclesWorked: "Middle Pectoral")
            
            //Incline
            let exercise6 = Exercises(title: "Incline Bench Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
            let exercise7 = Exercises(title: "Incline Dumbell Bench Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
            let exercise8 = Exercises(title: "Incline Machine Chest Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
            let exercise9 = Exercises(title: "Incline Cable Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
            let exercise10 = Exercises(title: "Incline Crossover Flyes",    musclesWorked: "Upper Pectoral")
            
            //Decline
          
            let exercise11 = Exercises(title: "Decline Bench Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
            let exercise12 = Exercises(title: "Decline Dumbell Bench Press", musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
            let exercise13 = Exercises(title: "Decline Cable Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
            let exercise14 = Exercises(title: "Decline Crossover Flyes",     musclesWorked: "Lower Pectoral")
            
            //Miscellaneuos
            let exercise15 = Exercises(title: "Chest Pullover", musclesWorked: "Upper Pectoral, Triceps Secondary: Lats")
           
            return [exercise0, exercise1, exercise2, exercise3, exercise4, exercise5
                    , exercise6, exercise7, exercise8, exercise9, exercise10,
                    exercise11, exercise12, exercise13, exercise14, exercise15]
        }
        
        func createBWRadialForearmArray() -> [Exercises] {
              let exercise0 = Exercises(title: "Radial Forearm",     musclesWorked:   "RadialForearm n stuff")
              let exercise1 = Exercises(title: "Wide Dips",    musclesWorked:  "Chest Secondary: Lateral and Medial Triceps")
              let exercise2 = Exercises(title: "Banded Fly",   musclesWorked: "Upper/Middle/Lower Pectoral")
             
              return [exercise0, exercise1, exercise2]
          }
        
        func createSpinalErectorsArray() -> [Exercises] {
            let exercise0 = Exercises(title: "Spinal Erectors", musclesWorked: "One set towards SpinalErectors")
             //Netral Position
            let exercise1 = Exercises(title: "Bench Press",             musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
            let exercise2 = Exercises(title: "Dumbell Bench Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
            let exercise3 = Exercises(title: "Machine Chest Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
            let exercise4 = Exercises(title: "Nuetral Cable Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
            let exercise5 = Exercises(title: "Neutral Crossover Flyes", musclesWorked: "Middle Pectoral")
            
            //Incline
            let exercise6 = Exercises(title: "Incline Bench Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
            let exercise7 = Exercises(title: "Incline Dumbell Bench Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
            let exercise8 = Exercises(title: "Incline Machine Chest Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
            let exercise9 = Exercises(title: "Incline Cable Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
            let exercise10 = Exercises(title: "Incline Crossover Flyes",    musclesWorked: "Upper Pectoral")
            
            //Decline
          
            let exercise11 = Exercises(title: "Decline Bench Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
            let exercise12 = Exercises(title: "Decline Dumbell Bench Press", musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
            let exercise13 = Exercises(title: "Decline Cable Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
            let exercise14 = Exercises(title: "Decline Crossover Flyes",     musclesWorked: "Lower Pectoral")
            
            //Miscellaneuos
            let exercise15 = Exercises(title: "Chest Pullover", musclesWorked: "Upper Pectoral, Triceps Secondary: Lats")
           
            return [exercise0, exercise1, exercise2, exercise3, exercise4, exercise5
                    , exercise6, exercise7, exercise8, exercise9, exercise10,
                    exercise11, exercise12, exercise13, exercise14, exercise15]
        }
        
        func createBWSpinalErectorsArray() -> [Exercises] {
              let exercise0 = Exercises(title: "SpinalErectors",     musclesWorked:   "SpinalErectors n stuff")
              let exercise1 = Exercises(title: "Wide Dips",    musclesWorked:  "Chest Secondary: Lateral and Medial Triceps")
              let exercise2 = Exercises(title: "Banded Fly",   musclesWorked: "Upper/Middle/Lower Pectoral")
             
              return [exercise0, exercise1, exercise2]
          }
        
        func createUpperTrapsArray() -> [Exercises] {
            let exercise0 = Exercises(title: "Upper Traps", musclesWorked: "A single set towards Upper Traps")
             //Netral Position
            let exercise1 = Exercises(title: "Bench Press",             musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
            let exercise2 = Exercises(title: "Dumbell Bench Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
            let exercise3 = Exercises(title: "Machine Chest Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
            let exercise4 = Exercises(title: "Nuetral Cable Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
            let exercise5 = Exercises(title: "Neutral Crossover Flyes", musclesWorked: "Middle Pectoral")
            
            //Incline
            let exercise6 = Exercises(title: "Incline Bench Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
            let exercise7 = Exercises(title: "Incline Dumbell Bench Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
            let exercise8 = Exercises(title: "Incline Machine Chest Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
            let exercise9 = Exercises(title: "Incline Cable Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
            let exercise10 = Exercises(title: "Incline Crossover Flyes",    musclesWorked: "Upper Pectoral")
            
            //Decline
          
            let exercise11 = Exercises(title: "Decline Bench Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
            let exercise12 = Exercises(title: "Decline Dumbell Bench Press", musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
            let exercise13 = Exercises(title: "Decline Cable Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
            let exercise14 = Exercises(title: "Decline Crossover Flyes",     musclesWorked: "Lower Pectoral")
            
            //Miscellaneuos
            let exercise15 = Exercises(title: "Chest Pullover", musclesWorked: "Upper Pectoral, Triceps Secondary: Lats")
           
            return [exercise0, exercise1, exercise2, exercise3, exercise4, exercise5
                    , exercise6, exercise7, exercise8, exercise9, exercise10,
                    exercise11, exercise12, exercise13, exercise14, exercise15]
        }
        
        func createBWUpperTrapsArray() -> [Exercises] {
              let exercise0 = Exercises(title: "Upper Traps",     musclesWorked:   "Upper Traps")
              let exercise1 = Exercises(title: "Wide Dips",         musclesWorked:  "Chest Secondary: Lateral and Medial Triceps")
              let exercise2 = Exercises(title: "Banded Fly",        musclesWorked: "Upper/Middle/Lower Pectoral")
             
              return [exercise0, exercise1, exercise2]
          }

       func createLowerTrapsArray() -> [Exercises] {
              let exercise0 = Exercises(title: "Lower Traps", musclesWorked: "A single set towards Lower Traps")
               //Netral Position
              let exercise1 = Exercises(title: "Bench Press",             musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
              let exercise2 = Exercises(title: "Dumbell Bench Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
              let exercise3 = Exercises(title: "Machine Chest Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
              let exercise4 = Exercises(title: "Nuetral Cable Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
              let exercise5 = Exercises(title: "Neutral Crossover Flyes", musclesWorked: "Middle Pectoral")
              
              //Incline
              let exercise6 = Exercises(title: "Incline Bench Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
              let exercise7 = Exercises(title: "Incline Dumbell Bench Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
              let exercise8 = Exercises(title: "Incline Machine Chest Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
              let exercise9 = Exercises(title: "Incline Cable Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps")
              let exercise10 = Exercises(title: "Incline Crossover Flyes",    musclesWorked: "Upper Pectoral")
              
              //Decline
            
              let exercise11 = Exercises(title: "Decline Bench Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
              let exercise12 = Exercises(title: "Decline Dumbell Bench Press", musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
              let exercise13 = Exercises(title: "Decline Cable Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
              let exercise14 = Exercises(title: "Decline Crossover Flyes",     musclesWorked: "Lower Pectoral")
              
              //Miscellaneuos
              let exercise15 = Exercises(title: "Chest Pullover", musclesWorked: "Upper Pectoral, Triceps Secondary: Lats")
             
              return [exercise0, exercise1, exercise2, exercise3, exercise4, exercise5
                      , exercise6, exercise7, exercise8, exercise9, exercise10,
                      exercise11, exercise12, exercise13, exercise14, exercise15]
          }
    
    func createBWLowerTrapsArray() -> [Exercises] {
              let exercise0 = Exercises(title: "Upper Traps",     musclesWorked:   "Upper Traps")
              let exercise1 = Exercises(title: "Wide Dips",         musclesWorked:  "Chest Secondary: Lateral and Medial Triceps")
              let exercise2 = Exercises(title: "Banded Fly",        musclesWorked: "Upper/Middle/Lower Pectoral")
             
              return [exercise0, exercise1, exercise2]
                       }
       
    //-----------------------------------------------------------END SHENANIGANS----------------------------------------------------
    
    
    
    func goToVolumeTracker(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let dashBoard = storyboard.instantiateViewController(identifier: "volumeTracker")
        self.show(dashBoard, sender: self)
        self.dismiss(animated: true, completion: nil)
    }
  
}
    
extension ChestListViewController: ExercisesTableViewCellDelegate {
func didTapAddSet(title: String) {
    
    //ADD CODE TO OPEN ADD SET WINDOW FOR PROPER EXERCISE
    //Each else bracket identifies the exercise that was click and stores its corersponding volume into variable in the format musclegroupTally. I tried abstracting a function but failed sorry future self/ coders
    // TODO Pullover and dips
    let chestPressList = ["Bench Press", "Dumbell Bench Press", "Machine Chest Press", "Neutral Cable Press", "Push-Ups"]
    let inclineChestPressList = ["Incline Bench Press", "Incline Dumbell Bench Press", "Incline Machine Chest Press", "Incline Cable Press"]
    let declineChestPressList = ["Decline Bench Press", "Decline Dumbell Bench Press",  "Decline Cable Press"]
    let chestIsolation = ["Neutral Crossover Flyes", "Incline Crossover Flyes", "Decline Crossover Flyes", "Chest"]
    //Upper Traps missing Inverted Y
    let upperTrapList = [ "Dumbell Shrugs", "Trap Bar Shrugs", "Farmer Walk", "Trap Pushaway"]
    //Lower Traps  TODO Angel of Death
    let lowerTrapIsolation = ["Y Raise, Floor/Dip Bar Scapular Depression", "Hanging/Cable Scapular Retraction", "Lower Trap"]
    let facePullList = ["Facepulls", "Ring Facepulls", "W's"]
    //Post Delt
    let postDeltIsolation = ["Posterior Deltoid", "Floor T's", "Dumbbell High Pull"]
    let postDeltlowerTrapList = ["Reverse Pec Dec", "Barbell/Dumbbell High Rows", "Banded Pull Aparts"]
    //Lateral Delt
    let medialDeltisolation = [ "Medial Deltoid", "Cable Lateral Raise", "Machine Lateral Riase", "Cheat Lateral Raise", "Lateral Raise", "Delt Rotating Plank", "Banded Lateral Raise"]
    //Ant Delt
    let anteriorDeltIsolation = ["Anterior Deltoid", "Cable Front Raise"]
    let oHPList = ["Arnolds", "Barbell Overhead Press", "Dumbbell OHP", "Cable Stretch to OHP", "Landmine Press", "Machine Shoulder Press", "Push Press", "Pike Pushup", "Handstand Pushup"]
    //Rotator Cuff TODO just rotator cuff
    let rotatorCuffExtensorList = ["Cable External Rotation, Bench Dumbbell External Rotation", "Banded External Rotation"]
    //Triceps TODO Narrow Dip
    let triceps = ["Triceps", "Incline Skullcrushers", "Cable Rope Pushdowns", "V Bar Pushdowns", "Rope Overhead Triceps Extensions", "Long Head Triceps Push Downs", "Triceps Kickbacks", "Triceps Extension", "Ring Overhead Extension", "Bench Dip"]
    let tricepHalfChestDeltList = ["California Press", "Close Grip Dumbbell Press", "Narrow Pushup"]
    //Ulnar Forearm
    let ulnarForearmList = ["Ulnar Forearm", "Rope Ulnar Deviation", "Banded Ulnar Deviation"]
    //Forearm Extensors
    let forearmExtensors = ["Forearm Extensors", "Standing Barbell Wrist Extension", "Barbell Extension Rolls", "Reverse Curls", "Banded Wrist Extension"]
    //Forearm Flexors
    let forearmFlexors = ["Forearm Flexors", "Prone Wrist Curls", "Wrist Flexed Curls", "Banded Wrist Curls"]
    //Radial Forearm
    let radialForearm = ["Radial Forearm", "Rope Radial Deviation", "Hammer/Crossbody Curls", "Banded Radial Deviation", "Re-racking your plates"]
    //Lats TODO Chin Ups
    let latsIsolation = ["Lats", "Pull Ins"]
    let latTricepsList = ["Lat Pull Over", "Lat Pushdowns", "Front Levers"]
    //wathc out this one is super compound
    let latLowerTrapList = ["Cable Pulldown", "High Pulley Row", "Chest Suppported Rows", "Pull Ups", "Ring Rows", "Australian Pull Ups"]
    let latLowerTrapErectorList = ["Barbell Rows, Cable Rows"]
    //Erectors  TODO deadlift, squats, frog pumps, angels of death, marching bridge
    let erectors = ["Erectors", "Hyperextension", "Machine Erector Extension"]
    //Glutes TODO Glutes Hip thrust, reverse hyperextension, banded rdl, BW hip thrust
    let gluteGlutemediusSHamstringsList = ["Isolateral Hip Thrust", "Sprinter Lunge"]
    let glutesSHamstringsGlutemediusList = ["Cable Pull Through", "Glute Hyperextension", "Kettlebell/Dumbbell Swing", "Cable Kick Backs"]
    //GluteMedius TODO Glute side plank
    let gluteMediusList = ["Glute Medius", "Machine Abduction", "Banded Lateral Walkout", "Banded Abduction"]
    //Hamstrings TODO hamstrings
    let hamstringsSGlutesErectorsList = ["Romanian Deadlift", "Deficit Deadlift", "Hamstring Hyperextension", "Glute Ham Raise", "Physioball Hamstring Curls"]
    let isoHamstringsSGlutesErectorsList = ["Isolateral Hamstring Curls", "Single Leg Romanian Deadlift"]
    //CAlves
    let calvesList = ["Calves", "Machine Standing Calf Raise", "Straight Leg Machine Calf Raise", "Seated Calf Raise", "Donkey Calf Raise", "Dumbell/Plated Calf Raise", "Bodyweight Calf Raise"]
    //Bicep  TODO hammer Curls
    let curlsList = ["Dumbbell Curls", "Narrow Dumbbell Curls", "Wide Dumbbell Curls", "Barbell Curls", "Narrow Barbell Curls", "Wide Barbell Curls", "Narrow EZ Bar Curls", "Wide EZ Bar Curls", "Preacher Curls", "Cable/Dumbbell Spider Curls", "Banded Curls"]
    let bicepIsolation = ["Biceps", "Bicep Isometric", "Limp Wrist Curls"]
    //Serratus
    let serratusIsolationList = ["Serratus Anterior", "Plank Protraction", "Banded/Cable Punches"]
    let serratusAbsSTransverseList = ["Protracted Roll Out", "Protracted Cable Crunch"]
    //Abs  Ab Circles
    let absTrnasverse = ["Abs", "Leg Raises", "Reverse Crunches", "Pulse Up", "Cable Crunch", "Band Crunch", "V-Up", "Ab Rollout"]
    //Obliques  leg raise scissors obliques
    let obliquesTransAbList = ["Neutral Wood Choppers", "Low to High Wood Choppers", "High to Low Wood Choppers", "Banded/Cable Step Out", "Banded/Cable/Resisted Rotation"]
    let obliquesTransAbsSAb = ["Twisting Leg Raise", "Elbow to Knee Tuck", "Rotating Plank", "Elbow to Knee Plank", "Twisting Pulse Up", "X-Crunch"]
    //Transverse Ab
    let transverseAbList = ["Transverse Ab", "Vacuums"]
    //Quads pistol squat BW Squats lunges
    let quadsList = ["Quads", "Cable Walkaways", "Leg Press", "Wall Sit", "Banded Lunge"]
    let quadsGlutemedius = ["Banded Leg Press", "Side Lunge"]
    let quadsSGlutemedius = ["Explosive Bulgarian Split Squats", "Traditional Lunge", "Bulgarian Split Squat"]
    
    
     if (chestIsolation.contains(title)){
                          //  1. Create the alert controller.
                          let alert = UIAlertController(title: "Add Volume", message: "Volume accounts for all muscle groups in the exercise. 1 set for primary movers, 1/2 for secondary movers. Input amount of sets performed.", preferredStyle: .alert)
                          //2. Add the text field. You can configure it however you need.
                            alert.addTextField { (textField) in
                            textField.text = "Input amount of sets"
                            textField.keyboardType = .numberPad
                            textField.clearsOnBeginEditing = true
                          }
                          // 3. Grab the value from the text field, and print it when the user clicks OK.
                          alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                            //CAST STRING INPUT TO FLOAT
                          let chestTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                          var chestTallyFloat:Float? = Float(chestTallyString?.text ?? "0")
                          chestTallyFloat = (chestTallyFloat ?? 0)
                          self.defaults.set(chestTallyFloat, forKey: Keys.chestTally)
                          self.goToVolumeTracker()
                          }))
                          // 4. Present the alert.
                          self.present(alert, animated: true, completion: nil)
     } else if (chestPressList.contains(title)){

                                 //  1. Create the alert controller.
                                 let alert = UIAlertController(title: "Add Volume", message: "Volume accounts for all muscle groups in the exercise. 1 set for primary movers, 1/2 for secondary movers. Input amount of sets performed.", preferredStyle: .alert)
                                 //2. Add the text field. You can configure it however you need.
                                   alert.addTextField { (textField) in
                                   textField.text = "Input amount of sets"
                                   textField.keyboardType = .numberPad
                                   textField.clearsOnBeginEditing = true
                                 }
                                 // 3. Grab the value from the text field, and print it when the user clicks OK.
                                 alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                                   //CAST STRING INPUT TO FLOAT
                                 let chestTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                                 var chestTallyFloat:Float? = Float(chestTallyString?.text ?? "0")
                                 chestTallyFloat = (chestTallyFloat ?? 0)
                                 self.defaults.set(chestTallyFloat, forKey: Keys.chestTally)
                                 var tricepTallyFloat:Float? = Float(chestTallyString?.text ?? "0")
                                 tricepTallyFloat = (chestTallyFloat ?? 0) / 2
                                 self.defaults.set(tricepTallyFloat, forKey: Keys.tricepsTally)
                                 var frontShoulderTallyFloat:Float? = Float(chestTallyString?.text ?? "0")
                                 frontShoulderTallyFloat = (chestTallyFloat ?? 0) / 2
                                 self.defaults.set(frontShoulderTallyFloat, forKey: Keys.frontShoulderTally)
                                    
                                 self.goToVolumeTracker()
                                 }))
                                 // 4. Present the alert.
                                 self.present(alert, animated: true, completion: nil)
     } else if (inclineChestPressList.contains(title)){

                                 //  1. Create the alert controller.
                                 let alert = UIAlertController(title: "Add Volume", message: "Volume accounts for all muscle groups in the exercise. 1 set for primary movers, 1/2 for secondary movers. Input amount of sets performed.", preferredStyle: .alert)
                                 //2. Add the text field. You can configure it however you need.
                                   alert.addTextField { (textField) in
                                   textField.text = "Input amount of sets"
                                   textField.keyboardType = .numberPad
                                   textField.clearsOnBeginEditing = true
                                 }
                                 // 3. Grab the value from the text field, and print it when the user clicks OK.
                                 alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                                   //CAST STRING INPUT TO FLOAT
                                let chestTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                                 var chestTallyFloat:Float? = Float(chestTallyString?.text ?? "0")
                                 chestTallyFloat = (chestTallyFloat ?? 0)
                                 self.defaults.set(chestTallyFloat, forKey: Keys.chestTally)
                                 var tricepTallyFloat:Float? = Float(chestTallyString?.text ?? "0")
                                 tricepTallyFloat = (chestTallyFloat ?? 0) / 2
                                 self.defaults.set(tricepTallyFloat, forKey: Keys.tricepsTally)
                                 var frontShoulderTallyFloat:Float? = Float(chestTallyString?.text ?? "0")
                                 self.defaults.set(frontShoulderTallyFloat, forKey: Keys.frontShoulderTally)
                               
                                 self.goToVolumeTracker()
                                 }))
                                 // 4. Present the alert.
                                 self.present(alert, animated: true, completion: nil)
     } else if (declineChestPressList.contains(title)){

                                 //  1. Create the alert controller.
                                 let alert = UIAlertController(title: "Add Volume", message: "Volume accounts for all muscle groups in the exercise. 1 set for primary movers, 1/2 for secondary movers. Input amount of sets performed.", preferredStyle: .alert)
                                 //2. Add the text field. You can configure it however you need.
                                   alert.addTextField { (textField) in
                                   textField.text = "Input amount of sets"
                                   textField.keyboardType = .numberPad
                                   textField.clearsOnBeginEditing = true
                                 }
                                 // 3. Grab the value from the text field, and print it when the user clicks OK.
                                 alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                                   //CAST STRING INPUT TO FLOAT
                               let chestTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                                 var chestTallyFloat:Float? = Float(chestTallyString?.text ?? "0")
                                 chestTallyFloat = (chestTallyFloat ?? 0)
                                 self.defaults.set(chestTallyFloat, forKey: Keys.chestTally)
                                 var tricepTallyFloat:Float? = Float(chestTallyString?.text ?? "0")
                                 tricepTallyFloat = (chestTallyFloat ?? 0) / 2
                                 self.defaults.set(tricepTallyFloat, forKey: Keys.tricepsTally)
                               
                                 self.goToVolumeTracker()
                                 }))
                                 // 4. Present the alert.
                                 self.present(alert, animated: true, completion: nil)
     } else if (upperTrapList.contains(title)){

                                //  1. Create the alert controller.
                                let alert = UIAlertController(title: "Add Volume", message: "Volume accounts for all muscle groups in the exercise. 1 set for primary movers, 1/2 for secondary movers. Input amount of sets performed.", preferredStyle: .alert)
                                //2. Add the text field. You can configure it however you need.
                                alert.addTextField { (textField) in
                                textField.text = "Input amount of sets"
                                textField.keyboardType = .numberPad
                                textField.clearsOnBeginEditing = true
                                }
                                // 3. Grab the value from the text field, and print it when the user clicks OK.
                                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                                //CAST STRING INPUT TO FLOAT
                                let upperTrapsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                                var upperTrapsTallyFloat:Float? = Float(upperTrapsTallyString?.text ?? "0")
                                upperTrapsTallyFloat = (upperTrapsTallyFloat ?? 0)
                                self.defaults.set(upperTrapsTallyFloat, forKey: Keys.upperTrapsTally)
                            
                                self.goToVolumeTracker()
                                }))
                            // 4. Present the alert.
                                self.present(alert, animated: true, completion: nil)
     } else if (lowerTrapIsolation.contains(title)){

                                //  1. Create the alert controller.
                                let alert = UIAlertController(title: "Add Volume", message: "Volume accounts for all muscle groups in the exercise. 1 set for primary movers, 1/2 for secondary movers. Input amount of sets performed.", preferredStyle: .alert)
                                //2. Add the text field. You can configure it however you need.
                                alert.addTextField { (textField) in
                                textField.text = "Input amount of sets"
                                textField.keyboardType = .numberPad
                                textField.clearsOnBeginEditing = true
                                }
                                // 3. Grab the value from the text field, and print it when the user clicks OK.
                                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                                //CAST STRING INPUT TO FLOAT
                                let lowerTrapsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                                var lowerTrapsTallyFloat:Float? = Float(lowerTrapsTallyString?.text ?? "0")
                                lowerTrapsTallyFloat = (lowerTrapsTallyFloat ?? 0)
                                self.defaults.set(lowerTrapsTallyFloat, forKey: Keys.lowerTrapsTally)
                                
                                self.goToVolumeTracker()
                                }))
                                // 4. Present the alert.
                                self.present(alert, animated: true, completion: nil)
     } else if (facePullList.contains(title)){

                                //  1. Create the alert controller.
                                let alert = UIAlertController(title: "Add Volume", message: "Volume accounts for all muscle groups in the exercise. 1 set for primary movers, 1/2 for secondary movers. Input amount of sets performed.", preferredStyle: .alert)
                                //2. Add the text field. You can configure it however you need.
                                alert.addTextField { (textField) in
                                textField.text = "Input amount of sets"
                                textField.keyboardType = .numberPad
                                textField.clearsOnBeginEditing = true
                                }
                                // 3. Grab the value from the text field, and print it when the user clicks OK.
                                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                                //CAST STRING INPUT TO FLOAT
                                let rotatorCuffTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                                var rotatorCuffTallyFloat:Float? = Float(rotatorCuffTallyString?.text ?? "0")
                                rotatorCuffTallyFloat = (rotatorCuffTallyFloat ?? 0)
                                self.defaults.set(rotatorCuffTallyFloat, forKey:
                                    Keys.rotatorCuffTally)
                                let backShoulderTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                                var backShoulderTallyFloat:Float? = Float(backShoulderTallyString?.text ?? "0")
                                backShoulderTallyFloat = (backShoulderTallyFloat ?? 0)
                                self.defaults.set(backShoulderTallyFloat, forKey:
                                    Keys.backShoulderTally)
                                let lowerTrapsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                                var lowerTrapsTallyFloat:Float? = Float(lowerTrapsTallyString?.text ?? "0")
                                lowerTrapsTallyFloat = (lowerTrapsTallyFloat ?? 0)
                                self.defaults.set(lowerTrapsTallyFloat, forKey:
                                    Keys.lowerTrapsTally)
                                            
                                self.goToVolumeTracker()
                                }))
                                // 4. Present the alert.
                                self.present(alert, animated: true, completion: nil)
        
     }  else if (postDeltIsolation.contains(title)){

                                //  1. Create the alert controller.
                                let alert = UIAlertController(title: "Add Volume", message: "Volume accounts for all muscle groups in the exercise. 1 set for primary movers, 1/2 for secondary movers. Input amount of sets performed.", preferredStyle: .alert)
                                //2. Add the text field. You can configure it however you need.
                                alert.addTextField { (textField) in
                                textField.text = "Input amount of sets"
                                textField.keyboardType = .numberPad
                                textField.clearsOnBeginEditing = true
                                }
                                // 3. Grab the value from the text field, and print it when the user clicks OK.
                                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                                //CAST STRING INPUT TO FLOAT
                                let backShoulderTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                                var backShoulderTallyFloat:Float? = Float(backShoulderTallyString?.text ?? "0")
                                backShoulderTallyFloat = (backShoulderTallyFloat ?? 0)
                                self.defaults.set(backShoulderTallyFloat, forKey: Keys.backShoulderTally)
                                                                            
                                self.goToVolumeTracker()
                                }))
                                // 4. Present the alert.
                                self.present(alert, animated: true, completion: nil)
                                } else if (title == "Front Shoulder"){
        
     } else if (postDeltlowerTrapList.contains(title)){

                                //  1. Create the alert controller.
                                let alert = UIAlertController(title: "Add Volume", message: "Volume accounts for all muscle groups in the exercise. 1 set for primary movers, 1/2 for secondary movers. Input amount of sets performed.", preferredStyle: .alert)
                                //2. Add the text field. You can configure it however you need.
                                alert.addTextField { (textField) in
                                textField.text = "Input amount of sets"
                                textField.keyboardType = .numberPad
                                textField.clearsOnBeginEditing = true
                                }
                                // 3. Grab the value from the text field, and print it when the user clicks OK.
                                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                                //CAST STRING INPUT TO FLOAT
                                let backShoulderTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                                var backShoulderTallyFloat:Float? = Float(backShoulderTallyString?.text ?? "0")
                                backShoulderTallyFloat = (backShoulderTallyFloat ?? 0)
                                self.defaults.set(backShoulderTallyFloat, forKey: Keys.backShoulderTally)
                                let lowerTrapTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                                var lowerTrapTallyFloat:Float? = Float(lowerTrapTallyString?.text ?? "0")
                                lowerTrapTallyFloat = (lowerTrapTallyFloat ?? 0)
                                self.defaults.set(lowerTrapTallyFloat, forKey: Keys.lowerTrapsTally)
                                
                                                                               
                                self.goToVolumeTracker()
                                }))
                                // 4. Present the alert.
                                self.present(alert, animated: true, completion: nil)
     } else if (medialDeltisolation.contains(title)){

                                 //  1. Create the alert controller.
                                 let alert = UIAlertController(title: "Add Volume", message: "Volume accounts for all muscle groups in the exercise. 1 set for primary movers, 1/2 for secondary movers. Input amount of sets performed.", preferredStyle: .alert)
                                 //2. Add the text field. You can configure it however you need.
                                 alert.addTextField { (textField) in
                                 textField.text = "Input amount of sets"
                                 textField.keyboardType = .numberPad
                                 textField.clearsOnBeginEditing = true
                                 }
                                 // 3. Grab the value from the text field, and print it when the user clicks OK.
                                 alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                                 //CAST STRING INPUT TO FLOAT
                                 let lateralShoulderTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                                 var lateralShoulderTallyFloat:Float? = Float(lateralShoulderTallyString?.text ?? "0")
                                 lateralShoulderTallyFloat = (lateralShoulderTallyFloat ?? 0)
                                 self.defaults.set(lateralShoulderTallyFloat, forKey: Keys.lateralShoulderTally)
                                                                                
                                 self.goToVolumeTracker()
                                 }))
                                 // 4. Present the alert.
                                 self.present(alert, animated: true, completion: nil)
        
           
     }  else if (anteriorDeltIsolation.contains(title)){

                                       //  1. Create the alert controller.
                                       let alert = UIAlertController(title: "Add Volume", message: "Volume accounts for all muscle groups in the exercise. 1 set for primary movers, 1/2 for secondary movers. Input amount of sets performed.", preferredStyle: .alert)
                                       //2. Add the text field. You can configure it however you need.
                                       alert.addTextField { (textField) in
                                       textField.text = "Input amount of sets"
                                       textField.keyboardType = .numberPad
                                       textField.clearsOnBeginEditing = true
                                       }
                                       // 3. Grab the value from the text field, and print it when the user clicks OK.
                                       alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                                       //CAST STRING INPUT TO FLOAT
                                       let frontShoulderTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                                       var frontShoulderTallyFloat:Float? = Float(frontShoulderTallyString?.text ?? "0")
                                       frontShoulderTallyFloat = (frontShoulderTallyFloat ?? 0)
                                       self.defaults.set(frontShoulderTallyFloat, forKey: Keys.frontShoulderTally)
                                                                                      
                                       self.goToVolumeTracker()
                                       }))
                                       // 4. Present the alert.
                                       self.present(alert, animated: true, completion: nil)
        
     } else if (oHPList.contains(title)){

                            //  1. Create the alert controller.
                            let alert = UIAlertController(title: "Add Volume", message: "Volume accounts for all muscle groups in the exercise. 1 set for primary movers, 1/2 for secondary movers. Input amount of sets performed.", preferredStyle: .alert)
                            //2. Add the text field. You can configure it however you need.
                            alert.addTextField { (textField) in
                            textField.text = "Input amount of sets"
                            textField.keyboardType = .numberPad
                            textField.clearsOnBeginEditing = true
                            }
                            // 3. Grab the value from the text field, and print it when the user clicks OK.
                            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                            //CAST STRING INPUT TO FLOAT
                            let frontShoulderTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                            var frontShoulderTallyFloat:Float? = Float(frontShoulderTallyString?.text ?? "0")
                            frontShoulderTallyFloat = (frontShoulderTallyFloat ?? 0)
                            self.defaults.set(frontShoulderTallyFloat, forKey:
                                Keys.frontShoulderTally)
                            let tricepsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                            var tricepsTallyFloat:Float? = Float(tricepsTallyString?.text ?? "0")
                            tricepsTallyFloat = (tricepsTallyFloat ?? 0)
                            self.defaults.set(tricepsTallyFloat, forKey:
                                Keys.tricepsTally)
                            let lateralShoulderTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                            var lateralShoulderTallyFloat:Float? = Float(lateralShoulderTallyString?.text ?? "0")
                            lateralShoulderTallyFloat = (lateralShoulderTallyFloat ?? 0)
                            self.defaults.set(lateralShoulderTallyFloat, forKey:
                                Keys.lateralShoulderTally)
                                                                           
                            self.goToVolumeTracker()
                            }))
                            // 4. Present the alert.
                            self.present(alert, animated: true, completion: nil)
        
     } else if (rotatorCuffExtensorList.contains(title)){

                            //  1. Create the alert controller.
                            let alert = UIAlertController(title: "Add Volume", message: "Volume accounts for all muscle groups in the exercise. 1 set for primary movers, 1/2 for secondary movers. Input amount of sets performed.", preferredStyle: .alert)
                            //2. Add the text field. You can configure it however you need.
                            alert.addTextField { (textField) in
                            textField.text = "Input amount of sets"
                            textField.keyboardType = .numberPad
                            textField.clearsOnBeginEditing = true
                            }
                            // 3. Grab the value from the text field, and print it when the user clicks OK.
                            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                            //CAST STRING INPUT TO FLOAT
                            let rotatorCuffTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                            var rotatorCuffTallyFloat:Float? = Float(rotatorCuffTallyString?.text ?? "0")
                            rotatorCuffTallyFloat = (rotatorCuffTallyFloat ?? 0)
                            self.defaults.set(rotatorCuffTallyFloat, forKey: Keys.rotatorCuffTally)
                            let forearmExtensorsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                            var forearmExtensorsTallyFloat:Float? = Float(forearmExtensorsTallyString?.text ?? "0")
                            forearmExtensorsTallyFloat = (forearmExtensorsTallyFloat ?? 0)
                            self.defaults.set(forearmExtensorsTallyFloat, forKey: Keys.forearmExtensorsTally)
                                
                            self.goToVolumeTracker()
                            }))
                            // 4. Present the alert.
                            self.present(alert, animated: true, completion: nil)
     } else if (triceps.contains(title)){
                            
                            //  1. Create the alert controller.
                            let alert = UIAlertController(title: "Add Volume", message: "Volume accounts for all muscle groups in the exercise. 1 set for primary movers, 1/2 for secondary movers. Input amount of sets performed.", preferredStyle: .alert)
                            //2. Add the text field. You can configure it however you need.
                            alert.addTextField { (textField) in
                            textField.text = "Input amount of sets"
                            textField.keyboardType = .numberPad
                            textField.clearsOnBeginEditing = true
                            }
                            // 3. Grab the value from the text field, and print it when the user clicks OK.
                            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                            //CAST STRING INPUT TO FLOAT
                            let tricepsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                            var tricepsTallyFloat:Float? = Float(tricepsTallyString?.text ?? "0")
                            tricepsTallyFloat = (tricepsTallyFloat ?? 0)
                            self.defaults.set(tricepsTallyFloat, forKey: Keys.tricepsTally)
                                                                           
                            self.goToVolumeTracker()
                            }))
                            // 4. Present the alert.
                            self.present(alert, animated: true, completion: nil)
                            
     } else if (tricepHalfChestDeltList.contains(title)){
        
                            //  1. Create the alert controller.
                            let alert = UIAlertController(title: "Add Volume", message: "Volume accounts for all muscle groups in the exercise. 1 set for primary movers, 1/2 for secondary movers. Input amount of sets performed.", preferredStyle: .alert)
                            //2. Add the text field. You can configure it however you need.
                            alert.addTextField { (textField) in
                            textField.text = "Input amount of sets"
                            textField.keyboardType = .numberPad
                            textField.clearsOnBeginEditing = true
                            }
                            // 3. Grab the value from the text field, and print it when the user clicks OK.
                            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                            //CAST STRING INPUT TO FLOAT
                            let tricepsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                            var tricepsTallyFloat:Float? = Float(tricepsTallyString?.text ?? "0")
                            tricepsTallyFloat = (tricepsTallyFloat ?? 0)
                            self.defaults.set(tricepsTallyFloat, forKey: Keys.tricepsTally)
                                
                            let chestTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                            var chestTallyFloat:Float? = Float(chestTallyString?.text ?? "0")
                            chestTallyFloat = (chestTallyFloat ?? 0)
                            chestTallyFloat = (chestTallyFloat ?? 0) / 2
                            self.defaults.set(chestTallyFloat, forKey: Keys.chestTally)
                                
                            let frontShoulderTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                            var frontShoulderTallyFloat:Float? = Float(frontShoulderTallyString?.text ?? "0")
                            frontShoulderTallyFloat = (frontShoulderTallyFloat ?? 0)
                                frontShoulderTallyFloat = (frontShoulderTallyFloat ?? 0) / 2
                            self.defaults.set(frontShoulderTallyFloat, forKey: Keys.frontShoulderTally)
                                                                           
                            self.goToVolumeTracker()
                            }))
                            // 4. Present the alert.
                            self.present(alert, animated: true, completion: nil)
        
     } else if (ulnarForearmList.contains(title)){
        
                            //  1. Create the alert controller.
                            let alert = UIAlertController(title: "Add Volume", message: "Volume accounts for all muscle groups in the exercise. 1 set for primary movers, 1/2 for secondary movers. Input amount of sets performed.", preferredStyle: .alert)
                            //2. Add the text field. You can configure it however you need.
                            alert.addTextField { (textField) in
                            textField.text = "Input amount of sets"
                            textField.keyboardType = .numberPad
                            textField.clearsOnBeginEditing = true
                            }
                            // 3. Grab the value from the text field, and print it when the user clicks OK.
                            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                            //CAST STRING INPUT TO FLOAT
                                
                            let ulnarForearmTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                            var ulnarForearmTallyFloat:Float? = Float(ulnarForearmTallyString?.text ?? "0")
                            ulnarForearmTallyFloat = (ulnarForearmTallyFloat ?? 0)
                            self.defaults.set(ulnarForearmTallyFloat, forKey: Keys.ulnarForearmTally)
                                                                           
                            self.goToVolumeTracker()
                            }))
                            // 4. Present the alert.
                            self.present(alert, animated: true, completion: nil)
     } else if (forearmExtensors.contains(title)){
        
                            //  1. Create the alert controller.
                            let alert = UIAlertController(title: "Add Volume", message: "Volume accounts for all muscle groups in the exercise. 1 set for primary movers, 1/2 for secondary movers. Input amount of sets performed.", preferredStyle: .alert)
                            //2. Add the text field. You can configure it however you need.
                            alert.addTextField { (textField) in
                            textField.text = "Input amount of sets"
                            textField.keyboardType = .numberPad
                            textField.clearsOnBeginEditing = true
                            }
                            // 3. Grab the value from the text field, and print it when the user clicks OK.
                            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                            //CAST STRING INPUT TO FLOAT
                            let forearmExtensorsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                            var forearmExtensorsTallyFloat:Float? = Float(forearmExtensorsTallyString?.text ?? "0")
                            forearmExtensorsTallyFloat = (forearmExtensorsTallyFloat ?? 0)
                            self.defaults.set(forearmExtensorsTallyFloat, forKey: Keys.forearmExtensorsTally)
                                                                           
                            self.goToVolumeTracker()
                            }))
                            // 4. Present the alert.
                            self.present(alert, animated: true, completion: nil)
     } else if (forearmFlexors.contains(title)){
        
                            //  1. Create the alert controller.
                            let alert = UIAlertController(title: "Add Volume", message: "Volume accounts for all muscle groups in the exercise. 1 set for primary movers, 1/2 for secondary movers. Input amount of sets performed.", preferredStyle: .alert)
                            //2. Add the text field. You can configure it however you need.
                            alert.addTextField { (textField) in
                            textField.text = "Input amount of sets"
                            textField.keyboardType = .numberPad
                            textField.clearsOnBeginEditing = true
                            }
                            // 3. Grab the value from the text field, and print it when the user clicks OK.
                            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                                
                            //CAST STRING INPUT TO FLOAT
                            let forearmFlexorsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                            var forearmFlexorsTallyFloat:Float? = Float(forearmFlexorsTallyString?.text ?? "0")
                            forearmFlexorsTallyFloat = (forearmFlexorsTallyFloat ?? 0)
                            self.defaults.set(forearmFlexorsTallyFloat, forKey: Keys.forearmFlexorsTally)
                                                                           
                            self.goToVolumeTracker()
                            }))
                            // 4. Present the alert.
                            self.present(alert, animated: true, completion: nil)
     } else if (radialForearm.contains(title)){
        
                        //  1. Create the alert controller.
                        let alert = UIAlertController(title: "Add Volume", message: "Volume accounts for all muscle groups in the exercise. 1 set for primary movers, 1/2 for secondary movers. Input amount of sets performed.", preferredStyle: .alert)
                        //2. Add the text field. You can configure it however you need.
                        alert.addTextField { (textField) in
                        textField.text = "Input amount of sets"
                        textField.keyboardType = .numberPad
                        textField.clearsOnBeginEditing = true
                        }
                        // 3. Grab the value from the text field, and print it when the user clicks OK.
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                            
                        //CAST STRING INPUT TO FLOAT
                        let radialForearmTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                        var radialForearmTallyFloat:Float? = Float(radialForearmTallyString?.text ?? "0")
                        radialForearmTallyFloat = (radialForearmTallyFloat ?? 0)
                            self.defaults.set(radialForearmTallyFloat, forKey: Keys.radialForearmTally)
                                                                       
                        self.goToVolumeTracker()
                        }))
                        // 4. Present the alert.
                        self.present(alert, animated: true, completion: nil)

    } else if (title == "Forearm Extensors"){
        
                        //  1. Create the alert controller.
                        let alert = UIAlertController(title: "Add Volume", message: "Volume accounts for all muscle groups in the exercise. 1 set for primary movers, 1/2 for secondary movers. Input amount of sets performed.", preferredStyle: .alert)
                        //2. Add the text field. You can configure it however you need.
                        alert.addTextField { (textField) in
                        textField.text = "Input amount of sets"
                        textField.keyboardType = .numberPad
                        textField.clearsOnBeginEditing = true
                        }
                        // 3. Grab the value from the text field, and print it when the user clicks OK.
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                        //CAST STRING INPUT TO FLOAT
                        let forearmExtensorsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                        var forearmExtensorsTallyFloat:Float? = Float(forearmExtensorsTallyString?.text ?? "0")
                        forearmExtensorsTallyFloat = (forearmExtensorsTallyFloat ?? 0)
                        self.defaults.set(forearmExtensorsTallyFloat, forKey: Keys.forearmExtensorsTally)
                                                                       
                        self.goToVolumeTracker()
                        }))
                        // 4. Present the alert.
                        self.present(alert, animated: true, completion: nil)
        } else if (title == "Ulnar Forearm"){
        
                        //  1. Create the alert controller.
                        let alert = UIAlertController(title: "Add Volume", message: "Volume accounts for all muscle groups in the exercise. 1 set for primary movers, 1/2 for secondary movers. Input amount of sets performed.", preferredStyle: .alert)
                        //2. Add the text field. You can configure it however you need.
                        alert.addTextField { (textField) in
                        textField.text = "Input amount of sets"
                        textField.keyboardType = .numberPad
                        textField.clearsOnBeginEditing = true
                        }
                        // 3. Grab the value from the text field, and print it when the user clicks OK.
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                        //CAST STRING INPUT TO FLOAT
                        let ulnarForearmTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                        var ulnarForearmTallyFloat:Float? = Float(ulnarForearmTallyString?.text ?? "0")
                        ulnarForearmTallyFloat = (ulnarForearmTallyFloat ?? 0)
                        self.defaults.set(ulnarForearmTallyFloat, forKey: Keys.ulnarForearmTally)
                                                                       
                        self.goToVolumeTracker()
                        }))
                        // 4. Present the alert.
                        self.present(alert, animated: true, completion: nil)
                        
    }  else if (title == "Forearm Flexors"){
        
                        //  1. Create the alert controller.
                        let alert = UIAlertController(title: "Add Volume", message: "Volume accounts for all muscle groups in the exercise. 1 set for primary movers, 1/2 for secondary movers. Input amount of sets performed.", preferredStyle: .alert)
                        //2. Add the text field. You can configure it however you need.
                        alert.addTextField { (textField) in
                        textField.text = "Input amount of sets"
                        textField.keyboardType = .numberPad
                        textField.clearsOnBeginEditing = true
                        }
                        // 3. Grab the value from the text field, and print it when the user clicks OK.
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                        //CAST STRING INPUT TO FLOAT
                        let forearmFlexorsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                        var forearmFlexorsTallyFloat:Float? = Float(forearmFlexorsTallyString?.text ?? "0")
                        forearmFlexorsTallyFloat = (forearmFlexorsTallyFloat ?? 0)
                        self.defaults.set(forearmFlexorsTallyFloat, forKey: Keys.forearmFlexorsTally)
                                                                       
                        self.goToVolumeTracker()
                        }))
                        // 4. Present the alert.
                        self.present(alert, animated: true, completion: nil)
        
    }  else if (title == "Forearm Flexors"){
        
                        //  1. Create the alert controller.
                        let alert = UIAlertController(title: "Add Volume", message: "Volume accounts for all muscle groups in the exercise. 1 set for primary movers, 1/2 for secondary movers. Input amount of sets performed.", preferredStyle: .alert)
                        //2. Add the text field. You can configure it however you need.
                        alert.addTextField { (textField) in
                        textField.text = "Input amount of sets"
                        textField.keyboardType = .numberPad
                        textField.clearsOnBeginEditing = true
                        }
                        // 3. Grab the value from the text field, and print it when the user clicks OK.
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                        //CAST STRING INPUT TO FLOAT
                        let forearmFlexorsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                        var forearmFlexorsTallyFloat:Float? = Float(forearmFlexorsTallyString?.text ?? "0")
                        forearmFlexorsTallyFloat = (forearmFlexorsTallyFloat ?? 0)
                        self.defaults.set(forearmFlexorsTallyFloat, forKey: Keys.forearmFlexorsTally)
                                                                       
                        self.goToVolumeTracker()
                        }))
                        // 4. Present the alert.
                        self.present(alert, animated: true, completion: nil)
    
    } else if (title == "Radial Forearm"){
        
                        //  1. Create the alert controller.
                        let alert = UIAlertController(title: "Add Volume", message: "Volume accounts for all muscle groups in the exercise. 1 set for primary movers, 1/2 for secondary movers. Input amount of sets performed.", preferredStyle: .alert)
                        //2. Add the text field. You can configure it however you need.
                        alert.addTextField { (textField) in
                        textField.text = "Input amount of sets"
                        textField.keyboardType = .numberPad
                        textField.clearsOnBeginEditing = true
                        }
                        // 3. Grab the value from the text field, and print it when the user clicks OK.
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                        //CAST STRING INPUT TO FLOAT
                        let radialForearmTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                        var radialForearmTallyFloat:Float? = Float(radialForearmTallyString?.text ?? "0")
                        radialForearmTallyFloat = (radialForearmTallyFloat ?? 0)
                        self.defaults.set(radialForearmTallyFloat, forKey: Keys.radialForearmTally)
                                                                       
                        self.goToVolumeTracker()
                        }))
                        // 4. Present the alert.
                        self.present(alert, animated: true, completion: nil)
    } else if (title == "Spinal Erectors"){
        
                        //  1. Create the alert controller.
                        let alert = UIAlertController(title: "Add Volume", message: "Volume accounts for all muscle groups in the exercise. 1 set for primary movers, 1/2 for secondary movers. Input amount of sets performed.", preferredStyle: .alert)
                        //2. Add the text field. You can configure it however you need.
                        alert.addTextField { (textField) in
                        textField.text = "Input amount of sets"
                        textField.keyboardType = .numberPad
                        textField.clearsOnBeginEditing = true
                        }
                        // 3. Grab the value from the text field, and print it when the user clicks OK.
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                        //CAST STRING INPUT TO FLOAT
                        let spinalErectorsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                        var spinalErectorsTallyFloat:Float? = Float(spinalErectorsTallyString?.text ?? "0")
                        spinalErectorsTallyFloat = (spinalErectorsTallyFloat ?? 0)
                        self.defaults.set(spinalErectorsTallyFloat, forKey: Keys.spinalErectorsTally)
                                                                       
                        self.goToVolumeTracker()
                        }))
                        // 4. Present the alert.
                        self.present(alert, animated: true, completion: nil)
        
    } else if (title == "Upper Traps"){
        
        //  1. Create the alert controller.
        let alert = UIAlertController(title: "Add Volume", message: "Volume accounts for all muscle groups in the exercise. 1 set for primary movers, 1/2 for secondary movers. Input amount of sets performed.", preferredStyle: .alert)
        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
        textField.text = "Input amount of sets"
        textField.keyboardType = .numberPad
        textField.clearsOnBeginEditing = true
        }
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
        //CAST STRING INPUT TO FLOAT
        let upperTrapsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
        var upperTrapsTallyFloat:Float? = Float(upperTrapsTallyString?.text ?? "0")
        upperTrapsTallyFloat = (upperTrapsTallyFloat ?? 0)
        self.defaults.set(upperTrapsTallyFloat, forKey: Keys.upperTrapsTally)
                                                       
        self.goToVolumeTracker()
        }))
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    } else if (title == "Lower Traps"){
        //  1. Create the alert controller.
        let alert = UIAlertController(title: "Add Volume", message: "Volume accounts for all muscle groups in the exercise. 1 set for primary movers, 1/2 for secondary movers. Input amount of sets performed.", preferredStyle: .alert)
        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
        textField.text = "Input amount of sets"
        textField.keyboardType = .numberPad
        textField.clearsOnBeginEditing = true
        }
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
        //CAST STRING INPUT TO FLOAT
        let lowerTrapsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
        var lowerTrapsTallyFloat:Float? = Float(lowerTrapsTallyString?.text ?? "0")
        lowerTrapsTallyFloat = (lowerTrapsTallyFloat ?? 0)
        self.defaults.set(lowerTrapsTallyFloat, forKey: Keys.lowerTrapsTally)
                                                       
        self.goToVolumeTracker()
        }))
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
        
    }  else if (title == "Reset All"){
        
        //  1. Create the alert controller.
        let alert = UIAlertController(title: "Add Volume", message: "Volume accounts for all muscle groups in the exercise. 1 set for primary movers, 1/2 for secondary movers. Input amount of sets performed.", preferredStyle: .alert)
        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
        textField.text = "Input amount of sets"
        textField.keyboardType = .numberPad
        textField.clearsOnBeginEditing = true
        }
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
        //CAST STRING INPUT TO FLOAT
        let lowerTrapsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
        var lowerTrapsTallyFloat:Float? = Float(lowerTrapsTallyString?.text ?? "0")
        lowerTrapsTallyFloat = (lowerTrapsTallyFloat ?? 0)
        self.defaults.set(lowerTrapsTallyFloat, forKey: Keys.lowerTrapsTally)
                                                       
        self.goToVolumeTracker()
        }))
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
        }
    }
    
}


extension ChestListViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return gymExercises.count
        } else {
            return bodyWeightExercises.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //PRETTY SURE I DONT NEED THIS IDK YET
        var exercise = gymExercises[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell") as! ExercisesTableViewCell
        if (indexPath.section == 1){
                   exercise = bodyWeightExercises[indexPath.row]
               }
        cell.setExercises(exercise: exercise)
        cell.delegate = self
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "Weighted Exercises"
        } else{
            return "Bodyweight Exercises"
        }
    }
}
    










