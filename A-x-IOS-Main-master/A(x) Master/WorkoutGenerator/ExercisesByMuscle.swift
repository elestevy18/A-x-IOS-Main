//
//  ExerciseByMuscle.swift
//  AofX
//
//  Copyright © 2021 Aesthet(X). All rights reserved.
//
//TODO add forearms to triceps and others
import Foundation

enum peakContraction {
    
}

struct ExerciseByMuscles {
    
    func getBigSixExercise(position:Int) -> Exercise { 
        
        switch position {
        case 0:
            return Exercise(title: NSLocalizedString("exercises.hamstringsHinge1", comment: ""), primaryMuscles: [Save.hamstringHingeTitle, Save.spinalErectorsTitle, Save.upperTrapsTitle ], secondaryMuscles: [ Save.latsPushdownTitle, Save.glutesTitle, Save.lowerTrapsTitle, Save.transverseAbTitle], peakTension: [Save.mid], isBW: false)
        case 1:
            return Exercise(title: NSLocalizedString("exercises.chest1", comment: ""), primaryMuscles: [Save.middleChestTitle, Save.frontShoulderTitle],
                            secondaryMuscles: [Save.tricepsLateralShortTitle , Save.serratusTitle], peakTension: [Save.mid], isBW: false)
        case 2:
            return Exercise(title: NSLocalizedString("exercises.quads1", comment: ""),                           primaryMuscles: [Save.quadsTitle, Save.spinalErectorsTitle, Save.adductorsTitle ], secondaryMuscles: [ Save.glutesTitle, Save.transverseAbTitle, Save.anteriorTibialisTitle], peakTension: [Save.ecc, Save.mid], isBW: false)
        case 3:
            return Exercise(title: NSLocalizedString("exercises.anteriorDeltoid2", comment: ""), primaryMuscles: [Save.frontShoulderTitle ], secondaryMuscles: [ Save.tricepsLateralShortTitle], peakTension: [Save.con], isBW: false)
            
        case 4:
            return Exercise(title: NSLocalizedString("exercises.latsRowing3", comment: ""), primaryMuscles: [Save.latsRowingTitle, Save.spinalErectorsTitle ], secondaryMuscles: [ Save.backShoulderTitle, Save.bicepsShortHeadTitle, Save.bicepsLongHeadTitle, Save.forearmFlexorsTitle, Save.hamstringHingeTitle, Save.glutesTitle], peakTension: [Save.mid, Save.con], isBW: false)
        case 5:
            return Exercise(title: NSLocalizedString("exercises.gluteMax1", comment: ""), primaryMuscles: [Save.glutesTitle, Save.spinalErectorsTitle ], secondaryMuscles: [ Save.hamstringHingeTitle , Save.gluteMediusTitle], peakTension: [Save.ecc, Save.mid, Save.con], isBW: false)
        default:
            return Exercise(title: "Error", primaryMuscles: [], secondaryMuscles: [], peakTension: [], isBW: true)
            
        }
    }

func getMiddleChestExercise() -> [Exercise] {
    let exercise = Exercise(title: Save.middleChestTitle, primaryMuscles: [Save.middleChestTitle], secondaryMuscles: [], peakTension: [], isBW: false)
    //Netral Position
    let exercise1 = Exercise(title: NSLocalizedString("exercises.chest1", comment: ""),             primaryMuscles: [Save.middleChestTitle, Save.frontShoulderTitle],
                             secondaryMuscles: [Save.tricepsLateralShortTitle , Save.serratusTitle], peakTension: [Save.mid], isBW: false)
    let exercise2 = Exercise(title: NSLocalizedString("removingExercises.chest1", comment: ""),     primaryMuscles: [Save.middleChestTitle, Save.frontShoulderTitle ],
                             secondaryMuscles: [ Save.tricepsLateralShortTitle, Save.serratusTitle], peakTension: [Save.mid], isBW: false)
    let exercise3 = Exercise(title: NSLocalizedString("removingExercises.chest2", comment: ""),     primaryMuscles: [Save.middleChestTitle, Save.frontShoulderTitle, ],
                             secondaryMuscles: [ Save.tricepsLateralShortTitle,Save.frontShoulderTitle, Save.serratusTitle], peakTension: [Save.mid], isBW: false)
    let exercise4 = Exercise(title: NSLocalizedString("removingExercises.chest3", comment: ""),     primaryMuscles: [Save.middleChestTitle],
                             secondaryMuscles: [ Save.tricepsLateralShortTitle,Save.frontShoulderTitle], peakTension: [Save.ecc, Save.con], isBW: false)
    let exercise5 = Exercise(title: NSLocalizedString("exercises.chest3", comment: ""), primaryMuscles: [Save.middleChestTitle]
                             , secondaryMuscles: [], peakTension: [Save.ecc, Save.con], isBW: false)
    let exercise6 = Exercise(title: NSLocalizedString("exercises.chest3", comment: ""), primaryMuscles: [Save.middleChestTitle, Save.frontShoulderTitle],
                             secondaryMuscles: [], peakTension: [Save.ecc], isBW: false)
    let exercise7 = Exercise(title: NSLocalizedString("bWExercises.chest1", comment: ""), primaryMuscles: [Save.middleChestTitle], secondaryMuscles: [], peakTension: [Save.con], isBW: true)
    let exercise8 = Exercise(title: "Push-Up", primaryMuscles: [Save.middleChestTitle, Save.frontShoulderTitle],
                            secondaryMuscles: [Save.tricepsLateralShortTitle , Save.serratusTitle], peakTension: [Save.mid], isBW: true)
    
    
    return [exercise, exercise1, exercise2, exercise3, exercise4, exercise5, exercise6, exercise7, exercise8]
}
    
    //Incline
func getUpperChestExercise() -> [Exercise] {
    let exercise = Exercise(title: Save.upperChestTitle, primaryMuscles: [Save.upperChestTitle], secondaryMuscles: [], peakTension: [], isBW: false)
let exercise0 = Exercise(title: NSLocalizedString("exercises.upperChest1", comment: ""),         primaryMuscles: [Save.upperChestTitle,Save.frontShoulderTitle ], secondaryMuscles: [ Save.tricepsLateralShortTitle, Save.serratusTitle], peakTension: [Save.mid], isBW: false)
let exercise1 = Exercise(title: NSLocalizedString("removingExercises.upperChest1", comment: ""), primaryMuscles: [Save.upperChestTitle,Save.frontShoulderTitle ], secondaryMuscles: [ Save.tricepsLateralShortTitle, Save.serratusTitle], peakTension: [Save.mid], isBW: false)
let exercise2 = Exercise(title: NSLocalizedString("removingExercises.upperChest2", comment: ""), primaryMuscles: [Save.upperChestTitle,Save.frontShoulderTitle ], secondaryMuscles: [ Save.tricepsLateralShortTitle, Save.serratusTitle], peakTension: [Save.mid], isBW: false)
let exercise3 = Exercise(title: NSLocalizedString("removingExercises.upperChest3", comment: ""),         primaryMuscles: [Save.upperChestTitle,Save.frontShoulderTitle ], secondaryMuscles: [ Save.tricepsLateralShortTitle, Save.serratusTitle], peakTension: [Save.ecc, Save.con], isBW: false)
    let exercise4 = Exercise(title: NSLocalizedString("exercises.upperChest3", comment: ""),    primaryMuscles: [Save.upperChestTitle], secondaryMuscles: [], peakTension: [Save.con, Save.ecc], isBW: false)
    let exercise5 = Exercise(title: NSLocalizedString("exercises.upperChest4", comment: ""),    primaryMuscles: [Save.upperChestTitle], secondaryMuscles: [], peakTension: [Save.con], isBW: false)
    let exercise6 = Exercise(title: NSLocalizedString("exercises.upperChest5", comment: ""), primaryMuscles: [Save.upperChestTitle, Save.tricepsLongTitle], secondaryMuscles: [Save.latsPushdownTitle], peakTension: [Save.ecc], isBW: false)
    let exercise7 = Exercise(title: NSLocalizedString("bWExercises.upperChest1", comment: ""), primaryMuscles: [Save.upperChestTitle], secondaryMuscles: [], peakTension: [Save.con], isBW: true)
    let exercise8 = Exercise(title: "Incline Push-Up", primaryMuscles: [Save.upperChestTitle, Save.frontShoulderTitle], secondaryMuscles: [Save.tricepsLateralShortTitle , Save.serratusTitle], peakTension: [Save.mid], isBW: true)
    
    return [exercise, exercise0, exercise1, exercise2, exercise3, exercise4, exercise5, exercise6, exercise7, exercise8]
}
    
