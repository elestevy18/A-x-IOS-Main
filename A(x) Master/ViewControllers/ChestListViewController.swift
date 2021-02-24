//
//  ChestExercisesViewController.swift
//  BeginnerTableView
//
//  Created by Kevin Jimenez on 7/3/20.
//  Copyright © 2020 Sean Allen. All rights reserved.
//


import UIKit
//TODO make repeating inputs add to only one, double check ypu can in;ut more than 50 entries, add notes and rpe feature
import GoogleMobileAds
import MaterialShowcase

class ChestListViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var chestTableView: UITableView!
    
    
    
    //creates array to populate exercise list cells
    var gymExercises: [Exercises] = []
    var bodyWeightExercises: [Exercises] = []
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.backItem?.title = ""
        
        let muscleGroup = defaults.string(forKey:Save.muscle)
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
            //bodyWeightExercises = createBWAbsArray()
        } else if (muscleGroup == "Obliques"){
            gymExercises = createObliquesArray()
            //bodyWeightExercises = createBWObliquesArray()
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
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        let showCase = defaults.bool(forKey: Save.firstTimeShowcaseExercises)
        
        if showCase == false {
            if let cell = chestTableView.visibleCells.first as? ExercisesTableViewCell{
                
                let showcase0 = MaterialShowcase()
                showcase0.setTargetView(view: cell.exerciseTitleLabel)
                showcase0.primaryText = "Click any exercise to view a form video"
                showcase0.secondaryText = "Stop half repping and swinging your sets. Maximize growth.\n\nThese exercises were selected to maximize gains and keep you safe. Perform any others at your discretion. You can track them by adding individual volume with the muscle name option at the top."
                showcase0.primaryTextColor = UIColor.black
                showcase0.secondaryTextColor = UIColor.black
                showcase0.backgroundViewType = .full
                showcase0.backgroundPromptColor = Colors.aXGreen
                showcase0.targetHolderColor = UIColor.black
                showcase0.show(completion: {
                    self.defaults.setValue(true, forKey: Save.firstTimeShowcaseExercises)
                })
                
                let showcase1 = MaterialShowcase()
                showcase1.setTargetView(view: cell.addSetButton)
                showcase1.primaryText = "Click to Fill Your Weekly Progress"
                showcase1.secondaryText = "This will add the exercise's volume to the volume tracker's progress bars.\nPrimary movers add one set to your weekly volume and secondary movers add 1/2 a set.\nEach exercise's description provides a list of all the muscles worked."
                showcase1.primaryTextColor = UIColor.black
                showcase1.secondaryTextColor = UIColor.black
                showcase1.backgroundViewType = .full
                showcase1.backgroundPromptColor = Colors.aXGreen
                showcase1.targetHolderColor = UIColor.black
                showcase1.show(completion: {
                    self.defaults.setValue(true, forKey: Save.firstTimeShowcaseExercises)
                })
            }
            
           
        }
    }
    
    
    //---------------------------------------------BEGIN SHENANIGANS-----------------------------------------------------------------
    //Folowing Functions contain all exercises. Will display only the muscle group selected in the volume tracker
    func createChestArray() -> [Exercises] {
        let exercise0 = Exercises(title: "Chest", musclesWorked: "A single set towards chest")
        //Netral Position
        let exercise1 = Exercises(title: "Bench Press",             musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid, Serratus")
        let exercise2 = Exercises(title: "Dumbell Bench Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid, Serratus")
        let exercise3 = Exercises(title: "Machine Chest Press",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid, Serratus")
        let exercise4 = Exercises(title: "Neutral Cable Press, Serratus",     musclesWorked: "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
        let exercise5 = Exercises(title: "Neutral Crossover Flyes", musclesWorked: "Middle Pectoral")
        
        //Incline
        let exercise6 = Exercises(title: "Incline Bench Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps, Serratus")
        let exercise7 = Exercises(title: "Incline Dumbell Bench Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps, Serratus")
        let exercise8 = Exercises(title: "Incline Machine Chest Press", musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps, Serratus")
        let exercise9 = Exercises(title: "Incline Cable Press",         musclesWorked: "Upper Pectoral, Anterior Deltoid Secondary: Lateral and Medial Triceps, Serratus")
        let exercise10 = Exercises(title: "Incline Crossover Flyes",    musclesWorked: "Upper Pectoral")
        
        //Decline
        
        let exercise11 = Exercises(title: "Decline Bench Press",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps, Serratus")
        let exercise12 = Exercises(title: "Decline Dumbell Bench Press", musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps, Serratus")
        let exercise13 = Exercises(title: "Decline Cable Press, Serratus",         musclesWorked: "Lower Pectoral Secondary: Lateral and Medial Triceps")
        let exercise14 = Exercises(title: "Decline Crossover Flyes, Serratus",     musclesWorked: "Lower Pectoral")
        
        //Miscellaneuos
        let exercise15 = Exercises(title: "Chest Pullover", musclesWorked: "Upper Pectoral, Triceps Secondary: Lats")
        
        return [exercise0, exercise1, exercise2, exercise3, exercise4, exercise5
                , exercise6, exercise7, exercise8, exercise9, exercise10,
                exercise11, exercise12, exercise13, exercise14, exercise15]
    }
    
    func createBWChestArray() -> [Exercises] {
        let exercise0 = Exercises(title: "Push-Ups",     musclesWorked:   "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid, Serratus")
        let exercise1 = Exercises(title: "Wide Dips",    musclesWorked:  "Chest Secondary: Lateral and Medial Triceps, Serratus")
        let exercise2 = Exercises(title: "Banded Fly",   musclesWorked: "Upper/Middle/Lower Pectoral")
        
        return [exercise0, exercise1, exercise2]
    }
    
    func createBicepsArray() -> [Exercises] {
        let exercise0 = Exercises(title: "Biceps", musclesWorked: "A single set towards Biceps")
        let exercise1 = Exercises(title: "Dumbbell Curls",                   musclesWorked: "Biceps Secondary: Forearm Flexors")
        let exercise2 = Exercises(title: "Narrow Dumbbell Curls",            musclesWorked: "Biceps: short head Secondary: Forearm Flexors")
        let exercise3 = Exercises(title: "Wide Dumbbell Curls",              musclesWorked: "Bicep: long head Secondary: Forearm Flexors")
        let exercise4 = Exercises(title: "Barbell Curls",                    musclesWorked: "Biceps Secondary: Forearm Flexors")
        let exercise5 = Exercises(title: "Narrow Barbell Curls",             musclesWorked: "Biceps: short head Secondary: Forearm Flexors")
        let exercise6 = Exercises(title: "Wide Barbell Curls",               musclesWorked: "Biceps: long head Secondary: Forearm Flexors")
        let exercise7 = Exercises(title: "Narrow EZ Bar Curls",              musclesWorked: "Biceps: short head Secondary: Forearm Flexors")
        let exercise8 = Exercises(title: "Wide EZ Bar Curls",                musclesWorked: "Biceps: long head Secondary: Forearm Flexors")
        let exercise9 = Exercises(title: "Preacher Curls",                   musclesWorked: "Biceps: Secondary: Forearm Flexors")
        let exercise10 = Exercises(title: "Limp Wrist Curls",                musclesWorked: "Biceps")
        let exercise11 = Exercises(title: "Biceps Isometric",                musclesWorked: "Biceps")
        let exercise12 = Exercises(title: "Cross Body Hammer Curls",         musclesWorked: "Brachialis, Radial Forearm Secondary: Biceps")
        let exercise13 = Exercises(title: "Cable/Dumbbell Spider Curls",     musclesWorked: "Biceps Secondary: Forearm Flexors")
        
        
        return [exercise0, exercise1, exercise2, exercise3, exercise4, exercise5
                , exercise6, exercise7, exercise8, exercise9, exercise10,
                exercise11, exercise12, exercise13]
    }
    
    func createBWBicepsArray() -> [Exercises] {
        let exercise0 = Exercises(title: "Banded Curls",                    musclesWorked: "Biceps Secondary: Forearm Flexors")
        let exercise1 = Exercises(title: "Ring Curls",                      musclesWorked:  "Biceps Secondary: Forearm Flexors")
        
        return [exercise0, exercise1]
    }
    
    func createLatsArray() -> [Exercises] {
        let exercise0 = Exercises(title: "Lats", musclesWorked: "One set towards Lats")
        let exercise1 = Exercises(title: "Lat Pull Over",        musclesWorked: "Lats, Trieps")
        let exercise2 = Exercises(title: "Lat Pushdowns",        musclesWorked: "Lats, Triceps")
        let exercise3 = Exercises(title: "Cable Pulldown",       musclesWorked: "Lats, Lower Traps\nSecondary: Post Delt, Bicep, Forearms")
        let exercise4 = Exercises(title: "High Pulley Row",      musclesWorked: "Lats, Lower Traps Secondary: Post Delt, Biceps, Forearm Flexors")
        let exercise5 = Exercises(title: "Chest Supported Rows", musclesWorked: "Lats, Lower Traps Secondary: Post Delt, Biceps, Forearm Flexors")
        let exercise6 = Exercises(title: "Barbell Rows",         musclesWorked: "Lats, Lower Traps, Erectors Secondary: Post Delt, Biceps, Forearm Flexors")
        let exercise7 = Exercises(title: "Cable Rows",           musclesWorked: "Lats, Lower Traps, Erectors Secondary: Post Delt, Biceps, Forearm Flexors")
        
        return [exercise0, exercise1, exercise2, exercise3, exercise4, exercise5
                , exercise6, exercise7]
    }
    
    func createBWLatsArray() -> [Exercises] {
        let exercise0 = Exercises(title: "Front Levers", musclesWorked:   "Lats, Triceps")
        let exercise1 = Exercises(title: "Pull Ups",     musclesWorked:  "Lats, Lower Traps\nSecondary: Post Delt, Bicep, Forearms")
        let exercise2 = Exercises(title: "Chin Ups",     musclesWorked: "Lats, Lower Traps Secondary: Post Delt, Forearms")
        let exercise3 = Exercises(title: "Pull Ins",     musclesWorked: "Lats")
        let exercise4 = Exercises(title: "Ring Rows",    musclesWorked: "Lats, Lower Traps Secondary: Post Delt, Biceps, Forearm Flexors")
        
        return [exercise0, exercise1, exercise2, exercise3, exercise4]
    }
    
    func createGlutesArray() -> [Exercises] {
        let exercise0 = Exercises(title: "Glutes", musclesWorked: "A single set towards Glutes")
        let exercise1 = Exercises(title: "Hip Thrust",                musclesWorked: "Glutes, Erectors Secondary: Hamstrings, Glute Medius")
        let exercise2 = Exercises(title: "Cable Pull Through",        musclesWorked: "Glutes Secondary: Hamstrings, Glute Medius")
        let exercise3 = Exercises(title: "Glute Hyperextension",      musclesWorked: "Glutes Secondary: Hamstrings, Glute Medius")
        let exercise4 = Exercises(title: "Kettlebell/Dumbbell Swing", musclesWorked: "Glutes Secondary: Hamstrings, Glute Medius")
        let exercise5 = Exercises(title: "Cable Kick Backs",          musclesWorked: "Glutes Secondary: Hamstrings, Glute Medius")
        
        return [exercise0, exercise1, exercise2, exercise3, exercise4, exercise5]
    }
    
    func createBWGlutesArray() -> [Exercises] {
        let exercise0 = Exercises(title: "Bodyweight Hip Thrusts",    musclesWorked: "Glutes Secondary: Hamstrings")
        let exercise1 = Exercises(title: "Isolateral Hip Thrust",     musclesWorked: "Glutes, Glute Medius Secondary: Hamstrings")
        let exercise2 = Exercises(title: "Sprinter Lunge",            musclesWorked: "Glutes, Glute Medius Secondary: Hamstrings")
        let exercise3 = Exercises(title: "Banded RDL",                musclesWorked: "Glutes, Glute Medius, Hamstrings")
        let exercise4 = Exercises(title: "Marching Bridge",           musclesWorked: "Spinal Erector, Glutes")
        
        return [exercise0, exercise1, exercise2, exercise3, exercise4]
    }
    
    func createGluteMediusArray() -> [Exercises] {
        let exercise0 = Exercises(title: "Glute Medius",                  musclesWorked: "A single set towards Glute Medius")
        let exercise1 = Exercises(title: "Machine Abduction",             musclesWorked: "Glute Medius")
        let exercise2 = Exercises(title: "Ankle Brace Cable Abduction",             musclesWorked: "Glute Medius")
        return [exercise0, exercise1, exercise2]
    }
    
    func createBWGluteMediusArray() -> [Exercises] {
        let exercise0 = Exercises(title: "Banded Lateral Walkout",     musclesWorked: "Glute Medius")
        let exercise1 = Exercises(title: "Banded Abduction",           musclesWorked:  "Glute Medius")
        let exercise2 = Exercises(title: "Glute Side Plank",           musclesWorked: "Glute Medius Secondary: Obliques")
        
        return [exercise0, exercise1, exercise2]
    }
    
    func createHamstringsArray() -> [Exercises] {
        let exercise0 = Exercises(title: "Hamstrings", musclesWorked: "A single set towards Hamstrings")
        let exercise1 = Exercises(title: "Deadlift",                 musclesWorked: "Hamstrings, Erectors, Upper Traps Secondary: Lats, Glutes, Lower Traps, Transverse")
        let exercise2 = Exercises(title: "Romanian Deadlift",        musclesWorked: "Hamstring, Secondary: Glutes, Erectors")
        let exercise3 = Exercises(title: "Deficit Deadlift",         musclesWorked: "Hamstring Secondary: Glutes, Erectors")
        let exercise4 = Exercises(title: "Hamstring Hyperextension", musclesWorked: "Hamstring Secondary: Glutes, Erectors")
        
        return [exercise0, exercise1, exercise2, exercise3, exercise4]
    }
    
    func createBWHamstringsArray() -> [Exercises] {
        
        let exercise0 = Exercises(title: "Glute Ham Raise",                musclesWorked:  "Hamstrings Secondary: Glutes, Erectors")
        let exercise1 = Exercises(title: "Medicine Ball Curl",             musclesWorked: "Hamstring Secondary: Glutes, Erectors")
        let exercise2 = Exercises(title: "Single Leg Medicine Ball Curl",  musclesWorked: "Hamstring, Glute Medius Secondary: Glutes, Erectors")
        let exercise3 = Exercises(title: "Single Leg Romanian Deadlift",   musclesWorked: "Hamstring, Glute Medius Secondary: Glutes, Erectors")
        
        return [exercise0, exercise1, exercise2, exercise3]
    }
    
    func createFrontShoulderArray() -> [Exercises] {
        let exercise0 = Exercises(title: "Front Shoulder",          musclesWorked: "One set towards Anterior Deltoids ")
        let exercise1 = Exercises(title: "Arnolds",                 musclesWorked: "Anterior Delt Secondary: Triceps, Medial Delt")
        let exercise2 = Exercises(title: "Barbell Overhead Press",  musclesWorked: "Anterior Delt Secondary: Triceps")
        let exercise3 = Exercises(title: "Dumbbell OHP",            musclesWorked: "Anterior Deltoid Secondary: Triceps, Medial Delt")
        let exercise4 = Exercises(title: "Cable Stretch to OHP",    musclesWorked: "Anterior Deltoid Secondary: Triceps, Medial Delt")
        let exercise5 = Exercises(title: "Landmine Press",          musclesWorked: "Anterior Delt Secondary: Triceps, Medial Delt")
        let exercise6 = Exercises(title: "Machine Shoulder Press",  musclesWorked: "Anterior Delt Secondary: Triceps, Medial Delt")
        let exercise7 = Exercises(title: "Push Press",              musclesWorked: "Anterior Delt Secondary: Triceps, Medial Delt")
        
        return [exercise0, exercise1, exercise2, exercise3, exercise4, exercise5
                , exercise6, exercise7]
    }
    
    func createBWFrontShoulderArray() -> [Exercises] {
        let exercise0 = Exercises(title: "Pike Push-Up",      musclesWorked:   "Anterior Delt Secondary: Triceps, Medial Delt")
        let exercise1 = Exercises(title: "Handstand Push-Up", musclesWorked:  "Anterior Delt Secondary: Triceps, Medial Delt")
        let exercise2 = Exercises(title: "Cable Front Raise", musclesWorked: "Anterior Delt")
        
        return [exercise0, exercise1, exercise2]
    }
    
    func createLateralShoulderArray() -> [Exercises] {
        let exercise0 = Exercises(title: "Lateral Shoulder",         musclesWorked: "A single set towards Lateral Deltoids")
        let exercise1 = Exercises(title: "Cable Lateral Raises",    musclesWorked: "Medial Deltoid")
        let exercise2 = Exercises(title: "Machine Lateral Raise",   musclesWorked: "Medial Deltoid")
        let exercise3 = Exercises(title: "Cheat Lateral Raise",     musclesWorked: "Medial Deltoid, Upper Trap")
        let exercise4 = Exercises(title: "Lateral Raise",           musclesWorked: "Medial Deltoid")
        
        return [exercise0, exercise1, exercise2, exercise3, exercise4]
    }
    
    func createBWLateralShoulderArray() -> [Exercises] {
        let exercise0 = Exercises(title: "Delt Rotating Plank",     musclesWorked:   "Medial Detoid")
        
        return [exercise0]
    }
    
    func createBackShoulderArray() -> [Exercises] {
        let exercise0 = Exercises(title: "Back Shoulder",               musclesWorked: "A single set towards Posterior Deltoids")
        let exercise1 = Exercises(title: "Barbell/Dumbbell High Rows",  musclesWorked: "Posterior Deltoid, Lower Trap")
        let exercise2 = Exercises(title: "Facepulls",                   musclesWorked: "Rotator Cuff, Lower Trap, Posterior Deltoid")
        let exercise3 = Exercises(title: "W's",                         musclesWorked: "Posterior Deltoid, Rotator Cuff, Lower Traps")
        let exercise4 = Exercises(title: "Reverse Pec Deck",             musclesWorked: "Lower Traps, Posterior Deltoid")
        
        return [exercise0, exercise1, exercise2, exercise3, exercise4]
    }
    
    func createBWBackShoulderArray() -> [Exercises] {
        let exercise0 = Exercises(title: "Floor T's",          musclesWorked:   "Posterior Deltoid")
        let exercise1 = Exercises(title: "Banded Pull Aparts", musclesWorked:  "Posterior Deltoid, Lower Traps")
        let exercise2 = Exercises(title: "Ring Facepulls",     musclesWorked: "Posterior Deltoid, Rotator Cuff, Lower Traps")
        let exercise3 = Exercises(title: "Angels of Death",    musclesWorked: "Spinal Erectors, Lower Traps, Posterior Deltoid")
        
        return [exercise0, exercise1, exercise2, exercise3]
    }
    
    func createRotatorCuffArray() -> [Exercises] {
        let exercise0 = Exercises(title: "Rotator Cuff",                     musclesWorked: "A single set towards Rotator Cuffs")
        let exercise1 = Exercises(title: "Cable External Rotation",          musclesWorked: "Rotator Cuff, Forearm Extensors")
        let exercise2 = Exercises(title: "Bench Dumbbell External Rotation", musclesWorked: "Rotator Cuff, Forearm Extensors")
        let exercise3 = Exercises(title: "W's",                              musclesWorked: "Rotator Cuff, Lower Trap, Posterior Deltoid")
        let exercise4 = Exercises(title: "Dumbbell High Pull",               musclesWorked: "Rotator Cuff, Lower Trap, Posterior Deltoid")
        let exercise5 = Exercises(title: "Facepulls",                        musclesWorked: "Rotator Cuff, Lower Trap, Posterior Deltoid")
        
        return [exercise0, exercise1, exercise2, exercise3, exercise4, exercise5]
    }
    
    func createBWRotatorCuffArray() -> [Exercises] {
        let exercise0 = Exercises(title: "Ring Facepull",            musclesWorked:   "Rotator Cuff, Lower Trap, Posterior Deltoid")
        let exercise1 = Exercises(title: "Banded External Rotation", musclesWorked:  "Rotator Cuff, Forearm Extensors")
        
        return [exercise0, exercise1]
    }
    
    func createTricepsArray() -> [Exercises] {
        let exercise0 = Exercises(title: "Triceps",                     musclesWorked: "One set towards Triceps")
        let exercise1 = Exercises(title: "Narrow Dip",                  musclesWorked: "Triceps: All Heads, Chest")
        let exercise2 = Exercises(title: "Incline Skullcrushers",       musclesWorked: "Triceps, Long Head")
        let exercise3 = Exercises(title: "California Press",            musclesWorked: "Triceps: All heads Secondary: Chest, Anterior Deltoid")
        let exercise4 = Exercises(title: "Cable Rope Pushdowns",        musclesWorked: "Triceps: Medial and Short Head")
        let exercise5 = Exercises(title: "V Bar Pushdowns",             musclesWorked: "Triceps: Medial and Short Head")
        let exercise6 = Exercises(title: "Close Grip Dumbbell Press",   musclesWorked: "Triceps Short and Medial Head Secondary: Chest, Anterior deltoid")
        let exercise7 = Exercises(title: "Rope Overhead Extension",     musclesWorked: "Triceps: Long Head")
        let exercise8 = Exercises(title: "Long Head Triceps Pushdowns", musclesWorked: "Triceps: Long Head")
        let exercise9 = Exercises(title: "Triceps Kickback",            musclesWorked: "Triceps: Short Head")
        let exercise10 = Exercises(title: "Triceps Extension",          musclesWorked: "Triceps: Short and Medial Head")
        
        return [exercise0, exercise1, exercise2, exercise3, exercise4, exercise5
                , exercise6, exercise7, exercise8, exercise9, exercise10]
    }
    
    func createBWTricepsArray() -> [Exercises] {
        let exercise0 = Exercises(title: "Narrow Pushup",     musclesWorked:   "Triceps: Short and Medial Head, Chest Secondary: Anterior Delts")
        let exercise1 = Exercises(title: "Ring Overhead Extension",    musclesWorked:  "Triceps: long head")
        let exercise2 = Exercises(title: "Bench Dip",   musclesWorked: "Triceps: All heads")
        
        return [exercise0, exercise1, exercise2]
    }
    
    func createQuadsArray() -> [Exercises] {
        let exercise0 = Exercises(title: "Quads",                            musclesWorked: "A single set towards Quads")
        let exercise1 = Exercises(title: "Squats",                           musclesWorked: "Quads, Erectors Secondary: Glutes, Transverse")
        let exercise2 = Exercises(title: "Cable Walkaways",                  musclesWorked: "Quads")
        let exercise3 = Exercises(title: "Banded Leg Press",                 musclesWorked: "Quads, Glutes Medius")
        let exercise4 = Exercises(title: "Leg Press",                        musclesWorked: "Quads")
        let exercise5 = Exercises(title: "Traditional Lunge",                musclesWorked: "Quads Secondary: Glute Medius")
        let exercise6 = Exercises(title: "Bulgarian Split Squat",            musclesWorked: "Quads Secondary: Glute Medius")
        let exercise7 = Exercises(title: "Explosive Bulgarian Split Squat", musclesWorked: "Quads Secondary: Glute Medius")
        let exercise8 = Exercises(title: "Pistol Squats",                    musclesWorked: "Quads, Glute Medius Secondary: Glutes")
        let exercise9 = Exercises(title: "Side Lunge",                       musclesWorked: "Quads Secondary: Glute Medius")
        
        return [exercise0, exercise1, exercise2, exercise3, exercise4, exercise5
                , exercise6, exercise7, exercise8, exercise9]
    }
    
    func createBWQuadsArray() -> [Exercises] {
        let exercise0 = Exercises(title: "Banded Lunges",        musclesWorked:   "Quads")
        let exercise1 = Exercises(title: "Bodyweight Squats",    musclesWorked:  "Quads Secondary: Glutes")
        let exercise2 = Exercises(title: "Wall Sit",             musclesWorked: "Quads Secondary: Glutes")
        let exercise3 = Exercises(title: "Lunges",               musclesWorked: "Quads Secondary: Glutes")
        
        return [exercise0, exercise1, exercise2, exercise3]
    }
    
    func createAbsArray() -> [Exercises] {
        let exercise0 = Exercises(title: "Abs",          musclesWorked: "A single set towards Abs")
        let exercise1 = Exercises(title: "Cable Crunch", musclesWorked: "Middle Abs Secondary: Transverse")
        
        let exercise2 = Exercises(title: "Machine Crunch", musclesWorked: "Middle Abs Secondary: Transverse")
        let exercise3 = Exercises(title: "Leg Raises",       musclesWorked:   "Abs Secondary: Transverse")
        let exercise4 = Exercises(title: "Ab Circles",       musclesWorked:  "Lower Abs, Obliques Secondary: Transverse")
        let exercise5 = Exercises(title: "Reverse Crunches", musclesWorked: "Lower Abs Secondary: Transverse")
        let exercise6 = Exercises(title: "Pulse Up",         musclesWorked: "Lower Abs Secondary: Transverse")
        let exercise7 = Exercises(title: "Band Crunch",      musclesWorked: "Middle Abs Secondary: Transverse")
        let exercise8 = Exercises(title: "V-Up",             musclesWorked: "Middle Abs Secondary: Transverse")
        
        return [exercise0, exercise1, exercise2, exercise3, exercise4, exercise5, exercise6, exercise7, exercise8]
    }
    
    
    func createObliquesArray() -> [Exercises] {
        let exercise0 = Exercises(title: "Obliques",                      musclesWorked: "A single set towards Obliques")
        let exercise1 = Exercises(title: "Neutral Wood Choppers",         musclesWorked: "Mid Obliques Secondary: Transverse")
        let exercise2 = Exercises(title: "Low to High Wood Choppers",     musclesWorked: "Upper and lower Obliques Secondary: Transverse")
        let exercise3 = Exercises(title: "High to Low Wood Choppers",     musclesWorked: "Upper and lower Obliques Secondary: Transverse")
        let exercise4 = Exercises(title: "Twisting Leg Raise",    musclesWorked:   "Obliques Secondary: Transverse, Lower Ab")
        let exercise5 = Exercises(title: "Leg Raise Scissors",    musclesWorked:  "Obliques, Abs Secondary: Transverse")
        let exercise6 = Exercises(title: "Elbow to Knee Tucks",   musclesWorked: "Obliques Secondary: Transverse, Middle ab")
        let exercise7 = Exercises(title: "Banded/Cable Step Out", musclesWorked: "Obliques Secondary: Transverse")
        let exercise8 = Exercises(title: "Rotating Plank",        musclesWorked: "Obliques Secondary: Transverse, Abs")
        let exercise9 = Exercises(title: "Elbow to Knee Plank",   musclesWorked: "Obliques Secondary: Transverse, Abs")
        let exercise10 = Exercises(title: "Twisting Pulse Up",     musclesWorked: "Obliques Secondary: Transverse, Abs")
        let exercise11 = Exercises(title: "X-Crunch",              musclesWorked: "Obliques Secondary: Transverse, Abs")
        
        return [exercise0, exercise1, exercise2, exercise3, exercise4, exercise5, exercise6, exercise7, exercise8, exercise9, exercise10, exercise11]
    }
    
    
    
    func createSerratusArray() -> [Exercises] {
        let exercise0 = Exercises(title: "Serratus Anterior",                musclesWorked: "One set towards Serratus")
        let exercise1 = Exercises(title: "Protracted Cable Crunch", musclesWorked: "Serratus Anterior, Abs Secondary: Transverse")
        let exercise2 = Exercises(title: "Banded/Cable Punches",   musclesWorked: "Serratus Anterior")
        
        return [exercise0, exercise1, exercise2]
    }
    
    func createBWSerratusArray() -> [Exercises] {
        let exercise0 = Exercises(title: "Plank Protraction",     musclesWorked:   "Serratus Anterior")
        let exercise1 = Exercises(title: "Protracted Rollout",    musclesWorked:  "Serratus Anterior, Abs Secondary: Transverse")
        
        
        return [exercise0, exercise1]
    }
    
    func createTransverseAbArray() -> [Exercises] {
        let exercise0 = Exercises(title: "Transverse Ab",                   musclesWorked: "A single set towards Transverse Ab")
        let exercise1 = Exercises(title: "Banded/Cable Resisted Rotation",  musclesWorked: "Transverse, Obliques")
        
        
        return [exercise0, exercise1]
    }
    
    func createBWTransverseAbArray() -> [Exercises] {
        let exercise0 = Exercises(title: "Vacuums",     musclesWorked:   "Transverse Abdominus")
        
        return [exercise0]
    }
    
    func createCalvesArray() -> [Exercises] {
        let exercise0 = Exercises(title: "Calves",                           musclesWorked: "A single set towards Calves")
        let exercise1 = Exercises(title: "Machine Standing Calf Raise",      musclesWorked: "Calves")
        let exercise2 = Exercises(title: "Straight Leg Machine Calf Raise",  musclesWorked: "Calves")
        let exercise3 = Exercises(title: "Seated Calf Raise",                musclesWorked: "Calves")
        let exercise4 = Exercises(title: "Donkey Calf Raise",                musclesWorked: "Calves")
        let exercise5 = Exercises(title: "Dumbbell/Plated Calf Raise",       musclesWorked: "Calves")
        
        return [exercise0, exercise1, exercise2, exercise3, exercise4, exercise5]
    }
    
    func createBWCalvesArray() -> [Exercises] {
        let exercise0 = Exercises(title: "Bodyweight Calf Raises",     musclesWorked:   "Calves")
        
        return [exercise0]
    }
    
    func createNeckArray() -> [Exercises] {
        let exercise0 = Exercises(title: "Neck",                    musclesWorked: "A single set towards Neck")
        let exercise1 = Exercises(title: "Plate Curl",              musclesWorked: "Neck Flexion")
        let exercise2 = Exercises(title: "Neck Harness Curl",       musclesWorked: "Neck Flexion")
        let exercise3 = Exercises(title: "Plated Neck Extension",   musclesWorked: "Neck Extension")
        let exercise4 = Exercises(title: "Harness Lateral Flexion", musclesWorked: "Lateral Flexion")
        let exercise5 = Exercises(title: "Suspended Neck Rotation", musclesWorked: "Neck Flexion and Rotation")
        let exercise6 = Exercises(title: "Neck Flexion",            musclesWorked: "Lateral and forward Flexion")
        
        return [exercise0, exercise1, exercise2, exercise3, exercise4, exercise5, exercise6]
    }
    
    func createBWNeckArray() -> [Exercises] {
        let exercise0 = Exercises(title: "Head Floats",     musclesWorked:   "Neck Flexion, Lateral Flexion or Extension")
        
        return [exercise0]
    }
    
    func createForearmExtensorsArray() -> [Exercises] {
        let exercise0 = Exercises(title: "Forearm Extensors",                 musclesWorked: "One set towards Forearm Extensors")
        let exercise1 = Exercises(title: "Standing Barbell Wrist Extension", musclesWorked: "Forearm Extensors")
        let exercise2 = Exercises(title: "Barbell Extension Rolls",          musclesWorked: "Forearm Extensors")
        let exercise3 = Exercises(title: "Reverse Curls",                    musclesWorked: "Forearm Extensors")
        
        return [exercise0, exercise1, exercise2, exercise3]
    }
    
    func createBWForearmExtensorsArray() -> [Exercises] {
        let exercise0 = Exercises(title: "Banded Wrist Extension",    musclesWorked:  "Forearm Extensors")
        
        return [exercise0]
    }
    
    func createUlnarForearmArray() -> [Exercises] {
        let exercise0 = Exercises(title: "Ulnar Forearm",          musclesWorked: "A single set towards Ulnar Forearm")
        let exercise1 = Exercises(title: "Rope Ulnar Deviation",   musclesWorked: "Ulnar Forearm")
        
        
        return [exercise0, exercise1]
    }
    
    func createBWUlnarForearmArray() -> [Exercises] {
        
        let exercise0 = Exercises(title: "Banded Ulnar Deviation", musclesWorked: "Ulnar Forearm")
        
        return [exercise0]
    }
    
    
    
    
    func createForearmFlexorsArray() -> [Exercises] {
        let exercise0 = Exercises(title: "Forearm Flexors",    musclesWorked: "A single set towards Forearm Flexors")
        let exercise1 = Exercises(title: "Prone Wrist Curls",  musclesWorked: "Forearm Flexors")
        let exercise2 = Exercises(title: "Wrist Flexed Curls", musclesWorked: "Biceps, Forearm Flexors")
        
        return [exercise0, exercise1, exercise2]
    }
    
    func createBWForearmFlexorsArray() -> [Exercises] {
        
        let exercise0 = Exercises(title: "Banded Wrist Curls", musclesWorked: "Forearm Flexors")
        
        return [exercise0]
    }
    
    func createRadialForearmArray() -> [Exercises] {
        let exercise0 = Exercises(title: "Radial Forearm",             musclesWorked: "A single set towards Radial Forearm")
        let exercise1 = Exercises(title: "Rope Radial Deviation",      musclesWorked: "Radial Forearm")
        let exercise2 = Exercises(title: "Hammer/Crossbody Curls",     musclesWorked: "Biceps, Brachialis, Radial Forearm")
        
        let exercise3 = Exercises(title: "Re-racking your plates",     musclesWorked: "Radial Forearm, put ur plates back please")
        
        return [exercise0, exercise1, exercise2, exercise3]
    }
    
    func createBWRadialForearmArray() -> [Exercises] {
        
        let exercise0 = Exercises(title: "Banded Radial Deviation",    musclesWorked: "Radial Forearm")
        
        
        return [exercise0]
    }
    func createSpinalErectorsArray() -> [Exercises] {
        let exercise0 = Exercises(title: "Spinal Erectors",            musclesWorked: "One set towards SpinalErectors")
        let exercise1 = Exercises(title: "Hyperextension",             musclesWorked: "Spinal Erector")
        let exercise2 = Exercises(title: "Machine Erector Extension",  musclesWorked: "Spinal Erector")
        let exercise3 = Exercises(title: "Deadlift",                   musclesWorked: "Spinal Erector Secondary: Glutes, Hamstrings")
        let exercise4 = Exercises(title: "Squats",                     musclesWorked: "Quads, Spinal Erector Secondary: Glutes, Hamstrings")
        
        
        return [exercise0, exercise1, exercise2, exercise3, exercise4]
    }
    
    func createBWSpinalErectorsArray() -> [Exercises] {
        
        let exercise0 = Exercises(title: "Frog Pumps",                 musclesWorked: "Spinal Erectors, Glute Medius")
        let exercise1 = Exercises(title: "Angels of Death",            musclesWorked: "Spinal Erectors, Lower Traps, Post Delt")
        let exercise2 = Exercises(title: "Marching Bridge",            musclesWorked: "Spinal Erector, Glutes")
        let exercise3 = Exercises(title: "Reverse Hyperextension",     musclesWorked: "Spinal Erector Secondary: Glutes, Hamstring")
        
        return [exercise0, exercise1, exercise2, exercise3]
    }
    
    func createUpperTrapsArray() -> [Exercises] {
        let exercise0 = Exercises(title: "Upper Traps",      musclesWorked: "A single set towards Upper Traps")
        let exercise1 = Exercises(title: "Dumbell Shrugs",   musclesWorked: "Upper Trap")
        let exercise2 = Exercises(title: "Trap Bar Shrugs",  musclesWorked: "Upper Trap")
        let exercise3 = Exercises(title: "Farmer Walk",     musclesWorked: "Upper Trap")
        
        return [exercise0, exercise1, exercise2, exercise3]
    }
    
    func createBWUpperTrapsArray() -> [Exercises] {
        let exercise0 = Exercises(title: "Trap Pushaway",      musclesWorked:   "Upper Traps")
        let exercise1 = Exercises(title: "Inverted Y",         musclesWorked:  "Upper and Lower Traps")
        
        return [exercise0, exercise1]
    }
    
    func createLowerTrapsArray() -> [Exercises] {
        let exercise0 = Exercises(title: "Lower Traps",      musclesWorked: "A single set towards Lower Traps")
        let exercise1 = Exercises(title: "Y Raise",          musclesWorked: "Lower Traps")
        let exercise2 = Exercises(title: "Reverse Pec Deck", musclesWorked: "Lower Traps, Post Delt")
        let exercise3 = Exercises(title: "W's",              musclesWorked: "Rotator Cuff, Lower Trap, Post Delt")
        let exercise4 = Exercises(title: "Facepulls",        musclesWorked: "Rotator Cuff, Lower Trap, Post Delt")
        
        return [exercise0, exercise1, exercise2, exercise3, exercise4]
    }
    
    func createBWLowerTrapsArray() -> [Exercises] {
        let exercise0 = Exercises(title: "Ring Facepull",                     musclesWorked:   "Rotator Cuff, Lower Trap, Posterior Deltoid")
        let exercise1 = Exercises(title: "Hanging/Cable Scapular Retraction",        musclesWorked:  "Lower Traps")
        let exercise2 = Exercises(title: "Inverted Y",                         musclesWorked: "Upper and Lower Traps")
        let exercise3 = Exercises(title: "Angels of Death",                    musclesWorked: "Spinal Erectors, Lower Traps, Post Delt")
        let exercise4 = Exercises(title: "Floor/Dip Bar Scapular Depression", musclesWorked: "Lower Traps")
        
        return [exercise0, exercise1, exercise2, exercise3, exercise4]
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

extension ChestListViewController: ExercisesTableViewCellDelegate {
    func didTapAddSet(title: String) {
        
        //ADD CODE TO OPEN ADD SET WINDOW FOR PROPER EXERCISE
        //Each else bracket identifies the exercise that was click and stores its corersponding volume into variable in the format musclegroupTally. I tried abstracting a function but failed sorry future self/ coders
        // TODO
        let chestPressList = ["Bench Press", "Dumbell Bench Press", "Machine Chest Press", "Neutral Cable Press", "Push-Ups"]
        let inclineChestPressList = ["Incline Bench Press", "Incline Dumbell Bench Press", "Incline Machine Chest Press", "Incline Cable Press"]
        let declineChestPressList = ["Decline Bench Press", "Decline Dumbell Bench Press",  "Decline Cable Press"]
        let chestIsolation = ["Chest", "Neutral Crossover Flyes", "Incline Crossover Flyes", "Decline Crossover Flyes", "Chest", "Banded Fly"]
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
        
        
        //Below are the alerts that will Input Set Information, sets, and reps.
        //TODO make arrays that will store titke, datrem, reps, and set each in  one arrays
        
        //-----------------------to be inserted I will probably have to download array from defaults, append to it, then save it
        /* self.defaults.set(title, forKey: Save.chestTally)
         var exTitleHist          = defaults.object(forKey: Save.exTitleHist) as? [String]
         var dateHist       = defaults.object(forKey: Save.dateHist) as? [String]
         var weightTxts   = defaults.object(forKey: Save.weightTxts) as? [String]
         var repsTxts       = defaults.object(forKey: Save.repsTxts) as? [String]
         var volumeTxts = defaults.object(forKey: Save.volumeTxts) as? [String]
         //----------------------*/
        if (chestIsolation.contains(title)){
            //  1. Create the alert controller.
            let alert = UIAlertController(title: "Input Set Information", message: "Input amount of sets performed. Accounts for all muscle groups in the exercise. 1 set for primary movers, 1/2 for secondary movers. Optional (*) fields are saved under history.", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                //CAST SETS REPS AND WEIGHT STRING INPUT TO FLOATS
                //SETS
                let sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var chestTallyFloat:Float? = Float(sets?.text ?? "0")
                chestTallyFloat = (chestTallyFloat ?? 0)
                self.defaults.set(chestTallyFloat, forKey: Save.chestTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![1] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.weightTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
                self.goToVolumeTracker()
                
                
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                action in
                // Called when user taps outside
            }))
            
            // 4. Present the alert.
            self.present(alert, animated: true, completion: nil)
            
            
            
        } else if (neckIsolation.contains(title)){
            //  1. Create the alert controller.
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                //CAST STRING INPUT TO FLOAT
                let sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var neckTallyFloat:Float? = Float(sets?.text ?? "0")
                neckTallyFloat = (neckTallyFloat ?? 0)
                self.defaults.set(neckTallyFloat, forKey: Save.neckTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                //CAST STRING INPUT TO FLOAT
                let sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var chestTallyFloat:Float? = Float(sets?.text ?? "0")
                chestTallyFloat = (chestTallyFloat ?? 0)
                self.defaults.set(chestTallyFloat, forKey: Save.chestTally)
                var tricepTallyFloat:Float? = Float(sets?.text ?? "0")
                tricepTallyFloat = (chestTallyFloat ?? 0) / 2
                self.defaults.set(tricepTallyFloat, forKey: Save.tricepsTally)
                var frontShoulderTallyFloat:Float? = Float(sets?.text ?? "0")
                frontShoulderTallyFloat = (chestTallyFloat ?? 0) / 2
                self.defaults.set(frontShoulderTallyFloat, forKey: Save.frontShoulderTally)
                var serratusTallyFloat:Float? = Float(sets?.text ?? "0")
                serratusTallyFloat = (serratusTallyFloat ?? 0) / 2
                self.defaults.set(serratusTallyFloat, forKey: Save.serratusTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                //CAST STRING INPUT TO FLOAT
                let sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var chestTallyFloat:Float? = Float(sets?.text ?? "0")
                chestTallyFloat = (chestTallyFloat ?? 0)
                self.defaults.set(chestTallyFloat, forKey: Save.chestTally)
                var tricepTallyFloat:Float? = Float(sets?.text ?? "0")
                tricepTallyFloat = (chestTallyFloat ?? 0) / 2
                self.defaults.set(tricepTallyFloat, forKey: Save.tricepsTally)
                let frontShoulderTallyFloat:Float? = Float(sets?.text ?? "0")
                self.defaults.set(frontShoulderTallyFloat, forKey: Save.frontShoulderTally)
                var serratusTallyFloat:Float? = Float(sets?.text ?? "0")
                serratusTallyFloat = (serratusTallyFloat ?? 0) / 2
                self.defaults.set(serratusTallyFloat, forKey: Save.serratusTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                //CAST STRING INPUT TO FLOAT
                let sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var chestTallyFloat:Float? = Float(sets?.text ?? "0")
                chestTallyFloat = (chestTallyFloat ?? 0)
                self.defaults.set(chestTallyFloat, forKey: Save.chestTally)
                var tricepTallyFloat:Float? = Float(sets?.text ?? "0")
                tricepTallyFloat = (chestTallyFloat ?? 0) / 2
                self.defaults.set(tricepTallyFloat, forKey: Save.tricepsTally)
                var serratusTallyFloat:Float? = Float(sets?.text ?? "0")
                serratusTallyFloat = (serratusTallyFloat ?? 0) / 2
                self.defaults.set(serratusTallyFloat, forKey: Save.serratusTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                //CAST STRING INPUT TO FLOAT
                let sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var upperTrapsTallyFloat:Float? = Float(sets?.text ?? "0")
                upperTrapsTallyFloat = (upperTrapsTallyFloat ?? 0)
                self.defaults.set(upperTrapsTallyFloat, forKey: Save.upperTrapsTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                //CAST STRING INPUT TO FLOAT
                let sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var lowerTrapsTallyFloat:Float? = Float(sets?.text ?? "0")
                lowerTrapsTallyFloat = (lowerTrapsTallyFloat ?? 0)
                self.defaults.set(lowerTrapsTallyFloat, forKey: Save.lowerTrapsTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                //CAST STRING INPUT TO FLOAT
                let sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var rotatorCuffTallyFloat:Float? = Float(sets?.text ?? "0")
                rotatorCuffTallyFloat = (rotatorCuffTallyFloat ?? 0)
                self.defaults.set(rotatorCuffTallyFloat, forKey:
                                    Save.rotatorCuffTally)
                
                var backShoulderTallyFloat:Float? = Float(sets?.text ?? "0")
                backShoulderTallyFloat = (backShoulderTallyFloat ?? 0)
                self.defaults.set(backShoulderTallyFloat, forKey:
                                    Save.backShoulderTally)
                
                var lowerTrapsTallyFloat:Float? = Float(sets?.text ?? "0")
                lowerTrapsTallyFloat = (lowerTrapsTallyFloat ?? 0)
                self.defaults.set(lowerTrapsTallyFloat, forKey:
                                    Save.lowerTrapsTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                //CAST STRING INPUT TO FLOAT
                let sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var backShoulderTallyFloat:Float? = Float(sets?.text ?? "0")
                backShoulderTallyFloat = (backShoulderTallyFloat ?? 0)
                self.defaults.set(backShoulderTallyFloat, forKey: Save.backShoulderTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                //CAST STRING INPUT TO FLOAT
                let  sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var backShoulderTallyFloat:Float? = Float(sets?.text ?? "0")
                backShoulderTallyFloat = (backShoulderTallyFloat ?? 0)
                self.defaults.set(backShoulderTallyFloat, forKey: Save.backShoulderTally)
                var lowerTrapTallyFloat:Float? = Float(sets?.text ?? "0")
                lowerTrapTallyFloat = (lowerTrapTallyFloat ?? 0)
                self.defaults.set(lowerTrapTallyFloat, forKey: Save.lowerTrapsTally)
                
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                //CAST STRING INPUT TO FLOAT
                let sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var lateralShoulderTallyFloat:Float? = Float(sets?.text ?? "0")
                lateralShoulderTallyFloat = (lateralShoulderTallyFloat ?? 0)
                self.defaults.set(lateralShoulderTallyFloat, forKey: Save.lateralShoulderTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                //CAST STRING INPUT TO FLOAT
                let sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var frontShoulderTallyFloat:Float? = Float(sets?.text ?? "0")
                frontShoulderTallyFloat = (frontShoulderTallyFloat ?? 0)
                self.defaults.set(frontShoulderTallyFloat, forKey: Save.frontShoulderTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                //CAST STRING INPUT TO FLOAT
                let sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var frontShoulderTallyFloat:Float? = Float(sets?.text ?? "0")
                frontShoulderTallyFloat = (frontShoulderTallyFloat ?? 0)
                self.defaults.set(frontShoulderTallyFloat, forKey:
                                    Save.frontShoulderTally)
                var tricepsTallyFloat:Float? = Float(sets?.text ?? "0")
                tricepsTallyFloat = (tricepsTallyFloat ?? 0)
                self.defaults.set(tricepsTallyFloat, forKey:
                                    Save.tricepsTally)
                var lateralShoulderTallyFloat:Float? = Float(sets?.text ?? "0")
                lateralShoulderTallyFloat = (lateralShoulderTallyFloat ?? 0)
                self.defaults.set(lateralShoulderTallyFloat, forKey:
                                    Save.lateralShoulderTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                //CAST STRING INPUT TO FLOAT
                let sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var rotatorCuffTallyFloat:Float? = Float(sets?.text ?? "0")
                rotatorCuffTallyFloat = (rotatorCuffTallyFloat ?? 0)
                self.defaults.set(rotatorCuffTallyFloat, forKey: Save.rotatorCuffTally)
                var forearmExtensorsTallyFloat:Float? = Float(sets?.text ?? "0")
                forearmExtensorsTallyFloat = (forearmExtensorsTallyFloat ?? 0)
                self.defaults.set(forearmExtensorsTallyFloat, forKey: Save.forearmExtensorsTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                //CAST STRING INPUT TO FLOAT
                let sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var tricepsTallyFloat:Float? = Float(sets?.text ?? "0")
                tricepsTallyFloat = (tricepsTallyFloat ?? 0)
                self.defaults.set(tricepsTallyFloat, forKey: Save.tricepsTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                //CAST STRING INPUT TO FLOAT
                let sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var tricepsTallyFloat:Float? = Float(sets?.text ?? "0")
                tricepsTallyFloat = (tricepsTallyFloat ?? 0)
                self.defaults.set(tricepsTallyFloat, forKey: Save.tricepsTally)
                
                var chestTallyFloat:Float? = Float(sets?.text ?? "0")
                chestTallyFloat = (chestTallyFloat ?? 0)
                chestTallyFloat = (chestTallyFloat ?? 0) / 2
                self.defaults.set(chestTallyFloat, forKey: Save.chestTally)
                
                var frontShoulderTallyFloat:Float? = Float(sets?.text ?? "0")
                frontShoulderTallyFloat = (frontShoulderTallyFloat ?? 0)
                frontShoulderTallyFloat = (frontShoulderTallyFloat ?? 0) / 2
                self.defaults.set(frontShoulderTallyFloat, forKey: Save.frontShoulderTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                //CAST STRING INPUT TO FLOAT
                let sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var calvesTallyFloat:Float? = Float(sets?.text ?? "0")
                calvesTallyFloat = (calvesTallyFloat ?? 0)
                self.defaults.set(calvesTallyFloat, forKey: Save.calvesTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                //CAST STRING INPUT TO FLOAT
                
                let sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var ulnarForearmTallyFloat:Float? = Float(sets?.text ?? "0")
                ulnarForearmTallyFloat = (ulnarForearmTallyFloat ?? 0)
                self.defaults.set(ulnarForearmTallyFloat, forKey: Save.ulnarForearmTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                //CAST STRING INPUT TO FLOAT
                let  sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var forearmExtensorsTallyFloat:Float? = Float( sets?.text ?? "0")
                forearmExtensorsTallyFloat = (forearmExtensorsTallyFloat ?? 0)
                self.defaults.set(forearmExtensorsTallyFloat, forKey: Save.forearmExtensorsTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                
                //CAST STRING INPUT TO FLOAT
                let sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var forearmFlexorsTallyFloat:Float? = Float(sets?.text ?? "0")
                forearmFlexorsTallyFloat = (forearmFlexorsTallyFloat ?? 0)
                self.defaults.set(forearmFlexorsTallyFloat, forKey: Save.forearmFlexorsTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                
                //CAST STRING INPUT TO FLOAT
                let sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var radialForearmTallyFloat:Float? = Float(sets?.text ?? "0")
                radialForearmTallyFloat = (radialForearmTallyFloat ?? 0)
                self.defaults.set(radialForearmTallyFloat, forKey: Save.radialForearmTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                //CAST STRING INPUT TO FLOAT
                let sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var latsTallyFloat:Float? = Float(sets?.text ?? "0")
                latsTallyFloat = (latsTallyFloat ?? 0)
                self.defaults.set(latsTallyFloat, forKey: Save.latsTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                
                //CAST STRING INPUT TO FLOAT
                let sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var latsTallyFloat:Float? = Float(sets?.text ?? "0")
                latsTallyFloat = (latsTallyFloat ?? 0)
                self.defaults.set(latsTallyFloat, forKey: Save.latsTally)
                
                var tricepsTallyFloat:Float? = Float(sets?.text ?? "0")
                tricepsTallyFloat = (tricepsTallyFloat ?? 0)
                self.defaults.set(tricepsTallyFloat, forKey: Save.tricepsTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
           
            
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
                self.goToVolumeTracker()
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                action in
                // Called when user taps outside
            }))
            // 4. Present the alert.
            self.present(alert, animated: true, completion: nil)
            
            //COMPLETE VERSION
        }  else if (latLowerTrapList.contains(title)){
            
            //  1. Create the alert controller.
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                //CAST STRING INPUT TO FLOAT
                
                let sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var latsTallyFloat:Float? = Float(sets?.text ?? "0")
                latsTallyFloat = (latsTallyFloat ?? 0)
                self.defaults.set(latsTallyFloat, forKey: Save.latsTally)
                
                var lowerTrapsTallyFloat:Float? = Float(sets?.text ?? "0")
                lowerTrapsTallyFloat = (lowerTrapsTallyFloat ?? 0)
                self.defaults.set(lowerTrapsTallyFloat, forKey: Save.lowerTrapsTally)
                
                var backShoulderTallyFloat:Float? = Float(sets?.text ?? "0")
                backShoulderTallyFloat = (backShoulderTallyFloat ?? 0) / 2
                self.defaults.set(backShoulderTallyFloat, forKey: Save.backShoulderTally)
                
                var bicepsTallyFloat:Float? = Float(sets?.text ?? "0")
                bicepsTallyFloat = (bicepsTallyFloat ?? 0) / 2
                self.defaults.set(bicepsTallyFloat, forKey: Save.bicepsTally)
                
                var forearmFlexorsTallyFloat:Float? = Float(sets?.text ?? "0")
                forearmFlexorsTallyFloat = (forearmFlexorsTallyFloat ?? 0) / 2
                self.defaults.set(forearmFlexorsTallyFloat, forKey: Save.forearmFlexorsTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    //__________Reaplace from here_____________
                    print("Weight stored: " +  weightString!)
                }
                
    
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                //CAST STRING INPUT TO FLOAT
                let sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var latsTallyFloat:Float? = Float(sets?.text ?? "0")
                latsTallyFloat = (latsTallyFloat ?? 0)
                self.defaults.set(latsTallyFloat, forKey: Save.latsTally)
                
                var erectorsTallyFloat:Float? = Float(sets?.text ?? "0")
                erectorsTallyFloat = (erectorsTallyFloat ?? 0)
                self.defaults.set(erectorsTallyFloat, forKey: Save.spinalErectorsTally)
                
                var lowerTrapsTallyFloat:Float? = Float(sets?.text ?? "0")
                lowerTrapsTallyFloat = (lowerTrapsTallyFloat ?? 0)
                self.defaults.set(lowerTrapsTallyFloat, forKey: Save.lowerTrapsTally)
                
                var backShoulderTallyFloat:Float? = Float(sets?.text ?? "0")
                backShoulderTallyFloat = (backShoulderTallyFloat ?? 0) / 2
                self.defaults.set(backShoulderTallyFloat, forKey: Save.backShoulderTally)
                
                var bicepsTallyFloat:Float? = Float(sets?.text ?? "0")
                bicepsTallyFloat = (bicepsTallyFloat ?? 0) / 2
                self.defaults.set(bicepsTallyFloat, forKey: Save.bicepsTally)
                
                var forearmFlexorsTallyFloat:Float? = Float(sets?.text ?? "0")
                forearmFlexorsTallyFloat = (forearmFlexorsTallyFloat ?? 0) / 2
                self.defaults.set(forearmFlexorsTallyFloat, forKey: Save.forearmFlexorsTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                //CAST STRING INPUT TO FLOAT
                let  sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var erectorsTallyFloat:Float? = Float( sets?.text ?? "0")
                erectorsTallyFloat = (erectorsTallyFloat ?? 0)
                self.defaults.set(erectorsTallyFloat, forKey: Save.spinalErectorsTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                
                
                //CAST STRING INPUT TO FLOAT
                let  sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var glutesTallyFloat:Float? = Float( sets?.text ?? "0")
                glutesTallyFloat = (glutesTallyFloat ?? 0)
                self.defaults.set(glutesTallyFloat, forKey: Save.glutesTally)
                
                var gluteMediusTallyFloat:Float? = Float( sets?.text ?? "0")
                gluteMediusTallyFloat = (gluteMediusTallyFloat ?? 0)
                self.defaults.set(gluteMediusTallyFloat, forKey: Save.gluteMediusTally)
                
                var hamstringsTallyFloat:Float? = Float( sets?.text ?? "0")
                hamstringsTallyFloat = (hamstringsTallyFloat ?? 0) / 2
                self.defaults.set(hamstringsTallyFloat, forKey: Save.hamstringsTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                //CAST STRING INPUT TO FLOAT
                let  sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var glutesTallyFloat:Float? = Float( sets?.text ?? "0")
                glutesTallyFloat = (glutesTallyFloat ?? 0)
                self.defaults.set(glutesTallyFloat, forKey: Save.glutesTally)
                
                var gluteMediusTallyFloat:Float? = Float( sets?.text ?? "0")
                gluteMediusTallyFloat = (gluteMediusTallyFloat ?? 0) / 2
                self.defaults.set(gluteMediusTallyFloat, forKey: Save.gluteMediusTally)
                
                var hamstringsTallyFloat:Float? = Float( sets?.text ?? "0")
                hamstringsTallyFloat = (hamstringsTallyFloat ?? 0) / 2
                self.defaults.set(hamstringsTallyFloat, forKey: Save.hamstringsTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                //CAST STRING INPUT TO FLOAT
                let  sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var lowerTrapsTallyFloat:Float? = Float(sets?.text ?? "0")
                lowerTrapsTallyFloat = (lowerTrapsTallyFloat ?? 0)
                self.defaults.set(lowerTrapsTallyFloat, forKey: Save.lowerTrapsTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                
                //CAST STRING INPUT TO FLOAT
                let  sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var gluteMediusTallyFloat:Float? = Float( sets?.text ?? "0")
                gluteMediusTallyFloat = (gluteMediusTallyFloat ?? 0)
                self.defaults.set(gluteMediusTallyFloat, forKey: Save.gluteMediusTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                
                //CAST STRING INPUT TO FLOAT
                let  sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var hamstringsTallyFloat:Float? = Float( sets?.text ?? "0")
                hamstringsTallyFloat = (hamstringsTallyFloat ?? 0)
                self.defaults.set(hamstringsTallyFloat, forKey: Save.hamstringsTally)
                
                var glutesTallyFloat:Float? = Float( sets?.text ?? "0")
                glutesTallyFloat = (glutesTallyFloat ?? 0) / 2
                self.defaults.set(glutesTallyFloat, forKey: Save.glutesTally)
                
                var erectorsTallyFloat:Float? = Float( sets?.text ?? "0")
                erectorsTallyFloat = (erectorsTallyFloat ?? 0) / 2
                self.defaults.set(erectorsTallyFloat, forKey: Save.spinalErectorsTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                
                //CAST STRING INPUT TO FLOAT
                let  sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var hamstringsTallyFloat:Float? = Float( sets?.text ?? "0")
                hamstringsTallyFloat = (hamstringsTallyFloat ?? 0)
                self.defaults.set(hamstringsTallyFloat, forKey: Save.hamstringsTally)
                
                var glutesTallyFloat:Float? = Float( sets?.text ?? "0")
                glutesTallyFloat = (glutesTallyFloat ?? 0) / 2
                self.defaults.set(glutesTallyFloat, forKey: Save.glutesTally)
                
                var erectorsTallyFloat:Float? = Float( sets?.text ?? "0")
                erectorsTallyFloat = (erectorsTallyFloat ?? 0) / 2
                self.defaults.set(erectorsTallyFloat, forKey: Save.spinalErectorsTally)
                
                var gluteMediusTallyFloat:Float? = Float( sets?.text ?? "0")
                gluteMediusTallyFloat = (gluteMediusTallyFloat ?? 0)
                self.defaults.set(gluteMediusTallyFloat, forKey: Save.gluteMediusTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                
                //CAST STRING INPUT TO FLOAT
                let  sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var bicepsTallyFloat:Float? = Float( sets?.text ?? "0")
                bicepsTallyFloat = (bicepsTallyFloat ?? 0)
                self.defaults.set(bicepsTallyFloat, forKey: Save.bicepsTally)
                
                var forearmFlexorsTallyFloat:Float? = Float( sets?.text ?? "0")
                forearmFlexorsTallyFloat = (forearmFlexorsTallyFloat ?? 0)
                self.defaults.set(forearmFlexorsTallyFloat, forKey: Save.forearmFlexorsTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                
                //CAST STRING INPUT TO FLOAT
                let  sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var bicepsTallyFloat:Float? = Float( sets?.text ?? "0")
                bicepsTallyFloat = (bicepsTallyFloat ?? 0)
                self.defaults.set(bicepsTallyFloat, forKey: Save.bicepsTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                
                //CAST STRING INPUT TO FLOAT
                let  sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var serratusTallyFloat:Float? = Float( sets?.text ?? "0")
                serratusTallyFloat = (serratusTallyFloat ?? 0)
                self.defaults.set(serratusTallyFloat, forKey: Save.serratusTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                
                //CAST STRING INPUT TO FLOAT
                let  sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var serratusTallyFloat:Float? = Float( sets?.text ?? "0")
                serratusTallyFloat = (serratusTallyFloat ?? 0)
                self.defaults.set(serratusTallyFloat, forKey: Save.serratusTally)
                
                var absTallyFloat:Float? = Float( sets?.text ?? "0")
                absTallyFloat = (absTallyFloat ?? 0)
                self.defaults.set(absTallyFloat, forKey: Save.absTally)
                
                var transverseAbTallyFloat:Float? = Float( sets?.text ?? "0")
                transverseAbTallyFloat = (transverseAbTallyFloat ?? 0) / 2
                self.defaults.set(transverseAbTallyFloat, forKey: Save.transverseAbTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                
                //CAST STRING INPUT TO FLOAT
                let  sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var absTallyFloat:Float? = Float( sets?.text ?? "0")
                absTallyFloat = (absTallyFloat ?? 0)
                self.defaults.set(absTallyFloat, forKey: Save.absTally)
                
                var transverseAbTallyFloat:Float? = Float( sets?.text ?? "0")
                transverseAbTallyFloat = (transverseAbTallyFloat ?? 0)
                self.defaults.set(transverseAbTallyFloat, forKey: Save.transverseAbTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                
                //CAST STRING INPUT TO FLOAT
                
                let  sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var obliquesTallyFloat:Float? = Float( sets?.text ?? "0")
                obliquesTallyFloat = (obliquesTallyFloat ?? 0)
                self.defaults.set(obliquesTallyFloat, forKey: Save.obliquesTally)
                
                
                var transverseAbTallyFloat:Float? = Float( sets?.text ?? "0")
                transverseAbTallyFloat = (transverseAbTallyFloat ?? 0)
                self.defaults.set(transverseAbTallyFloat, forKey: Save.transverseAbTally)
                
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                
                //CAST STRING INPUT TO FLOAT
                let  sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var obliquesTallyFloat:Float? = Float( sets?.text ?? "0")
                obliquesTallyFloat = (obliquesTallyFloat ?? 0)
                self.defaults.set(obliquesTallyFloat, forKey: Save.obliquesTally)
                
                var transverseAbTallyFloat:Float? = Float( sets?.text ?? "0")
                transverseAbTallyFloat = (transverseAbTallyFloat ?? 0) / 2
                self.defaults.set(transverseAbTallyFloat, forKey: Save.transverseAbTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                
                //CAST STRING INPUT TO FLOAT
                let  sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var transverseAbTallyFloat:Float? = Float( sets?.text ?? "0")
                transverseAbTallyFloat = (transverseAbTallyFloat ?? 0)
                self.defaults.set(transverseAbTallyFloat, forKey: Save.transverseAbTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                
                //CAST STRING INPUT TO FLOAT
                let  sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var quadsTallyFloat:Float? = Float( sets?.text ?? "0")
                quadsTallyFloat = (quadsTallyFloat ?? 0)
                self.defaults.set(quadsTallyFloat, forKey: Save.quadsTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                
                //CAST STRING INPUT TO FLOAT
                let  sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var gluteMediusTallyFloat:Float? = Float( sets?.text ?? "0")
                gluteMediusTallyFloat = (gluteMediusTallyFloat ?? 0)
                self.defaults.set(gluteMediusTallyFloat, forKey: Save.gluteMediusTally)
                
                var quadsTallyFloat:Float? = Float( sets?.text ?? "0")
                quadsTallyFloat = (quadsTallyFloat ?? 0)
                self.defaults.set(quadsTallyFloat, forKey: Save.quadsTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                
                //CAST STRING INPUT TO FLOAT
                let  sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var gluteMediusTallyFloat:Float? = Float( sets?.text ?? "0")
                gluteMediusTallyFloat = (gluteMediusTallyFloat ?? 0)
                self.defaults.set(gluteMediusTallyFloat, forKey: Save.gluteMediusTally)
                
                var quadsTallyFloat:Float? = Float( sets?.text ?? "0")
                quadsTallyFloat = (quadsTallyFloat ?? 0) / 2
                self.defaults.set(quadsTallyFloat, forKey: Save.quadsTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                
                //CAST STRING INPUT TO FLOAT
                let sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var chestTallyFloat:Float? = Float(sets?.text ?? "0")
                chestTallyFloat = (chestTallyFloat ?? 0)
                self.defaults.set(chestTallyFloat, forKey: Save.chestTally)
                
                var tricepsTallyFloat:Float? = Float(sets?.text ?? "0")
                tricepsTallyFloat = (tricepsTallyFloat ?? 0)
                self.defaults.set(tricepsTallyFloat, forKey: Save.tricepsTally)
                
                var latsTallyFloat:Float? = Float(sets?.text ?? "0")
                latsTallyFloat = (latsTallyFloat ?? 0) / 2
                self.defaults.set(latsTallyFloat, forKey: Save.latsTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                
                //CAST STRING INPUT TO FLOAT
                let sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var chestTallyFloat:Float? = Float(sets?.text ?? "0")
                chestTallyFloat = (chestTallyFloat ?? 0)
                self.defaults.set(chestTallyFloat, forKey: Save.chestTally)
                
                var tricepsTallyFloat:Float? = Float(sets?.text ?? "0")
                tricepsTallyFloat = (tricepsTallyFloat ?? 0)
                self.defaults.set(tricepsTallyFloat, forKey: Save.tricepsTally)
                
                var frontShoulderTallyFloat:Float? = Float( sets?.text ?? "0")
                frontShoulderTallyFloat = (frontShoulderTallyFloat ?? 0)
                self.defaults.set(frontShoulderTallyFloat, forKey: Save.frontShoulderTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                
                //CAST STRING INPUT TO FLOAT
                let  sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var glutesTallyFloat:Float? = Float( sets?.text ?? "0")
                glutesTallyFloat = (glutesTallyFloat ?? 0)
                self.defaults.set(glutesTallyFloat, forKey: Save.glutesTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                
                //CAST STRING INPUT TO FLOAT
                let sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var upperTrapsTallyFloat:Float? = Float(sets?.text ?? "0")
                upperTrapsTallyFloat = (upperTrapsTallyFloat ?? 0)
                self.defaults.set(upperTrapsTallyFloat, forKey: Save.upperTrapsTally)
                
                var lowerTrapsTallyFloat:Float? = Float( sets?.text ?? "0")
                lowerTrapsTallyFloat = (lowerTrapsTallyFloat ?? 0)
                self.defaults.set(lowerTrapsTallyFloat, forKey: Save.lowerTrapsTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                
                //CAST STRING INPUT TO FLOAT
                let  sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var spinalErectorsTallyFloat:Float? = Float( sets?.text ?? "0")
                spinalErectorsTallyFloat = (spinalErectorsTallyFloat ?? 0)
                self.defaults.set(spinalErectorsTallyFloat, forKey: Save.spinalErectorsTally)
                
                var lowerTrapsTallyFloat:Float? = Float( sets?.text ?? "0")
                lowerTrapsTallyFloat = (lowerTrapsTallyFloat ?? 0)
                self.defaults.set(lowerTrapsTallyFloat, forKey: Save.lowerTrapsTally)
                
                var backShoulderTallyFloat:Float? = Float( sets?.text ?? "0")
                backShoulderTallyFloat = (backShoulderTallyFloat ?? 0)
                self.defaults.set(backShoulderTallyFloat, forKey: Save.backShoulderTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                
                //CAST STRING INPUT TO FLOAT
                let  sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var rotatorCuffTallyFloat:Float? = Float( sets?.text ?? "0")
                rotatorCuffTallyFloat = (rotatorCuffTallyFloat ?? 0)
                self.defaults.set(rotatorCuffTallyFloat, forKey: Save.rotatorCuffTally)
                
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                
                //CAST STRING INPUT TO FLOAT
                let sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var tricepsTallyFloat:Float? = Float(sets?.text ?? "0")
                tricepsTallyFloat = (tricepsTallyFloat ?? 0)
                self.defaults.set(tricepsTallyFloat, forKey: Save.tricepsTally)
                
                var chestTallyFloat:Float? = Float(sets?.text ?? "0")
                chestTallyFloat = (chestTallyFloat ?? 0)
                self.defaults.set(chestTallyFloat, forKey: Save.chestTally)
                
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                
                //CAST STRING INPUT TO FLOAT
                let  sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var hamstringsTallyFloat:Float? = Float( sets?.text ?? "0")
                hamstringsTallyFloat = (hamstringsTallyFloat ?? 0)
                self.defaults.set(hamstringsTallyFloat, forKey: Save.hamstringsTally)
                
                var spinalErectorsTallyFloat:Float? = Float( sets?.text ?? "0")
                spinalErectorsTallyFloat = (spinalErectorsTallyFloat ?? 0)
                self.defaults.set(spinalErectorsTallyFloat, forKey: Save.spinalErectorsTally)
                
                var upperTrapsTallyFloat:Float? = Float(sets?.text ?? "0")
                upperTrapsTallyFloat = (upperTrapsTallyFloat ?? 0)
                self.defaults.set(upperTrapsTallyFloat, forKey: Save.upperTrapsTally)
                
                var latsTallyFloat:Float? = Float(sets?.text ?? "0")
                latsTallyFloat = (latsTallyFloat ?? 0)
                self.defaults.set(latsTallyFloat, forKey: Save.latsTally)
                
                var glutesTallyFloat:Float? = Float( sets?.text ?? "0")
                glutesTallyFloat = (glutesTallyFloat ?? 0)
                self.defaults.set(glutesTallyFloat, forKey: Save.glutesTally)
                
                var lowerTrapsTallyFloat:Float? = Float( sets?.text ?? "0")
                lowerTrapsTallyFloat = (lowerTrapsTallyFloat ?? 0)
                self.defaults.set(lowerTrapsTallyFloat, forKey: Save.lowerTrapsTally)
                
                var transverseAbTallyFloat:Float? = Float( sets?.text ?? "0")
                transverseAbTallyFloat = (transverseAbTallyFloat ?? 0)
                self.defaults.set(transverseAbTallyFloat, forKey: Save.transverseAbTally)
                
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                
                //CAST STRING INPUT TO FLOAT
                let  sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var quadsTallyFloat:Float? = Float( sets?.text ?? "0")
                quadsTallyFloat = (quadsTallyFloat ?? 0)
                self.defaults.set(quadsTallyFloat, forKey: Save.quadsTally)
                
                var spinalErectorsTallyFloat:Float? = Float( sets?.text ?? "0")
                spinalErectorsTallyFloat = (spinalErectorsTallyFloat ?? 0)
                self.defaults.set(spinalErectorsTallyFloat, forKey: Save.spinalErectorsTally)
                
                var transverseAbTallyFloat:Float? = Float( sets?.text ?? "0")
                transverseAbTallyFloat = (transverseAbTallyFloat ?? 0)
                self.defaults.set(transverseAbTallyFloat, forKey: Save.transverseAbTally)
                
                var glutesTallyFloat:Float? = Float( sets?.text ?? "0")
                glutesTallyFloat = (glutesTallyFloat ?? 0)
                self.defaults.set(glutesTallyFloat, forKey: Save.glutesTally)
                
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                
                //CAST STRING INPUT TO FLOAT
                let  sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var gluteMediusTallyFloat:Float? = Float( sets?.text ?? "0")
                gluteMediusTallyFloat = (gluteMediusTallyFloat ?? 0)
                self.defaults.set(gluteMediusTallyFloat, forKey: Save.gluteMediusTally)
                
                var spinalErectorsTallyFloat:Float? = Float( sets?.text ?? "0")
                spinalErectorsTallyFloat = (spinalErectorsTallyFloat ?? 0)
                self.defaults.set(spinalErectorsTallyFloat, forKey: Save.spinalErectorsTally)
                
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                
                //CAST STRING INPUT TO FLOAT
                let  sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var glutesTallyFloat:Float? = Float( sets?.text ?? "0")
                glutesTallyFloat = (glutesTallyFloat ?? 0)
                self.defaults.set(glutesTallyFloat, forKey: Save.glutesTally)
                
                var spinalErectorsTallyFloat:Float? = Float( sets?.text ?? "0")
                spinalErectorsTallyFloat = (spinalErectorsTallyFloat ?? 0)
                self.defaults.set(spinalErectorsTallyFloat, forKey: Save.spinalErectorsTally)
                
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                
                //CAST STRING INPUT TO FLOAT
                let  sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var glutesTallyFloat:Float? = Float( sets?.text ?? "0")
                glutesTallyFloat = (glutesTallyFloat ?? 0)
                self.defaults.set(glutesTallyFloat, forKey: Save.glutesTally)
                
                var spinalErectorsTallyFloat:Float? = Float( sets?.text ?? "0")
                spinalErectorsTallyFloat = (spinalErectorsTallyFloat ?? 0)
                self.defaults.set(spinalErectorsTallyFloat, forKey: Save.spinalErectorsTally)
                
                
                var hamstringsTallyFloat:Float? = Float( sets?.text ?? "0")
                hamstringsTallyFloat = (hamstringsTallyFloat ?? 0) / 2
                self.defaults.set(hamstringsTallyFloat, forKey: Save.hamstringsTally)
                
                
                var gluteMediusTallyFloat:Float? = Float( sets?.text ?? "0")
                gluteMediusTallyFloat = (gluteMediusTallyFloat ?? 0) / 2
                self.defaults.set(gluteMediusTallyFloat, forKey: Save.gluteMediusTally)
                
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                
                //CAST STRING INPUT TO FLOAT
                let  sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var glutesTallyFloat:Float? = Float( sets?.text ?? "0")
                glutesTallyFloat = (glutesTallyFloat ?? 0)
                self.defaults.set(glutesTallyFloat, forKey: Save.glutesTally)
                
                
                var hamstringsTallyFloat:Float? = Float( sets?.text ?? "0")
                hamstringsTallyFloat = (hamstringsTallyFloat ?? 0) / 2
                self.defaults.set(hamstringsTallyFloat, forKey: Save.hamstringsTally)
                
                
                var gluteMediusTallyFloat:Float? = Float( sets?.text ?? "0")
                gluteMediusTallyFloat = (gluteMediusTallyFloat ?? 0) / 2
                self.defaults.set(gluteMediusTallyFloat, forKey: Save.gluteMediusTally)
                
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                
                //CAST STRING INPUT TO FLOAT
                let  sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var glutesTallyFloat:Float? = Float( sets?.text ?? "0")
                glutesTallyFloat = (glutesTallyFloat ?? 0)
                self.defaults.set(glutesTallyFloat, forKey: Save.glutesTally)
                
                
                var hamstringsTallyFloat:Float? = Float( sets?.text ?? "0")
                hamstringsTallyFloat = (hamstringsTallyFloat ?? 0)
                self.defaults.set(hamstringsTallyFloat, forKey: Save.hamstringsTally)
                
                
                var gluteMediusTallyFloat:Float? = Float( sets?.text ?? "0")
                gluteMediusTallyFloat = (gluteMediusTallyFloat ?? 0)
                self.defaults.set(gluteMediusTallyFloat, forKey: Save.gluteMediusTally)
                
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                
                let  sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                
                //CAST STRING INPUT TO FLOAT
                var glutesTallyFloat:Float? = Float( sets?.text ?? "0")
                glutesTallyFloat = (glutesTallyFloat ?? 0)
                self.defaults.set(glutesTallyFloat, forKey: Save.glutesTally)
                
                
                var hamstringsTallyFloat:Float? = Float( sets?.text ?? "0")
                hamstringsTallyFloat = (hamstringsTallyFloat ?? 0) / 2
                self.defaults.set(hamstringsTallyFloat, forKey: Save.hamstringsTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                
                //CAST STRING INPUT TO FLOAT
                
                let  sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var hamstringsTallyFloat:Float? = Float( sets?.text ?? "0")
                hamstringsTallyFloat = (hamstringsTallyFloat ?? 0)
                self.defaults.set(hamstringsTallyFloat, forKey: Save.hamstringsTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                
                //CAST STRING INPUT TO FLOAT
                
                let  sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var absTallyFloat:Float? = Float( sets?.text ?? "0")
                absTallyFloat = (absTallyFloat ?? 0)
                self.defaults.set(absTallyFloat, forKey: Save.absTally)
                
                var obliquesTallyFloat:Float? = Float( sets?.text ?? "0")
                obliquesTallyFloat = (obliquesTallyFloat ?? 0)
                self.defaults.set(obliquesTallyFloat, forKey: Save.obliquesTally)
                
                var transverseAbTallyFloat:Float? = Float( sets?.text ?? "0")
                transverseAbTallyFloat = (transverseAbTallyFloat ?? 0) / 2
                self.defaults.set(transverseAbTallyFloat, forKey: Save.transverseAbTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                //CAST STRING INPUT TO FLOAT
                
                let sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var latsTallyFloat:Float? = Float(sets?.text ?? "0")
                latsTallyFloat = (latsTallyFloat ?? 0)
                self.defaults.set(latsTallyFloat, forKey: Save.latsTally)
                
                var lowerTrapsTallyFloat:Float? = Float( sets?.text ?? "0")
                lowerTrapsTallyFloat = (lowerTrapsTallyFloat ?? 0)
                self.defaults.set(lowerTrapsTallyFloat, forKey: Save.lowerTrapsTally)
                
                var backShoulderTallyFloat:Float? = Float( sets?.text ?? "0")
                backShoulderTallyFloat = (backShoulderTallyFloat ?? 0) / 2
                self.defaults.set(backShoulderTallyFloat, forKey: Save.backShoulderTally)
                
                var bicepsTallyFloat:Float? = Float( sets?.text ?? "0")
                bicepsTallyFloat = (bicepsTallyFloat ?? 0)
                self.defaults.set(bicepsTallyFloat, forKey: Save.bicepsTally)
                
                var forearmFlexorsTallyFloat:Float? = Float( sets?.text ?? "0")
                forearmFlexorsTallyFloat = (forearmFlexorsTallyFloat ?? 0) / 2
                self.defaults.set(forearmFlexorsTallyFloat, forKey: Save.forearmFlexorsTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                
                //CAST STRING INPUT TO FLOAT
                
                let  sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var absTallyFloat:Float? = Float( sets?.text ?? "0")
                absTallyFloat = (absTallyFloat ?? 0)
                self.defaults.set(absTallyFloat, forKey: Save.absTally)
                
                var obliquesTallyFloat:Float? = Float( sets?.text ?? "0")
                obliquesTallyFloat = (obliquesTallyFloat ?? 0)
                self.defaults.set(obliquesTallyFloat, forKey: Save.obliquesTally)
                
                var transverseAbTallyFloat:Float? = Float( sets?.text ?? "0")
                transverseAbTallyFloat = (transverseAbTallyFloat ?? 0) / 2
                self.defaults.set(transverseAbTallyFloat, forKey: Save.transverseAbTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                
                //CAST STRING INPUT TO FLOAT
                
                
                let  sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var obliquesTallyFloat:Float? = Float( sets?.text ?? "0")
                obliquesTallyFloat = (obliquesTallyFloat ?? 0)
                self.defaults.set(obliquesTallyFloat, forKey: Save.obliquesTally)
                
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                
                //CAST STRING INPUT TO FLOAT
                
                
                let  sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var quadsTallyFloat:Float? = Float( sets?.text ?? "0")
                quadsTallyFloat = (quadsTallyFloat ?? 0)
                self.defaults.set(quadsTallyFloat, forKey: Save.quadsTally)
                
                var gluteMediusTallyFloat:Float? = Float( sets?.text ?? "0")
                gluteMediusTallyFloat = (gluteMediusTallyFloat ?? 0)
                self.defaults.set(gluteMediusTallyFloat, forKey: Save.gluteMediusTally)
                
                var glutesTallyFloat:Float? = Float( sets?.text ?? "0")
                glutesTallyFloat = (glutesTallyFloat ?? 0)
                self.defaults.set(glutesTallyFloat, forKey: Save.glutesTally)
                
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                //CAST STRING INPUT TO FLOAT
                
                let  sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var glutesTallyFloat:Float? = Float( sets?.text ?? "0")
                glutesTallyFloat = (glutesTallyFloat ?? 0)
                self.defaults.set(glutesTallyFloat, forKey: Save.glutesTally)
                
                var gluteMediusTallyFloat:Float? = Float( sets?.text ?? "0")
                gluteMediusTallyFloat = (gluteMediusTallyFloat ?? 0)
                self.defaults.set(gluteMediusTallyFloat, forKey: Save.gluteMediusTally)
                
                var hamstringsTallyFloat:Float? = Float( sets?.text ?? "0")
                hamstringsTallyFloat = (hamstringsTallyFloat ?? 0)
                self.defaults.set(hamstringsTallyFloat, forKey: Save.hamstringsTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                //CAST STRING INPUT TO FLOAT
                
                let  sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var glutesTallyFloat:Float? = Float( sets?.text ?? "0")
                glutesTallyFloat = (glutesTallyFloat ?? 0) / 2
                self.defaults.set(glutesTallyFloat, forKey: Save.glutesTally)
                
                var transverseAbTallyFloat:Float? = Float( sets?.text ?? "0")
                transverseAbTallyFloat = (transverseAbTallyFloat ?? 0) / 2
                self.defaults.set(transverseAbTallyFloat, forKey: Save.transverseAbTally)
                
                var spinalErectorsTallyFloat:Float? = Float( sets?.text ?? "0")
                spinalErectorsTallyFloat = (spinalErectorsTallyFloat ?? 0)
                self.defaults.set(spinalErectorsTallyFloat, forKey: Save.spinalErectorsTally)
                
                var quadsTallyFloat:Float? = Float( sets?.text ?? "0")
                quadsTallyFloat = (quadsTallyFloat ?? 0)
                self.defaults.set(quadsTallyFloat, forKey: Save.quadsTally)
                
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                //CAST STRING INPUT TO FLOAT
                
                
                
                let  sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var gluteMediusTallyFloat:Float? = Float( sets?.text ?? "0")
                gluteMediusTallyFloat = (gluteMediusTallyFloat ?? 0)
                self.defaults.set(gluteMediusTallyFloat, forKey: Save.gluteMediusTally)
                
                var obliquesTallyFloat:Float? = Float( sets?.text ?? "0")
                obliquesTallyFloat = (obliquesTallyFloat ?? 0) / 2
                self.defaults.set(obliquesTallyFloat, forKey: Save.obliquesTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                
                //CAST STRING INPUT TO FLOAT
                
                
                let  sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var quadsTallyFloat:Float? = Float( sets?.text ?? "0")
                quadsTallyFloat = (quadsTallyFloat ?? 0)
                self.defaults.set(quadsTallyFloat, forKey: Save.quadsTally)
                
                var glutesTallyFloat:Float? = Float( sets?.text ?? "0")
                glutesTallyFloat = (glutesTallyFloat ?? 0) / 2
                self.defaults.set(glutesTallyFloat, forKey: Save.glutesTally)
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                
                //CAST STRING INPUT TO FLOAT
                
                
                let  sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var quadsTallyFloat:Float? = Float( sets?.text ?? "0")
                quadsTallyFloat = (quadsTallyFloat ?? 0)
                self.defaults.set(quadsTallyFloat, forKey: Save.quadsTally)
                
                var glutesTallyFloat:Float? = Float( sets?.text ?? "0")
                glutesTallyFloat = (glutesTallyFloat ?? 0)
                self.defaults.set(glutesTallyFloat, forKey: Save.glutesTally)
                
                var gluteMediusTallyFloat:Float? = Float( sets?.text ?? "0")
                gluteMediusTallyFloat = (gluteMediusTallyFloat ?? 0)
                self.defaults.set(gluteMediusTallyFloat, forKey: Save.gluteMediusTally)
                
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Counts one set for primary movers, half for secondary movers.\nRPE: Rate of Perceived Exertion.\nNotes can be viewed under 'History'.\n", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                
                //CAST STRING INPUT TO FLOAT
                
                
                let  sets = alert?.textFields![0] // Force unwrapping because we know it exists.
                var hamstringsTallyFloat:Float? = Float( sets?.text ?? "0")
                hamstringsTallyFloat = (hamstringsTallyFloat ?? 0)
                self.defaults.set(hamstringsTallyFloat, forKey: Save.hamstringsTally)
                
                var glutesTallyFloat:Float? = Float( sets?.text ?? "0")
                glutesTallyFloat = (glutesTallyFloat ?? 0)
                self.defaults.set(glutesTallyFloat, forKey: Save.glutesTally)
                
                
                
                
                let setsString:String? = String(sets?.text ?? "")
                if (!(setsString == "")){
                    if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    } else {
                        var setsTxts: [String] = []
                        setsTxts.append(setsString ?? "0")
                        self.defaults.set(setsTxts, forKey: Save.setsTxts)
                    }
                }
                
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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
            let alert = UIAlertController(title: "Input Set Information", message: "Fix it Bro XxXXXXXXXXXXXXXX\nXXXXXXXXXXXXXXXXX\nXXXXXXXXXXXXX\nXXXXXXXXXXXXXXXXXXXXXX\nXXXXXXXXXXXXXXX", preferredStyle: .alert)
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "Sets"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
                textField.addNumericAccessory(addPlusMinus: true)            }
            alert.addTextField { (textField) in
                textField.placeholder = "Reps *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Weight *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "RPE *"
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes *"
                textField.clearsOnBeginEditing = true
            }
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                
                //CAST STRING INPUT TO FLOAT
                
                //REPS
                let reps = alert?.textFields![1] // Force unwrapping because we know it exists.
                var repsString:String? = String(reps?.text ?? "0.00")
                if repsString == ""{
                    repsString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(repsString == "")){
                    if var repsTxts = self.defaults.object(forKey:Save.repsTxts) as? [String] {
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    } else {
                        var repsTxts: [String] = []
                        repsTxts.append(repsString ?? "0.00")
                        self.defaults.set(repsTxts, forKey: Save.repsTxts)
                    }
                    
                    print("reps input and stored: " + repsString! )
                }
                
                //WEIGHTS
                let weight = alert?.textFields![2] // Force unwrapping because we know it exists.
                var weightString:String? = String(weight?.text ?? "0.00")
                if weightString == ""{
                    weightString = "0.0"
                }
                //necessary for volume: calcrepsFloat = (repsFloat ?? 0)
                if (!(weightString == "")){
                    if var weightTxts = self.defaults.object(forKey:Save.weightTxts) as? [String] {
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    } else {
                        var weightTxts: [String] = []
                        weightTxts.append(weightString ?? "0")
                        self.defaults.set(weightTxts, forKey: Save.weightTxts)
                    }
                    print("Weight stored: " +  weightString!)
                }
                
                //calculate and store volume
                
                if (!(weightString == "") && !(repsString == "")){
                    let weight = Float((weightString ?? "0.00"))
                    let reps = Float((repsString ?? "0.00"))
                    let volume = weight! * reps!
                    print("Calulated volume: " + String(volume))
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append(String(volume))
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append(String(volume) )
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                } else {
                    if var volumeTxts = self.defaults.object(forKey:Save.volumeTxts) as? [String] {
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    } else {
                        var volumeTxts: [String] = []
                        volumeTxts.append("0")
                        self.defaults.set(volumeTxts, forKey: Save.volumeTxts)
                    }
                }
                
                //Store title name
                
                if var exTitleHist = self.defaults.object(forKey:Save.exTitleHist) as? [String] {
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("title added")
                } else {
                    var exTitleHist: [String] = []
                    exTitleHist.append(title)
                    self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
                    print("Title added")
                }
                
                print("Title stored: " +  title)
                
                
                //Store Dates
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let dateString = formatter1.string(from: today)
                
                if var dateHist = self.defaults.object(forKey:Save.dateHist) as? [String] {
                    
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                } else {
                    var dateHist: [String] = []
                    dateHist.append(dateString)
                    self.defaults.set(dateHist, forKey: Save.dateHist)
                }
                
                
                
                 //Store RPE
                
                let rpe = alert?.textFields![3] // Force unwrapping because we know it exists.
                var rpeString:String? = String(rpe?.text ?? "0.00")
                if rpeString == ""{
                    rpeString = "0.0"
                }
                
                if var RPETxts = self.defaults.object(forKey:Save.RPETxts) as? [String] {
                    
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                } else {
                    var RPETxts: [String] = []
                    RPETxts.append(rpeString ?? "--")
                    self.defaults.set(RPETxts, forKey: Save.RPETxts)
                }
                
                //Store Notes
                
                let note = alert?.textFields![4]
                var noteString:String? = String(note?.text ?? "0.00")
                if noteString == ""{
                    noteString = "No notes."
                }
                
                if var noteTxts = self.defaults.object(forKey:Save.noteTxts) as? [String] {
                    
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                } else {
                    var noteTxts: [String] = []
                    noteTxts.append(noteString ?? "No notes.")
                    self.defaults.set(noteTxts, forKey: Save.noteTxts)
                }
            
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

extension UITextField {
    
    func addNumericAccessory(addPlusMinus: Bool) {
        let numberToolbar = UIToolbar()
        numberToolbar.barStyle = UIBarStyle.default
        
        var accessories : [UIBarButtonItem] = []
        
        if addPlusMinus {
            accessories.append(UIBarButtonItem(title: "+/-", style: UIBarButtonItem.Style.plain, target: self, action: #selector(plusMinusPressed)))
            accessories.append(UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil))   //add padding after
        }
        
        accessories.append(UIBarButtonItem(title: "Clear", style: UIBarButtonItem.Style.plain, target: self, action: #selector(numberPadClear)))
        accessories.append(UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil))   //add padding space
        accessories.append(UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(numberPadDone)))
        
        numberToolbar.items = accessories
        numberToolbar.sizeToFit()
        
        inputAccessoryView = numberToolbar
    }
    
    @objc func numberPadDone() {
        self.resignFirstResponder()
    }
    
    @objc func numberPadClear() {
        self.text = ""
    }
    
    @objc func plusMinusPressed() {
        guard let currentText = self.text else {
            return
        }
        if currentText.hasPrefix("-") {
            let offsetIndex = currentText.index(currentText.startIndex, offsetBy: 1)
            let substring = currentText[offsetIndex...]  //remove first character
            self.text = String(substring)
        }
        else {
            self.text = "-" + currentText
        }
    }
}


extension ChestListViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        
        let muscleGroup = defaults.string(forKey:Save.muscle)!
        let exceptionsArray = ["Abs", "Obliques"]
        if (exceptionsArray.contains(muscleGroup)){
            return 1
        }
        else{
            return 2
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let muscleGroup = defaults.string(forKey:Save.muscle)!
        let exceptionsArray = ["Abs", "Obliques"]
        if (exceptionsArray.contains(muscleGroup)){
            return gymExercises.count
        }else{
            if section == 0 {
                return gymExercises.count
            } else {
                return bodyWeightExercises.count
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let muscleGroup = defaults.string(forKey:Save.muscle)!
        let exceptionsArray = ["Abs", "Obliques"]
        if (exceptionsArray.contains(muscleGroup)){
            let exercise = gymExercises[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell") as! ExercisesTableViewCell
            cell.setExercises(exercise: exercise)
            cell.delegate = self
            return cell
        } else{
            
            var exercise = gymExercises[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell") as! ExercisesTableViewCell
            if (indexPath.section == 1){
                exercise = bodyWeightExercises[indexPath.row]
            }
            cell.setExercises(exercise: exercise)
            cell.delegate = self
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        let currentCell = tableView.cellForRow(at: indexPath!)! as! ExercisesTableViewCell
        let title = currentCell.exerciseTitleLabel.text
        print(currentCell.exerciseTitleLabel.text!)
        defaults.set(title, forKey: Save.formExercise)
        goToFormVideo()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        
        let muscleGroup = defaults.string(forKey:Save.muscle)!
        let exceptionsArray = ["Abs", "Obliques"]
        if (exceptionsArray.contains(muscleGroup)){
            return "Exercises"
        } else{
            
            if section == 0{
                return "Weighted Exercises\nClick on title to view exercise history"
            } else{
                return "Bodyweight Exercises\nClick on title to view exercise history"
            }
        }
    }
    
    
    
}



