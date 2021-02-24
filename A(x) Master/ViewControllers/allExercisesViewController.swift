//
//  allExercisesViewController.swift
//  AofX
//
//  Created by Kevin Jimenez on 7/23/20.
//  Copyright © 2020 Aesthet(X). All rights reserved.
//

import UIKit

class allExercisesViewController: UIViewController{
    
    var searchedCountry = [String]()
       var searching = false
      @IBOutlet weak var allExercisesTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
     
        
    //creates array to populate exercise list cells
    
    
        var chestExercises: [Exercises] = []
        var bicepExercises: [Exercises] = []
        var latsExercises: [Exercises] = []
        var glutesExercises: [Exercises] = []
        var gluteMediusExercises: [Exercises] = []
        var hamstringsExercises: [Exercises] = []
        var frontShoulderExercises: [Exercises] = []
        var lateralShoulderExercises: [Exercises] = []
        var backShoulderExercises: [Exercises] = []
        var rotatorCuffExercises: [Exercises] = []
        var tricepsExercises: [Exercises] = []
        var quadsExercises: [Exercises] = []
        var absExercises: [Exercises] = []
        var obliquesExercises: [Exercises] = []
        var serratusExercises: [Exercises] = []
        var transverseAbExercises: [Exercises] = []
        var calvesExercises: [Exercises] = []
        var neckExercises: [Exercises] = []
        var forearmExtensorsExercises: [Exercises] = []
        var ulnarForearmExercises: [Exercises] = []
        var forearmFlexorsExercises: [Exercises] = []
        var radialForearmExercises: [Exercises] = []
        var spinalErectorsExercises: [Exercises] = []
        var upperTrapsExercises: [Exercises] = []
        var lowerTrapsExercises: [Exercises] = []
        var placeHolderExercises: [Exercises] = []
        var allExercises: [Exercises] = []
    
    
        var initialDataAry:[Exercises] = []
        var dataAry:[Exercises] = []
    
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
                static let formExercise                = "formExercise"
        
     }
    
     //Place code to add volume according to exercise here
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        navigationItem.title = " "
       
        allExercisesTableView.allowsSelection = true
        allExercises = createAllExercisesArray()
        placeHolderExercises = createAllExercisesArray()

    }


     //---------------------------------------------BEGIN SHENANIGANS-----------------------------------------------------------------
        //Folowing Functions contain all exercises. Will display only the muscle group selected in the volume tracker
          func createAllExercisesArray() -> [Exercises] {
              let exercise0 = Exercises(title: "Chest", musclesWorked: "A single set towards chest")
               //Netral Position
              let exercise1 = Exercises(title: "Bench Press",             musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
              let exercise2 = Exercises(title: "Dumbell Bench Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
              let exercise3 = Exercises(title: "Machine Chest Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
              let exercise4 = Exercises(title: "Neutral Cable Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
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
            //BW
            let exercise16 = Exercises(title: "Push-Ups",     musclesWorked:   "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
            let exercise17 = Exercises(title: "Wide Dips",    musclesWorked:  "Chest Secondary: Lateral and Medial Triceps")
            let exercise18 = Exercises(title: "Banded Fly",   musclesWorked: "Upper/Middle/Lower Pectoral")
             
              
        
              let exercise19 = Exercises(title: "Biceps", musclesWorked: "A single set towards Biceps")
              let exercise20 = Exercises(title: "Dumbbell Curls",                   musclesWorked: "Biceps Secondary: Forearm Flexors")
              let exercise21 = Exercises(title: "Narrow Dumbbell Curls",            musclesWorked: "Biceps: short head Secondary: Forearm Flexors")
              let exercise22 = Exercises(title: "Wide Dumbbell Curls",              musclesWorked: "Bicep: long head Secondary: Forearm Flexors")
              let exercise23 = Exercises(title: "Barbell Curls",                    musclesWorked: "Biceps Secondary: Forearm Flexors")
              let exercise24 = Exercises(title: "Narrow Barbell Curls",             musclesWorked: "Biceps: short head Secondary: Forearm Flexors")
              let exercise25 = Exercises(title: "Wide Barbell Curls",               musclesWorked: "Biceps: long head Secondary: Forearm Flexors")
              let exercise26 = Exercises(title: "Narrow EZ Bar Curls",              musclesWorked: "Biceps: short head Secondary: Forearm Flexors")
              let exercise27 = Exercises(title: "Wide EZ Bar Curls",                musclesWorked: "Biceps: long head Secondary: Forearm Flexors")
              let exercise28 = Exercises(title: "Preacher Curls",                   musclesWorked: "Biceps: Secondary: Forearm Flexors")
              let exercise29 = Exercises(title: "Limp Wrist Curls",                musclesWorked: "Biceps")
              let exercise30 = Exercises(title: "Biceps Isometric",                musclesWorked: "Biceps")
              let exercise31 = Exercises(title: "Cross Body Hammer Curls",         musclesWorked: "Brachialis, Radial Forearm Secondary: Biceps")
              let exercise32 = Exercises(title: "Cable/Dumbbell Spider Curls",     musclesWorked: "Biceps Secondary: Forearm Flexors")
              let exercise33 = Exercises(title: "Banded Curls",                    musclesWorked: "Biceps Secondary: Forearm Flexors")
              let exercise34 = Exercises(title: "Ring Curls",                      musclesWorked:  "Biceps Secondary: Forearm Flexors")
              
              
         
              let exercise35 = Exercises(title: "Lats", musclesWorked: "One set towards Lats")
              let exercise36 = Exercises(title: "Lat Pull Over",        musclesWorked: "Lats, Trieps")
              let exercise37 = Exercises(title: "Lat Pushdowns",        musclesWorked: "Lats, Triceps")
              let exercise38 = Exercises(title: "Cable Pulldown",       musclesWorked: "Lats, Lower Traps\nSecondary: Post Delt, Bicep, Forearms")
              let exercise39 = Exercises(title: "High Pulley Row",      musclesWorked: "Lats, Lower Traps Secondary: Post Delt, Biceps, Forearm Flexors")
              let exercise40 = Exercises(title: "Chest Supported Rows", musclesWorked: "Lats, Lower Traps Secondary: Post Delt, Biceps, Forearm Flexors")
              let exercise41 = Exercises(title: "Barbell Rows",         musclesWorked: "Lats, Lower Traps, Erectors Secondary: Post Delt, Biceps, Forearm Flexors")
              let exercise42 = Exercises(title: "Cable Rows",           musclesWorked: "Lats, Lower Traps, Erectors Secondary: Post Delt, Biceps, Forearm Flexors")
              let exercise43 = Exercises(title: "Front Levers", musclesWorked:   "Lats, Triceps")
              let exercise44 = Exercises(title: "Pull Ups",     musclesWorked:  "Lats, Lower Traps\nSecondary: Post Delt, Bicep, Forearms")
              let exercise45 = Exercises(title: "Chin Ups",     musclesWorked: "Lats, Lower Traps Secondary: Post Delt, Forearms")
              let exercise46 = Exercises(title: "Pull Ins",     musclesWorked: "Lats")
              let exercise47 = Exercises(title: "Ring Rows",    musclesWorked: "Lats, Lower Traps Secondary: Post Delt, Biceps, Forearm Flexors")
             
          
              let exercise48 = Exercises(title: "Glutes", musclesWorked: "A single set towards Glutes")
              let exercise49 = Exercises(title: "Hip Thrust",                musclesWorked: "Glutes, Erectors Secondary: Hamstrings, Glute Medius")
              let exercise50 = Exercises(title: "Cable Pull Through",        musclesWorked: "Glutes Secondary: Hamstrings, Glute Medius")
              let exercise51 = Exercises(title: "Glute Hyperextension",      musclesWorked: "Glutes Secondary: Hamstrings, Glute Medius")
              let exercise52 = Exercises(title: "Kettlebell/Dumbbell Swing", musclesWorked: "Glutes Secondary: Hamstrings, Glute Medius")
              let exercise53 = Exercises(title: "Cable Kick Backs",          musclesWorked: "Glutes Secondary: Hamstrings, Glute Medius")
              let exercise54 = Exercises(title: "Bodyweight Hip Thrusts",    musclesWorked: "Glutes Secondary: Hamstrings")
              let exercise55 = Exercises(title: "Isolateral Hip Thrust",     musclesWorked: "Glutes, Glute Medius Secondary: Hamstrings")
              let exercise56 = Exercises(title: "Sprinter Lunge",            musclesWorked: "Glutes, Glute Medius Secondary: Hamstrings")
              let exercise57 = Exercises(title: "Banded RDL",                musclesWorked: "Glutes, Glute Medius, Hamstrings")
              let exercise58 = Exercises(title: "Marching Bridge",           musclesWorked: "Spinal Erector, Glutes")
             
             
               let exercise59 = Exercises(title: "Glute Medius",                  musclesWorked: "A single set towards Glute Medius")
               let exercise60 = Exercises(title: "Machine Abduction",             musclesWorked: "Glute Medius")
               let exercise61 = Exercises(title: "Ankle Brace Cable Abduction",             musclesWorked: "Glute Medius")
               let exercise62 = Exercises(title: "Banded Lateral Walkout",     musclesWorked: "Glute Medius")
               let exercise63 = Exercises(title: "Banded Abduction",           musclesWorked:  "Glute Medius")
               let exercise64 = Exercises(title: "Glute Side Plank",           musclesWorked: "Glute Medius Secondary: Obliques")
      
               let exercise65 = Exercises(title: "Hamstrings", musclesWorked: "A single set towards Hamstrings")
               let exercise66 = Exercises(title: "Deadlift",                 musclesWorked: "Hamstrings, Erectors, Upper Traps Secondary: Lats, Glutes, Lower Traps, Transverse")
               let exercise67 = Exercises(title: "Romanian Deadlift",        musclesWorked: "Hamstring, Secondary: Glutes, Erectors")
               let exercise68 = Exercises(title: "Deficit Deadlift",         musclesWorked: "Hamstring Secondary: Glutes, Erectors")
               let exercise69 = Exercises(title: "Hamstring Hyperextension", musclesWorked: "Hamstring Secondary: Glutes, Erectors")
               let exercise70 = Exercises(title: "Glute Ham Raise",                musclesWorked:  "Hamstrings Secondary: Glutes, Erectors")
               let exercise71 = Exercises(title: "Medicine Ball Curl",             musclesWorked: "Hamstring Secondary: Glutes, Erectors")
               let exercise72 = Exercises(title: "Single Leg Medicine Ball Curl",  musclesWorked: "Hamstring, Glute Medius Secondary: Glutes, Erectors")
               let exercise73 = Exercises(title: "Single Leg Romanian Deadlift",   musclesWorked: "Hamstring, Glute Medius Secondary: Glutes, Erectors")
              
            
               let exercise74 = Exercises(title: "Front Shoulder",          musclesWorked: "One set towards Anterior Deltoids ")
               let exercise75 = Exercises(title: "Arnolds",                 musclesWorked: "Anterior Delt Secondary: Triceps, Medial Delt")
               let exercise76 = Exercises(title: "Barbell Overhead Press",  musclesWorked: "Anterior Delt Secondary: Triceps")
               let exercise78 = Exercises(title: "Dumbbell OHP",            musclesWorked: "Anterior Deltoid Secondary: Triceps, Medial Delt")
               let exercise79 = Exercises(title: "Cable Stretch to OHP",    musclesWorked: "Anterior Deltoid Secondary: Triceps, Medial Delt")
               let exercise80 = Exercises(title: "Landmine Press",          musclesWorked: "Anterior Delt Secondary: Triceps, Medial Delt")
               let exercise81 = Exercises(title: "Machine Shoulder Press",  musclesWorked: "Anterior Delt Secondary: Triceps, Medial Delt")
               let exercise82 = Exercises(title: "Push Press",              musclesWorked: "Anterior Delt Secondary: Triceps, Medial Delt")
               let exercise83 = Exercises(title: "Pike Push-Up",      musclesWorked:   "Anterior Delt Secondary: Triceps, Medial Delt")
               let exercise84 = Exercises(title: "Handstand Push-Up", musclesWorked:  "Anterior Delt Secondary: Triceps, Medial Delt")
               let exercise85 = Exercises(title: "Cable Front Raise", musclesWorked: "Anterior Delt")
          
               
               let exercise86 = Exercises(title: "Lateral Shoulder",         musclesWorked: "A single set towards Lateral Deltoids")
               let exercise87 = Exercises(title: "Cable Lateral Raises",    musclesWorked: "Medial Deltoid")
               let exercise88 = Exercises(title: "Machine Lateral Raise",   musclesWorked: "Medial Deltoid")
               let exercise89 = Exercises(title: "Cheat Lateral Raise",     musclesWorked: "Medial Deltoid, Upper Trap")
               let exercise90 = Exercises(title: "Lateral Raise",           musclesWorked: "Medial Deltoid")
               let exercise91 = Exercises(title: "Delt Rotating Plank",     musclesWorked:   "Medial Detoid")
              
            
                 let exercise92 = Exercises(title: "Back Shoulder",               musclesWorked: "A single set towards Posterior Deltoids")
                 let exercise93 = Exercises(title: "Barbell/Dumbbell High Rows",  musclesWorked: "Posterior Deltoid, Lower Trap")
                 let exercise94 = Exercises(title: "Facepulls",                   musclesWorked: "Rotator Cuff, Lower Trap, Posterior Deltoid")
                 let exercise95 = Exercises(title: "W's",                         musclesWorked: "Posterior Deltoid, Rotator Cuff, Lower Traps")
                 let exercise96 = Exercises(title: "Reverse Pec Dec",             musclesWorked: "Lower Traps, Posterior Deltoid")
                 let exercise97 = Exercises(title: "Floor T's",          musclesWorked:   "Posterior Deltoid")
                 let exercise98 = Exercises(title: "Banded Pull Aparts", musclesWorked:  "Posterior Deltoid, Lower Traps")
                 let exercise99 = Exercises(title: "Ring Facepulls",     musclesWorked: "Posterior Deltoid, Rotator Cuff, Lower Traps")
                 let exercise100 = Exercises(title: "Angels of Death",    musclesWorked: "Spinal Erectors, Lower Traps, Posterior Deltoid")
                
                
                 let exercise101 = Exercises(title: "Rotator Cuff",                     musclesWorked: "A single set towards Rotator Cuffs")
                 let exercise102 = Exercises(title: "Cable External Rotation",          musclesWorked: "Rotator Cuff, Forearm Extensors")
                 let exercise103 = Exercises(title: "Bench Dumbbell External Rotation", musclesWorked: "Rotator Cuff, Forearm Extensors")
                 let exercise104 = Exercises(title: "W's",                              musclesWorked: "Rotator Cuff, Lower Trap, Posterior Deltoid")
                 let exercise105 = Exercises(title: "Dumbbell High Pull",               musclesWorked: "Rotator Cuff, Lower Trap, Posterior Deltoid")
                 let exercise106 = Exercises(title: "Facepulls",                        musclesWorked: "Rotator Cuff, Lower Trap, Posterior Deltoid")
                 let exercise107 = Exercises(title: "Ring Facepull",            musclesWorked:   "Rotator Cuff, Lower Trap, Posterior Deltoid")
                 let exercise108 = Exercises(title: "Banded External Rotation", musclesWorked:  "Rotator Cuff, Forearm Extensors")
                
                
                 let exercise109 = Exercises(title: "Triceps",                     musclesWorked: "One set towards Triceps")
                 let exercise110 = Exercises(title: "Narrow Dip",                  musclesWorked: "Triceps: All Heads, Chest")
                 let exercise111 = Exercises(title: "Incline Skullcrushers",       musclesWorked: "Triceps, Long Head")
                 let exercise112 = Exercises(title: "California Press",            musclesWorked: "Triceps: All heads Secondary: Chest, Anterior Deltoid")
                 let exercise113 = Exercises(title: "Cable Rope Pushdowns",        musclesWorked: "Triceps: Medial and Short Head")
                 let exercise114 = Exercises(title: "V Bar Pushdowns",             musclesWorked: "Triceps: Medial and Short Head")
                 let exercise115 = Exercises(title: "Close Grip Dumbbell Press",   musclesWorked: "Triceps Short and Medial Head Secondary: Chest, Anterior deltoid")
                 let exercise116 = Exercises(title: "Rope Overhead Extension",     musclesWorked: "Triceps: Long Head")
                 let exercise117 = Exercises(title: "Long Head Triceps Pushdowns", musclesWorked: "Triceps: Long Head")
                 let exercise118 = Exercises(title: "Triceps Kickback",            musclesWorked: "Triceps: Short Head")
                 let exercise119 = Exercises(title: "Triceps Extension",          musclesWorked: "Triceps: Short and Medial Head")
                 let exercise120 = Exercises(title: "Narrow Pushup",     musclesWorked:   "Triceps: Short and Medial Head, Chest Secondary: Anterior Delts")
                 let exercise121 = Exercises(title: "Ring Overhead Extension",    musclesWorked:  "Triceps: long head")
                 let exercise122 = Exercises(title: "Bench Dip",   musclesWorked: "Triceps: All heads")
              
                 let exercise123 = Exercises(title: "Quads",                            musclesWorked: "A single set towards Quads")
                 let exercise124 = Exercises(title: "Squats",                           musclesWorked: "Quads, Erectors Secondary: Glutes, Transverse")
                 let exercise125 = Exercises(title: "Cable Walkaways",                  musclesWorked: "Quads")
                 let exercise126 = Exercises(title: "Banded Leg Press",                 musclesWorked: "Quads, Glutes Medius")
                 let exercise127 = Exercises(title: "Leg Press",                        musclesWorked: "Quads")
                 let exercise128 = Exercises(title: "Traditional Lunge",                musclesWorked: "Quads Secondary: Glute Medius")
                 let exercise129 = Exercises(title: "Bulgarian Split Squat",            musclesWorked: "Quads Secondary: Glute Medius")
                 let exercise130 = Exercises(title: "Explosive Bulagarian Split Squat", musclesWorked: "Quads Secondary: Glute Medius")
                 let exercise131 = Exercises(title: "Pistol Squats",                    musclesWorked: "Quads, Glute Medius Secondary: Glutes")
                 let exercise132 = Exercises(title: "Side Lunge",                       musclesWorked: "Quads Secondary: Glute Medius")
                 let exercise133 = Exercises(title: "Banded Lunges",        musclesWorked:   "Quads")
                 let exercise134 = Exercises(title: "Bodyweight Squats",    musclesWorked:  "Quads Secondary: Glutes")
                 let exercise135 = Exercises(title: "Wall Sit",             musclesWorked: "Quads Secondary: Glutes")
                 let exercise136 = Exercises(title: "Lunges",               musclesWorked: "Quads Secondary: Glutes")
                
               
                let exercise137 = Exercises(title: "Abs",          musclesWorked: "A single set towards Abs")
                let exercise138 = Exercises(title: "Cable Crunch", musclesWorked: "Middle Abs Secondary: Transverse")
               
                let exercise139 = Exercises(title: "Machine Crunch", musclesWorked: "Middle Abs Secondary: Transverse")
               let exercise140 = Exercises(title: "Leg Raises",       musclesWorked:   "Abs Secondary: Transverse")
               let exercise141 = Exercises(title: "Ab Circles",       musclesWorked:  "Lower Abs, Obliques Secondary: Transverse")
               let exercise142 = Exercises(title: "Reverse Crunches", musclesWorked: "Lower Abs Secondary: Transverse")
               let exercise143 = Exercises(title: "Pulse Up",         musclesWorked: "Lower Abs Secondary: Transverse")
               let exercise144 = Exercises(title: "Band Crunch",      musclesWorked: "Middle Abs Secondary: Transverse")
               let exercise145 = Exercises(title: "V-Up",             musclesWorked: "Middle Abs Secondary: Transverse")

              
                  let exercise146 = Exercises(title: "Obliques",                      musclesWorked: "A single set towards Obliques")
                  let exercise147 = Exercises(title: "Neutral Wood Choppers",         musclesWorked: "Mid Obliques Secondary: Transverse")
                  let exercise148 = Exercises(title: "Low to High Wood Choppers",     musclesWorked: "Upper and lower Obliques Secondary: Transverse")
                  let exercise149 = Exercises(title: "High to Low Wood Choppers",     musclesWorked: "Upper and lower Obliques Secondary: Transverse")
                  let exercise150 = Exercises(title: "Twisting Leg Raise",    musclesWorked:   "Obliques Secondary: Transverse, Lower Ab")
                  let exercise151 = Exercises(title: "Leg Raise Scissors",    musclesWorked:  "Obliques, Abs Secondary: Transverse")
                  let exercise152 = Exercises(title: "Elbow to Knee Tucks",   musclesWorked: "Obliques Secondary: Transverse, Middle ab")
                  let exercise153 = Exercises(title: "Banded/Cable Step Out", musclesWorked: "Obliques Secondary: Transverse")
                  let exercise154 = Exercises(title: "Rotating Plank",        musclesWorked: "Obliques Secondary: Transverse, Abs")
                  let exercise155 = Exercises(title: "Elbow to Knee Plank",   musclesWorked: "Obliques Secondary: Transverse, Abs")
                  let exercise156 = Exercises(title: "Twisting Pulse Up",     musclesWorked: "Obliques Secondary: Transverse, Abs")
                  let exercise157 = Exercises(title: "X-Crunch",              musclesWorked: "Obliques Secondary: Transverse, Abs")
                 
                 
                  let exercise158 = Exercises(title: "Serratus Anterior",                musclesWorked: "One set towards Serratus")
                  let exercise159 = Exercises(title: "Protracted Cable Crunch", musclesWorked: "Serratus Anterior, Abs Secondary: Transverse")
                  let exercise160 = Exercises(title: "Banded/Cable Punches",   musclesWorked: "Serratus Anterior")
                  let exercise161 = Exercises(title: "Plank Protraction",     musclesWorked:   "Serratus Anterior")
                  let exercise162 = Exercises(title: "Protracted Rollout",    musclesWorked:  "Serratus Anterior, Abs Secondary: Transverse")
                
                  let exercise163 = Exercises(title: "Transverse Ab",                   musclesWorked: "A single set towards Transverse Ab")
                  let exercise164 = Exercises(title: "Banded/Cable Resisted Rotation",  musclesWorked: "Transverse, Obliques")
                  let exercise165 = Exercises(title: "Vacuums",     musclesWorked:   "Transverse Abdominus")
                  
                 
             
                 let exercise166 = Exercises(title: "Calves",                           musclesWorked: "A single set towards Calves")
                 let exercise167 = Exercises(title: "Machine Standing Calf Raise",      musclesWorked: "Calves")
                 let exercise168 = Exercises(title: "Straight Leg Machine Calf Raise",  musclesWorked: "Calves")
                 let exercise169 = Exercises(title: "Seated Calf Raise",                musclesWorked: "Calves")
                 let exercise170 = Exercises(title: "Donkey Calf Raise",                musclesWorked: "Calves")
                 let exercise171 = Exercises(title: "Dumbbell/Plated Calf Raise",       musclesWorked: "Calves")
            //out of order
                 let exercise232 = Exercises(title: "Bodyweight Calf Raises",     musclesWorked:   "Calves")
            
             
                 let exercise172 = Exercises(title: "Neck",                    musclesWorked: "A single set towards Neck")
                 let exercise173 = Exercises(title: "Plate Curl",              musclesWorked: "Neck Flexion")
                 let exercise174 = Exercises(title: "Neck Harness Curl",       musclesWorked: "Neck Flexion")
                 let exercise175 = Exercises(title: "Plated Neck Extension",   musclesWorked: "Neck Extension")
                 let exercise176 = Exercises(title: "Harness Lateral Flexion", musclesWorked: "Lateral Flexion")
                 let exercise177 = Exercises(title: "Suspended Neck Rotation", musclesWorked: "Neck Flexion and Rotation")
                 let exercise178 = Exercises(title: "Neck Flexion",            musclesWorked: "Lateral and forward Flexion")
                 let exercise179 = Exercises(title: "Head Floats",     musclesWorked:   "Neck Flexion, Lateral Flexion or Extension")
                
                
                 let exercise180 = Exercises(title: "Forearm Extensors",                 musclesWorked: "One set towards Forearm Extensors")
                 let exercise181 = Exercises(title: "Standing Barbell Wrist Extension", musclesWorked: "Forearm Extensors")
                 let exercise182 = Exercises(title: "Barbell Extension Rolls",          musclesWorked: "Forearm Extensors")
                 let exercise183 = Exercises(title: "Reverse Curls",                    musclesWorked: "Forearm Extensors")
                 let exercise184 = Exercises(title: "Banded Wrist Extension",    musclesWorked:  "Forearm Extensors")

              
                 let exercise185 = Exercises(title: "Ulnar Forearm",          musclesWorked: "A single set towards Ulnar Forearm")
                 let exercise186 = Exercises(title: "Rope Ulnar Deviation",   musclesWorked: "Ulnar Forearm")
                 let exercise187 = Exercises(title: "Banded Ulnar Deviation", musclesWorked: "Ulnar Forearm")
                
                
                
                  let exercise188 = Exercises(title: "Forearm Flexors",    musclesWorked: "A single set towards Forearm Flexors")
                  let exercise189 = Exercises(title: "Prone Wrist Curls",  musclesWorked: "Forearm Flexors")
                  let exercise190 = Exercises(title: "Wrist Flexed Curls", musclesWorked: "Biceps, Forearm Flexors")
                  let exercise191 = Exercises(title: "Banded Wrist Curls", musclesWorked: "Forearm Flexors")
                 
              
         
                  let exercise192 = Exercises(title: "Radial Forearm",             musclesWorked: "A single set towards Radial Forearm")
                  let exercise193 = Exercises(title: "Rope Radial Deviation",      musclesWorked: "Radial Forearm")
                  let exercise194 = Exercises(title: "Hammer/Crossbody Curls",     musclesWorked: "Biceps, Brachialis, Radial Forearm")
                  let exercise195 = Exercises(title: "Re-racking your plates",     musclesWorked: "Radial Forearm, put ur plates back please")
                  let exercise196 = Exercises(title: "Banded Radial Deviation",    musclesWorked: "Radial Forearm")

              
                  let exercise197 = Exercises(title: "Spinal Erectors",            musclesWorked: "One set towards SpinalErectors")
                  let exercise198 = Exercises(title: "Hyperextension",             musclesWorked: "Spinal Erector")
                  let exercise199 = Exercises(title: "Machine Erector Extension",  musclesWorked: "Spinal Erector")
                  let exercise200 = Exercises(title: "Deadlift",                   musclesWorked: "Spinal Erector Secondary: Glutes, Hamstrings")
                  let exercise201 = Exercises(title: "Squats",                     musclesWorked: "Quads, Spinal Erector Secondary: Glutes, Hamstrings")
                  let exercise202 = Exercises(title: "Frog Pumps",                 musclesWorked: "Spinal Erectors, Glute Medius")
                  let exercise203 = Exercises(title: "Angels of Death",            musclesWorked: "Spinal Erectors, Lower Traps, Post Delt")
                  let exercise204 = Exercises(title: "Marching Bridge",            musclesWorked: "Spinal Erector, Glutes")
                  let exercise205 = Exercises(title: "Reverse Hyperextension",     musclesWorked: "Spinal Erector Secondary: Glutes, Hamstring")
                  
                  let exercise206 = Exercises(title: "Upper Traps",      musclesWorked: "A single set towards Upper Traps")
                  let exercise207 = Exercises(title: "Dumbell Shrugs",   musclesWorked: "Upper Trap")
                  let exercise208 = Exercises(title: "Trap Bar Shrugs",  musclesWorked: "Upper Trap")
                  let exercise209 = Exercises(title: "Farmer Walk",     musclesWorked: "Upper Trap")
                  let exercise210 = Exercises(title: "Trap Pushaway",      musclesWorked:   "Upper Traps")
                  let exercise211 = Exercises(title: "Inverted Y",         musclesWorked:  "Upper and Lower Traps")
                 
           
                    let exercise212 = Exercises(title: "Lower Traps",      musclesWorked: "A single set towards Lower Traps")
                    let exercise213 = Exercises(title: "Y Raise",          musclesWorked: "Lower Traps")
                    let exercise214 = Exercises(title: "Reverse Pec Deck", musclesWorked: "Lower Traps, Post Delt")
                    let exercise215 = Exercises(title: "W's",              musclesWorked: "Rotator Cuff, Lower Trap, Post Delt")
                    let exercise216 = Exercises(title: "Facepulls",        musclesWorked: "Rotator Cuff, Lower Trap, Post Delt")
                    let exercise217 = Exercises(title: "Ring Facepull",                     musclesWorked:   "Rotator Cuff, Lower Trap, Posterior Deltoid")
                    let exercise218 = Exercises(title: "Hanging/Cable Scapular Retraction",        musclesWorked:  "Lower Traps")
                    let exercise219 = Exercises(title: "Inverted Y",                         musclesWorked: "Upper and Lower Traps")
                    let exercise220 = Exercises(title: "Angels of Death",                    musclesWorked: "Spinal Erectors, Lower Traps, Post Delt")
                    let exercise221 = Exercises(title: "Floor/Dip Bar Scapular Depression", musclesWorked: "Lower Traps")
                   
                 
           let exercise222 = Exercises(title: "Lower Traps",      musclesWorked: "A single set towards Lower Traps")
           let exercise223 = Exercises(title: "Y Raise",          musclesWorked: "Lower Traps")
           let exercise224 = Exercises(title: "Reverse Pec Deck", musclesWorked: "Lower Traps, Post Delt")
           let exercise225 = Exercises(title: "W's",              musclesWorked: "Rotator Cuff, Lower Trap, Post Delt")
           let exercise226 = Exercises(title: "Facepulls",        musclesWorked: "Rotator Cuff, Lower Trap, Post Delt")
           let exercise227 = Exercises(title: "Ring Facepull",                     musclesWorked:   "Rotator Cuff, Lower Trap, Posterior Deltoid")
           let exercise228 = Exercises(title: "Hanging/Cable Scapular Retraction",        musclesWorked:  "Lower Traps")
           let exercise229 = Exercises(title: "Inverted Y",                         musclesWorked: "Upper and Lower Traps")
           let exercise230 = Exercises(title: "Angels of Death",                    musclesWorked: "Spinal Erectors, Lower Traps, Post Delt")
           let exercise231 = Exercises(title: "Floor/Dip Bar Scapular Depression", musclesWorked: "Lower Traps")
          
           return [exercise0, exercise1, exercise2, exercise3, exercise4, exercise5, exercise6, exercise7, exercise8, exercise9, exercise10, exercise11, exercise12, exercise13, exercise14, exercise15, exercise16, exercise17, exercise18, exercise19, exercise20, exercise21, exercise22, exercise23, exercise24, exercise25, exercise26, exercise27, exercise28, exercise29, exercise30, exercise31, exercise32, exercise33, exercise34, exercise35, exercise36, exercise37, exercise38, exercise39, exercise40, exercise41, exercise42, exercise43, exercise44, exercise45, exercise46, exercise47, exercise48, exercise49, exercise50, exercise51, exercise52, exercise53, exercise54, exercise55, exercise56, exercise57, exercise58, exercise59, exercise60, exercise61, exercise62, exercise63, exercise64, exercise65, exercise66, exercise67, exercise68, exercise69, exercise70, exercise71, exercise72, exercise73, exercise74, exercise75, exercise76,  exercise78, exercise79, exercise80, exercise81, exercise82, exercise83, exercise84, exercise85, exercise86, exercise87, exercise88, exercise89, exercise90, exercise91, exercise92, exercise93, exercise94, exercise95, exercise96, exercise97, exercise98, exercise99, exercise100, exercise101, exercise102, exercise103, exercise104, exercise105, exercise106, exercise107, exercise108, exercise109, exercise110, exercise111, exercise112, exercise113, exercise114, exercise115, exercise116, exercise117, exercise118, exercise119, exercise120, exercise121, exercise122, exercise123, exercise124, exercise125, exercise126, exercise127, exercise128, exercise129, exercise130, exercise131, exercise132, exercise133, exercise134, exercise135, exercise136, exercise137, exercise138, exercise139, exercise140, exercise141, exercise142, exercise143, exercise144, exercise145, exercise146, exercise147, exercise148, exercise149, exercise150, exercise151, exercise152, exercise153, exercise154, exercise155, exercise156, exercise157, exercise158, exercise159, exercise160, exercise161, exercise162, exercise163, exercise164, exercise165, exercise166, exercise167, exercise168, exercise169, exercise170, exercise171, exercise172, exercise173, exercise174, exercise175, exercise176, exercise177, exercise178, exercise179, exercise180, exercise181, exercise182, exercise183, exercise184, exercise185, exercise186, exercise187, exercise188, exercise189, exercise190, exercise191, exercise192, exercise193, exercise194, exercise195, exercise196, exercise197, exercise198, exercise199, exercise200, exercise201, exercise202, exercise203, exercise204, exercise205, exercise206, exercise207, exercise208, exercise209, exercise210, exercise211, exercise212, exercise213, exercise214, exercise215, exercise216, exercise217, exercise218, exercise219, exercise220, exercise221, exercise222, exercise223, exercise224, exercise225, exercise226, exercise227, exercise228, exercise229, exercise230, exercise231,exercise232]
       }
          
            
       //-----------------------------------------------------------END SHENANIGANS----------------------------------------------------
       
       
    
    func goToVolumeTracker(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let dashBoard = storyboard.instantiateViewController(identifier: "volumeTracker")
        self.show(dashBoard, sender: self)
        self.dismiss(animated: true, completion: nil)
    }
    
    func goToFormVideo(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let dashBoard = storyboard.instantiateViewController(identifier: "formVideo")
        self.show(dashBoard, sender: self)
        self.dismiss(animated: true, completion: nil)
          }
    
   
}

extension allExercisesViewController: ExercisesTableViewCellDelegate {
func didTapAddSet(title: String) {

    //ADD CODE TO OPEN ADD SET WINDOW FOR PROPER EXERCISE
    //Each else bracket identifies the exercise that was click and stores its corersponding volume into variable in the format musclegroupTally. I tried abstracting a function but failed sorry future self/ coders
    // TODO
    let chestPressList = ["Bench Press", "Dumbell Bench Press", "Machine Chest Press", "Neutral Cable Press", "Push-Ups"]
    let inclineChestPressList = ["Incline Bench Press", "Incline Dumbell Bench Press", "Incline Machine Chest Press", "Incline Cable Press"]
    let declineChestPressList = ["Decline Bench Press", "Decline Dumbell Bench Press",  "Decline Cable Press"]
    let chestIsolation = ["Neutral Crossover Flyes", "Incline Crossover Flyes", "Decline Crossover Flyes", "Chest", "Banded Fly"]
    let neckIsolation = ["Neck", "Plate Curl", "Neck Harness Curl", "Plated Neck Extension", "Harness Lateral Flexion", "Suspended Neck Rotation", "Neck Flexion", "Head Floats"]
    //Upper Traps
    let upperTrapList = [ "Dumbell Shrugs", "Trap Bar Shrugs", "Farmer Walk", "Trap Pushaway", "Upper Traps"]
    //Lower Traps
    let lowerTrapIsolation = ["Y Raise", "Floor/Dip Bar Scapular Depression", "Hanging/Cable Scapular Retraction", "Lower Traps"]
    let facePullList = ["Facepulls", "Ring Facepull", "W's"]
    //Post Delt
    let postDeltIsolation = ["Back Shoulder", "Floor T's", "Dumbbell High Pull"]
    let postDeltlowerTrapList = ["Reverse Pec Deck", "Barbell/Dumbbell High Rows", "Banded Pull Aparts"]
    //Lateral Delt
    let medialDeltisolation = [ "Lateral Shoulder", "Cable Lateral Raises", "Machine Lateral Raise", "Cheat Lateral Raise", "Lateral Raise", "Delt Rotating Plank", "Banded Lateral Raise"]
    //Ant Delt
    let anteriorDeltIsolation = ["Front Shoulder", "Cable Front Raise"]
    let oHPList = ["Arnolds", "Barbell Overhead Press", "Dumbbell OHP", "Cable Stretch to OHP", "Landmine Press", "Machine Shoulder Press", "Push Press", "Pike Pushup", "Handstand Pushup", "Pike Push-Up", "Handstand Push-Up"]
    //Rotator Cuff
    let rotatorCuffExtensorList = ["Cable External Rotation", "Bench Dumbbell External Rotation", "Banded External Rotation"]
    //Triceps TODO Narrow Dip
    let triceps = ["Triceps", "Incline Skullcrushers", "Cable Rope Pushdowns", "V Bar Pushdowns", "Rope Overhead Extension", "Long Head Triceps Pushdowns", "Triceps Kickback", "Triceps Extension", "Ring Overhead Extension", "Bench Dip"]
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
    let latLowerTrapList = ["Cable Pulldown", "High Pulley Row", "Chest Supported Rows", "Pull Ups", "Ring Rows", "Australian Pull Ups"]
    let latLowerTrapErectorList = ["Barbell Rows", "Cable Rows"]
    //Erectors
    let erectorsIsolation = ["Spinal Erectors", "Hyperextension", "Machine Erector Extension"]
    //Glutes TODO
    let gluteGlutemediusSHamstringsList = ["Isolateral Hip Thrust", "Sprinter Lunge"]
    let glutesSHamstringsGlutemediusList = ["Cable Pull Through", "Glute Hyperextension", "Kettlebell/Dumbbell Swing", "Cable Kick Backs"]
    //GluteMedius TODO Glute side plank
    let gluteMediusList = ["Glute Medius", "Machine Abduction", "Banded Lateral Walkout", "Banded Abduction", "Ankle Brace Cable Abduction"]
    //Hamstrings TODO hamstrings
    let hamstringsSGlutesErectorsList = ["Romanian Deadlift", "Deficit Deadlift", "Hamstring Hyperextension", "Glute Ham Raise", "Medicine Ball Curl"]
    let isoHamstringsSGlutesErectorsList = ["Single Leg Medicine Ball Curl", "Single Leg Romanian Deadlift"]
    //CAlves
    let calvesList = ["Calves", "Machine Standing Calf Raise", "Straight Leg Machine Calf Raise", "Seated Calf Raise", "Donkey Calf Raise", "Dumbbell/Plated Calf Raise", "Bodyweight Calf Raises"]
    //Bicep  TODO hammer Curls
    let curlsList = ["Dumbbell Curls", "Narrow Dumbbell Curls", "Wide Dumbbell Curls", "Barbell Curls", "Narrow Barbell Curls", "Wide Barbell Curls", "Narrow EZ Bar Curls", "Wide EZ Bar Curls", "Preacher Curls", "Cable/Dumbbell Spider Curls", "Banded Curls", "Cross Body Hammer Curls", "Ring Curls"]
    let bicepIsolation = ["Biceps", "Biceps Isometric", "Limp Wrist Curls"]
    //Serratus
    let serratusIsolationList = ["Serratus Anterior", "Plank Protraction", "Banded/Cable Punches"]
    let serratusAbsSTransverseList = ["Protracted Rollout", "Protracted Cable Crunch", "Machine Crunch"]
    //Abs
    let absTransverseList = ["Abs", "Leg Raises", "Reverse Crunches", "Pulse Up", "Cable Crunch", "Band Crunch", "V-Up", "Ab Rollout"]
    //Obliques
    let obliquesTransAbList = ["Neutral Wood Choppers", "Low to High Wood Choppers", "High to Low Wood Choppers", "Banded/Cable Step Out", "Banded/Cable Resisted Rotation"]
    let obliquesTransAbsSAb = ["Twisting Leg Raise", "Elbow to Knee Tucks", "Rotating Plank", "Elbow to Knee Plank", "Twisting Pulse Up", "X-Crunch"]
    //Transverse Ab
    let transverseAbList = ["Transverse Ab", "Vacuums"]
    //Quads
    let quadsList = ["Quads", "Cable Walkaways", "Leg Press", "Wall Sit", "Banded Lunges"]
    let quadsGlutemediusList = ["Banded Leg Press", "Side Lunge"]
    let quadsSGlutemediusList = ["Explosive Bulgarian Split Squat", "Traditional Lunge", "Bulgarian Split Squat"]
    
    
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
                          self.defaults.set(chestTallyFloat, forKey: Save.chestTally)
                          self.goToVolumeTracker()
                            
                            
                          }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
                        }))
                        
                          // 4. Present the alert.
                          self.present(alert, animated: true, completion: nil)
        

       
    }else if (neckIsolation.contains(title)){
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
                                  let neckTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                                  var neckTallyFloat:Float? = Float(neckTallyString?.text ?? "0")
                                  neckTallyFloat = (neckTallyFloat ?? 0)
                                  self.defaults.set(neckTallyFloat, forKey: Save.neckTally)
                                  self.goToVolumeTracker()
                                    
                                    
                                  }))
                                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                                    action in
                                // Called when user taps outside
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
                                 self.defaults.set(chestTallyFloat, forKey: Save.chestTally)
                                 var tricepTallyFloat:Float? = Float(chestTallyString?.text ?? "0")
                                 tricepTallyFloat = (chestTallyFloat ?? 0) / 2
                                 self.defaults.set(tricepTallyFloat, forKey: Save.tricepsTally)
                                 var frontShoulderTallyFloat:Float? = Float(chestTallyString?.text ?? "0")
                                 frontShoulderTallyFloat = (chestTallyFloat ?? 0) / 2
                                 self.defaults.set(frontShoulderTallyFloat, forKey: Save.frontShoulderTally)
                                    
                                 self.goToVolumeTracker()
                                 }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
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
                                 self.defaults.set(chestTallyFloat, forKey: Save.chestTally)
                                 var tricepTallyFloat:Float? = Float(chestTallyString?.text ?? "0")
                                 tricepTallyFloat = (chestTallyFloat ?? 0) / 2
                                 self.defaults.set(tricepTallyFloat, forKey: Save.tricepsTally)
                                    let frontShoulderTallyFloat:Float? = Float(chestTallyString?.text ?? "0")
                                 self.defaults.set(frontShoulderTallyFloat, forKey: Save.frontShoulderTally)
                               
                                 self.goToVolumeTracker()
                                 }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
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
                                 self.defaults.set(chestTallyFloat, forKey: Save.chestTally)
                                 var tricepTallyFloat:Float? = Float(chestTallyString?.text ?? "0")
                                 tricepTallyFloat = (chestTallyFloat ?? 0) / 2
                                 self.defaults.set(tricepTallyFloat, forKey: Save.tricepsTally)
                               
                                 self.goToVolumeTracker()
                                 }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
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
                                self.defaults.set(upperTrapsTallyFloat, forKey: Save.upperTrapsTally)
                            
                                self.goToVolumeTracker()
                                }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
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
                                self.defaults.set(lowerTrapsTallyFloat, forKey: Save.lowerTrapsTally)
                                
                                self.goToVolumeTracker()
                                }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
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
                                    Save.rotatorCuffTally)
                                let backShoulderTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                                var backShoulderTallyFloat:Float? = Float(backShoulderTallyString?.text ?? "0")
                                backShoulderTallyFloat = (backShoulderTallyFloat ?? 0)
                                self.defaults.set(backShoulderTallyFloat, forKey:
                                    Save.backShoulderTally)
                                let lowerTrapsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                                var lowerTrapsTallyFloat:Float? = Float(lowerTrapsTallyString?.text ?? "0")
                                lowerTrapsTallyFloat = (lowerTrapsTallyFloat ?? 0)
                                self.defaults.set(lowerTrapsTallyFloat, forKey:
                                    Save.lowerTrapsTally)
                                            
                                self.goToVolumeTracker()
                                }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
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
                                self.defaults.set(backShoulderTallyFloat, forKey: Save.backShoulderTally)
                                                                            
                                self.goToVolumeTracker()
                                }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
                        }))
                                // 4. Present the alert.
                                self.present(alert, animated: true, completion: nil)
                           
        
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
                                self.defaults.set(backShoulderTallyFloat, forKey: Save.backShoulderTally)
                                let lowerTrapTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                                var lowerTrapTallyFloat:Float? = Float(lowerTrapTallyString?.text ?? "0")
                                lowerTrapTallyFloat = (lowerTrapTallyFloat ?? 0)
                                self.defaults.set(lowerTrapTallyFloat, forKey: Save.lowerTrapsTally)
                                
                                                                               
                                self.goToVolumeTracker()
                                }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
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
                                 self.defaults.set(lateralShoulderTallyFloat, forKey: Save.lateralShoulderTally)
                                                                                
                                 self.goToVolumeTracker()
                                 }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
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
                                       self.defaults.set(frontShoulderTallyFloat, forKey: Save.frontShoulderTally)
                                                                                      
                                       self.goToVolumeTracker()
                                       }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
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
                                Save.frontShoulderTally)
                            let tricepsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                            var tricepsTallyFloat:Float? = Float(tricepsTallyString?.text ?? "0")
                            tricepsTallyFloat = (tricepsTallyFloat ?? 0)
                            self.defaults.set(tricepsTallyFloat, forKey:
                                Save.tricepsTally)
                            let lateralShoulderTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                            var lateralShoulderTallyFloat:Float? = Float(lateralShoulderTallyString?.text ?? "0")
                            lateralShoulderTallyFloat = (lateralShoulderTallyFloat ?? 0)
                            self.defaults.set(lateralShoulderTallyFloat, forKey:
                                Save.lateralShoulderTally)
                                                                           
                            self.goToVolumeTracker()
                            }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
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
                            self.defaults.set(rotatorCuffTallyFloat, forKey: Save.rotatorCuffTally)
                            let forearmExtensorsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                            var forearmExtensorsTallyFloat:Float? = Float(forearmExtensorsTallyString?.text ?? "0")
                            forearmExtensorsTallyFloat = (forearmExtensorsTallyFloat ?? 0)
                            self.defaults.set(forearmExtensorsTallyFloat, forKey: Save.forearmExtensorsTally)
                                
                            self.goToVolumeTracker()
                            }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
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
            self.defaults.set(tricepsTallyFloat, forKey: Save.tricepsTally)
            
            self.goToVolumeTracker()
        }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
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
                            self.defaults.set(tricepsTallyFloat, forKey: Save.tricepsTally)
                                
                            let chestTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                            var chestTallyFloat:Float? = Float(chestTallyString?.text ?? "0")
                            chestTallyFloat = (chestTallyFloat ?? 0)
                            chestTallyFloat = (chestTallyFloat ?? 0) / 2
                            self.defaults.set(chestTallyFloat, forKey: Save.chestTally)
                                
                            let frontShoulderTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                            var frontShoulderTallyFloat:Float? = Float(frontShoulderTallyString?.text ?? "0")
                            frontShoulderTallyFloat = (frontShoulderTallyFloat ?? 0)
                                frontShoulderTallyFloat = (frontShoulderTallyFloat ?? 0) / 2
                            self.defaults.set(frontShoulderTallyFloat, forKey: Save.frontShoulderTally)
                                                                           
                            self.goToVolumeTracker()
                            }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
                        }))
                            // 4. Present the alert.
                            self.present(alert, animated: true, completion: nil)
        
     } else if (calvesList.contains(title)){
                            
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
                            let calvesTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                            var calvesTallyFloat:Float? = Float(calvesTallyString?.text ?? "0")
                            calvesTallyFloat = (calvesTallyFloat ?? 0)
                            self.defaults.set(calvesTallyFloat, forKey: Save.calvesTally)
                                                                           
                            self.goToVolumeTracker()
                            }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
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
                            self.defaults.set(ulnarForearmTallyFloat, forKey: Save.ulnarForearmTally)
                                                                           
                            self.goToVolumeTracker()
                            }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
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
                            self.defaults.set(forearmExtensorsTallyFloat, forKey: Save.forearmExtensorsTally)
                                                                           
                            self.goToVolumeTracker()
                            }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
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
                            self.defaults.set(forearmFlexorsTallyFloat, forKey: Save.forearmFlexorsTally)
                                                                           
                            self.goToVolumeTracker()
                            }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
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
                            self.defaults.set(radialForearmTallyFloat, forKey: Save.radialForearmTally)
                                                                       
                        self.goToVolumeTracker()
                        }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
                        }))
                        // 4. Present the alert.
                        self.present(alert, animated: true, completion: nil)

     } else if (latsIsolation.contains(title)){
        
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
                        let latsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                        var latsTallyFloat:Float? = Float(latsTallyString?.text ?? "0")
                        latsTallyFloat = (latsTallyFloat ?? 0)
                        self.defaults.set(latsTallyFloat, forKey: Save.latsTally)
                                                                       
                        self.goToVolumeTracker()
                        }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
                        }))
                        // 4. Present the alert.
                        self.present(alert, animated: true, completion: nil)
     } else if (latTricepsList.contains(title)){
        
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
                        let latsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                        var latsTallyFloat:Float? = Float(latsTallyString?.text ?? "0")
                        latsTallyFloat = (latsTallyFloat ?? 0)
                        self.defaults.set(latsTallyFloat, forKey: Save.latsTally)
                            
                        let tricepsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                        var tricepsTallyFloat:Float? = Float(tricepsTallyString?.text ?? "0")
                                              tricepsTallyFloat = (tricepsTallyFloat ?? 0)
                        self.defaults.set(tricepsTallyFloat, forKey: Save.tricepsTally)
                                                                       
                        self.goToVolumeTracker()
                        }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
                        }))
                        // 4. Present the alert.
                        self.present(alert, animated: true, completion: nil)
                        
     }  else if (latLowerTrapList.contains(title)){
        
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
                            
                        let latsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                        var latsTallyFloat:Float? = Float(latsTallyString?.text ?? "0")
                        latsTallyFloat = (latsTallyFloat ?? 0)
                        self.defaults.set(latsTallyFloat, forKey: Save.latsTally)
                            
                        let lowerTrapsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                        var lowerTrapsTallyFloat:Float? = Float(lowerTrapsTallyString?.text ?? "0")
                        lowerTrapsTallyFloat = (lowerTrapsTallyFloat ?? 0)
                        self.defaults.set(lowerTrapsTallyFloat, forKey: Save.lowerTrapsTally)
                            
                        let backShoulderTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                        var backShoulderTallyFloat:Float? = Float(backShoulderTallyString?.text ?? "0")
                        backShoulderTallyFloat = (backShoulderTallyFloat ?? 0) / 2
                        self.defaults.set(backShoulderTallyFloat, forKey: Save.backShoulderTally)
                            
                        let bicepsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                        var bicepsTallyFloat:Float? = Float(bicepsTallyString?.text ?? "0")
                        bicepsTallyFloat = (bicepsTallyFloat ?? 0) / 2
                        self.defaults.set(bicepsTallyFloat, forKey: Save.bicepsTally)
                            
                        let forearmFlexorsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                        var forearmFlexorsTallyFloat:Float? = Float(forearmFlexorsTallyString?.text ?? "0")
                        forearmFlexorsTallyFloat = (forearmFlexorsTallyFloat ?? 0) / 2
                        self.defaults.set(forearmFlexorsTallyFloat, forKey: Save.forearmFlexorsTally)
                                                                       
                        self.goToVolumeTracker()
                        }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
                        }))
                        // 4. Present the alert.
                        self.present(alert, animated: true, completion: nil)
        
     }  else if (latLowerTrapErectorList.contains(title)){
        
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
                        let latsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                        var latsTallyFloat:Float? = Float(latsTallyString?.text ?? "0")
                        latsTallyFloat = (latsTallyFloat ?? 0)
                        self.defaults.set(latsTallyFloat, forKey: Save.latsTally)
                            
                        let erectorsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                        var erectorsTallyFloat:Float? = Float(erectorsTallyString?.text ?? "0")
                        erectorsTallyFloat = (erectorsTallyFloat ?? 0)
                        self.defaults.set(erectorsTallyFloat, forKey: Save.spinalErectorsTally)
                            
                        let lowerTrapsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                        var lowerTrapsTallyFloat:Float? = Float(lowerTrapsTallyString?.text ?? "0")
                        lowerTrapsTallyFloat = (lowerTrapsTallyFloat ?? 0)
                        self.defaults.set(lowerTrapsTallyFloat, forKey: Save.lowerTrapsTally)
                            
                        let backShoulderTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                        var backShoulderTallyFloat:Float? = Float(backShoulderTallyString?.text ?? "0")
                        backShoulderTallyFloat = (backShoulderTallyFloat ?? 0) / 2
                        self.defaults.set(backShoulderTallyFloat, forKey: Save.backShoulderTally)
                            
                        let bicepsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                        var bicepsTallyFloat:Float? = Float(bicepsTallyString?.text ?? "0")
                        bicepsTallyFloat = (bicepsTallyFloat ?? 0) / 2
                        self.defaults.set(bicepsTallyFloat, forKey: Save.bicepsTally)
                            
                        let forearmFlexorsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                        var forearmFlexorsTallyFloat:Float? = Float(forearmFlexorsTallyString?.text ?? "0")
                        forearmFlexorsTallyFloat = (forearmFlexorsTallyFloat ?? 0) / 2
                        self.defaults.set(forearmFlexorsTallyFloat, forKey: Save.forearmFlexorsTally)
                                                                       
                        self.goToVolumeTracker()
                        }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
                        }))
                        // 4. Present the alert.
                        self.present(alert, animated: true, completion: nil)
    
     } else if (erectorsIsolation.contains(title)){
        
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
                        let erectorsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                        var erectorsTallyFloat:Float? = Float(erectorsTallyString?.text ?? "0")
                        erectorsTallyFloat = (erectorsTallyFloat ?? 0)
                        self.defaults.set(erectorsTallyFloat, forKey: Save.spinalErectorsTally)
                                                                       
                        self.goToVolumeTracker()
                        }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
                        }))
                        // 4. Present the alert.
                        self.present(alert, animated: true, completion: nil)
     } else if (gluteGlutemediusSHamstringsList.contains(title)){
        
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
                        let glutesTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                        var glutesTallyFloat:Float? = Float(glutesTallyString?.text ?? "0")
                        glutesTallyFloat = (glutesTallyFloat ?? 0)
                        self.defaults.set(glutesTallyFloat, forKey: Save.glutesTally)
                            
                        let gluteMediusTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                        var gluteMediusTallyFloat:Float? = Float(gluteMediusTallyString?.text ?? "0")
                        gluteMediusTallyFloat = (gluteMediusTallyFloat ?? 0)
                        self.defaults.set(gluteMediusTallyFloat, forKey: Save.gluteMediusTally)
                            
                        let hamstringsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                        var hamstringsTallyFloat:Float? = Float(hamstringsTallyString?.text ?? "0")
                        hamstringsTallyFloat = (hamstringsTallyFloat ?? 0) / 2
                        self.defaults.set(hamstringsTallyFloat, forKey: Save.hamstringsTally)
                                                                       
                        self.goToVolumeTracker()
                        }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
                        }))
                        // 4. Present the alert.
                        self.present(alert, animated: true, completion: nil)
        
     } else if (glutesSHamstringsGlutemediusList.contains(title)){
        
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
        let glutesTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
        var glutesTallyFloat:Float? = Float(glutesTallyString?.text ?? "0")
        glutesTallyFloat = (glutesTallyFloat ?? 0)
        self.defaults.set(glutesTallyFloat, forKey: Save.glutesTally)
            
        let gluteMediusTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
        var gluteMediusTallyFloat:Float? = Float(gluteMediusTallyString?.text ?? "0")
        gluteMediusTallyFloat = (gluteMediusTallyFloat ?? 0) / 2
        self.defaults.set(gluteMediusTallyFloat, forKey: Save.gluteMediusTally)
            
        let hamstringsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
        var hamstringsTallyFloat:Float? = Float(hamstringsTallyString?.text ?? "0")
        hamstringsTallyFloat = (hamstringsTallyFloat ?? 0) / 2
        self.defaults.set(hamstringsTallyFloat, forKey: Save.hamstringsTally)
                                                       
        self.goToVolumeTracker()
        }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
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
        self.defaults.set(lowerTrapsTallyFloat, forKey: Save.lowerTrapsTally)
                                                       
        self.goToVolumeTracker()
        }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
                        }))
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
        
     }  else if (gluteMediusList.contains(title)){
        
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
        let gluteMediusTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
        var gluteMediusTallyFloat:Float? = Float(gluteMediusTallyString?.text ?? "0")
        gluteMediusTallyFloat = (gluteMediusTallyFloat ?? 0)
        self.defaults.set(gluteMediusTallyFloat, forKey: Save.gluteMediusTally)
                                                       
        self.goToVolumeTracker()
        }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
                        }))
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
        
        }  else if (hamstringsSGlutesErectorsList.contains(title)){
        
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
        let hamstringsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
        var hamstringsTallyFloat:Float? = Float(hamstringsTallyString?.text ?? "0")
        hamstringsTallyFloat = (hamstringsTallyFloat ?? 0)
        self.defaults.set(hamstringsTallyFloat, forKey: Save.hamstringsTally)
            
        let glutesTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
        var glutesTallyFloat:Float? = Float(glutesTallyString?.text ?? "0")
        glutesTallyFloat = (glutesTallyFloat ?? 0) / 2
        self.defaults.set(glutesTallyFloat, forKey: Save.glutesTally)
            
        let erectorsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
        var erectorsTallyFloat:Float? = Float(erectorsTallyString?.text ?? "0")
        erectorsTallyFloat = (erectorsTallyFloat ?? 0) / 2
        self.defaults.set(erectorsTallyFloat, forKey: Save.spinalErectorsTally)
                                                       
        self.goToVolumeTracker()
        }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
                        }))
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
        
        }  else if (isoHamstringsSGlutesErectorsList.contains(title)){
        
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
        let calvesTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
        var calvesTallyFloat:Float? = Float(calvesTallyString?.text ?? "0")
        calvesTallyFloat = (calvesTallyFloat ?? 0)
        self.defaults.set(calvesTallyFloat, forKey: Save.calvesTally)
            
                                            
        self.goToVolumeTracker()
        }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
                        }))
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
        
        }  else if (curlsList.contains(title)){
        
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
        let bicepsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
        var bicepsTallyFloat:Float? = Float(bicepsTallyString?.text ?? "0")
        bicepsTallyFloat = (bicepsTallyFloat ?? 0)
        self.defaults.set(bicepsTallyFloat, forKey: Save.bicepsTally)
            
        let forearmFlexorsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
        var forearmFlexorsTallyFloat:Float? = Float(forearmFlexorsTallyString?.text ?? "0")
        forearmFlexorsTallyFloat = (forearmFlexorsTallyFloat ?? 0)
        self.defaults.set(forearmFlexorsTallyFloat, forKey: Save.forearmFlexorsTally)
                                                       
        self.goToVolumeTracker()
        }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
                        }))
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
        
        }  else if (bicepIsolation.contains(title)){
        
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
        let bicepsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
        var bicepsTallyFloat:Float? = Float(bicepsTallyString?.text ?? "0")
        bicepsTallyFloat = (bicepsTallyFloat ?? 0)
        self.defaults.set(bicepsTallyFloat, forKey: Save.bicepsTally)
                                                       
        self.goToVolumeTracker()
        }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
                        }))
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
        
        }  else if (serratusIsolationList.contains(title)){
        
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
         let serratusTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
        var serratusTallyFloat:Float? = Float(serratusTallyString?.text ?? "0")
        serratusTallyFloat = (serratusTallyFloat ?? 0)
        self.defaults.set(serratusTallyFloat, forKey: Save.serratusTally)
                                                       
        self.goToVolumeTracker()
        }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
                        }))
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
        
        }  else if (serratusAbsSTransverseList.contains(title)){
              
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
               let serratusTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
              var serratusTallyFloat:Float? = Float(serratusTallyString?.text ?? "0")
              serratusTallyFloat = (serratusTallyFloat ?? 0)
              self.defaults.set(serratusTallyFloat, forKey: Save.serratusTally)
                
            let absTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
            var absTallyFloat:Float? = Float(absTallyString?.text ?? "0")
            absTallyFloat = (absTallyFloat ?? 0)
            self.defaults.set(absTallyFloat, forKey: Save.absTally)
                
            let transverseAbTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
            var transverseAbTallyFloat:Float? = Float(transverseAbTallyString?.text ?? "0")
            transverseAbTallyFloat = (transverseAbTallyFloat ?? 0) / 2
            self.defaults.set(transverseAbTallyFloat, forKey: Save.transverseAbTally)
                                                             
              self.goToVolumeTracker()
              }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
                        }))
              // 4. Present the alert.
              self.present(alert, animated: true, completion: nil)
        
        }  else if (absTransverseList.contains(title)){
        
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
        let absTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
        var absTallyFloat:Float? = Float(absTallyString?.text ?? "0")
        absTallyFloat = (absTallyFloat ?? 0)
        self.defaults.set(absTallyFloat, forKey: Save.absTally)
            
        let transverseAbTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
        var transverseAbTallyFloat:Float? = Float(transverseAbTallyString?.text ?? "0")
        transverseAbTallyFloat = (transverseAbTallyFloat ?? 0)
        self.defaults.set(transverseAbTallyFloat, forKey: Save.transverseAbTally)
                                                       
        self.goToVolumeTracker()
        }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
                        }))
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
        
        }  else if (obliquesTransAbList.contains(title)){
        
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
            
        let obliquesTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
        var obliquesTallyFloat:Float? = Float(obliquesTallyString?.text ?? "0")
        obliquesTallyFloat = (obliquesTallyFloat ?? 0)
        self.defaults.set(obliquesTallyFloat, forKey: Save.obliquesTally)
            
            
        let transverseAbTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
        var transverseAbTallyFloat:Float? = Float(transverseAbTallyString?.text ?? "0")
        transverseAbTallyFloat = (transverseAbTallyFloat ?? 0)
        self.defaults.set(transverseAbTallyFloat, forKey: Save.transverseAbTally)
            
                                                       
        self.goToVolumeTracker()
        }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
                        }))
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
        
        }  else if (obliquesTransAbsSAb.contains(title)){
        
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
         let obliquesTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
        var obliquesTallyFloat:Float? = Float(obliquesTallyString?.text ?? "0")
        obliquesTallyFloat = (obliquesTallyFloat ?? 0)
        self.defaults.set(obliquesTallyFloat, forKey: Save.obliquesTally)
                   
        let transverseAbTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
        var transverseAbTallyFloat:Float? = Float(transverseAbTallyString?.text ?? "0")
        transverseAbTallyFloat = (transverseAbTallyFloat ?? 0) / 2
        self.defaults.set(transverseAbTallyFloat, forKey: Save.transverseAbTally)
                                                       
        self.goToVolumeTracker()
        }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
                        }))
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
        
        }  else if (transverseAbList.contains(title)){
        
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
        let transverseAbTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
        var transverseAbTallyFloat:Float? = Float(transverseAbTallyString?.text ?? "0")
        transverseAbTallyFloat = (transverseAbTallyFloat ?? 0)
        self.defaults.set(transverseAbTallyFloat, forKey: Save.transverseAbTally)
                                                       
        self.goToVolumeTracker()
        }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
                        }))
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
        
        }  else if (quadsList.contains(title)){
        
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
        let quadsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
        var quadsTallyFloat:Float? = Float(quadsTallyString?.text ?? "0")
        quadsTallyFloat = (quadsTallyFloat ?? 0)
        self.defaults.set(quadsTallyFloat, forKey: Save.quadsTally)
                                                       
        self.goToVolumeTracker()
        }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
                        }))
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
        
        }  else if (quadsGlutemediusList.contains(title)){
        
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
        let gluteMediusTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
        var gluteMediusTallyFloat:Float? = Float(gluteMediusTallyString?.text ?? "0")
        gluteMediusTallyFloat = (gluteMediusTallyFloat ?? 0)
        self.defaults.set(gluteMediusTallyFloat, forKey: Save.gluteMediusTally)
            
        let quadsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
        var quadsTallyFloat:Float? = Float(quadsTallyString?.text ?? "0")
        quadsTallyFloat = (quadsTallyFloat ?? 0)
        self.defaults.set(quadsTallyFloat, forKey: Save.quadsTally)
                                                       
        self.goToVolumeTracker()
        }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
                        }))
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
        
        }  else if (quadsSGlutemediusList.contains(title)){
        
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
        let gluteMediusTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
        var gluteMediusTallyFloat:Float? = Float(gluteMediusTallyString?.text ?? "0")
        gluteMediusTallyFloat = (gluteMediusTallyFloat ?? 0)
        self.defaults.set(gluteMediusTallyFloat, forKey: Save.gluteMediusTally)
            
        let quadsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
        var quadsTallyFloat:Float? = Float(quadsTallyString?.text ?? "0")
        quadsTallyFloat = (quadsTallyFloat ?? 0) / 2
        self.defaults.set(quadsTallyFloat, forKey: Save.quadsTally)
                                                       
        self.goToVolumeTracker()
        }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
                        }))
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
        
        }  else if (title == "Chest Pullover"){
        
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
        self.defaults.set(chestTallyFloat, forKey: Save.chestTally)
            
        let tricepsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
        var tricepsTallyFloat:Float? = Float(tricepsTallyString?.text ?? "0")
        tricepsTallyFloat = (tricepsTallyFloat ?? 0)
        self.defaults.set(tricepsTallyFloat, forKey: Save.tricepsTally)
            
        let latsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
        var latsTallyFloat:Float? = Float(latsTallyString?.text ?? "0")
        latsTallyFloat = (latsTallyFloat ?? 0) / 2
        self.defaults.set(latsTallyFloat, forKey: Save.latsTally)
                                                       
        self.goToVolumeTracker()
        }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
                        }))
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
        
     }  else if (title == "Wide Dips"){
        
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
        self.defaults.set(chestTallyFloat, forKey: Save.chestTally)
            
        let tricepsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
        var tricepsTallyFloat:Float? = Float(tricepsTallyString?.text ?? "0")
        tricepsTallyFloat = (tricepsTallyFloat ?? 0)
        self.defaults.set(tricepsTallyFloat, forKey: Save.tricepsTally)
            
        let frontShoulderTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
        var frontShoulderTallyFloat:Float? = Float(frontShoulderTallyString?.text ?? "0")
        frontShoulderTallyFloat = (frontShoulderTallyFloat ?? 0)
        self.defaults.set(frontShoulderTallyFloat, forKey: Save.frontShoulderTally)
                                                       
        self.goToVolumeTracker()
        }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
                        }))
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
        
        }  else if (title == "Glutes"){
        
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
        let glutesTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
        var glutesTallyFloat:Float? = Float(glutesTallyString?.text ?? "0")
        glutesTallyFloat = (glutesTallyFloat ?? 0)
        self.defaults.set(glutesTallyFloat, forKey: Save.glutesTally)
                                                       
        self.goToVolumeTracker()
        }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
                        }))
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
        
        } else if (title == "Inverted Y"){
        
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
        self.defaults.set(upperTrapsTallyFloat, forKey: Save.upperTrapsTally)
            
        let lowerTrapsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
        var lowerTrapsTallyFloat:Float? = Float(lowerTrapsTallyString?.text ?? "0")
        lowerTrapsTallyFloat = (lowerTrapsTallyFloat ?? 0)
        self.defaults.set(lowerTrapsTallyFloat, forKey: Save.lowerTrapsTally)
                                                       
        self.goToVolumeTracker()
        }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
                        }))
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
        
        }  else if (title == "Angels of Death"){
            
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
            self.defaults.set(spinalErectorsTallyFloat, forKey: Save.spinalErectorsTally)
                
            let lowerTrapsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
            var lowerTrapsTallyFloat:Float? = Float(lowerTrapsTallyString?.text ?? "0")
            lowerTrapsTallyFloat = (lowerTrapsTallyFloat ?? 0)
            self.defaults.set(lowerTrapsTallyFloat, forKey: Save.lowerTrapsTally)
                
            let backShoulderTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
            var backShoulderTallyFloat:Float? = Float(backShoulderTallyString?.text ?? "0")
            backShoulderTallyFloat = (backShoulderTallyFloat ?? 0)
            self.defaults.set(backShoulderTallyFloat, forKey: Save.backShoulderTally)
                                                           
            self.goToVolumeTracker()
            }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
                        }))
            // 4. Present the alert.
            self.present(alert, animated: true, completion: nil)
        
            } else if (title == "Rotator Cuff"){
                  
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
                  self.defaults.set(rotatorCuffTallyFloat, forKey: Save.rotatorCuffTally)
                    
                                                                 
                  self.goToVolumeTracker()
                  }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
                        }))
                  // 4. Present the alert.
                  self.present(alert, animated: true, completion: nil)
        
            } else if (title == "Narrow Dip"){
              
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
              self.defaults.set(tricepsTallyFloat, forKey: Save.tricepsTally)
                
            let chestTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
            var chestTallyFloat:Float? = Float(chestTallyString?.text ?? "0")
            chestTallyFloat = (chestTallyFloat ?? 0)
            self.defaults.set(chestTallyFloat, forKey: Save.chestTally)
                
                                                             
              self.goToVolumeTracker()
              }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
                        }))
              // 4. Present the alert.
              self.present(alert, animated: true, completion: nil)
        
            } else if (title == "Deadlift"){
              
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
              let hamstringsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
              var hamstringsTallyFloat:Float? = Float(hamstringsTallyString?.text ?? "0")
              hamstringsTallyFloat = (hamstringsTallyFloat ?? 0)
              self.defaults.set(hamstringsTallyFloat, forKey: Save.hamstringsTally)
                
            let spinalErectorsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
            var spinalErectorsTallyFloat:Float? = Float(spinalErectorsTallyString?.text ?? "0")
            spinalErectorsTallyFloat = (spinalErectorsTallyFloat ?? 0)
            self.defaults.set(spinalErectorsTallyFloat, forKey: Save.spinalErectorsTally)
                
            let upperTrapsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
            var upperTrapsTallyFloat:Float? = Float(upperTrapsTallyString?.text ?? "0")
            upperTrapsTallyFloat = (upperTrapsTallyFloat ?? 0)
            self.defaults.set(upperTrapsTallyFloat, forKey: Save.upperTrapsTally)
                
            let latsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
            var latsTallyFloat:Float? = Float(latsTallyString?.text ?? "0")
            latsTallyFloat = (latsTallyFloat ?? 0)
            self.defaults.set(latsTallyFloat, forKey: Save.latsTally)
                
            let glutesTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
            var glutesTallyFloat:Float? = Float(glutesTallyString?.text ?? "0")
            glutesTallyFloat = (glutesTallyFloat ?? 0)
            self.defaults.set(glutesTallyFloat, forKey: Save.glutesTally)
                
            let lowerTrapsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
            var lowerTrapsTallyFloat:Float? = Float(lowerTrapsTallyString?.text ?? "0")
            lowerTrapsTallyFloat = (lowerTrapsTallyFloat ?? 0)
            self.defaults.set(lowerTrapsTallyFloat, forKey: Save.lowerTrapsTally)
                
            let transverseAbTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
            var transverseAbTallyFloat:Float? = Float(transverseAbTallyString?.text ?? "0")
            transverseAbTallyFloat = (transverseAbTallyFloat ?? 0)
            self.defaults.set(transverseAbTallyFloat, forKey: Save.transverseAbTally)
                
                                                             
              self.goToVolumeTracker()
              }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
                        }))
              // 4. Present the alert.
              self.present(alert, animated: true, completion: nil)
        
            } else if (title == "Squats"){
                  
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
                  let quadsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                  var quadsTallyFloat:Float? = Float(quadsTallyString?.text ?? "0")
                  quadsTallyFloat = (quadsTallyFloat ?? 0)
                  self.defaults.set(quadsTallyFloat, forKey: Save.quadsTally)
                    
                    let spinalErectorsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                    var spinalErectorsTallyFloat:Float? = Float(spinalErectorsTallyString?.text ?? "0")
                    spinalErectorsTallyFloat = (spinalErectorsTallyFloat ?? 0)
                    self.defaults.set(spinalErectorsTallyFloat, forKey: Save.spinalErectorsTally)
                    
                    let transverseAbTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                    var transverseAbTallyFloat:Float? = Float(transverseAbTallyString?.text ?? "0")
                    transverseAbTallyFloat = (transverseAbTallyFloat ?? 0)
                    self.defaults.set(transverseAbTallyFloat, forKey: Save.transverseAbTally)
                    
                    let glutesTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                    var glutesTallyFloat:Float? = Float(glutesTallyString?.text ?? "0")
                    glutesTallyFloat = (glutesTallyFloat ?? 0)
                    self.defaults.set(glutesTallyFloat, forKey: Save.glutesTally)
                    
                                                                 
                  self.goToVolumeTracker()
                  }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
                        }))
                  // 4. Present the alert.
                  self.present(alert, animated: true, completion: nil)
            
                } else if (title == "Frog Pumps"){
                  
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
                  let gluteMediusTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                  var gluteMediusTallyFloat:Float? = Float(gluteMediusTallyString?.text ?? "0")
                  gluteMediusTallyFloat = (gluteMediusTallyFloat ?? 0)
                  self.defaults.set(gluteMediusTallyFloat, forKey: Save.gluteMediusTally)
                    
                 let spinalErectorsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                 var spinalErectorsTallyFloat:Float? = Float(spinalErectorsTallyString?.text ?? "0")
                 spinalErectorsTallyFloat = (spinalErectorsTallyFloat ?? 0)
                 self.defaults.set(spinalErectorsTallyFloat, forKey: Save.spinalErectorsTally)
                    
                                                                 
                  self.goToVolumeTracker()
                  }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
                        }))
                  // 4. Present the alert.
                  self.present(alert, animated: true, completion: nil)
                  } else if (title == "Marching Bridge"){
                   
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
                   let glutesTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                   var glutesTallyFloat:Float? = Float(glutesTallyString?.text ?? "0")
                   glutesTallyFloat = (glutesTallyFloat ?? 0)
                   self.defaults.set(glutesTallyFloat, forKey: Save.glutesTally)
                     
                  let spinalErectorsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                  var spinalErectorsTallyFloat:Float? = Float(spinalErectorsTallyString?.text ?? "0")
                  spinalErectorsTallyFloat = (spinalErectorsTallyFloat ?? 0)
                  self.defaults.set(spinalErectorsTallyFloat, forKey: Save.spinalErectorsTally)
                     
                                                                  
                   self.goToVolumeTracker()
                   }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
                        }))
                   // 4. Present the alert.
                   self.present(alert, animated: true, completion: nil)
                    } else if (title == "Hip Thrust"){
                                   
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
                                   let glutesTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                                   var glutesTallyFloat:Float? = Float(glutesTallyString?.text ?? "0")
                                   glutesTallyFloat = (glutesTallyFloat ?? 0)
                                   self.defaults.set(glutesTallyFloat, forKey: Save.glutesTally)
                                     
                                  let spinalErectorsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                                  var spinalErectorsTallyFloat:Float? = Float(spinalErectorsTallyString?.text ?? "0")
                                  spinalErectorsTallyFloat = (spinalErectorsTallyFloat ?? 0)
                                  self.defaults.set(spinalErectorsTallyFloat, forKey: Save.spinalErectorsTally)
                                    
                                
                                let hamstringsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                                var hamstringsTallyFloat:Float? = Float(hamstringsTallyString?.text ?? "0")
                                hamstringsTallyFloat = (hamstringsTallyFloat ?? 0) / 2
                                self.defaults.set(hamstringsTallyFloat, forKey: Save.hamstringsTally)
                                    
                                
                                let gluteMediusTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                                var gluteMediusTallyFloat:Float? = Float(gluteMediusTallyString?.text ?? "0")
                                gluteMediusTallyFloat = (gluteMediusTallyFloat ?? 0) / 2
                                self.defaults.set(gluteMediusTallyFloat, forKey: Save.gluteMediusTally)
                                     
                                                                                  
                                   self.goToVolumeTracker()
                                   }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
                        }))
                                   // 4. Present the alert.
                                   self.present(alert, animated: true, completion: nil)
                    } else if (title == "Reverse Hyperextension"){
                                   
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
                                   let glutesTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                                   var glutesTallyFloat:Float? = Float(glutesTallyString?.text ?? "0")
                                   glutesTallyFloat = (glutesTallyFloat ?? 0)
                                   self.defaults.set(glutesTallyFloat, forKey: Save.glutesTally)
                                    
                                
                                let hamstringsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                                var hamstringsTallyFloat:Float? = Float(hamstringsTallyString?.text ?? "0")
                                hamstringsTallyFloat = (hamstringsTallyFloat ?? 0) / 2
                                self.defaults.set(hamstringsTallyFloat, forKey: Save.hamstringsTally)
                                    
                                
                                let gluteMediusTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                                var gluteMediusTallyFloat:Float? = Float(gluteMediusTallyString?.text ?? "0")
                                gluteMediusTallyFloat = (gluteMediusTallyFloat ?? 0) / 2
                                self.defaults.set(gluteMediusTallyFloat, forKey: Save.gluteMediusTally)
                                     
                                                                                  
                                   self.goToVolumeTracker()
                                   }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
                        }))
                                   // 4. Present the alert.
                                   self.present(alert, animated: true, completion: nil)
        
        
                    } else if (title == "Reverse Hyperextension"){
                                   
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
                                   let glutesTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                                   var glutesTallyFloat:Float? = Float(glutesTallyString?.text ?? "0")
                                   glutesTallyFloat = (glutesTallyFloat ?? 0)
                                   self.defaults.set(glutesTallyFloat, forKey: Save.glutesTally)
                                    
                                
                                let hamstringsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                                var hamstringsTallyFloat:Float? = Float(hamstringsTallyString?.text ?? "0")
                                hamstringsTallyFloat = (hamstringsTallyFloat ?? 0)
                                self.defaults.set(hamstringsTallyFloat, forKey: Save.hamstringsTally)
                                    
                                
                                let gluteMediusTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                                var gluteMediusTallyFloat:Float? = Float(gluteMediusTallyString?.text ?? "0")
                                gluteMediusTallyFloat = (gluteMediusTallyFloat ?? 0)
                                self.defaults.set(gluteMediusTallyFloat, forKey: Save.gluteMediusTally)
                                     
                                                                                  
                                   self.goToVolumeTracker()
                                   }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
                        }))
                                   // 4. Present the alert.
                                   self.present(alert, animated: true, completion: nil)
        
                    } else if (title == "Reverse Hyperextension"){
                                   
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
                                   let glutesTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                                   var glutesTallyFloat:Float? = Float(glutesTallyString?.text ?? "0")
                                   glutesTallyFloat = (glutesTallyFloat ?? 0)
                                   self.defaults.set(glutesTallyFloat, forKey: Save.glutesTally)
                                    
                                
                                let hamstringsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                                var hamstringsTallyFloat:Float? = Float(hamstringsTallyString?.text ?? "0")
                                hamstringsTallyFloat = (hamstringsTallyFloat ?? 0) / 2
                                self.defaults.set(hamstringsTallyFloat, forKey: Save.hamstringsTally)
                                                              
                                   self.goToVolumeTracker()
                                   }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
                        }))
                                   // 4. Present the alert.
                                   self.present(alert, animated: true, completion: nil)
                    } else if (title == "Hamstrings"){
                                   
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
                                
                                let hamstringsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                                var hamstringsTallyFloat:Float? = Float(hamstringsTallyString?.text ?? "0")
                                hamstringsTallyFloat = (hamstringsTallyFloat ?? 0)
                                self.defaults.set(hamstringsTallyFloat, forKey: Save.hamstringsTally)
                                                              
                                   self.goToVolumeTracker()
                                   }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
                        }))
                                   // 4. Present the alert.
                                   self.present(alert, animated: true, completion: nil)
                    } else if (title == "Ab Circles"){
                                       
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
                                    
                                    let absTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                                    var absTallyFloat:Float? = Float(absTallyString?.text ?? "0")
                                    absTallyFloat = (absTallyFloat ?? 0)
                                    self.defaults.set(absTallyFloat, forKey: Save.absTally)
                                        
                                    let obliquesTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                                    var obliquesTallyFloat:Float? = Float(obliquesTallyString?.text ?? "0")
                                    obliquesTallyFloat = (obliquesTallyFloat ?? 0)
                                    self.defaults.set(obliquesTallyFloat, forKey: Save.obliquesTally)
                                        
                                    let transverseAbTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                                    var transverseAbTallyFloat:Float? = Float(transverseAbTallyString?.text ?? "0")
                                    transverseAbTallyFloat = (transverseAbTallyFloat ?? 0) / 2
                                    self.defaults.set(transverseAbTallyFloat, forKey: Save.transverseAbTally)
                                                                  
                                       self.goToVolumeTracker()
                                       }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
                        }))
                                       // 4. Present the alert.
                                       self.present(alert, animated: true, completion: nil)
     }else if (title == "Chin Ups"){
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
            
        let latsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
        var latsTallyFloat:Float? = Float(latsTallyString?.text ?? "0")
        latsTallyFloat = (latsTallyFloat ?? 0)
        self.defaults.set(latsTallyFloat, forKey: Save.latsTally)
            
        let lowerTrapsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
        var lowerTrapsTallyFloat:Float? = Float(lowerTrapsTallyString?.text ?? "0")
        lowerTrapsTallyFloat = (lowerTrapsTallyFloat ?? 0)
        self.defaults.set(lowerTrapsTallyFloat, forKey: Save.lowerTrapsTally)
            
        let backShoulderTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
        var backShoulderTallyFloat:Float? = Float(backShoulderTallyString?.text ?? "0")
        backShoulderTallyFloat = (backShoulderTallyFloat ?? 0) / 2
        self.defaults.set(backShoulderTallyFloat, forKey: Save.backShoulderTally)
            
        let bicepsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
        var bicepsTallyFloat:Float? = Float(bicepsTallyString?.text ?? "0")
        bicepsTallyFloat = (bicepsTallyFloat ?? 0)
        self.defaults.set(bicepsTallyFloat, forKey: Save.bicepsTally)
            
        let forearmFlexorsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
        var forearmFlexorsTallyFloat:Float? = Float(forearmFlexorsTallyString?.text ?? "0")
        forearmFlexorsTallyFloat = (forearmFlexorsTallyFloat ?? 0) / 2
        self.defaults.set(forearmFlexorsTallyFloat, forKey: Save.forearmFlexorsTally)
                                                       
        self.goToVolumeTracker()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
            action in
        // Called when user taps outside
        }))
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
     } else if (title == "Leg Raise Scissors"){
                                       
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
                                    
                                    let absTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                                    var absTallyFloat:Float? = Float(absTallyString?.text ?? "0")
                                    absTallyFloat = (absTallyFloat ?? 0)
                                    self.defaults.set(absTallyFloat, forKey: Save.absTally)
                                        
                                    let obliquesTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                                    var obliquesTallyFloat:Float? = Float(obliquesTallyString?.text ?? "0")
                                    obliquesTallyFloat = (obliquesTallyFloat ?? 0)
                                    self.defaults.set(obliquesTallyFloat, forKey: Save.obliquesTally)
                                        
                                    let transverseAbTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                                    var transverseAbTallyFloat:Float? = Float(transverseAbTallyString?.text ?? "0")
                                    transverseAbTallyFloat = (transverseAbTallyFloat ?? 0) / 2
                                    self.defaults.set(transverseAbTallyFloat, forKey: Save.transverseAbTally)
                                                                  
                                       self.goToVolumeTracker()
                                       }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
                        }))
                                       // 4. Present the alert.
                                       self.present(alert, animated: true, completion: nil)
        
                        } else if (title == "Obliques"){
                                       
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
                                  
                                        
                                    let obliquesTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                                    var obliquesTallyFloat:Float? = Float(obliquesTallyString?.text ?? "0")
                                    obliquesTallyFloat = (obliquesTallyFloat ?? 0)
                                    self.defaults.set(obliquesTallyFloat, forKey: Save.obliquesTally)
                                        
                                                                  
                                       self.goToVolumeTracker()
                                       }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
                        }))
                                       // 4. Present the alert.
                                       self.present(alert, animated: true, completion: nil)
        
                        } else if (title == "Pistol Squats"){
                                       
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
                                  
                                        
                                    let quadsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                                    var quadsTallyFloat:Float? = Float(quadsTallyString?.text ?? "0")
                                    quadsTallyFloat = (quadsTallyFloat ?? 0)
                                    self.defaults.set(quadsTallyFloat, forKey: Save.quadsTally)
                                        
                                    let gluteMediusTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                                    var gluteMediusTallyFloat:Float? = Float(gluteMediusTallyString?.text ?? "0")
                                    gluteMediusTallyFloat = (gluteMediusTallyFloat ?? 0)
                                    self.defaults.set(gluteMediusTallyFloat, forKey: Save.gluteMediusTally)
                                        
                                    let glutesTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                                    var glutesTallyFloat:Float? = Float(glutesTallyString?.text ?? "0")
                                    glutesTallyFloat = (glutesTallyFloat ?? 0)
                                    self.defaults.set(glutesTallyFloat, forKey: Save.glutesTally)
                                        
                                                                  
                                       self.goToVolumeTracker()
                                       }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
                        }))
                                       // 4. Present the alert.
                                       self.present(alert, animated: true, completion: nil)
        
     } else if (title == "Banded RDL"){
        
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
                   
               let glutesTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
               var glutesTallyFloat:Float? = Float(glutesTallyString?.text ?? "0")
               glutesTallyFloat = (glutesTallyFloat ?? 0)
               self.defaults.set(glutesTallyFloat, forKey: Save.glutesTally)
                   
               let gluteMediusTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
               var gluteMediusTallyFloat:Float? = Float(gluteMediusTallyString?.text ?? "0")
               gluteMediusTallyFloat = (gluteMediusTallyFloat ?? 0)
               self.defaults.set(gluteMediusTallyFloat, forKey: Save.gluteMediusTally)
                   
               let hamstringsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
               var hamstringsTallyFloat:Float? = Float(hamstringsTallyString?.text ?? "0")
               hamstringsTallyFloat = (hamstringsTallyFloat ?? 0)
               self.defaults.set(hamstringsTallyFloat, forKey: Save.hamstringsTally)
                                                              
               self.goToVolumeTracker()
               }))
               alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                   action in
               // Called when user taps outside
               }))
               // 4. Present the alert.
               self.present(alert, animated: true, completion: nil)
        
        } else if (title == "Squats"){
           
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
                      
                  let glutesTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                  var glutesTallyFloat:Float? = Float(glutesTallyString?.text ?? "0")
                  glutesTallyFloat = (glutesTallyFloat ?? 0) / 2
                  self.defaults.set(glutesTallyFloat, forKey: Save.glutesTally)
                      
                  let transverseAbTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                  var transverseAbTallyFloat:Float? = Float(transverseAbTallyString?.text ?? "0")
                  transverseAbTallyFloat = (transverseAbTallyFloat ?? 0) / 2
                  self.defaults.set(transverseAbTallyFloat, forKey: Save.transverseAbTally)
                      
                  let spinalErectorsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                  var spinalErectorsTallyFloat:Float? = Float(spinalErectorsTallyString?.text ?? "0")
                  spinalErectorsTallyFloat = (spinalErectorsTallyFloat ?? 0)
                  self.defaults.set(spinalErectorsTallyFloat, forKey: Save.spinalErectorsTally)
                    
                 let quadsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                 var quadsTallyFloat:Float? = Float(quadsTallyString?.text ?? "0")
                 quadsTallyFloat = (quadsTallyFloat ?? 0)
                 self.defaults.set(quadsTallyFloat, forKey: Save.quadsTally)
                    
                                                                 
                  self.goToVolumeTracker()
                  }))
                  alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                      action in
                  // Called when user taps outside
                  }))
                  // 4. Present the alert.
                  self.present(alert, animated: true, completion: nil)
           
        } else if (title == "Glute Side Plank"){
                
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
                           
            
                           
                       let gluteMediusTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                       var gluteMediusTallyFloat:Float? = Float(gluteMediusTallyString?.text ?? "0")
                       gluteMediusTallyFloat = (gluteMediusTallyFloat ?? 0)
                       self.defaults.set(gluteMediusTallyFloat, forKey: Save.gluteMediusTally)
                           
                       let obliquesTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                       var obliquesTallyFloat:Float? = Float(obliquesTallyString?.text ?? "0")
                       obliquesTallyFloat = (obliquesTallyFloat ?? 0) / 2
                       self.defaults.set(obliquesTallyFloat, forKey: Save.obliquesTally)
                                                                      
                       self.goToVolumeTracker()
                       }))
                       alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                           action in
                       // Called when user taps outside
                       }))
                       // 4. Present the alert.
                       self.present(alert, animated: true, completion: nil)
                
                
             } else if (title == "Bodyweight Squats"){
                                       
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
                                  
                                        
                                    let quadsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                                    var quadsTallyFloat:Float? = Float(quadsTallyString?.text ?? "0")
                                    quadsTallyFloat = (quadsTallyFloat ?? 0)
                                    self.defaults.set(quadsTallyFloat, forKey: Save.quadsTally)
                                        
                                    let glutesTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                                    var glutesTallyFloat:Float? = Float(glutesTallyString?.text ?? "0")
                                    glutesTallyFloat = (glutesTallyFloat ?? 0) / 2
                                    self.defaults.set(glutesTallyFloat, forKey: Save.glutesTally)
                                        
                                       self.goToVolumeTracker()
                                       }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
                        }))
                                       // 4. Present the alert.
                                       self.present(alert, animated: true, completion: nil)
        
                        } else if (title == "Lunges"){
                                       
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
                                  
                                        
                                    let quadsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                                    var quadsTallyFloat:Float? = Float(quadsTallyString?.text ?? "0")
                                    quadsTallyFloat = (quadsTallyFloat ?? 0)
                                    self.defaults.set(quadsTallyFloat, forKey: Save.quadsTally)
                                        
                                    let glutesTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                                    var glutesTallyFloat:Float? = Float(glutesTallyString?.text ?? "0")
                                    glutesTallyFloat = (glutesTallyFloat ?? 0)
                                    self.defaults.set(glutesTallyFloat, forKey: Save.glutesTally)
                                        
                                    let gluteMediusTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                                    var gluteMediusTallyFloat:Float? = Float(gluteMediusTallyString?.text ?? "0")
                                    gluteMediusTallyFloat = (gluteMediusTallyFloat ?? 0)
                                    self.defaults.set(gluteMediusTallyFloat, forKey: Save.gluteMediusTally)
                                        
                                                                  
                                       self.goToVolumeTracker()
                                       }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
                        }))
                                       // 4. Present the alert.
                                       self.present(alert, animated: true, completion: nil)
     } else if (title == "Bodyweight Hip Thrusts"){
                                              
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
                                         
                                               
                                           let hamstringsTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                                           var hamstringsTallyFloat:Float? = Float(hamstringsTallyString?.text ?? "0")
                                           hamstringsTallyFloat = (hamstringsTallyFloat ?? 0)
                                           self.defaults.set(hamstringsTallyFloat, forKey: Save.hamstringsTally)
                                               
                                           let glutesTallyString = alert?.textFields![0] // Force unwrapping because we know it exists.
                                           var glutesTallyFloat:Float? = Float(glutesTallyString?.text ?? "0")
                                           glutesTallyFloat = (glutesTallyFloat ?? 0)
                                           self.defaults.set(glutesTallyFloat, forKey: Save.glutesTally)
                                               
                                          
                                               
                                                                         
                                              self.goToVolumeTracker()
                                              }))
                               alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                                   action in
                               // Called when user taps outside
                               }))
                                              // 4. Present the alert.
                                              self.present(alert, animated: true, completion: nil)
                            } else {
        
                        //  1. Create the alert controller.
                       let alert = UIAlertController(title: "Add Volume", message: "Fix it Bro XxXXXXXXXXXXXXXX\nXXXXXXXXXXXXXXXXX\nXXXXXXXXXXXXX\nXXXXXXXXXXXXXXXXXXXXXX\nXXXXXXXXXXXXXXX", preferredStyle: .alert)
                       //2. Add the text field. You can configure it however you need.
                       alert.addTextField { (textField) in
                       textField.text = "Input amount of sets"
                       textField.keyboardType = .numberPad
                       textField.clearsOnBeginEditing = true
                       }
                       // 3. Grab the value from the text field, and print it when the user clicks OK.
                       alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                           
                       //CAST STRING INPUT TO FLOAT
                                                  
                       self.goToVolumeTracker()
                       }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            action in
                        // Called when user taps outside
                        }))
                       // 4. Present the alert.
                       self.present(alert, animated: true, completion: nil)
        }
    }
}
    