    //Decline
func getLowerChestExercise() -> [Exercise] {
    let exercise = Exercise(title: Save.lowerChestTitle, primaryMuscles: [Save.lowerChestTitle], secondaryMuscles: [], peakTension: [], isBW: false)
    let exercise0 = Exercise(title: NSLocalizedString("exercises.lowerChest1", comment: ""),         primaryMuscles: [Save.lowerChestTitle ], secondaryMuscles: [ Save.tricepsLateralShortTitle, Save.serratusTitle], peakTension: [Save.mid], isBW: false)
let exercise1 = Exercise(title: NSLocalizedString("removingExercises.lowerChest1", comment: ""), primaryMuscles: [Save.lowerChestTitle ], secondaryMuscles: [ Save.tricepsLateralShortTitle, Save.serratusTitle],  peakTension: [Save.mid], isBW: false)
    let exercise2 = Exercise(title: NSLocalizedString("removingExercises.lowerChest2", comment: ""),  primaryMuscles: [Save.lowerChestTitle], secondaryMuscles: [ Save.tricepsLateralShortTitle, Save.serratusTitle], peakTension: [Save.mid], isBW: false)
    let exercise3 = Exercise(title: NSLocalizedString("exercises.lowerChest3", comment: ""),     primaryMuscles: [Save.lowerChestTitle],secondaryMuscles: [], peakTension: [Save.con, Save.ecc], isBW: false)
    let exercise4 = Exercise(title: NSLocalizedString("exercises.lowerChest4", comment: ""),     primaryMuscles: [Save.lowerChestTitle],secondaryMuscles: [], peakTension: [ Save.ecc], isBW: false)
    let exercise5 = Exercise(title: NSLocalizedString("bWExercises.lowerChest5", comment: ""), primaryMuscles: [Save.lowerChestTitle], secondaryMuscles: [], peakTension: [Save.con], isBW: true)
    let exercise6 = Exercise(title: NSLocalizedString("bWExercises.lowerChest6", comment: ""),    primaryMuscles: [Save.lowerChestTitle], secondaryMuscles: [ Save.tricepsLateralShortTitle, Save.serratusTitle], peakTension: [Save.mid], isBW: true)//TODO add to Alert Volume Manager


return [exercise, exercise0, exercise1, exercise2, exercise3, exercise4, exercise5, exercise6]
}

func getBicepsLongHeadExercise() -> [Exercise] {
    let exercise = Exercise(title: Save.bicepsLongHeadTitle, primaryMuscles: [Save.bicepsLongHeadTitle], secondaryMuscles: [], peakTension: [], isBW: false)
    let exercise0 = Exercise(title: NSLocalizedString("removingExercises.bicepsLong1", comment: ""),            primaryMuscles: [Save.bicepsLongHeadTitle], secondaryMuscles: [Save.bicepsShortHeadTitle, Save.forearmFlexorsTitle], peakTension: [Save.mid], isBW: false)
    let exercise1 = Exercise(title: NSLocalizedString("removingExercises.bicepsLong2", comment: ""),             primaryMuscles: [Save.bicepsShortHeadTitle], secondaryMuscles: [Save.bicepsShortHeadTitle, Save.forearmFlexorsTitle], peakTension: [Save.mid], isBW: false)
    let exercise2 = Exercise(title: NSLocalizedString("removingExercises.bicepsLong3", comment: ""),              primaryMuscles: [Save.bicepsShortHeadTitle], secondaryMuscles: [Save.bicepsShortHeadTitle, Save.forearmFlexorsTitle], peakTension: [Save.mid], isBW: false)
    let exercise3 = Exercise(title: NSLocalizedString("removingExercises.bicepsLong4", comment: ""),                 primaryMuscles: [Save.bicepsShortHeadTitle], secondaryMuscles: [Save.bicepsShortHeadTitle], peakTension: [Save.mid], isBW: true)//TODO Add to alert
    let exercise4 = Exercise(title: NSLocalizedString("removingExercises.bicepsLong5", comment: ""),                 primaryMuscles: [Save.bicepsShortHeadTitle], secondaryMuscles: [Save.bicepsShortHeadTitle], peakTension: [Save.con], isBW: true)//TODO Add to alert
    return [exercise, exercise0, exercise1, exercise2, exercise3,exercise4]
}
    
func getBicepsShortHeadExercise() -> [Exercise] {
    let exercise = Exercise(title: Save.bicepsShortHeadTitle, primaryMuscles: [Save.bicepsShortHeadTitle], secondaryMuscles: [], peakTension: [], isBW: false)
    let exercise0 = Exercise(title: NSLocalizedString("removingExercises.bicepsShort1", comment: ""),              primaryMuscles: [Save.bicepsShortHeadTitle], secondaryMuscles: [ Save.forearmFlexorsTitle, Save.bicepsLongHeadTitle], peakTension: [Save.mid], isBW: false)
    let exercise1 = Exercise(title: NSLocalizedString("removingExercises.bicepsShort2", comment: ""), primaryMuscles: [Save.bicepsShortHeadTitle], secondaryMuscles: [ Save.forearmFlexorsTitle, Save.bicepsLongHeadTitle], peakTension: [Save.mid], isBW: false)
    let exercise2 = Exercise(title: NSLocalizedString("removingExercises.bicepsShort3", comment: ""),                primaryMuscles: [Save.bicepsShortHeadTitle], secondaryMuscles: [ Save.forearmFlexorsTitle, Save.bicepsLongHeadTitle], peakTension: [Save.mid], isBW: false)
    let exercise3 = Exercise(title: NSLocalizedString("removingExercises.bicepsShort4", comment: ""),                    primaryMuscles: [Save.bicepsShortHeadTitle], secondaryMuscles: [ Save.bicepsLongHeadTitle], peakTension: [Save.mid], isBW: false)//TODO Add to alert
    let exercise4 = Exercise(title: NSLocalizedString("removingExercises.bicepsShort5", comment: ""),                 primaryMuscles: [Save.bicepsShortHeadTitle], secondaryMuscles: [ Save.bicepsLongHeadTitle], peakTension: [Save.con], isBW: true)//TODO Add to alert
                                return [exercise, exercise0, exercise1, exercise2, exercise3, exercise4]
}
    
func getBrachialisExercises() -> [Exercise] {
    let exercise = Exercise(title: Save.brachialisTitle, primaryMuscles: [Save.brachialisTitle], secondaryMuscles: [], peakTension: [], isBW: false)
    let exercise0 = Exercise(title: NSLocalizedString("exercises.brachialis1", comment: ""),         primaryMuscles: [Save.brachialisTitle, Save.radialForearmTitle ], secondaryMuscles: [ Save.bicepsShortHeadTitle, Save.bicepsLongHeadTitle], peakTension: [Save.mid], isBW: false)
    
    let exercise1 = Exercise(title: NSLocalizedString("bWExercises.brachialis1", comment: ""),         primaryMuscles: [Save.latsPullInTitle, Save.brachialisTitle, Save.radialForearmTitle ], secondaryMuscles: [ Save.bicepsShortHeadTitle, Save.bicepsLongHeadTitle, Save.lowerTrapsTitle], peakTension: [Save.mid, Save.con], isBW: true)//TODO Add to alert
    
    return [exercise, exercise0, exercise1]
}
        //TODO integrate and localize strings
func getBicepFinisherExercises() -> [Exercise] {
    let exercise = Exercise(title: Save.bicepsShortHeadTitle, primaryMuscles: [Save.bicepsShortHeadTitle], secondaryMuscles: [], peakTension: [], isBW: false)
    let exercise0 = Exercise(title: "Dumbbell Curls",                   primaryMuscles: [Save.bicepsShortHeadTitle, Save.bicepsLongHeadTitle], secondaryMuscles: [ Save.forearmFlexorsTitle], peakTension: [Save.mid], isBW: false)
    let exercise1 = Exercise(title: "Barbell Curls",                    primaryMuscles: [Save.bicepsShortHeadTitle, Save.bicepsLongHeadTitle ], secondaryMuscles: [ Save.forearmFlexorsTitle], peakTension: [Save.mid], isBW: false)
    let exercise2 = Exercise(title: "Preacher Curls",                   primaryMuscles: [Save.bicepsShortHeadTitle, Save.bicepsLongHeadTitle], secondaryMuscles: [ Save.forearmFlexorsTitle], peakTension: [Save.con], isBW: false)
    let exercise3 = Exercise(title: "Limp Wrist Curls",                primaryMuscles: [Save.bicepsShortHeadTitle, Save.bicepsLongHeadTitle], secondaryMuscles: [], peakTension: [Save.mid], isBW: false)
    let exercise4 = Exercise(title: "Biceps Isometric", primaryMuscles: [Save.bicepsShortHeadTitle, Save.bicepsLongHeadTitle], secondaryMuscles: [], peakTension: [Save.mid], isBW: false)
    let exercise5 = Exercise(title: "Cable/Dumbbell Behind the Back Curls",     primaryMuscles: [Save.bicepsShortHeadTitle, Save.bicepsLongHeadTitle], secondaryMuscles: [ Save.forearmFlexorsTitle], peakTension: [Save.ecc], isBW: false)//TODO add to alert
    let exercise6 = Exercise(title: "Ring Curls",     primaryMuscles: [Save.bicepsShortHeadTitle, Save.bicepsLongHeadTitle], secondaryMuscles: [ Save.forearmFlexorsTitle], peakTension: [Save.mid, Save.con], isBW: true)
    let exercise7 = Exercise(title: "Pelican Curls",     primaryMuscles: [Save.bicepsShortHeadTitle, Save.bicepsLongHeadTitle], secondaryMuscles: [ Save.forearmFlexorsTitle], peakTension: [Save.mid, Save.con], isBW: true)
    return [exercise, exercise0, exercise1, exercise2, exercise3, exercise4, exercise5, exercise6, exercise7]
}
    
func getLatsRowingExercise() -> [Exercise] {
    let exercise = Exercise(title: Save.latsRowingTitle, primaryMuscles: [Save.latsRowingTitle], secondaryMuscles: [], peakTension: [], isBW: false)
    let exercise0 = Exercise(title: NSLocalizedString("exercises.latsRowing1", comment: ""),      primaryMuscles: [Save.latsRowingTitle], secondaryMuscles: [ Save.backShoulderTitle, Save.bicepsShortHeadTitle, Save.bicepsLongHeadTitle, Save.forearmFlexorsTitle], peakTension: [Save.ecc, Save.con], isBW: false)
    let exercise1 = Exercise(title: NSLocalizedString("exercises.latsRowing2", comment: ""), primaryMuscles: [Save.latsRowingTitle], secondaryMuscles: [ Save.backShoulderTitle, Save.bicepsShortHeadTitle, Save.bicepsLongHeadTitle, Save.forearmFlexorsTitle], peakTension: [Save.mid, Save.con], isBW: false)
    let exercise2 = Exercise(title: NSLocalizedString("exercises.latsRowing3", comment: ""),         primaryMuscles: [Save.latsRowingTitle, Save.spinalErectorsTitle ], secondaryMuscles: [ Save.backShoulderTitle, Save.bicepsShortHeadTitle, Save.bicepsLongHeadTitle, Save.forearmFlexorsTitle, Save.hamstringHingeTitle, Save.glutesTitle], peakTension: [Save.mid, Save.con], isBW: false)
    let exercise3 = Exercise(title: NSLocalizedString("exercises.latsRowing4", comment: ""),           primaryMuscles: [Save.latsRowingTitle, Save.spinalErectorsTitle ], secondaryMuscles: [ Save.backShoulderTitle, Save.bicepsShortHeadTitle, Save.bicepsLongHeadTitle, Save.forearmFlexorsTitle], peakTension: [Save.mid, Save.con], isBW: false)
    let exercise4 = Exercise(title: NSLocalizedString("bWExercises.latsRowing1", comment: ""),    primaryMuscles: [Save.latsRowingTitle ], secondaryMuscles: [ Save.backShoulderTitle, Save.bicepsShortHeadTitle, Save.bicepsLongHeadTitle, Save.forearmFlexorsTitle], peakTension: [Save.mid, Save.con], isBW: true)
    return [exercise, exercise0, exercise1, exercise2, exercise3, exercise4]
}
    
func getLatsPullinExercise() -> [Exercise] {
    let exercise = Exercise(title: Save.latsPullInTitle, primaryMuscles: [Save.latsPullInTitle], secondaryMuscles: [], peakTension: [], isBW: false)
    let exercise0 = Exercise(title: NSLocalizedString("exercises.latsPull-In1", comment: ""),       primaryMuscles: [Save.latsPullInTitle], secondaryMuscles: [ Save.backShoulderTitle, Save.bicepsShortHeadTitle, Save.bicepsLongHeadTitle, Save.forearmFlexorsTitle], peakTension: [Save.con, Save.mid], isBW: false)
    //TODO add string without breaking the whole damn thing
    let exercise1 = Exercise(title: NSLocalizedString("removingExercises.latPullIn1", comment: ""),     primaryMuscles: [ Save.latsPullInTitle], secondaryMuscles: [ Save.backShoulderTitle, Save.bicepsShortHeadTitle, Save.bicepsLongHeadTitle, Save.forearmFlexorsTitle], peakTension: [Save.mid, Save.con], isBW: true)
    let exercise2 = Exercise(title: NSLocalizedString("removingExercises.latPullIn2", comment: ""),     primaryMuscles: [Save.latsPullInTitle, Save.bicepsShortHeadTitle ], secondaryMuscles: [ Save.backShoulderTitle, Save.forearmFlexorsTitle], peakTension: [Save.mid, Save.con], isBW: true)
    let exercise3 = Exercise(title: NSLocalizedString("removingExercises.latPullIn3", comment: ""),     primaryMuscles: [Save.latsPullInTitle], secondaryMuscles: [], peakTension: [Save.mid, Save.con], isBW: false)
    
    return [exercise, exercise0, exercise1, exercise2, exercise3]
}
    
func getLatsPushdownExercise() -> [Exercise] {
    let exercise = Exercise(title: Save.latsPushdownTitle, primaryMuscles: [Save.latsPushdownTitle], secondaryMuscles: [], peakTension: [], isBW: false)

    let exercise1 = Exercise(title: NSLocalizedString("exercises.latsPushdown1", comment: ""),        primaryMuscles: [Save.latsPushdownTitle, Save.tricepsLongTitle], secondaryMuscles: [Save.upperChestTitle], peakTension: [Save.ecc], isBW: false)
    let exercise2 = Exercise(title: NSLocalizedString("exercises.latsPushdown2", comment: ""),        primaryMuscles: [Save.latsPushdownTitle, Save.tricepsLateralShortTitle, Save.ulnarForearm], secondaryMuscles: [], peakTension: [Save.con], isBW: false)
    let exercise3 = Exercise(title: NSLocalizedString("bWExercises.latsPushdown1", comment: ""), primaryMuscles: [  Save.latsPushdownTitle, Save.tricepsLateralShortTitle], secondaryMuscles: [], peakTension: [Save.mid], isBW: true)

return [exercise, exercise1, exercise2, exercise3]
}

func getGluteTitleExercise() -> [Exercise] {
    let exercise = Exercise(title: Save.glutesTitle, primaryMuscles: [Save.glutesTitle], secondaryMuscles: [], peakTension: [], isBW: false)
    let exercise0 = Exercise(title: NSLocalizedString("exercises.gluteMax1", comment: ""),                primaryMuscles: [Save.glutesTitle, Save.spinalErectorsTitle ], secondaryMuscles: [ Save.hamstringHingeTitle , Save.gluteMediusTitle], peakTension: [Save.ecc, Save.mid, Save.con], isBW: false)
    let exercise1 = Exercise(title: NSLocalizedString("exercises.gluteMax2", comment: ""),        primaryMuscles: [Save.glutesTitle ], secondaryMuscles: [ Save.hamstringHingeTitle, Save.gluteMediusTitle], peakTension: [Save.ecc, Save.mid, Save.con], isBW: false)
    let exercise2 = Exercise(title: NSLocalizedString("exercises.gluteMax3", comment: ""), primaryMuscles: [Save.glutesTitle ], secondaryMuscles: [ Save.hamstringHingeTitle, Save.gluteMediusTitle], peakTension: [ Save.mid], isBW: false)
    let exercise3 = Exercise(title: NSLocalizedString("exercises.gluteMax4", comment: ""),          primaryMuscles: [Save.glutesTitle ], secondaryMuscles: [ Save.hamstringHingeTitle, Save.gluteMediusTitle], peakTension: [Save.ecc], isBW: false)
    let exercise4 = Exercise(title: NSLocalizedString("removingExercises.gluteMax1", comment: ""),                primaryMuscles: [Save.glutesTitle, Save.spinalErectorsTitle ], secondaryMuscles: [ Save.hamstringHingeTitle , Save.gluteMediusTitle], peakTension: [Save.ecc, Save.mid, Save.con], isBW: true)
    let exercise5 = Exercise(title: NSLocalizedString("bWExercises.gluteMax2", comment: ""),                primaryMuscles: [Save.glutesTitle, Save.spinalErectorsTitle, Save.gluteMediusTitle ], secondaryMuscles: [ Save.hamstringHingeTitle , Save.gluteMediusTitle], peakTension: [Save.ecc, Save.mid, Save.con], isBW: true)
    let exercise6 = Exercise(title: NSLocalizedString("bWExercises.gluteMax3", comment: ""),            primaryMuscles: [Save.glutesTitle, Save.gluteMediusTitle ], secondaryMuscles: [ Save.hamstringHingeTitle], peakTension: [Save.ecc], isBW: false)
    let exercise7 = Exercise(title: NSLocalizedString("bWExercises.gluteMax4", comment: ""),                primaryMuscles: [Save.glutesTitle, Save.gluteMediusTitle, Save.hamstringHingeTitle], secondaryMuscles: [], peakTension: [Save.con], isBW: true)
    let exercise8 = Exercise(title: NSLocalizedString("bWExercises.gluteMax5", comment: ""),           primaryMuscles: [Save.spinalErectorsTitle, Save.glutesTitle], secondaryMuscles: [], peakTension: [Save.con], isBW: true)
    let exercise9 = Exercise(title: NSLocalizedString("bWExercises.gluteMax6", comment: ""),      primaryMuscles: [Save.glutesTitle ], secondaryMuscles: [ Save.hamstringHingeTitle, Save.gluteMediusTitle], peakTension: [Save.ecc, Save.mid], isBW: false)
    return [exercise, exercise0, exercise1, exercise2, exercise3, exercise4, exercise5, exercise6, exercise7, exercise8, exercise9]
}

func getGluteMediusExercise() -> [Exercise] {
    let exercise = Exercise(title: Save.gluteMediusTitle, primaryMuscles: [Save.gluteMediusTitle], secondaryMuscles: [], peakTension: [], isBW: false)
    let exercise0 = Exercise(title: NSLocalizedString("exercises.gluteMedius1", comment: ""),             primaryMuscles: [Save.gluteMediusTitle], secondaryMuscles: [], peakTension: [Save.mid, Save.con], isBW: false)
    let exercise1 = Exercise(title: NSLocalizedString("exercises.gluteMedius2", comment: ""), primaryMuscles: [Save.gluteMediusTitle], secondaryMuscles: [], peakTension: [Save.ecc], isBW: false)//TODO add to alerts
    let exercise2 = Exercise(title: NSLocalizedString("exercises.gluteMedius3", comment: ""),  primaryMuscles: [Save.gluteMediusTitle], secondaryMuscles: [], peakTension: [Save.ecc, Save.mid], isBW: false)
    let exercise3 = Exercise(title: NSLocalizedString("bWExercises.gluteMedius1", comment: ""),     primaryMuscles: [Save.gluteMediusTitle], secondaryMuscles: [], peakTension: [Save.con], isBW: true)
    let exercise4 = Exercise(title: NSLocalizedString("bWExercises.gluteMedius2", comment: ""),           primaryMuscles: [ Save.gluteMediusTitle], secondaryMuscles: [], peakTension: [Save.con], isBW: true)
    let exercise5 = Exercise(title: NSLocalizedString("bWExercises.gluteMedius3" , comment: ""),           primaryMuscles: [Save.gluteMediusTitle ], secondaryMuscles: [ Save.middleObliquesTitle], peakTension: [Save.con], isBW: true)
    return [exercise, exercise0, exercise1, exercise2, exercise3, exercise4, exercise5]
}

func getHamstringsHingeExercise() -> [Exercise] {
    let exercise = Exercise(title: Save.hamstringHingeTitle, primaryMuscles: [Save.hamstringHingeTitle], secondaryMuscles: [], peakTension: [], isBW: false)
    let exercise0 = Exercise(title: NSLocalizedString("exercises.hamstringsHinge1", comment: ""),                 primaryMuscles: [Save.hamstringHingeTitle, Save.spinalErectorsTitle, Save.upperTrapsTitle ], secondaryMuscles: [ Save.latsPushdownTitle, Save.glutesTitle, Save.lowerTrapsTitle, Save.transverseAbTitle], peakTension: [Save.mid], isBW: false)
    let exercise1 = Exercise(title: NSLocalizedString("exercises.hamstringsHinge2", comment: ""),        primaryMuscles: [Save.hamstringHingeTitle, ], secondaryMuscles: [ Save.glutesTitle, Save.spinalErectorsTitle], peakTension: [Save.ecc], isBW: false)
    let exercise2 = Exercise(title: NSLocalizedString("exercises.hamstringsHinge3", comment: ""),         primaryMuscles: [Save.hamstringHingeTitle ], secondaryMuscles: [ Save.glutesTitle, Save.spinalErectorsTitle], peakTension: [Save.ecc], isBW: false)
    let exercise3 = Exercise(title: NSLocalizedString("exercises.hamstringsHinge4", comment: ""),   primaryMuscles: [Save.hamstringHingeTitle, Save.gluteMediusTitle ], secondaryMuscles: [ Save.glutesTitle, Save.spinalErectorsTitle], peakTension: [Save.ecc], isBW: false)
    let exercise4 = Exercise(title: NSLocalizedString("bWExercises.hamstringsHinge1", comment: ""), primaryMuscles: [Save.hamstringHingeTitle ], secondaryMuscles: [ Save.glutesTitle, Save.spinalErectorsTitle], peakTension: [Save.ecc], isBW: false)
    
    
    return [exercise, exercise0, exercise1, exercise2, exercise3, exercise4]
}

func getHamstringsCurlExercise() -> [Exercise] {
    let exercise = Exercise(title: Save.hamstringCurlTitle, primaryMuscles: [Save.hamstringCurlTitle], secondaryMuscles: [], peakTension: [], isBW: false)
    let exercise3 = Exercise(title: NSLocalizedString("exercises.hamstringsCurl1", comment: ""),  primaryMuscles: [Save.hamstringCurlTitle, Save.gluteMediusTitle ], secondaryMuscles: [ Save.glutesTitle, Save.spinalErectorsTitle], peakTension: [Save.con], isBW: false)
    let exercise0 = Exercise(title: NSLocalizedString("bWexercises.hamstringsCurl1", comment: ""),                primaryMuscles: [ Save.hamstringCurlTitle ], secondaryMuscles: [ Save.glutesTitle, Save.spinalErectorsTitle], peakTension: [Save.ecc], isBW: true)
    let exercise1 = Exercise(title: NSLocalizedString("bWexercises.hamstringsCurl2", comment: ""),             primaryMuscles: [Save.hamstringCurlTitle ], secondaryMuscles: [ Save.glutesTitle, Save.spinalErectorsTitle], peakTension: [Save.con], isBW: true)
    let exercise2 = Exercise(title: NSLocalizedString("bWexercises.hamstringsCurl3", comment: ""),  primaryMuscles: [Save.hamstringCurlTitle, Save.gluteMediusTitle ], secondaryMuscles: [ Save.glutesTitle, Save.spinalErectorsTitle], peakTension: [Save.con], isBW: true)
   
  
    
    return [exercise, exercise0, exercise1, exercise2, exercise3]
}

func getFrontShoulderExercise() -> [Exercise] {
    let exercise = Exercise(title: Save.frontShoulderTitle, primaryMuscles: [Save.frontShoulderTitle], secondaryMuscles: [], peakTension: [], isBW: false)

    let exercise0 = Exercise(title: NSLocalizedString("exercises.anteriorDeltoid1", comment: ""),                 primaryMuscles: [Save.frontShoulderTitle ], secondaryMuscles: [ Save.tricepsLateralShortTitle, Save.lateralShoulderTitle], peakTension: [Save.ecc], isBW: false)
    let exercise1 = Exercise(title: NSLocalizedString("exercises.anteriorDeltoid2", comment: ""),  primaryMuscles: [Save.frontShoulderTitle ], secondaryMuscles: [ Save.tricepsLateralShortTitle], peakTension: [Save.con], isBW: false)
    let exercise2 = Exercise(title: NSLocalizedString("exercises.anteriorDeltoid3", comment: ""),            primaryMuscles: [Save.frontShoulderTitle ], secondaryMuscles: [ Save.tricepsLateralShortTitle, Save.lateralShoulderTitle], peakTension: [Save.ecc], isBW: false)
    let exercise3 = Exercise(title: NSLocalizedString("exercises.anteriorDeltoid3", comment: ""),    primaryMuscles: [Save.frontShoulderTitle ], secondaryMuscles: [ Save.tricepsLateralShortTitle, Save.lateralShoulderTitle], peakTension: [Save.ecc], isBW: false)
    let exercise4 = Exercise(title: NSLocalizedString("exercises.anteriorDeltoid4", comment: ""),          primaryMuscles: [Save.frontShoulderTitle ], secondaryMuscles: [ Save.tricepsLateralShortTitle, Save.lateralShoulderTitle], peakTension: [Save.ecc], isBW: false)
    let exercise5 = Exercise(title: NSLocalizedString("exercises.anteriorDeltoid5", comment: ""),  primaryMuscles: [Save.frontShoulderTitle ], secondaryMuscles: [ Save.tricepsLateralShortTitle, Save.lateralShoulderTitle], peakTension: [Save.mid], isBW: false)
    let exercise6 = Exercise(title: NSLocalizedString("exercises.anteriorDeltoid6", comment: ""),              primaryMuscles: [Save.frontShoulderTitle ], secondaryMuscles: [ Save.tricepsLateralShortTitle, Save.lateralShoulderTitle], peakTension: [Save.mid], isBW: false)
    let exercise7 = Exercise(title: NSLocalizedString("exercises.anteriorDeltoid7", comment: ""), primaryMuscles: [Save.frontShoulderTitle], secondaryMuscles: [], peakTension:[ Save.con], isBW: false)
    let exercise8 = Exercise(title: NSLocalizedString("bWExercises.anteriorDeltoid1", comment: ""),      primaryMuscles: [  Save.frontShoulderTitle ], secondaryMuscles: [ Save.tricepsLateralShortTitle, Save.lateralShoulderTitle], peakTension: [Save.mid], isBW: true)
    let exercise9 = Exercise(title: NSLocalizedString("bWExercises.anteriorDeltoid1", comment: ""), primaryMuscles: [ Save.frontShoulderTitle ], secondaryMuscles: [ Save.tricepsLateralShortTitle, Save.lateralShoulderTitle], peakTension: [Save.mid], isBW: true)
    
    
    return [exercise, exercise0, exercise1, exercise2, exercise3, exercise4, exercise5, exercise6, exercise7, exercise8, exercise9]
}
    
func getLateralShoulderExercise() -> [Exercise] {
    let exercise = Exercise(title: Save.lateralShoulderTitle, primaryMuscles: [Save.lateralShoulderTitle], secondaryMuscles: [], peakTension: [], isBW: false)

    let exercise0 = Exercise(title: NSLocalizedString("exercises.lateralDeltoid1", comment: ""),    primaryMuscles: [Save.lateralShoulderTitle], secondaryMuscles: [], peakTension: [Save.ecc, Save.con], isBW: false)
    let exercise1 = Exercise(title: NSLocalizedString("exercises.lateralDeltoid2", comment: ""),   primaryMuscles: [Save.lateralShoulderTitle], secondaryMuscles: [], peakTension: [Save.con], isBW: false)
    let exercise2 = Exercise(title: NSLocalizedString("exercises.lateralDeltoid3", comment: ""),     primaryMuscles: [Save.lateralShoulderTitle, Save.upperTrapsTitle], secondaryMuscles: [], peakTension: [Save.con], isBW: false)
    let exercise3 = Exercise(title: NSLocalizedString("exercises.lateralDeltoid4", comment: ""),           primaryMuscles: [Save.lateralShoulderTitle], secondaryMuscles: [], peakTension: [Save.mid, Save.con], isBW: false)
    let exercise4 = Exercise(title: NSLocalizedString("bWExercises.lateralDeltoid1", comment: ""),     primaryMuscles: [Save.lateralShoulderTitle], secondaryMuscles: [], peakTension: [Save.ecc, Save.mid, Save.con], isBW: true)
    
    return [exercise, exercise0, exercise1, exercise2, exercise3, exercise4]
}

func getBackShoulderExercise() -> [Exercise] {
    let exercise = Exercise(title: Save.backShoulderTitle, primaryMuscles: [Save.backShoulderTitle], secondaryMuscles: [], peakTension: [], isBW: false)
    let exercise1 = Exercise(title: NSLocalizedString("exercises.posteriorDeltoid1", comment: ""),  primaryMuscles: [Save.backShoulderTitle, Save.lowerTrapsTitle], secondaryMuscles: [], peakTension: [Save.mid], isBW: false)
    let exercise2 = Exercise(title: NSLocalizedString("exercises.posteriorDeltoid2", comment: ""),                   primaryMuscles: [Save.rotatorCuffTitle,  Save.backShoulderTitle, Save.radialForearmTitle, Save.lowerTrapsTitle], secondaryMuscles: [], peakTension: [Save.mid], isBW: false)
    let exercise3 = Exercise(title: NSLocalizedString("exercises.posteriorDeltoid3", comment: ""),                         primaryMuscles: [Save.backShoulderTitle, Save.rotatorCuffTitle, Save.radialForearmTitle, Save.lowerTrapsTitle], secondaryMuscles: [], peakTension: [Save.con, Save.mid], isBW: false)
    let exercise4 = Exercise(title: "Reverse Pec Deck",             primaryMuscles: [Save.lowerTrapsTitle , Save.backShoulderTitle], secondaryMuscles: [], peakTension: [Save.mid, Save.con], isBW: false)

    let exercise5 = Exercise(title: NSLocalizedString("bWExercises.posteriorDeltoid1", comment: ""),          primaryMuscles: [  Save.backShoulderTitle, Save.lowerTrapsTitle], secondaryMuscles: [], peakTension: [Save.con], isBW: true)
    let exercise6 = Exercise(title: NSLocalizedString("bWExercises.posteriorDeltoid2", comment: ""), primaryMuscles: [ Save.backShoulderTitle, Save.lowerTrapsTitle], secondaryMuscles: [], peakTension: [Save.con], isBW: true)
    let exercise7 = Exercise(title: NSLocalizedString("bWExercises.posteriorDeltoid3", comment: ""),     primaryMuscles: [Save.backShoulderTitle, Save.rotatorCuffTitle ], secondaryMuscles:[]  ,peakTension: [Save.con], isBW: true)
    let exercise8 = Exercise(title: NSLocalizedString("bWExercises.posteriorDeltoid4", comment: ""),    primaryMuscles: [Save.spinalErectorsTitle, Save.backShoulderTitle], secondaryMuscles: [], peakTension: [Save.con], isBW: true)
    
    return [exercise, exercise1, exercise2, exercise3, exercise4, exercise5, exercise6, exercise7, exercise8]
}

func getRotatorCuffExercise() -> [Exercise] {
    let exercise = Exercise(title: Save.rotatorCuffTitle, primaryMuscles: [Save.rotatorCuffTitle], secondaryMuscles: [], peakTension: [], isBW: false)
  
    let exercise1 = Exercise(title: NSLocalizedString("exercises.rotatorCuff1", comment: ""),          primaryMuscles: [Save.rotatorCuffTitle, Save.forearmExtensorsTitle], secondaryMuscles: [], peakTension: [Save.mid], isBW: false)
    let exercise2 = Exercise(title: NSLocalizedString("exercises.rotatorCuff2", comment: ""), primaryMuscles: [Save.rotatorCuffTitle, Save.forearmExtensorsTitle], secondaryMuscles: [], peakTension: [Save.mid], isBW: false)
    let exercise3 = Exercise(title: NSLocalizedString("exercises.rotatorCuff3", comment: ""),                              primaryMuscles: [Save.backShoulderTitle, Save.rotatorCuffTitle, Save.radialForearmTitle, Save.lowerTrapsTitle], secondaryMuscles: [], peakTension: [Save.con], isBW: false)
    let exercise4 = Exercise(title: NSLocalizedString("exercises.rotatorCuff4", comment: ""),               primaryMuscles: [Save.rotatorCuffTitle, Save.lowerTrapsTitle, Save.backShoulderTitle], secondaryMuscles: [], peakTension: [Save.mid], isBW: false)
    let exercise5 = Exercise(title: NSLocalizedString("exercises.rotatorCuff5", comment: ""),                        primaryMuscles: [Save.rotatorCuffTitle, Save.lowerTrapsTitle, Save.backShoulderTitle, Save.radialForearmTitle], secondaryMuscles: [], peakTension: [], isBW: false)
    let exercise6 = Exercise(title: NSLocalizedString("bWExercises.rotatorCuff1", comment: ""),            primaryMuscles: [  Save.rotatorCuffTitle, Save.lowerTrapsTitle, Save.backShoulderTitle], secondaryMuscles: [], peakTension: [Save.mid], isBW: true)
    let exercise7 = Exercise(title: NSLocalizedString("bWExercises.rotatorCuff2", comment: ""), primaryMuscles: [ Save.rotatorCuffTitle, Save.forearmExtensorsTitle], secondaryMuscles: [], peakTension: [Save.con, Save.mid], isBW: true)
    
    return [exercise, exercise1, exercise2, exercise3, exercise4, exercise5, exercise6, exercise7]
}

