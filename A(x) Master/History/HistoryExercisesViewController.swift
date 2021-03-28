//
//  HistoryExercisesViewController.swift
//  AofX
//
//  Created by Kevin Jimenez on 10/13/20.
//  Copyright © 2020 Aesthet(X). All rights reserved.
//



import UIKit
import GoogleMobileAds

class HistoryExercisesViewController: UIViewController {
    
    
            @IBOutlet weak var exerciseHistoryTableView: UITableView!
    
 
    
//creates array to populate exercise list cells
       var histExercises: [HistExercise] = []
       var prTxts: [Float] = []
       var prDateTxts: [Float] = []
       var vPrTxts: [Float] = []
       var vPrDateTxts: [Float] = []
       var unit: String = ""
   
      
       let defaults = UserDefaults.standard
    
     struct Keys {
        //Keys for muscle group to be displayed
       

        static let muscleHistoryString                  = "musclehistorystring"

                static let formExercise                = "formExercise"
        static let exerciseTitle          = "exercisetitle"
        static let unitsBool             = "unitsBool"
        static let volumeTxts                  = "volumeTxts"
        static let repsTxts                      = "repstxts"
        static let weightTxts                  = "weighttxts"
        static let dateHist                      = "datehist"
        static let exTitleHist                = "extitlehist"
        static let setsTxts                         = "setstxts"
     }
    
    
     