extension allExercisesViewController: UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            initialDataAry = createAllExercisesArray()
            if searchText.isEmpty {
                allExercises = initialDataAry
                self.allExercisesTableView.reloadData()
                } else {
                allExercises.removeAll()
                
                    for i in 0..<initialDataAry.count{
                        if ( initialDataAry[i].title.lowercased().contains(searchText.lowercased())){
                        allExercises.append(initialDataAry[i])
                        } else if ( initialDataAry[i].musclesWorked.lowercased().contains(searchText.lowercased())){
                        allExercises.append(initialDataAry[i])
                        }
                }
                allExercisesTableView.reloadData()
            }
        }
            
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searching = false
            searchBar.text = ""
            allExercisesTableView.reloadData()
        }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return allExercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var exercise = placeHolderExercises[1]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell") as! ExercisesTableViewCell
        exercise = allExercises[indexPath.row]
        cell.setExercises(exercise: exercise)
        cell.delegate = self
        return cell
        }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                    let indexPath = tableView.indexPathForSelectedRow
                   let currentCell = tableView.cellForRow(at: indexPath!)! as! ExercisesTableViewCell
                   let title = currentCell.exerciseTitleLabel.text
                   print(currentCell.exerciseTitleLabel.text!)
                   defaults.set(title, forKey: Save.formExercise)
                   goToFormVideo()
    }
    
    @objc private func titleWasTapped() {
            guard let url = URL(string: "http://aesthet-x.com/about/") else {
                return //be safe
              }

              if #available(iOS 10.0, *) {
                  UIApplication.shared.open(url, options: [:], completionHandler: nil)
              } else {
                  UIApplication.shared.openURL(url)
              }
    }
    }


    
    
     
    

    