    func getTricepsLongExercise() -> [Exercise] {
    let exercise = Exercise(title: Save.tricepsLongTitle, primaryMuscles: [Save.tricepsLongTitle], secondaryMuscles: [], peakTension: [], isBW: false)
        let exercise0 = Exercise(title: NSLocalizedString("exercises.tricepsLongHead1", comment: ""),       primaryMuscles: [Save.tricepsLongTitle, Save.ulnarForearmTitle], secondaryMuscles: [Save.middleAbsTitle], peakTension: [Save.ecc], isBW: false)// TODO Update alert
        let exercise1 = Exercise(title: NSLocalizedString("exercises.tricepsLongHead2", comment: ""),            primaryMuscles: [Save.tricepsLongTitle, Save.upperChestTitle, Save.ulnarForearmTitle ], secondaryMuscles: [Save.frontShoulderTitle, Save.tricepsLateralShortTitle], peakTension: [Save.ecc], isBW: false) // TODO update in alert
        let exercise2 = Exercise(title: NSLocalizedString("exercises.tricepsLongHead3", comment: ""),       primaryMuscles: [Save.tricepsLongTitle, Save.ulnarForearmTitle], secondaryMuscles: [Save.middleAbsTitle], peakTension: [Save.ecc], isBW: true)// TODO Update alert
        let exercise3 = Exercise(title: NSLocalizedString("exercises.tricepsLongHead4", comment: ""), primaryMuscles: [Save.tricepsLongTitle, Save.ulnarForearmTitle], secondaryMuscles: [], peakTension: [Save.con], isBW: false)
        let exercise4 = Exercise(title: NSLocalizedString("bWExercises.tricepsLongHead1", comment: ""),       primaryMuscles: [Save.tricepsLongTitle, Save.ulnarForearmTitle], secondaryMuscles: [Save.middleAbsTitle], peakTension: [Save.ecc], isBW: true)
    
        
        return [exercise, exercise0, exercise1, exercise2, exercise3, exercise4]
    }
    
func getTricepsLateralAndShortExercise() -> [Exercise] {
    let exercise = Exercise(title: Save.tricepsLateralShortTitle, primaryMuscles: [Save.tricepsLateralShortTitle], secondaryMuscles: [], peakTension: [], isBW: false)
   
    let exercise1 = Exercise(title: "Cable Rope Pushdowns",  primaryMuscles: [Save.tricepsLateralShortTitle, Save.ulnarForearmTitle], secondaryMuscles: [], peakTension: [Save.con], isBW: false) //TODO Update alert
    let exercise2 = Exercise(title: "V Bar Pushdowns",             primaryMuscles: [Save.tricepsLateralShortTitle, Save.ulnarForearmTitle], secondaryMuscles: [], peakTension: [Save.con], isBW: false)
    let exercise3 = Exercise(title: "Close Grip Dumbbell Press",   primaryMuscles:[Save.tricepsLateralShortTitle ], secondaryMuscles: [ Save.middleChestTitle ,Save.frontShoulderTitle], peakTension: [Save.con], isBW: false)
    let exercise4 = Exercise(title: "Triceps Kickback",  primaryMuscles: [Save.tricepsLateralShortTitle], secondaryMuscles: [], peakTension: [Save.con], isBW: false)
    
    let exercise5 = Exercise(title: "Narrow Dip",                  primaryMuscles: [Save.tricepsLongTitle, Save.tricepsLateralShortTitle, Save.lowerChestTitle], secondaryMuscles: [], peakTension: [Save.mid], isBW: true)
    let exercise6 = Exercise(title: "Bench Dip",   primaryMuscles: [Save.tricepsLateralShortTitle, Save.tricepsLongTitle], secondaryMuscles: [], peakTension: [Save.ecc, Save.mid], isBW: true)
    let exercise7 = Exercise(title: "Narrow Pushup",     primaryMuscles: [Save.tricepsLateralShortTitle, Save.lowerChestTitle ], secondaryMuscles: [ Save.frontShoulderTitle], peakTension: [Save.mid], isBW: true)
    let exercise8 = Exercise(title: "Triceps Extension",          primaryMuscles: [Save.tricepsLateralShortTitle], secondaryMuscles: [], peakTension: [Save.con], isBW: true)
    
    
    return [exercise, exercise1, exercise2, exercise3, exercise4, exercise5
            , exercise6, exercise7, exercise8]
}
    
func getQuadsExercise() -> [Exercise] {
    let exercise = Exercise(title: Save.quadsTitle, primaryMuscles: [Save.quadsTitle], secondaryMuscles: [], peakTension: [], isBW: false)
   
    let exercise1 = Exercise(title: NSLocalizedString("exercises.quads1", comment: ""),                           primaryMuscles: [Save.quadsTitle, Save.spinalErectorsTitle, Save.adductorsTitle ], secondaryMuscles: [ Save.glutesTitle, Save.transverseAbTitle, Save.anteriorTibialisTitle], peakTension: [Save.ecc, Save.mid], isBW: false)
    let exercise2 = Exercise(title: NSLocalizedString("exercises.quads2", comment: ""),                  primaryMuscles: [Save.quadsTitle], secondaryMuscles: [], peakTension: [Save.con], isBW: false)
    let exercise3 = Exercise(title: NSLocalizedString("exercises.quads3", comment: ""),                 primaryMuscles: [Save.quadsTitle, Save.gluteMediusTitle], secondaryMuscles: [], peakTension: [Save.mid], isBW: false)
    let exercise4 = Exercise(title: NSLocalizedString("exercises.quads4", comment: ""),                        primaryMuscles: [Save.quadsTitle], secondaryMuscles: [], peakTension: [Save.mid], isBW: false)
    let exercise5 = Exercise(title: NSLocalizedString("exercises.quads5", comment: ""),                primaryMuscles: [Save.quadsTitle ], secondaryMuscles: [ Save.gluteMediusTitle], peakTension: [Save.ecc], isBW: false)
    let exercise6 = Exercise(title: NSLocalizedString("exercises.quads6", comment: ""),            primaryMuscles: [Save.quadsTitle ], secondaryMuscles: [ Save.gluteMediusTitle], peakTension: [Save.mid], isBW: false)
    let exercise7 = Exercise(title: NSLocalizedString("exercises.quads7", comment: ""),                       primaryMuscles: [Save.quadsTitle, Save.gluteMediusTitle ], secondaryMuscles: [ ], peakTension: [Save.mid], isBW: true)
    
    
    
    
    let exercise8 = Exercise(title: NSLocalizedString("bWExercises.quads1", comment: ""),                    primaryMuscles: [Save.quadsTitle, Save.gluteMediusTitle ], secondaryMuscles: [ Save.glutesTitle], peakTension: [Save.ecc, Save.mid], isBW: true)
    
    let exercise9 = Exercise(title: NSLocalizedString("bWExercises.quads2", comment: ""),        primaryMuscles: [  Save.quadsTitle], secondaryMuscles: [],peakTension: [Save.con], isBW: true)
    let exercise10 = Exercise(title: NSLocalizedString("bWExercises.quads3", comment: ""), primaryMuscles: [Save.quadsTitle ], secondaryMuscles: [ Save.gluteMediusTitle], peakTension: [Save.mid], isBW: true)
    let exercise11 = Exercise(title: NSLocalizedString("bWExercises.quads4", comment: ""),    primaryMuscles: [ Save.quadsTitle ], secondaryMuscles: [ Save.glutesTitle], peakTension: [Save.ecc, Save.mid], isBW: true)
    let exercise12 = Exercise(title: NSLocalizedString("bWExercises.quads5", comment: ""),             primaryMuscles: [Save.quadsTitle ], secondaryMuscles: [ Save.glutesTitle], peakTension: [Save.mid], isBW: true)
    let exercise13 = Exercise(title: NSLocalizedString("bWExercises.quads6", comment: ""),               primaryMuscles: [Save.quadsTitle ], secondaryMuscles: [ Save.glutesTitle], peakTension: [Save.mid], isBW: true)
    
    return [exercise, exercise1, exercise2, exercise3, exercise4, exercise5
            , exercise6, exercise7, exercise8, exercise9, exercise10, exercise11, exercise12, exercise13]
}

func getLowerAbsExercise() -> [Exercise] {
    let exercise = Exercise(title: Save.lowerAbsTitle, primaryMuscles: [Save.lowerAbsTitle], secondaryMuscles: [], peakTension: [], isBW: false)
   
    let exercise0 = Exercise(title: NSLocalizedString("bWExercises.lowerAbs1", comment: ""),       primaryMuscles: [Save.lowerAbsTitle, Save.middleAbsTitle], secondaryMuscles: [ Save.transverseAbTitle, Save.upperAbsTitle], peakTension: [Save.mid], isBW: true)
    let exercise1 = Exercise(title: NSLocalizedString("bWExercises.lowerAbs2", comment: ""),       primaryMuscles: [ Save.lowerAbsTitle, Save.middleAbsTitle ], secondaryMuscles: [ Save.transverseAbTitle], peakTension: [Save.mid], isBW: true)
    let exercise2 = Exercise(title: NSLocalizedString("bWExercises.lowerAbs3", comment: ""), primaryMuscles: [Save.lowerAbsTitle], secondaryMuscles: [ Save.transverseAbTitle], peakTension: [Save.mid], isBW: true)
    let exercise3 = Exercise(title: NSLocalizedString("bWExercises.lowerAbs4", comment: ""),         primaryMuscles: [Save.lowerAbsTitle], secondaryMuscles: [ Save.transverseAbTitle], peakTension: [Save.mid], isBW: true)
   
    
    return [exercise, exercise0, exercise1, exercise2, exercise3]
}
    