    override func viewDidLoad() {
        super.viewDidLoad()
        //Assigns array stored from adding sets to diffeerent array variables
        let exTitleHist          = defaults.object(forKey: Keys.exTitleHist) as? [String]
   
        //Code to determine and display proper units
        let units = defaults.bool(forKey: Keys.unitsBool)
        unit = " lbs"
        if (units){ unit = " kgs"}
        
         //Checks what muscle group was clicked and displays exercises accordingly
        //Download info obtain highest value and safety check for array size
        let muscleGroup = defaults.string(forKey:Keys.muscleHistoryString)
    
        //Define count as 50, or anything less than 50
        var count = 50
        if exTitleHist != nil{
            if exTitleHist!.count < 50 {
                count = exTitleHist!.count - 1
            }
            //While loop to pobtain highest value
            while (count >= 0 && exTitleHist != nil){
              
            }// else {
                
            //}
        }
        
           
    
        if (muscleGroup == "Chest"){
            histExercises = createChestArray( prTxts: prTxts, prDateTxts: prDateTxts,vPrTxts: vPrTxts, vDatePrTxts: vPrDateTxts)
     
        }  else if (muscleGroup == "Biceps"){
            histExercises = createBicepsArray(prTxts: prTxts, prDateTxts: prDateTxts,vPrTxts: vPrTxts, vDatePrTxts: vPrDateTxts)
          //  bodyWeightExercises = createBWBicepsArray(prTxts: prTxts, prDateTxts: prDateTxts,vPrTxts: vPrTxts, vDatePrTxts: vPrDateTxts)
        } else if (muscleGroup == "Lats"){
            histExercises = createLatsArray(prTxts: prTxts, prDateTxts: prDateTxts,vPrTxts: vPrTxts, vDatePrTxts: vPrDateTxts)
           // bodyWeightExercises = createBWLatsArray(prTxts: prTxts, prDateTxts: prDateTxts,vPrTxts: vPrTxts, vDatePrTxts: vPrDateTxts)
        } else if (muscleGroup == "Glutes"){
           histExercises = createGlutesArray(prTxts: prTxts, prDateTxts: prDateTxts,vPrTxts: vPrTxts, vDatePrTxts: vPrDateTxts)
            //bodyWeightExercises = createBWGlutesArray(prTxts: prTxts, prDateTxts: prDateTxts,vPrTxts: vPrTxts, vDatePrTxts: vPrDateTxts)
        } else if (muscleGroup == "Glute Medius"){
           histExercises = createGluteMediusArray(prTxts: prTxts, prDateTxts: prDateTxts,vPrTxts: vPrTxts, vDatePrTxts: vPrDateTxts)
           // bodyWeightExercises = createBWGluteMediusArray(prTxts: prTxts, prDateTxts: prDateTxts,vPrTxts: vPrTxts, vDatePrTxts: vPrDateTxts)
        } else if (muscleGroup == "Hamstrings"){
           histExercises = createHamstringsArray(prTxts: prTxts, prDateTxts: prDateTxts,vPrTxts: vPrTxts, vDatePrTxts: vPrDateTxts)
           // bodyWeightExercises = createBWHamstringsArray(prTxts: prTxts, prDateTxts: prDateTxts,vPrTxts: vPrTxts, vDatePrTxts: vPrDateTxts)
        } else if (muscleGroup == "Front Shoulder"){
            histExercises = createFrontShoulderArray(prTxts: prTxts, prDateTxts: prDateTxts,vPrTxts: vPrTxts, vDatePrTxts: vPrDateTxts)
            //bodyWeightExercises = createBWFrontShoulderArray(prTxts: prTxts, prDateTxts: prDateTxts,vPrTxts: vPrTxts, vDatePrTxts: vPrDateTxts)
        } else if (muscleGroup == "Lateral Shoulder"){
            histExercises = createLateralShoulderArray(prTxts: prTxts, prDateTxts: prDateTxts,vPrTxts: vPrTxts, vDatePrTxts: vPrDateTxts)
           // bodyWeightExercises = createBWLateralShoulderArray(prTxts: prTxts, prDateTxts: prDateTxts,vPrTxts: vPrTxts, vDatePrTxts: vPrDateTxts)
        } else if (muscleGroup == "Back Shoulder"){
           histExercises = createBackShoulderArray(prTxts: prTxts, prDateTxts: prDateTxts,vPrTxts: vPrTxts, vDatePrTxts: vPrDateTxts)
           // bodyWeightExercises = createBWBackShoulderArray(prTxts: prTxts, prDateTxts: prDateTxts,vPrTxts: vPrTxts, vDatePrTxts: vPrDateTxts)
        } else if (muscleGroup == "Rotator Cuff"){
         histExercises = createRotatorCuffArray(prTxts: prTxts, prDateTxts: prDateTxts,vPrTxts: vPrTxts, vDatePrTxts: vPrDateTxts)
         //   bodyWeightExercises = createBWRotatorCuffArray(prTxts: prTxts, prDateTxts: prDateTxts,vPrTxts: vPrTxts, vDatePrTxts: vPrDateTxts)
        } else if (muscleGroup == "Triceps"){
            histExercises = createTricepsArray(prTxts: prTxts, prDateTxts: prDateTxts,vPrTxts: vPrTxts, vDatePrTxts: vPrDateTxts)
          //  bodyWeightExercises = createBWTricepsArray(prTxts: prTxts, prDateTxts: prDateTxts,vPrTxts: vPrTxts, vDatePrTxts: vPrDateTxts)
        } else if (muscleGroup == "Quads"){
            histExercises = createQuadsArray(prTxts: prTxts, prDateTxts: prDateTxts,vPrTxts: vPrTxts, vDatePrTxts: vPrDateTxts)
           // bodyWeightExercises = createBWQuadsArray(prTxts: prTxts, prDateTxts: prDateTxts,vPrTxts: vPrTxts, vDatePrTxts: vPrDateTxts)
        } else if (muscleGroup == "Abs"){
            histExercises = createAbsArray(prTxts: prTxts, prDateTxts: prDateTxts,vPrTxts: vPrTxts, vDatePrTxts: vPrDateTxts)
            //bodyWeightExercises = createBWAbsArray(prTxts: prTxts, prDateTxts: prDateTxts,vPrTxts: vPrTxts, vDatePrTxts: vPrDateTxts)
        } else if (muscleGroup == "Obliques"){
            histExercises = createObliquesArray(prTxts: prTxts, prDateTxts: prDateTxts,vPrTxts: vPrTxts, vDatePrTxts: vPrDateTxts)
            //bodyWeightExercises = createBWObliquesArray(prTxts: prTxts, prDateTxts: prDateTxts,vPrTxts: vPrTxts, vDatePrTxts: vPrDateTxts)
        } else if (muscleGroup == "Serratus"){
            histExercises = createSerratusArray(prTxts: prTxts, prDateTxts: prDateTxts,vPrTxts: vPrTxts, vDatePrTxts: vPrDateTxts)
            //bodyWeightExercises = createBWSerratusArray(prTxts: prTxts, prDateTxts: prDateTxts,vPrTxts: vPrTxts, vDatePrTxts: vPrDateTxts)
        } else if (muscleGroup == "Transverse Ab"){
            histExercises = createTransverseAbArray(prTxts: prTxts, prDateTxts: prDateTxts,vPrTxts: vPrTxts, vDatePrTxts: vPrDateTxts)
           // bodyWeightExercises = createBWTransverseAbArray(prTxts: prTxts, prDateTxts: prDateTxts,vPrTxts: vPrTxts, vDatePrTxts: vPrDateTxts)
        } else if (muscleGroup == "Calves"){
           histExercises = createCalvesArray(prTxts: prTxts, prDateTxts: prDateTxts,vPrTxts: vPrTxts, vDatePrTxts: vPrDateTxts)
            //bodyWeightExercises = createBWCalvesArray(prTxts: prTxts, prDateTxts: prDateTxts,vPrTxts: vPrTxts, vDatePrTxts: vPrDateTxts)
        } else if (muscleGroup == "Neck"){
            histExercises = createNeckArray(prTxts: prTxts, prDateTxts: prDateTxts,vPrTxts: vPrTxts, vDatePrTxts: vPrDateTxts)
           // bodyWeightExercises = createBWNeckArray(prTxts: prTxts, prDateTxts: prDateTxts,vPrTxts: vPrTxts, vDatePrTxts: vPrDateTxts)
        } else if (muscleGroup == "Forearm Extensors"){
            histExercises = createForearmExtensorsArray(prTxts: prTxts, prDateTxts: prDateTxts,vPrTxts: vPrTxts, vDatePrTxts: vPrDateTxts)
           // bodyWeightExercises = createBWForearmExtensorsArray(prTxts: prTxts, prDateTxts: prDateTxts,vPrTxts: vPrTxts, vDatePrTxts: vPrDateTxts)
        } else if (muscleGroup == "Ulnar Forearm"){
         histExercises = createUlnarForearmArray(prTxts: prTxts, prDateTxts: prDateTxts,vPrTxts: vPrTxts, vDatePrTxts: vPrDateTxts)
         // bodyWeightExercises = createBWUlnarForearmArray(prTxts: prTxts, prDateTxts: prDateTxts,vPrTxts: vPrTxts, vDatePrTxts: vPrDateTxts)
        } else if (muscleGroup == "Forearm Flexors"){
           histExercises = createForearmFlexorsArray(prTxts: prTxts, prDateTxts: prDateTxts,vPrTxts: vPrTxts, vDatePrTxts: vPrDateTxts)
            //bodyWeightExercises = createBWForearmFlexorsArray(prTxts: prTxts, prDateTxts: prDateTxts,vPrTxts: vPrTxts, vDatePrTxts: vPrDateTxts)
        } else if (muscleGroup == "Radial Forearm"){
            histExercises = createRadialForearmArray(prTxts: prTxts, prDateTxts: prDateTxts,vPrTxts: vPrTxts, vDatePrTxts: vPrDateTxts)
           // bodyWeightExercises = createBWRadialForearmArray(prTxts: prTxts, prDateTxts: prDateTxts,vPrTxts: vPrTxts, vDatePrTxts: vPrDateTxts)
        } else if (muscleGroup == "Spinal Erectors"){
            histExercises = createSpinalErectorsArray(prTxts: prTxts, prDateTxts: prDateTxts,vPrTxts: vPrTxts, vDatePrTxts: vPrDateTxts)
            //bodyWeightExercises = createBWSpinalErectorsArray(prTxts: prTxts, prDateTxts: prDateTxts,vPrTxts: vPrTxts, vDatePrTxts: vPrDateTxts)
        } else if (muscleGroup == "Upper Traps"){
            histExercises = createUpperTrapsArray(prTxts: prTxts, prDateTxts: prDateTxts,vPrTxts: vPrTxts, vDatePrTxts: vPrDateTxts)
            //bodyWeightExercises = createBWUpperTrapsArray(prTxts: prTxts, prDateTxts: prDateTxts,vPrTxts: vPrTxts, vDatePrTxts: vPrDateTxts)
        } else if (muscleGroup == "Lower Traps"){
            histExercises = createLowerTrapsArray(prTxts: prTxts, prDateTxts: prDateTxts,vPrTxts: vPrTxts, vDatePrTxts: vPrDateTxts)
           // bodyWeightExercises = createBWLowerTrapsArray(prTxts: prTxts, prDateTxts: prDateTxts,vPrTxts: vPrTxts, vDatePrTxts: vPrDateTxts)
        }
        
    }
    
    
    //---------------------------------------------BEGIN SHENANIGANS-----------------------------------------------------------------
     //Folowing Functions contain all exercises. Will display only the muscle group selected in the volume tracker
    