    func getMiddleAbsExercise() -> [Exercise] {
    let exercise = Exercise(title: Save.middleAbsTitle, primaryMuscles: [Save.middleAbsTitle], secondaryMuscles: [], peakTension: [], isBW: false)
      
        let exercise0 = Exercise(title: NSLocalizedString("bWExercises.middleAbs1", comment: ""),             primaryMuscles: [Save.middleAbsTitle,Save.upperAbsTitle], secondaryMuscles: [ Save.transverseAbTitle], peakTension: [Save.mid], isBW: true)
        
        let exercise1 = Exercise(title: NSLocalizedString("bWExercises.middleAbs2", comment: ""),             primaryMuscles: [Save.middleAbsTitle, Save.upperAbsTitle], secondaryMuscles: [ Save.transverseAbTitle, Save.lowerAbsTitle ], peakTension: [Save.mid], isBW: true)
        
        let exercise2 = Exercise(title: NSLocalizedString("bWExercises.middleAbs3", comment: ""),             primaryMuscles: [Save.middleAbsTitle, Save.lowerAbsTitle], secondaryMuscles: [ Save.transverseAbTitle ], peakTension: [Save.mid], isBW: true)
        
        let exercise3 = Exercise(title: NSLocalizedString("bWExercises.middleAbs4", comment: ""),             primaryMuscles: [Save.middleAbsTitle, Save.lowerAbsTitle], secondaryMuscles: [ Save.transverseAbTitle ], peakTension: [Save.mid], isBW: true)
        
        
        
        return [exercise, exercise0, exercise1, exercise2, exercise3] // TODO add exercises
    }
    
    func getUpperAbsExercise() -> [Exercise] {
    let exercise = Exercise(title: Save.upperAbsTitle, primaryMuscles: [Save.upperAbsTitle], secondaryMuscles: [], peakTension: [], isBW: false)
        let exercise0 = Exercise(title: NSLocalizedString("exercises.upperAbs1", comment: ""),      primaryMuscles: [Save.upperAbsTitle], secondaryMuscles: [ Save.transverseAbTitle], peakTension: [Save.mid], isBW: true)
        let exercise1 = Exercise(title: NSLocalizedString("exercises.upperAbs2", comment: ""), primaryMuscles: [Save.upperAbsTitle], secondaryMuscles: [ Save.transverseAbTitle], peakTension: [Save.mid], isBW: false)
        
        let exercise2 = Exercise(title: NSLocalizedString("exercises.upperAbs3", comment: ""), primaryMuscles: [Save.upperAbsTitle], secondaryMuscles: [ Save.transverseAbTitle], peakTension: [Save.mid], isBW: false)
        
        let exercise3 = Exercise(title: NSLocalizedString("bWExercises.upperAbs1", comment: ""), primaryMuscles: [Save.upperAbsTitle], secondaryMuscles: [ Save.transverseAbTitle], peakTension: [Save.mid], isBW: false)
        
        return [exercise, exercise0, exercise1, exercise2, exercise3]
    }
    