    //for every exercises I need to loop the title through the array and get the highest value
    func createChestArray( prTxts: [Float], prDateTxts: [Float], vPrTxts: [Float], vDatePrTxts: [Float]) -> [HistExercise] {
       
           let exercise1 = HistExercise(title: "Bench Press",             prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
           let exercise2 = HistExercise(title: "Dumbell Bench Press",     prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
           let exercise3 = HistExercise(title: "Machine Chest Press",     prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
           let exercise4 = HistExercise(title: "Neutral Cable Press",     prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
           let exercise5 = HistExercise(title: "Neutral Crossover Flyes", prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
           
           //Incline
           let exercise6 = HistExercise(title: "Incline Bench Press",         prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
           let exercise7 = HistExercise(title: "Incline Dumbell Bench Press", prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
           let exercise8 = HistExercise(title: "Incline Machine Chest Press", prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
           let exercise9 = HistExercise(title: "Incline Cable Press",         prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
           let exercise10 = HistExercise(title: "Incline Crossover Flyes",    prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
           
           //Decline
         
           let exercise11 = HistExercise(title: "Decline Bench Press",         prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
           let exercise12 = HistExercise(title: "Decline Dumbell Bench Press", prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
           let exercise13 = HistExercise(title: "Decline Cable Press",         prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
           let exercise14 = HistExercise(title: "Decline Crossover Flyes",     prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
           
           //Miscellaneuos
           let exercise15 = HistExercise(title: "Chest Pullover", prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
        let exercise16 = HistExercise(title: "Push-Ups",     prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
        let exercise17 = HistExercise(title: "Wide Dips",    prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
          
           return [exercise1, exercise2, exercise3, exercise4, exercise5
                   , exercise6, exercise7, exercise8, exercise9, exercise10,
                   exercise11, exercise12, exercise13, exercise14, exercise15, exercise16, exercise17]
       }
       
       func createBicepsArray(prTxts: [Float], prDateTxts: [Float],vPrTxts: [Float], vDatePrTxts: [Float]) -> [HistExercise] {
           let exercise1 = HistExercise(title: "Dumbbell Curls",                   prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
           let exercise2 = HistExercise(title: "Narrow Dumbbell Curls",            prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
           let exercise3 = HistExercise(title: "Wide Dumbbell Curls",              prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
           let exercise4 = HistExercise(title: "Barbell Curls",                    prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
           let exercise5 = HistExercise(title: "Narrow Barbell Curls",             prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
           let exercise6 = HistExercise(title: "Wide Barbell Curls",               prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
           let exercise7 = HistExercise(title: "Narrow EZ Bar Curls",              prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
           let exercise8 = HistExercise(title: "Wide EZ Bar Curls",                prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
           let exercise9 = HistExercise(title: "Preacher Curls",                   prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
           let exercise10 = HistExercise(title: "Limp Wrist Curls",                prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
           let exercise11 = HistExercise(title: "Biceps Isometric",                prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
           let exercise12 = HistExercise(title: "Cross Body Hammer Curls",         prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
           let exercise13 = HistExercise(title: "Cable/Dumbbell Spider Curls",     prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
          
           
           return [exercise1, exercise2, exercise3, exercise4, exercise5
                   , exercise6, exercise7, exercise8, exercise9, exercise10,
                   exercise11, exercise12, exercise13]
       }
       
       
       func createLatsArray(prTxts: [Float], prDateTxts: [Float],vPrTxts: [Float], vDatePrTxts: [Float]) -> [HistExercise] {
           let exercise1 = HistExercise(title: "Lat Pull Over",        prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
           let exercise2 = HistExercise(title: "Lat Pushdowns",        prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
           let exercise3 = HistExercise(title: "Cable Pulldown",       prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
           let exercise4 = HistExercise(title: "High Pulley Row",      prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
           let exercise5 = HistExercise(title: "Chest Supported Rows", prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
           let exercise6 = HistExercise(title: "Barbell Rows",         prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
           let exercise7 = HistExercise(title: "Cable Rows",           prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
        let exercise8 = HistExercise(title: "Pull Ups",     prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
        let exercise9 = HistExercise(title: "Chin Ups",     prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
          
           return [exercise1, exercise2, exercise3, exercise4, exercise5
                   , exercise6, exercise7, exercise8, exercise9]
       }
       
       func createGlutesArray(prTxts: [Float], prDateTxts: [Float],vPrTxts: [Float], vDatePrTxts: [Float]) -> [HistExercise] {
           let exercise1 = HistExercise(title: "Hip Thrust",                prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
           let exercise2 = HistExercise(title: "Cable Pull Through",        prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
           let exercise3 = HistExercise(title: "Glute Hyperextension",      prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
           let exercise4 = HistExercise(title: "Kettlebell/Dumbbell Swing", prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
           let exercise5 = HistExercise(title: "Cable Kick Backs",          prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
         let exercise6 = HistExercise(title: "Sprinter Lunge",            prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
          
           return [exercise1, exercise2, exercise3, exercise4, exercise5, exercise6]
       }
    
       
       func createGluteMediusArray(prTxts: [Float], prDateTxts: [Float],vPrTxts: [Float], vDatePrTxts: [Float]) -> [HistExercise] {
            let exercise1 = HistExercise(title: "Machine Abduction",             prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
            let exercise2 = HistExercise(title: "Ankle Brace Cable Abduction",             prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
            return [exercise1, exercise2]
        }
        
        func createHamstringsArray(prTxts: [Float], prDateTxts: [Float],vPrTxts: [Float], vDatePrTxts: [Float]) -> [HistExercise] {
            let exercise1 = HistExercise(title: "Deadlift",                 prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
            let exercise2 = HistExercise(title: "Romanian Deadlift",        prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
            let exercise3 = HistExercise(title: "Deficit Deadlift",         prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
            let exercise4 = HistExercise(title: "Hamstring Hyperextension", prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
            let exercise5 = HistExercise(title: "Glute Ham Raise",                prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
            let exercise6 = HistExercise(title: "Single Leg Romanian Deadlift",   prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
           
            return [exercise1, exercise2, exercise3, exercise4,  exercise5, exercise6]
        }
    
        func createFrontShoulderArray(prTxts: [Float], prDateTxts: [Float],vPrTxts: [Float], vDatePrTxts: [Float]) -> [HistExercise] {
            let exercise1 = HistExercise(title: "Arnolds",                 prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
            let exercise2 = HistExercise(title: "Barbell Overhead Press",  prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
            let exercise3 = HistExercise(title: "Dumbbell OHP",            prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
            let exercise4 = HistExercise(title: "Cable Stretch to OHP",    prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
            let exercise5 = HistExercise(title: "Landmine Press",          prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
            let exercise6 = HistExercise(title: "Machine Shoulder Press",  prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
            let exercise7 = HistExercise(title: "Push Press",              prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
              let exercise8 = HistExercise(title: "Cable Front Raise", prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
            
            return [exercise1, exercise2, exercise3, exercise4, exercise5
                    , exercise6, exercise7, exercise8]
        }

        func createLateralShoulderArray(prTxts: [Float], prDateTxts: [Float],vPrTxts: [Float], vDatePrTxts: [Float]) -> [HistExercise] {
            let exercise1 = HistExercise(title: "Cable Lateral Raises",    prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
            let exercise2 = HistExercise(title: "Machine Lateral Raise",   prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
            let exercise3 = HistExercise(title: "Cheat Lateral Raise",     prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
            let exercise4 = HistExercise(title: "Lateral Raise",           prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
           
            return [exercise1, exercise2, exercise3, exercise4]
        }
        
       func createBackShoulderArray(prTxts: [Float], prDateTxts: [Float],vPrTxts: [Float], vDatePrTxts: [Float]) -> [HistExercise] {
              let exercise1 = HistExercise(title: "Barbell/Dumbbell High Rows",  prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
              let exercise2 = HistExercise(title: "Facepulls",                   prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
              let exercise3 = HistExercise(title: "W's",                         prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
              let exercise4 = HistExercise(title: "Reverse Pec Deck",             prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
         let exercise5 = HistExercise(title: "Angels of Death",    prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
             
              return [exercise1, exercise2, exercise3, exercise4, exercise5]
          }
            
          func createRotatorCuffArray(prTxts: [Float], prDateTxts: [Float],vPrTxts: [Float], vDatePrTxts: [Float]) -> [HistExercise] {
              let exercise1 = HistExercise(title: "Cable External Rotation",          prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
              let exercise2 = HistExercise(title: "Bench Dumbbell External Rotation", prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
              let exercise3 = HistExercise(title: "W's",                              prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
              let exercise4 = HistExercise(title: "Dumbbell High Pull",               prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
              let exercise5 = HistExercise(title: "Facepulls",                        prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
             
              return [exercise1, exercise2, exercise3, exercise4, exercise5]
          }
     
          func createTricepsArray(prTxts: [Float], prDateTxts: [Float],vPrTxts: [Float], vDatePrTxts: [Float]) -> [HistExercise] {
              let exercise1 = HistExercise(title: "Narrow Dip",                  prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
              let exercise2 = HistExercise(title: "Incline Skullcrushers",       prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
              let exercise3 = HistExercise(title: "California Press",            prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
              let exercise4 = HistExercise(title: "Cable Rope Pushdowns",        prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
              let exercise5 = HistExercise(title: "V Bar Pushdowns",             prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
              let exercise6 = HistExercise(title: "Close Grip Dumbbell Press",   prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
              let exercise7 = HistExercise(title: "Rope Overhead Extension",     prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
              let exercise8 = HistExercise(title: "Long Head Triceps Pushdowns", prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
              let exercise9 = HistExercise(title: "Triceps Kickback",            prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
              let exercise10 = HistExercise(title: "Triceps Extension",          prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
             let exercise11 = HistExercise(title: "Narrow Pushup",     prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
           
              return [exercise1, exercise2, exercise3, exercise4, exercise5
                      , exercise6, exercise7, exercise8, exercise9, exercise10, exercise11]
          }
 
          func createQuadsArray(prTxts: [Float], prDateTxts: [Float],vPrTxts: [Float], vDatePrTxts: [Float]) -> [HistExercise] {
              let exercise1 = HistExercise(title: "Squats",                           prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
              let exercise2 = HistExercise(title: "Cable Walkaways",                  prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
              let exercise3 = HistExercise(title: "Banded Leg Press",                 prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
              let exercise4 = HistExercise(title: "Leg Press",                        prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
              let exercise5 = HistExercise(title: "Traditional Lunge",                prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
              let exercise6 = HistExercise(title: "Bulgarian Split Squat",            prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
              let exercise7 = HistExercise(title: "Explosive Bulagarian Split Squat", prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
              let exercise8 = HistExercise(title: "Pistol Squats",                    prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
              let exercise9 = HistExercise(title: "Side Lunge",                       prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
             
              return [exercise1, exercise2, exercise3, exercise4, exercise5
                      , exercise6, exercise7, exercise8, exercise9]
          }
        
          func createAbsArray(prTxts: [Float], prDateTxts: [Float],vPrTxts: [Float], vDatePrTxts: [Float]) -> [HistExercise] {
               let exercise1 = HistExercise(title: "Cable Crunch", prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
             let exercise2 = HistExercise(title: "Machine Crunch", prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
            let exercise7 = HistExercise(title: "Band Crunch",      prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
            let exercise8 = HistExercise(title: "V-Up",             prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)

           return [exercise1, exercise2, exercise7, exercise8]
           }
           
           func createObliquesArray(prTxts: [Float], prDateTxts: [Float],vPrTxts: [Float], vDatePrTxts: [Float]) -> [HistExercise] {

               let exercise1 = HistExercise(title: "Neutral Wood Choppers",         prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
               let exercise2 = HistExercise(title: "Low to High Wood Choppers",     prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
               let exercise3 = HistExercise(title: "High to Low Wood Choppers",     prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
               let exercise7 = HistExercise(title: "Banded/Cable Step Out", prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
               let exercise11 = HistExercise(title: "X-Crunch",              prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
              
               return [exercise1, exercise2, exercise3, exercise7,  exercise11]
           }
           
           func createSerratusArray(prTxts: [Float], prDateTxts: [Float],vPrTxts: [Float], vDatePrTxts: [Float]) -> [HistExercise] {
               let exercise1 = HistExercise(title: "Protracted Cable Crunch", prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
               let exercise2 = HistExercise(title: "Banded/Cable Punches",   prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
              
               return [exercise1, exercise2]
           }
           
           func createBWSerratusArray(prTxts: [Float], prDateTxts: [Float],vPrTxts: [Float], vDatePrTxts: [Float]) -> [HistExercise] {
                 let exercise0 = HistExercise(title: "Plank Protraction",     prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
            
                 return [exercise0]
             }
           
           func createTransverseAbArray(prTxts: [Float], prDateTxts: [Float],vPrTxts: [Float], vDatePrTxts: [Float]) -> [HistExercise] {
               let exercise1 = HistExercise(title: "Banded/Cable Resisted Rotation",  prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
               
               return [exercise1]
           }
           
           func createBWTransverseAbArray(prTxts: [Float], prDateTxts: [Float],vPrTxts: [Float], vDatePrTxts: [Float]) -> [HistExercise] {
                 let exercise0 = HistExercise(title: "Vacuums",     prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
                
                 return [exercise0]
             }
       
       func createCalvesArray(prTxts: [Float], prDateTxts: [Float],vPrTxts: [Float], vDatePrTxts: [Float]) -> [HistExercise] {
        
              let exercise1 = HistExercise(title: "Machine Standing Calf Raise",      prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
              let exercise2 = HistExercise(title: "Straight Leg Machine Calf Raise",  prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
              let exercise3 = HistExercise(title: "Seated Calf Raise",                prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
              let exercise4 = HistExercise(title: "Donkey Calf Raise",                prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
              let exercise5 = HistExercise(title: "Dumbbell/Plated Calf Raise",       prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
            
              return [exercise1, exercise2, exercise3, exercise4, exercise5]
          }
          
          func createNeckArray(prTxts: [Float], prDateTxts: [Float],vPrTxts: [Float], vDatePrTxts: [Float]) -> [HistExercise] {
  
              let exercise1 = HistExercise(title: "Plate Curl",              prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
              let exercise2 = HistExercise(title: "Neck Harness Curl",       prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
              let exercise3 = HistExercise(title: "Plated Neck Extension",   prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
              let exercise4 = HistExercise(title: "Harness Lateral Flexion", prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
              let exercise5 = HistExercise(title: "Suspended Neck Rotation", prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
              let exercise6 = HistExercise(title: "Neck Flexion",            prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
         
              return [exercise1, exercise2, exercise3, exercise4, exercise5, exercise6]
          }
          
        
          
          func createForearmExtensorsArray(prTxts: [Float], prDateTxts: [Float],vPrTxts: [Float], vDatePrTxts: [Float]) -> [HistExercise] {
            
              let exercise1 = HistExercise(title: "Standing Barbell Wrist Extension", prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
              let exercise2 = HistExercise(title: "Barbell Extension Rolls",          prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
              let exercise3 = HistExercise(title: "Reverse Curls",                    prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )

              return [ exercise1, exercise2, exercise3]
          }
          
          func createBWForearmExtensorsArray(prTxts: [Float], prDateTxts: [Float],vPrTxts: [Float], vDatePrTxts: [Float]) -> [HistExercise] {
                let exercise0 = HistExercise(title: "Banded Wrist Extension",    prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
               
                return [exercise0]
            }
          
          func createUlnarForearmArray(prTxts: [Float], prDateTxts: [Float],vPrTxts: [Float], vDatePrTxts: [Float]) -> [HistExercise] {
              let exercise1 = HistExercise(title: "Rope Ulnar Deviation",   prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
             
             
              return [exercise1]
          }
    
    func createBWUlnarForearmArray(prTxts: [Float], prDateTxts: [Float],vPrTxts: [Float], vDatePrTxts: [Float]) -> [HistExercise] {
       
        let exercise0 = HistExercise(title: "Banded Ulnar Deviation", prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
       
        return [exercise0]
    }
    
    
          
          
          func createForearmFlexorsArray(prTxts: [Float], prDateTxts: [Float],vPrTxts: [Float], vDatePrTxts: [Float]) -> [HistExercise] {

               let exercise1 = HistExercise(title: "Prone Wrist Curls",  prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
               let exercise2 = HistExercise(title: "Wrist Flexed Curls", prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
              
               return [ exercise1, exercise2]
           }
    
        func createBWForearmFlexorsArray(prTxts: [Float], prDateTxts: [Float],vPrTxts: [Float], vDatePrTxts: [Float]) -> [HistExercise] {
           
            let exercise0 = HistExercise(title: "Banded Wrist Curls", prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
           
            return [exercise0]
        }
           
           func createRadialForearmArray(prTxts: [Float], prDateTxts: [Float],vPrTxts: [Float], vDatePrTxts: [Float]) -> [HistExercise] {
             
               let exercise1 = HistExercise(title: "Rope Radial Deviation",      prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
               let exercise2 = HistExercise(title: "Hammer/Crossbody Curls",     prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
    
               let exercise3 = HistExercise(title: "Re-racking your plates",     prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )

               return [exercise1, exercise2, exercise3]
           }
           
        func createBWRadialForearmArray(prTxts: [Float], prDateTxts: [Float],vPrTxts: [Float], vDatePrTxts: [Float]) -> [HistExercise] {
         
            let exercise0 = HistExercise(title: "Banded Radial Deviation",    prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
          

            return [exercise0]
        }
           func createSpinalErectorsArray(prTxts: [Float], prDateTxts: [Float],vPrTxts: [Float], vDatePrTxts: [Float]) -> [HistExercise] {
               let exercise1 = HistExercise(title: "Hyperextension",             prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
               let exercise2 = HistExercise(title: "Machine Erector Extension",  prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
               let exercise3 = HistExercise(title: "Deadlift",                   prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
               let exercise4 = HistExercise(title: "Squats",                     prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
               
              
               return [exercise1, exercise2, exercise3, exercise4]
           }
    
        func createBWSpinalErectorsArray(prTxts: [Float], prDateTxts: [Float],vPrTxts: [Float], vDatePrTxts: [Float]) -> [HistExercise] {
            
            let exercise0 = HistExercise(title: "Frog Pumps",                 prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
            let exercise1 = HistExercise(title: "Angels of Death",            prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
            let exercise2 = HistExercise(title: "Marching Bridge",            prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
            let exercise3 = HistExercise(title: "Reverse Hyperextension",     prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
           
            return [exercise0, exercise1, exercise2, exercise3]
        }
     
           func createUpperTrapsArray(prTxts: [Float], prDateTxts: [Float],vPrTxts: [Float], vDatePrTxts: [Float]) -> [HistExercise] {
        
               let exercise1 = HistExercise(title: "Dumbell Shrugs",   prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
               let exercise2 = HistExercise(title: "Trap Bar Shrugs",  prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit )
               let exercise3 = HistExercise(title: "Farmer Walk",     prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
              
               return [ exercise1, exercise2, exercise3]
           }
           
           
          func createLowerTrapsArray(prTxts: [Float], prDateTxts: [Float],vPrTxts: [Float], vDatePrTxts: [Float]) -> [HistExercise] {
              
                 let exercise1 = HistExercise(title: "Y Raise",          prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
                 let exercise2 = HistExercise(title: "Reverse Pec Deck", prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
                 let exercise3 = HistExercise(title: "W's",              prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
                 let exercise4 = HistExercise(title: "Facepulls",        prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
                 let exercise5 = HistExercise(title: "Inverted Y",                         prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
                    let exercise6 = HistExercise(title: "Angels of Death",                    prText: String(prTxts[0]) , prDateText: String(prDateTxts[0]), vPrText: String(vPrTxts[0]), vPrDateText:  String(vDatePrTxts[0]), unit: unit)
                
                 return [ exercise1, exercise2, exercise3, exercise4, exercise5, exercise6]
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
    
extension HistoryExercisesViewController: ExerciseHistoryCellDelegate{
    func didTapViewHistory(title: String) {
       // TODO add string for the next view to show proper exercise history
        //  let historyTitle = title
          defaults.set(title, forKey: Keys.exerciseTitle)
          
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                let dashBoard = storyboard.instantiateViewController(identifier: "specificExerciseHistory")
                                //self.present(calculatingPerfection, animated: true, completion: nil)
                  self.show(dashBoard, sender: self)
                   self.dismiss(animated: true, completion: nil)
         
    }
    
    func didTapViewNotes(title: String) {
        //
    }

}
extension HistoryExercisesViewController: UITableViewDataSource, UITableViewDelegate {
//    func numberOfSections(in tableView: UITableView) -> Int {
//            return 1
//    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 
            return histExercises.count
     
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
   
            let HistExer = histExercises[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseHistoryCell") as! ExerciseHistoryCell
            cell.setHistExercise(histExercise: HistExer)
            cell.delegate = self
            return cell
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     print ("clicked")
        let indexPath = tableView.indexPathForSelectedRow
                   let currentCell = tableView.cellForRow(at: indexPath!)! as! ExerciseHistoryCell
                   let title = currentCell.muscleHistoryTitleLabel.text
                   print(currentCell.muscleHistoryTitleLabel.text!)
                   defaults.set(title, forKey: Keys.formExercise)
                   goToFormVideo()
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
            return "Exercises"
      
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}


    