    func getLowerObliquesExercise() -> [Exercise] {
    let exercise = Exercise(title: Save.lowerObliquesTitle, primaryMuscles: [Save.lowerObliquesTitle], secondaryMuscles: [], peakTension: [], isBW: false)
        let exercise1 = Exercise(title: NSLocalizedString("exercises.lowerObliques1", comment: ""),     primaryMuscles: [Save.lowerObliquesTitle], secondaryMuscles: [ Save.transverseAbTitle], peakTension: [Save.mid], isBW: false)
        let exercise2 = Exercise(title: NSLocalizedString("bWExercises.lowerObliques1", comment: ""),    primaryMuscles: [  Save.lowerObliquesTitle], secondaryMuscles: [ Save.transverseAbTitle, Save.lowerAbsTitle], peakTension: [Save.mid], isBW: true)
        let exercise3 = Exercise(title: NSLocalizedString("bWExercises.lowerObliques2", comment: ""),              primaryMuscles: [Save.lowerObliquesTitle], secondaryMuscles: [ Save.transverseAbTitle, Save.middleAbsTitle], peakTension: [Save.mid], isBW: true)
        let exercise4 = Exercise(title: NSLocalizedString("bWExercises.lowerObliques3", comment: ""),     primaryMuscles: [Save.lowerObliquesTitle], secondaryMuscles: [ Save.transverseAbTitle, Save.lowerAbsTitle], peakTension: [Save.mid], isBW: true)
        
        let exercise5 = Exercise(title: NSLocalizedString("bWExercises.lowerObliques4", comment: ""),    primaryMuscles: [ Save.lowerObliquesTitle, Save.lowerAbsTitle, Save.middleAbsTitle ], secondaryMuscles: [ Save.transverseAbTitle], peakTension: [Save.mid], isBW: true)
        
        return [exercise, exercise1, exercise2, exercise3, exercise4, exercise5]
    }
    
    func getMiddleObliquesExercise() -> [Exercise] {
        let exercise = Exercise(title: Save.middleObliquesTitle, primaryMuscles: [Save.middleObliquesTitle], secondaryMuscles: [], peakTension: [], isBW: false)
        
        let exercise1 = Exercise(title: NSLocalizedString("exercises.middleObliques1", comment: ""),         primaryMuscles: [Save.middleObliquesTitle], secondaryMuscles: [ Save.transverseAbTitle], peakTension: [Save.ecc, Save.mid], isBW: false)
        let exercise2 = Exercise(title: NSLocalizedString("bWExercises.middleObliques1", comment: ""),   primaryMuscles: [Save.middleObliquesTitle], secondaryMuscles: [ Save.transverseAbTitle, Save.middleAbsTitle], peakTension: [Save.mid], isBW: true)
        let exercise3 = Exercise(title: NSLocalizedString("bWExercises.middleObliques2", comment: ""), primaryMuscles: [Save.middleObliquesTitle ], secondaryMuscles: [ Save.transverseAbTitle], peakTension: [Save.mid], isBW: true)
        let exercise4 = Exercise(title: NSLocalizedString("bWExercises.middleObliques3", comment: ""),        primaryMuscles: [Save.middleObliquesTitle ], secondaryMuscles: [ Save.transverseAbTitle, Save.middleAbsTitle], peakTension: [Save.mid], isBW: true)
        let exercise5 = Exercise(title: NSLocalizedString("bWExercises.middleObliques4", comment: ""),   primaryMuscles: [Save.middleObliquesTitle], secondaryMuscles: [ Save.transverseAbTitle, Save.middleAbsTitle], peakTension: [Save.mid], isBW: true)
        
        
        
        return [exercise, exercise1, exercise2, exercise3, exercise4, exercise5]
    }
    
    func getUpperObliquesExercise() -> [Exercise] {
    let exercise = Exercise(title: Save.upperObliquesTitle, primaryMuscles: [Save.upperObliquesTitle], secondaryMuscles: [], peakTension: [], isBW: false)
        let exercise1 = Exercise(title: NSLocalizedString("exercises.upperObliques1", comment: ""),     primaryMuscles: [Save.upperObliquesTitle], secondaryMuscles: [ Save.transverseAbTitle], peakTension: [Save.mid], isBW: false)
        let exercise2 = Exercise(title: NSLocalizedString("bWExercises.upperObliques1", comment: ""),     primaryMuscles: [Save.upperObliquesTitle], secondaryMuscles: [ Save.transverseAbTitle, Save.upperAbs], peakTension: [Save.mid], isBW: true)
        let exercise3 = Exercise(title: NSLocalizedString("bWExercises.upperObliques2", comment: ""),     primaryMuscles: [Save.upperObliquesTitle, Save.middleObliquesTitle], secondaryMuscles: [ Save.transverseAbTitle], peakTension: [Save.mid], isBW: true)
        return [exercise, exercise1,exercise2, exercise3]
    }



func getSerratusTitle() -> [Exercise] {
    let exercise = Exercise(title: Save.serratusTitle, primaryMuscles: [Save.serratusTitle], secondaryMuscles: [], peakTension: [], isBW: false)
    let exercise0 = Exercise(title: NSLocalizedString("exercises.serratus1", comment: ""), primaryMuscles: [Save.serratusTitle, Save.middleAbsTitle], secondaryMuscles: [ Save.transverseAbTitle], peakTension: [Save.con], isBW: false)
    let exercise1 = Exercise(title: NSLocalizedString("bWExercises.serratus2", comment: ""),   primaryMuscles: [Save.serratusTitle], secondaryMuscles: [], peakTension: [Save.con], isBW: true)
    let exercise2 = Exercise(title: NSLocalizedString("bWExercises.serratus3", comment: ""),     primaryMuscles: [  Save.serratusTitle], secondaryMuscles: [], peakTension: [Save.con], isBW: true)
    let exercise3 = Exercise(title: NSLocalizedString("bWExercises.serratus4", comment: ""),    primaryMuscles: [ Save.serratusTitle , Save.middleAbsTitle], secondaryMuscles: [ Save.transverseAbTitle], peakTension: [Save.ecc], isBW: true)
    
    return [exercise, exercise0, exercise1, exercise2, exercise3]
}

func getTransverseAbExercise() -> [Exercise] {
    let exercise = Exercise(title: Save.transverseAbTitle, primaryMuscles: [Save.transverseAbTitle], secondaryMuscles: [], peakTension: [], isBW: false)
    let exercise0 = Exercise(title: NSLocalizedString("bWExercises.transverseAb1", comment: ""),     primaryMuscles: [  Save.transverseAbTitle], secondaryMuscles: [], peakTension: [Save.con], isBW: true)
    let exercise1 = Exercise(title: NSLocalizedString("bWExercises.transverseAb2", comment: ""),  primaryMuscles: [Save.transverseAbTitle, Save.middleAbsTitle], secondaryMuscles: [], peakTension: [Save.mid], isBW: true)
    
    return [exercise, exercise0, exercise1]
}

func getSoleusExercise() -> [Exercise] {
    let exercise = Exercise(title: Save.soleusTitle, primaryMuscles: [Save.soleusTitle], secondaryMuscles: [], peakTension: [], isBW: false)
    let exercise0 = Exercise(title: NSLocalizedString("exercises.soleus1", comment: ""),                primaryMuscles: [Save.soleusTitle], secondaryMuscles: [Save.gastrocnemiusTitle], peakTension: [Save.con], isBW: false)
    let exercise1 = Exercise(title: NSLocalizedString("bWExercises.soleus1", comment: ""),                primaryMuscles: [Save.soleusTitle], secondaryMuscles: [Save.gastrocnemiusTitle], peakTension: [Save.con], isBW: true)

    return [exercise, exercise0, exercise1]
}

func getGastrocExercise() -> [Exercise] {
    let exercise = Exercise(title: Save.gastrocnemiusTitle, primaryMuscles: [Save.gastrocnemiusTitle], secondaryMuscles: [], peakTension: [], isBW: false)
    let exercise1 = Exercise(title: NSLocalizedString("exercises.gastrocnemius1", comment: ""),      primaryMuscles: [Save.gastrocnemiusTitle], secondaryMuscles: [Save.soleusTitle], peakTension: [Save.con], isBW: false)
    let exercise2 = Exercise(title: NSLocalizedString("exercises.gastrocnemius2", comment: ""),  primaryMuscles: [Save.gastrocnemiusTitle], secondaryMuscles: [Save.soleusTitle], peakTension: [Save.con], isBW: false)
    
    let exercise3 = Exercise(title: NSLocalizedString("exercises.gastrocnemius3", comment: ""),                primaryMuscles: [Save.gastrocnemiusTitle], secondaryMuscles: [Save.soleusTitle], peakTension: [Save.con], isBW: false)
    let exercise4 = Exercise(title: NSLocalizedString("exercises.gastrocnemius4", comment: ""),       primaryMuscles: [Save.gastrocnemiusTitle], secondaryMuscles: [Save.soleusTitle], peakTension: [Save.con], isBW: false)
    let exercise5 = Exercise(title: NSLocalizedString("bWExercises.gastrocnemius1", comment: ""),     primaryMuscles: [  Save.gastrocnemiusTitle], secondaryMuscles: [Save.soleusTitle], peakTension: [Save.con], isBW: true)
    
       return [exercise,  exercise1, exercise2, exercise3, exercise4, exercise5]
}
//TODO
    
func getNeckFlexionExercise() -> [Exercise] {
    let exercise = Exercise(title: Save.neckFlexionTitle, primaryMuscles: [Save.neckFlexionTitle], secondaryMuscles: [], peakTension: [], isBW: false)
    let exercise1 = Exercise(title: NSLocalizedString("exercises.neckFlexion1", comment: ""),              primaryMuscles: [Save.neckFlexionTitle], secondaryMuscles: [], peakTension: [Save.mid], isBW: false)
    let exercise2 = Exercise(title: NSLocalizedString("exercises.neckFlexion1", comment: ""),       primaryMuscles: [Save.neckFlexionTitle], secondaryMuscles: [], peakTension: [Save.mid], isBW: false)
    let exercise3 = Exercise(title: NSLocalizedString("bWExercises.neckFlexion1", comment: ""),     primaryMuscles: [  Save.neckFlexionTitle], secondaryMuscles: [], peakTension: [Save.mid], isBW: true)
    return [exercise,  exercise1, exercise2, exercise3]
}

    func getNeckExtensionExercise() -> [Exercise] {
    let exercise = Exercise(title: Save.neckExtensionTitle, primaryMuscles: [Save.neckExtensionTitle], secondaryMuscles: [], peakTension: [], isBW: false)
        let exercise0 = Exercise(title: NSLocalizedString("exercises.neckExtension1", comment: ""),   primaryMuscles: [Save.neckExtensionTitle], secondaryMuscles: [], peakTension: [Save.con], isBW: false)
        let exercise1 = Exercise(title: NSLocalizedString("exercises.neckExtension2", comment: ""),   primaryMuscles: [Save.neckExtensionTitle], secondaryMuscles: [], peakTension: [Save.con], isBW: false)
        let exercise2 = Exercise(title: NSLocalizedString("bWExercises.neckExtension1", comment: ""),   primaryMuscles: [Save.neckExtensionTitle], secondaryMuscles: [], peakTension: [Save.con], isBW: true)
    return [exercise, exercise0, exercise1, exercise2]
}

    func getNeckTransverseExercise() -> [Exercise] {
    let exercise = Exercise(title: Save.transverseNeckTitle, primaryMuscles: [Save.transverseNeckTitle], secondaryMuscles: [], peakTension: [], isBW: false)
        let exercise0 = Exercise(title: NSLocalizedString("exercises.transverseNeck1", comment: ""), primaryMuscles: [Save.transverseNeckTitle], secondaryMuscles: [], peakTension: [Save.con], isBW: true)
        let exercise1 = Exercise(title: NSLocalizedString("exercises.transverseNeck2", comment: ""), primaryMuscles: [Save.transverseNeckTitle, Save.backShoulderTitle, Save.lowerTrapsTitle, Save.rotatorCuffTitle, Save.radialForearmTitle], secondaryMuscles: [], peakTension: [Save.mid], isBW: false)
        let exercise2 = Exercise(title: NSLocalizedString("bWExercises.transverseNeck1", comment: ""), primaryMuscles: [Save.transverseNeckTitle, Save.backShoulderTitle, Save.lowerTrapsTitle, Save.rotatorCuffTitle, Save.radialForearmTitle], secondaryMuscles: [], peakTension: [Save.mid], isBW: false)
    
        return [exercise, exercise0, exercise1, exercise2]
    }
        

func getForearmExtensorsExercise() -> [Exercise] {
    let exercise = Exercise(title: Save.forearmExtensorsTitle, primaryMuscles: [Save.forearmExtensorsTitle], secondaryMuscles: [], peakTension: [], isBW: false)
   
    let exercise1 = Exercise(title: NSLocalizedString("exercises.forearmExtensors1", comment: ""), primaryMuscles: [Save.forearmExtensorsTitle], secondaryMuscles: [], peakTension: [Save.mid], isBW: false)
    let exercise2 = Exercise(title: NSLocalizedString("exercises.forearmExtensors2", comment: ""),          primaryMuscles: [Save.forearmExtensorsTitle], secondaryMuscles: [], peakTension: [Save.con], isBW: false)
    let exercise3 = Exercise(title: NSLocalizedString("exercises.forearmExtensors3", comment: ""),                    primaryMuscles: [Save.forearmExtensorsTitle], secondaryMuscles: [], peakTension: [Save.mid], isBW: false)
    let exercise4 = Exercise(title: NSLocalizedString("bwExercises.forearmExtensors1", comment: ""),    primaryMuscles: [ Save.forearmExtensorsTitle], secondaryMuscles: [], peakTension: [Save.con], isBW: true)
    
    return [exercise, exercise1, exercise2, exercise3, exercise4]
}



func getUlnarForearmExercise() -> [Exercise] {
    let exercise = Exercise(title: Save.ulnarForearmTitle, primaryMuscles: [Save.ulnarForearmTitle], secondaryMuscles: [], peakTension: [], isBW: false)
    let exercise0 = Exercise(title: NSLocalizedString("exercises.ulnarForearm1", comment: ""),   primaryMuscles: [Save.ulnarForearmTitle], secondaryMuscles: [], peakTension: [Save.con], isBW: false)
    
    let exercise1 = Exercise(title: NSLocalizedString("bWExercises.ulnarForearm1", comment: ""), primaryMuscles: [Save.ulnarForearmTitle], secondaryMuscles: [], peakTension: [Save.con], isBW: true)
    
    
    return [exercise, exercise0, exercise1]
}

func getForearmFlexorsExercise() -> [Exercise] {
    let exercise = Exercise(title: Save.forearmFlexorsTitle, primaryMuscles: [Save.forearmFlexorsTitle], secondaryMuscles: [], peakTension: [], isBW: false)
    let exercise1 = Exercise(title: NSLocalizedString("exercises.forearmFlexors1", comment: ""),  primaryMuscles: [Save.forearmFlexorsTitle], secondaryMuscles: [], peakTension: [Save.mid], isBW: false)
    let exercise2 = Exercise(title: NSLocalizedString("exercises.forearmFlexors2", comment: ""), primaryMuscles: [Save.bicepsLongHeadTitle, Save.bicepsLongHeadTitle, Save.forearmFlexorsTitle], secondaryMuscles: [], peakTension: [Save.mid], isBW: false)
    let exercise3 = Exercise(title: NSLocalizedString("bWExercises.forearmFlexors1", comment: ""), primaryMuscles: [Save.forearmFlexorsTitle], secondaryMuscles: [], peakTension: [Save.con], isBW: true)
    
    return [exercise, exercise1, exercise2, exercise3]
}

func getRadialForearmExercise() -> [Exercise] {
    let exercise = Exercise(title: Save.radialForearmTitle, primaryMuscles: [Save.radialForearmTitle], secondaryMuscles: [], peakTension: [], isBW: false)
    let exercise1 = Exercise(title: NSLocalizedString("exercises.radialForearm1", comment: ""),      primaryMuscles: [Save.radialForearmTitle], secondaryMuscles: [], peakTension: [Save.con], isBW: false)
    let exercise2 = Exercise(title: NSLocalizedString("exercises.radialForearm1", comment: ""),     primaryMuscles: [ Save.brachialisTitle, Save.radialForearmTitle], secondaryMuscles: [Save.bicepsLongHeadTitle], peakTension: [], isBW: false)
    let exercise3 = Exercise(title: NSLocalizedString("bWExercises.radialForearm1", comment: ""),    primaryMuscles: [Save.radialForearmTitle],secondaryMuscles: [], peakTension: [Save.con], isBW: true)
    
    return [exercise, exercise1, exercise2, exercise3]
}

func getspinalErectorsExercise() -> [Exercise] {
    let exercise = Exercise(title: Save.spinalErectorsTitle, primaryMuscles: [Save.spinalErectorsTitle], secondaryMuscles: [], peakTension: [], isBW: false)
  
    let exercise1 = Exercise(title: NSLocalizedString("exercises.spinalErectors1", comment: ""),             primaryMuscles: [Save.spinalErectorsTitle], secondaryMuscles: [], peakTension: [Save.con], isBW: false)
    let exercise2 = Exercise(title: NSLocalizedString("exercises.spinalErectors2", comment: ""),  primaryMuscles: [Save.spinalErectorsTitle], secondaryMuscles: [], peakTension: [Save.mid, Save.con], isBW: false)
    let exercise3 = Exercise(title: NSLocalizedString("exercises.hamstringsHinge1", comment: ""),                   primaryMuscles: [Save.spinalErectorsTitle ], secondaryMuscles: [ Save.glutesTitle, Save.hamstringHingeTitle], peakTension: [Save.mid, Save.con], isBW: false)
    let exercise4 = Exercise(title: NSLocalizedString("exercises.quads1", comment: ""),                     primaryMuscles: [Save.quadsTitle, Save.spinalErectorsTitle], secondaryMuscles: [ Save.glutesTitle, Save.hamstringHingeTitle], peakTension: [Save.mid, Save.ecc], isBW: false)
    let exercise5 = Exercise(title: NSLocalizedString("bWExercises.spinalErectors1", comment: ""),                 primaryMuscles: [Save.spinalErectorsTitle , Save.gluteMediusTitle], secondaryMuscles: [], peakTension: [Save.con], isBW: true)
    let exercise6 = Exercise(title: NSLocalizedString("bWExercises.spinalErectors2", comment: ""),            primaryMuscles: [Save.spinalErectorsTitle, Save.lowerAbsTitle, Save.backShoulderTitle], secondaryMuscles: [], peakTension: [Save.con], isBW: true)
    let exercise7 = Exercise(title: NSLocalizedString("bWExercises.spinalErectors3", comment: ""),            primaryMuscles: [Save.spinalErectorsTitle, Save.glutesTitle], secondaryMuscles: [], peakTension: [Save.con], isBW: true)
    let exercise8 = Exercise(title: NSLocalizedString("bWExercises.spinalErectors4", comment: ""),     primaryMuscles: [Save.spinalErectorsTitle ], secondaryMuscles: [ Save.glutesTitle, Save.hamstringHingeTitle], peakTension: [Save.ecc], isBW: true)
    
    
    return [exercise, exercise1, exercise2, exercise3, exercise4, exercise5, exercise6, exercise7, exercise8]
}

func getUpperTrapsExercise() -> [Exercise] {
    let exercise = Exercise(title: Save.upperTrapsTitle, primaryMuscles: [Save.upperTrapsTitle], secondaryMuscles: [], peakTension: [], isBW: false)
   
    let exercise1 = Exercise(title: NSLocalizedString("exercises.upperTraps1", comment: ""),   primaryMuscles: [Save.upperTrapsTitle], secondaryMuscles: [], peakTension: [Save.con], isBW: false)
    let exercise2 = Exercise(title: NSLocalizedString("exercises.upperTraps2", comment: ""),  primaryMuscles: [Save.upperTrapsTitle], secondaryMuscles: [], peakTension: [Save.con], isBW: false)
    let exercise3 = Exercise(title: NSLocalizedString("exercises.upperTraps3", comment: ""),     primaryMuscles: [Save.upperTrapsTitle], secondaryMuscles: [], peakTension: [Save.ecc], isBW: false)
    let exercise4 = Exercise(title: NSLocalizedString("bWExercises.upperTraps1", comment: ""),      primaryMuscles: [  Save.upperTrapsTitle], secondaryMuscles: [], peakTension: [Save.mid], isBW: true)
    let exercise5 = Exercise(title: NSLocalizedString("bWExercises.upperTraps2", comment: ""),         primaryMuscles: [ Save.upperTrapsTitle, Save.lowerTrapsTitle ], secondaryMuscles: [], peakTension: [Save.con], isBW: true)
    
    return [exercise, exercise1, exercise2, exercise3, exercise4, exercise5]
}

func getLowerTrapsExercise() -> [Exercise] {
    let exercise = Exercise(title: Save.lowerTrapsTitle, primaryMuscles: [Save.lowerTrapsTitle], secondaryMuscles: [], peakTension: [], isBW: false)
   
    let exercise1 = Exercise(title: NSLocalizedString("exercises.lowerTraps1", comment: ""),          primaryMuscles: [Save.lowerTrapsTitle ], secondaryMuscles: [], peakTension: [Save.con], isBW: false)
    let exercise2 = Exercise(title: NSLocalizedString("exercises.lowerTraps2", comment: ""), primaryMuscles: [Save.lowerTrapsTitle , Save.backShoulderTitle], secondaryMuscles: [], peakTension: [Save.con], isBW: false)
    let exercise3 = Exercise(title: NSLocalizedString("exercises.lowerTraps3", comment: ""),              primaryMuscles: [Save.rotatorCuffTitle, Save.lowerAbsTitle, Save.backShoulderTitle], secondaryMuscles: [], peakTension: [Save.con], isBW: false)
    let exercise4 = Exercise(title: NSLocalizedString("exercises.lowerTraps4", comment: ""),        primaryMuscles: [Save.rotatorCuffTitle, Save.lowerAbsTitle, Save.backShoulderTitle], secondaryMuscles: [], peakTension: [Save.con], isBW: false)
    
    
    let exercise5 = Exercise(title: NSLocalizedString("bWExercises.lowerTraps1", comment: ""),                     primaryMuscles: [  Save.rotatorCuffTitle, Save.lowerAbsTitle, Save.backShoulderTitle], secondaryMuscles: [], peakTension: [Save.con], isBW: false)
    let exercise6 = Exercise(title: NSLocalizedString("bWExercises.lowerTraps1", comment: ""),        primaryMuscles: [ Save.lowerTrapsTitle ], secondaryMuscles: [], peakTension: [Save.con], isBW: true)
    let exercise7 = Exercise(title: NSLocalizedString("bWExercises.lowerTraps1", comment: ""),                    primaryMuscles: [Save.spinalErectorsTitle, Save.lowerAbsTitle, Save.backShoulderTitle], secondaryMuscles: [], peakTension: [Save.con], isBW: true)
    let exercise8 = Exercise(title: NSLocalizedString("bWExercises.lowerTraps1", comment: ""), primaryMuscles: [Save.lowerTrapsTitle ], secondaryMuscles: [], peakTension: [Save.con], isBW: true)
    
    let exercise9 = Exercise(title: NSLocalizedString("bWExercises.lowerTraps1", comment: ""),                         primaryMuscles: [Save.upperTrapsTitle, Save.lowerTrapsTitle ], secondaryMuscles: [], peakTension: [Save.con], isBW: true)
    
    return [exercise,  exercise1, exercise2, exercise3, exercise4, exercise5, exercise6, exercise7, exercise8, exercise9]
}
    
    func getAdductorsExercises() -> [Exercise] {
        let exercise = Exercise(title: Save.adductorsTitle, primaryMuscles: [Save.adductorsTitle], secondaryMuscles: [], peakTension: [], isBW: false)
        let exercise1 = Exercise(title: NSLocalizedString("exercises.adductors1", comment: ""), primaryMuscles: [Save.adductorsTitle], secondaryMuscles: [], peakTension: [], isBW: false)
        let exercise2 = Exercise(title: NSLocalizedString("bWExercises.adductors1", comment: ""), primaryMuscles: [Save.adductorsTitle], secondaryMuscles: [], peakTension: [], isBW: true)
        
        return [exercise,  exercise1, exercise2]
    }
    
    func getTibialisExercises() -> [Exercise] {
        let exercise = Exercise(title: Save.anteriorTibialisTitle, primaryMuscles: [Save.anteriorTibialisTitle], secondaryMuscles: [], peakTension: [], isBW: false)
        let exercise1 = Exercise(title: NSLocalizedString("exercises.tibialis1", comment: ""), primaryMuscles: [Save.anteriorTibialisTitle], secondaryMuscles: [], peakTension: [], isBW: false)
        let exercise2 = Exercise(title: NSLocalizedString("bWExercises.tibialis2", comment: ""), primaryMuscles: [Save.anteriorTibialisTitle], secondaryMuscles: [], peakTension: [], isBW: true)
        
        return [exercise,  exercise1, exercise2]
    }

    func getAllExercises() -> [Exercise] {
    let exercise = Exercise(title: Save.middleChestTitle, primaryMuscles: [Save.middleChestTitle], secondaryMuscles: [], peakTension: [], isBW: false)
        var array = getMiddleChestExercise()
        array.append(contentsOf: getUpperChestExercise())
        array.append(contentsOf: getLowerChestExercise())
        array.append(contentsOf: getMiddleChestExercise())
        array.append(contentsOf: getBicepsLongHeadExercise())
        array.append(contentsOf: getBicepsShortHeadExercise())
        array.append(contentsOf: getBicepFinisherExercises())
        array.append(contentsOf: getBrachialisExercises())
        array.append(contentsOf: getLatsRowingExercise())
        array.append(contentsOf: getLatsPushdownExercise())
        array.append(contentsOf: getLatsPullinExercise())
        array.append(contentsOf: getGluteTitleExercise())
        array.append(contentsOf: getGluteMediusExercise())
        array.append(contentsOf: getAdductorsExercises())
        array.append(contentsOf: getHamstringsHingeExercise())
        array.append(contentsOf: getHamstringsCurlExercise())
        array.append(contentsOf: getFrontShoulderExercise())
        array.append(contentsOf: getLateralShoulderExercise())
        array.append(contentsOf: getBackShoulderExercise())
        array.append(contentsOf: getRotatorCuffExercise())
        array.append(contentsOf: getTricepsLongExercise())
        array.append(contentsOf: getTricepsLateralAndShortExercise())
        array.append(contentsOf: getQuadsExercise())
        array.append(contentsOf: getUpperAbsExercise())
        array.append(contentsOf: getMiddleAbsExercise())
        array.append(contentsOf: getLowerAbsExercise())
        array.append(contentsOf: getUpperObliquesExercise())
        array.append(contentsOf: getMiddleObliquesExercise())
        array.append(contentsOf: getLowerObliquesExercise())
        array.append(contentsOf: getSerratusTitle())
        array.append(contentsOf: getTransverseAbExercise())
        array.append(contentsOf: getGastrocExercise())
        array.append(contentsOf: getSoleusExercise())
        array.append(contentsOf: getTibialisExercises())
        array.append(contentsOf: getNeckTransverseExercise())
        array.append(contentsOf: getNeckExtensionExercise())
        array.append(contentsOf: getNeckFlexionExercise())
        array.append(contentsOf: getForearmFlexorsExercise())
        array.append(contentsOf: getForearmExtensorsExercise())
        array.append(contentsOf: getUlnarForearmExercise())
        array.append(contentsOf: getRadialForearmExercise())
        array.append(contentsOf: getspinalErectorsExercise())
        array.append(contentsOf: getUpperTrapsExercise())
        array.append(contentsOf: getLowerTrapsExercise())
     
        
        return array
    }
    
    func getExerciseList (muscle: String) -> [Exercise] {
    let exercise = Exercise(title: Save.middleChestTitle, primaryMuscles: [Save.middleChestTitle], secondaryMuscles: [], peakTension: [], isBW: false)
        //TODO find how to account for usin multiple head exercises
        var exerciseArray = [Exercise]()
        switch muscle {
        case Save.upperChestTitle:
            exerciseArray = getUpperChestExercise()
        case Save.middleChestTitle:
            exerciseArray = getMiddleChestExercise()
            
        case Save.lowerChestTitle:
            exerciseArray = getLowerChestExercise()
            
        case Save.bicepsLongHeadTitle:
            exerciseArray = getBicepsLongHeadExercise()
            
        case Save.bicepsShortHeadTitle:
            exerciseArray = getBicepsShortHeadExercise()
            
        case Save.latsRowingTitle:
            exerciseArray = getLatsRowingExercise()
            
        case Save.latsPushdownTitle:
            exerciseArray = getLatsPushdownExercise()
            
        case Save.latsPullInTitle:
            exerciseArray = getLatsPushdownExercise()
            
        case Save.glutesTitle:
            exerciseArray = getGluteTitleExercise()
            
        case Save.gluteMediusTitle:
            exerciseArray = getGluteMediusExercise()
            
        case Save.adductorsTitle:
            exerciseArray = getAdductorsExercises()
            
        case Save.hamstringCurlTitle:
            exerciseArray = getHamstringsCurlExercise()
            
        case Save.hamstringHingeTitle:
            exerciseArray = getHamstringsHingeExercise()
            
        case Save.frontShoulderTitle:
            exerciseArray = getFrontShoulderExercise()
            
        case Save.lateralShoulderTitle:
            exerciseArray = getLateralShoulderExercise()
            
        case Save.backShoulderTitle:
            exerciseArray = getBackShoulderExercise()
            
        case Save.rotatorCuffTitle:
            exerciseArray = getRotatorCuffExercise()
            
        case Save.tricepsLateralShortTitle:
            exerciseArray = getTricepsLateralAndShortExercise()
            
        case Save.tricepsLongTitle:
            exerciseArray = getTricepsLongExercise()
            
        case Save.quadsTitle:
            exerciseArray = getQuadsExercise()
            
        case Save.upperAbsTitle:
            exerciseArray = getUpperAbsExercise()
            
        case Save.middleAbsTitle:
            exerciseArray = getMiddleAbsExercise()
            
        case Save.lowerAbsTitle:
            exerciseArray = getLowerAbsExercise()
            
        case Save.upperObliquesTitle:
            exerciseArray = getUpperObliquesExercise()
            
        case Save.middleObliquesTitle:
            exerciseArray = getMiddleObliquesExercise()
            
        case Save.lowerObliquesTitle:
            exerciseArray = getLowerObliquesExercise()
            
        case Save.serratusTitle:
            exerciseArray = getSerratusTitle()
            
        case Save.transverseAbTitle:
            exerciseArray = getTransverseAbExercise()
            
        case Save.gastrocnemiusTitle:
            exerciseArray = getGastrocExercise()
            
        case Save.soleusTitle:
            exerciseArray = getSoleusExercise()
            
        case Save.anteriorTibialisTitle:
            exerciseArray = getTibialisExercises()
            
        case Save.neckFlexionTitle:
            exerciseArray = getNeckFlexionExercise()
            
        case Save.neckExtensionTitle:
            exerciseArray = getNeckExtensionExercise()
        
        case Save.transverseNeckTitle:
            exerciseArray = getNeckTransverseExercise()
        
        case Save.transverseNeckTitle:
            exerciseArray = getNeckTransverseExercise()
            
        case Save.lateralNeckTitle:
            exerciseArray = getUpperChestExercise()
            
        case Save.forearmExtensorsTitle:
            exerciseArray = getForearmExtensorsExercise()
            
        case Save.ulnarForearmTitle:
            exerciseArray = getUlnarForearmExercise()
            
        case Save.forearmFlexorsTitle:
            exerciseArray = getForearmFlexorsExercise()
            
        case Save.radialForearmTitle:
            exerciseArray = getRadialForearmExercise()
            
        case Save.spinalErectorsTitle:
            exerciseArray = getspinalErectorsExercise()
            
        case Save.upperTrapsTitle:
            exerciseArray = getUpperTrapsExercise()
            
        case Save.lowerTrapsTitle:
            exerciseArray = getLowerTrapsExercise()
            
        case Save.brachialisTitle:
            exerciseArray = getBrachialisExercises()
            
        default:
            // getExercise(muscle: muscle)
        print("EXERCISES NOT LOADED FOR \(muscle)")
        }
        return exerciseArray
    }
    
    func getSperatedExercisesList(muscle: String) -> ([Exercise], [Exercise]) {
        var wieghtExerciseList = getExerciseList(muscle: muscle)
        let locoCopy = wieghtExerciseList
        var count = 0
        var BWExerciseList = [Exercise]()
        
        
        for i in 0..<locoCopy.count {
            
            //  if wieghtExerciseList.count < i {
            if locoCopy[i].isBW == true {
                BWExerciseList.append(locoCopy[i])
                wieghtExerciseList.remove(at: i - count)
                count += 1
            }
        }
        return (wieghtExerciseList, BWExerciseList)
    }
}
