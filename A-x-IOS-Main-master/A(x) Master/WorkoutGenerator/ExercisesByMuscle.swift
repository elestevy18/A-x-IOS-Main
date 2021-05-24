//
//  ExercisesByMuscle.swift
//  AofX
//
//  getd by tstone10 on 5/16/21.
//  Copyright © 2021 Aesthet(X). All rights reserved.
//

import Foundation

struct ExerciseByMuscles {

func getChestExercises() -> [Exercises] {
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

func getBWChestExercises() -> [Exercises] {
    let exercise0 = Exercises(title: "Push-Ups",     musclesWorked:   "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid, Serratus")
    let exercise1 = Exercises(title: "Wide Dips",    musclesWorked:  "Chest Secondary: Lateral and Medial Triceps, Serratus")
    let exercise2 = Exercises(title: "Banded Fly",   musclesWorked: "Upper/Middle/Lower Pectoral")
    
    return [exercise0, exercise1, exercise2]
}

func getBicepsExercises() -> [Exercises] {
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

func getBWBicepsExercises() -> [Exercises] {
    let exercise0 = Exercises(title: "Banded Curls",                    musclesWorked: "Biceps Secondary: Forearm Flexors")
    let exercise1 = Exercises(title: "Ring Curls",                      musclesWorked:  "Biceps Secondary: Forearm Flexors")
    
    return [exercise0, exercise1]
}

func getLatsExercises() -> [Exercises] {
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

func getBWLatsExercises() -> [Exercises] {
    let exercise0 = Exercises(title: "Front Levers", musclesWorked:   "Lats, Triceps")
    let exercise1 = Exercises(title: "Pull Ups",     musclesWorked:  "Lats, Lower Traps\nSecondary: Post Delt, Bicep, Forearms")
    let exercise2 = Exercises(title: "Chin Ups",     musclesWorked: "Lats, Lower Traps Secondary: Post Delt, Forearms")
    let exercise3 = Exercises(title: "Pull Ins",     musclesWorked: "Lats")
    let exercise4 = Exercises(title: "Ring Rows",    musclesWorked: "Lats, Lower Traps Secondary: Post Delt, Biceps, Forearm Flexors")
    
    return [exercise0, exercise1, exercise2, exercise3, exercise4]
}

func getGlutesExercises() -> [Exercises] {
    let exercise0 = Exercises(title: "Glutes", musclesWorked: "A single set towards Glutes")
    let exercise1 = Exercises(title: "Hip Thrust",                musclesWorked: "Glutes, Erectors Secondary: Hamstrings, Glute Medius")
    let exercise2 = Exercises(title: "Cable Pull Through",        musclesWorked: "Glutes Secondary: Hamstrings, Glute Medius")
    let exercise3 = Exercises(title: "Glute Hyperextension",      musclesWorked: "Glutes Secondary: Hamstrings, Glute Medius")
    let exercise4 = Exercises(title: "Kettlebell/Dumbbell Swing", musclesWorked: "Glutes Secondary: Hamstrings, Glute Medius")
    let exercise5 = Exercises(title: "Cable Kick Backs",          musclesWorked: "Glutes Secondary: Hamstrings, Glute Medius")
    
    return [exercise0, exercise1, exercise2, exercise3, exercise4, exercise5]
}

func getBWGlutesExercises() -> [Exercises] {
    let exercise0 = Exercises(title: "Bodyweight Hip Thrusts",    musclesWorked: "Glutes Secondary: Hamstrings")
    let exercise1 = Exercises(title: "Isolateral Hip Thrust",     musclesWorked: "Glutes, Glute Medius Secondary: Hamstrings")
    let exercise2 = Exercises(title: "Sprinter Lunge",            musclesWorked: "Glutes, Glute Medius Secondary: Hamstrings")
    let exercise3 = Exercises(title: "Banded RDL",                musclesWorked: "Glutes, Glute Medius, Hamstrings")
    let exercise4 = Exercises(title: "Marching Bridge",           musclesWorked: "Spinal Erector, Glutes")
    
    return [exercise0, exercise1, exercise2, exercise3, exercise4]
}

func getGluteMediusExercises() -> [Exercises] {
    let exercise0 = Exercises(title: "Glute Medius",                  musclesWorked: "A single set towards Glute Medius")
    let exercise1 = Exercises(title: "Machine Abduction",             musclesWorked: "Glute Medius")
    let exercise2 = Exercises(title: "Ankle Brace Cable Abduction",             musclesWorked: "Glute Medius")
    return [exercise0, exercise1, exercise2]
}

func getBWGluteMediusExercises() -> [Exercises] {
    let exercise0 = Exercises(title: "Banded Lateral Walkout",     musclesWorked: "Glute Medius")
    let exercise1 = Exercises(title: "Banded Abduction",           musclesWorked:  "Glute Medius")
    let exercise2 = Exercises(title: "Glute Side Plank",           musclesWorked: "Glute Medius Secondary: Obliques")
    
    return [exercise0, exercise1, exercise2]
}

func getHamstringsExercises() -> [Exercises] {
    let exercise0 = Exercises(title: "Hamstrings", musclesWorked: "A single set towards Hamstrings")
    let exercise1 = Exercises(title: "Deadlift",                 musclesWorked: "Hamstrings, Erectors, Upper Traps Secondary: Lats, Glutes, Lower Traps, Transverse")
    let exercise2 = Exercises(title: "Romanian Deadlift",        musclesWorked: "Hamstring, Secondary: Glutes, Erectors")
    let exercise3 = Exercises(title: "Deficit Deadlift",         musclesWorked: "Hamstring Secondary: Glutes, Erectors")
    let exercise4 = Exercises(title: "Hamstring Hyperextension", musclesWorked: "Hamstring Secondary: Glutes, Erectors")
    
    return [exercise0, exercise1, exercise2, exercise3, exercise4]
}

func getBWHamstringsExercises() -> [Exercises] {
    
    let exercise0 = Exercises(title: "Glute Ham Raise",                musclesWorked:  "Hamstrings Secondary: Glutes, Erectors")
    let exercise1 = Exercises(title: "Medicine Ball Curl",             musclesWorked: "Hamstring Secondary: Glutes, Erectors")
    let exercise2 = Exercises(title: "Single Leg Medicine Ball Curl",  musclesWorked: "Hamstring, Glute Medius Secondary: Glutes, Erectors")
    let exercise3 = Exercises(title: "Single Leg Romanian Deadlift",   musclesWorked: "Hamstring, Glute Medius Secondary: Glutes, Erectors")
    
    return [exercise0, exercise1, exercise2, exercise3]
}

func getFrontShoulderExercises() -> [Exercises] {
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

func getBWFrontShoulderExercises() -> [Exercises] {
    let exercise0 = Exercises(title: "Pike Push-Up",      musclesWorked:   "Anterior Delt Secondary: Triceps, Medial Delt")
    let exercise1 = Exercises(title: "Handstand Push-Up", musclesWorked:  "Anterior Delt Secondary: Triceps, Medial Delt")
    let exercise2 = Exercises(title: "Cable Front Raise", musclesWorked: "Anterior Delt")
    
    return [exercise0, exercise1, exercise2]
}

func getLateralShoulderExercises() -> [Exercises] {
    let exercise0 = Exercises(title: "Lateral Shoulder",         musclesWorked: "A single set towards Lateral Deltoids")
    let exercise1 = Exercises(title: "Cable Lateral Raises",    musclesWorked: "Medial Deltoid")
    let exercise2 = Exercises(title: "Machine Lateral Raise",   musclesWorked: "Medial Deltoid")
    let exercise3 = Exercises(title: "Cheat Lateral Raise",     musclesWorked: "Medial Deltoid, Upper Trap")
    let exercise4 = Exercises(title: "Lateral Raise",           musclesWorked: "Medial Deltoid")
    
    return [exercise0, exercise1, exercise2, exercise3, exercise4]
}

func getBWLateralShoulderExercises() -> [Exercises] {
    let exercise0 = Exercises(title: "Delt Rotating Plank",     musclesWorked:   "Medial Detoid")
    
    return [exercise0]
}

func getBackShoulderExercises() -> [Exercises] {
    let exercise0 = Exercises(title: "Back Shoulder",               musclesWorked: "A single set towards Posterior Deltoids")
    let exercise1 = Exercises(title: "Barbell/Dumbbell High Rows",  musclesWorked: "Posterior Deltoid, Lower Trap")
    let exercise2 = Exercises(title: "Facepulls",                   musclesWorked: "Rotator Cuff, Lower Trap, Posterior Deltoid")
    let exercise3 = Exercises(title: "W's",                         musclesWorked: "Posterior Deltoid, Rotator Cuff, Lower Traps")
    let exercise4 = Exercises(title: "Reverse Pec Deck",             musclesWorked: "Lower Traps, Posterior Deltoid")
    
    return [exercise0, exercise1, exercise2, exercise3, exercise4]
}

func getBWBackShoulderExercises() -> [Exercises] {
    let exercise0 = Exercises(title: "Floor T's",          musclesWorked:   "Posterior Deltoid")
    let exercise1 = Exercises(title: "Banded Pull Aparts", musclesWorked:  "Posterior Deltoid, Lower Traps")
    let exercise2 = Exercises(title: "Ring Facepulls",     musclesWorked: "Posterior Deltoid, Rotator Cuff, Lower Traps")
    let exercise3 = Exercises(title: "Angels of Death",    musclesWorked: "Spinal Erectors, Lower Traps, Posterior Deltoid")
    
    return [exercise0, exercise1, exercise2, exercise3]
}

func getRotatorCuffExercises() -> [Exercises] {
    let exercise0 = Exercises(title: "Rotator Cuff",                     musclesWorked: "A single set towards Rotator Cuffs")
    let exercise1 = Exercises(title: "Cable External Rotation",          musclesWorked: "Rotator Cuff, Forearm Extensors")
    let exercise2 = Exercises(title: "Bench Dumbbell External Rotation", musclesWorked: "Rotator Cuff, Forearm Extensors")
    let exercise3 = Exercises(title: "W's",                              musclesWorked: "Rotator Cuff, Lower Trap, Posterior Deltoid")
    let exercise4 = Exercises(title: "Dumbbell High Pull",               musclesWorked: "Rotator Cuff, Lower Trap, Posterior Deltoid")
    let exercise5 = Exercises(title: "Facepulls",                        musclesWorked: "Rotator Cuff, Lower Trap, Posterior Deltoid")
    
    return [exercise0, exercise1, exercise2, exercise3, exercise4, exercise5]
}

func getBWRotatorCuffExercises() -> [Exercises] {
    let exercise0 = Exercises(title: "Ring Facepull",            musclesWorked:   "Rotator Cuff, Lower Trap, Posterior Deltoid")
    let exercise1 = Exercises(title: "Banded External Rotation", musclesWorked:  "Rotator Cuff, Forearm Extensors")
    
    return [exercise0, exercise1]
}

func getTricepsExercises() -> [Exercises] {
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

func getBWTricepsExercises() -> [Exercises] {
    let exercise0 = Exercises(title: "Narrow Pushup",     musclesWorked:   "Triceps: Short and Medial Head, Chest Secondary: Anterior Delts")
    let exercise1 = Exercises(title: "Ring Overhead Extension",    musclesWorked:  "Triceps: long head")
    let exercise2 = Exercises(title: "Bench Dip",   musclesWorked: "Triceps: All heads")
    
    return [exercise0, exercise1, exercise2]
}

func getQuadsExercises() -> [Exercises] {
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

func getBWQuadsExercises() -> [Exercises] {
    let exercise0 = Exercises(title: "Banded Lunges",        musclesWorked:   "Quads")
    let exercise1 = Exercises(title: "Bodyweight Squats",    musclesWorked:  "Quads Secondary: Glutes")
    let exercise2 = Exercises(title: "Wall Sit",             musclesWorked: "Quads Secondary: Glutes")
    let exercise3 = Exercises(title: "Lunges",               musclesWorked: "Quads Secondary: Glutes")
    
    return [exercise0, exercise1, exercise2, exercise3]
}

func getAbsExercises() -> [Exercises] {
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


func getObliquesExercises() -> [Exercises] {
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



func getSerratusExercises() -> [Exercises] {
    let exercise0 = Exercises(title: "Serratus Anterior",                musclesWorked: "One set towards Serratus")
    let exercise1 = Exercises(title: "Protracted Cable Crunch", musclesWorked: "Serratus Anterior, Abs Secondary: Transverse")
    let exercise2 = Exercises(title: "Banded/Cable Punches",   musclesWorked: "Serratus Anterior")
    
    return [exercise0, exercise1, exercise2]
}

func getBWSerratusExercises() -> [Exercises] {
    let exercise0 = Exercises(title: "Plank Protraction",     musclesWorked:   "Serratus Anterior")
    let exercise1 = Exercises(title: "Protracted Rollout",    musclesWorked:  "Serratus Anterior, Abs Secondary: Transverse")
    
    
    return [exercise0, exercise1]
}

func getTransverseAbExercises() -> [Exercises] {
    let exercise0 = Exercises(title: "Transverse Ab",                   musclesWorked: "A single set towards Transverse Ab")
    let exercise1 = Exercises(title: "Banded/Cable Resisted Rotation",  musclesWorked: "Transverse, Obliques")
    
    
    return [exercise0, exercise1]
}

func getBWTransverseAbExercises() -> [Exercises] {
    let exercise0 = Exercises(title: "Vacuums",     musclesWorked:   "Transverse Abdominus")
    
    return [exercise0]
}

func getCalvesExercises() -> [Exercises] {
    let exercise0 = Exercises(title: "Calves",                           musclesWorked: "A single set towards Calves")
    let exercise1 = Exercises(title: "Machine Standing Calf Raise",      musclesWorked: "Calves")
    let exercise2 = Exercises(title: "Straight Leg Machine Calf Raise",  musclesWorked: "Calves")
    let exercise3 = Exercises(title: "Seated Calf Raise",                musclesWorked: "Calves")
    let exercise4 = Exercises(title: "Donkey Calf Raise",                musclesWorked: "Calves")
    let exercise5 = Exercises(title: "Dumbbell/Plated Calf Raise",       musclesWorked: "Calves")
    
    return [exercise0, exercise1, exercise2, exercise3, exercise4, exercise5]
}

func getBWCalvesExercises() -> [Exercises] {
    let exercise0 = Exercises(title: "Bodyweight Calf Raises",     musclesWorked:   "Calves")
    
    return [exercise0]
}

func getNeckExercises() -> [Exercises] {
    let exercise0 = Exercises(title: "Neck",                    musclesWorked: "A single set towards Neck")
    let exercise1 = Exercises(title: "Plate Curl",              musclesWorked: "Neck Flexion")
    let exercise2 = Exercises(title: "Neck Harness Curl",       musclesWorked: "Neck Flexion")
    let exercise3 = Exercises(title: "Plated Neck Extension",   musclesWorked: "Neck Extension")
    let exercise4 = Exercises(title: "Harness Lateral Flexion", musclesWorked: "Lateral Flexion")
    let exercise5 = Exercises(title: "Suspended Neck Rotation", musclesWorked: "Neck Flexion and Rotation")
    let exercise6 = Exercises(title: "Neck Flexion",            musclesWorked: "Lateral and forward Flexion")
    
    return [exercise0, exercise1, exercise2, exercise3, exercise4, exercise5, exercise6]
}

func getBWNeckExercises() -> [Exercises] {
    let exercise0 = Exercises(title: "Head Floats",     musclesWorked:   "Neck Flexion, Lateral Flexion or Extension")
    
    return [exercise0]
}

func getForearmExtensorsExercises() -> [Exercises] {
    let exercise0 = Exercises(title: "Forearm Extensors",                 musclesWorked: "One set towards Forearm Extensors")
    let exercise1 = Exercises(title: "Standing Barbell Wrist Extension", musclesWorked: "Forearm Extensors")
    let exercise2 = Exercises(title: "Barbell Extension Rolls",          musclesWorked: "Forearm Extensors")
    let exercise3 = Exercises(title: "Reverse Curls",                    musclesWorked: "Forearm Extensors")
    
    return [exercise0, exercise1, exercise2, exercise3]
}

func getBWForearmExtensorsExercises() -> [Exercises] {
    let exercise0 = Exercises(title: "Banded Wrist Extension",    musclesWorked:  "Forearm Extensors")
    
    return [exercise0]
}

func getUlnarForearmExercises() -> [Exercises] {
    let exercise0 = Exercises(title: "Ulnar Forearm",          musclesWorked: "A single set towards Ulnar Forearm")
    let exercise1 = Exercises(title: "Rope Ulnar Deviation",   musclesWorked: "Ulnar Forearm")
    
    
    return [exercise0, exercise1]
}

func getBWUlnarForearmExercises() -> [Exercises] {
    
    let exercise0 = Exercises(title: "Banded Ulnar Deviation", musclesWorked: "Ulnar Forearm")
    
    return [exercise0]
}




func getForearmFlexorsExercises() -> [Exercises] {
    let exercise0 = Exercises(title: "Forearm Flexors",    musclesWorked: "A single set towards Forearm Flexors")
    let exercise1 = Exercises(title: "Prone Wrist Curls",  musclesWorked: "Forearm Flexors")
    let exercise2 = Exercises(title: "Wrist Flexed Curls", musclesWorked: "Biceps, Forearm Flexors")
    
    return [exercise0, exercise1, exercise2]
}

func getBWForearmFlexorsExercises() -> [Exercises] {
    
    let exercise0 = Exercises(title: "Banded Wrist Curls", musclesWorked: "Forearm Flexors")
    
    return [exercise0]
}

func getRadialForearmExercises() -> [Exercises] {
    let exercise0 = Exercises(title: "Radial Forearm",             musclesWorked: "A single set towards Radial Forearm")
    let exercise1 = Exercises(title: "Rope Radial Deviation",      musclesWorked: "Radial Forearm")
    let exercise2 = Exercises(title: "Hammer/Crossbody Curls",     musclesWorked: "Biceps, Brachialis, Radial Forearm")
    
    let exercise3 = Exercises(title: "Re-racking your plates",     musclesWorked: "Radial Forearm, put ur plates back please")
    
    return [exercise0, exercise1, exercise2, exercise3]
}

func getBWRadialForearmExercises() -> [Exercises] {
    
    let exercise0 = Exercises(title: "Banded Radial Deviation",    musclesWorked: "Radial Forearm")
    
    
    return [exercise0]
}
func getSpinalErectorsExercises() -> [Exercises] {
    let exercise0 = Exercises(title: "Spinal Erectors",            musclesWorked: "One set towards SpinalErectors")
    let exercise1 = Exercises(title: "Hyperextension",             musclesWorked: "Spinal Erector")
    let exercise2 = Exercises(title: "Machine Erector Extension",  musclesWorked: "Spinal Erector")
    let exercise3 = Exercises(title: "Deadlift",                   musclesWorked: "Spinal Erector Secondary: Glutes, Hamstrings")
    let exercise4 = Exercises(title: "Squats",                     musclesWorked: "Quads, Spinal Erector Secondary: Glutes, Hamstrings")
    
    
    return [exercise0, exercise1, exercise2, exercise3, exercise4]
}

func getBWSpinalErectorsExercises() -> [Exercises] {
    
    let exercise0 = Exercises(title: "Frog Pumps",                 musclesWorked: "Spinal Erectors, Glute Medius")
    let exercise1 = Exercises(title: "Angels of Death",            musclesWorked: "Spinal Erectors, Lower Traps, Post Delt")
    let exercise2 = Exercises(title: "Marching Bridge",            musclesWorked: "Spinal Erector, Glutes")
    let exercise3 = Exercises(title: "Reverse Hyperextension",     musclesWorked: "Spinal Erector Secondary: Glutes, Hamstring")
    
    return [exercise0, exercise1, exercise2, exercise3]
}

func getUpperTrapsExercises() -> [Exercises] {
    let exercise0 = Exercises(title: "Upper Traps",      musclesWorked: "A single set towards Upper Traps")
    let exercise1 = Exercises(title: "Dumbell Shrugs",   musclesWorked: "Upper Trap")
    let exercise2 = Exercises(title: "Trap Bar Shrugs",  musclesWorked: "Upper Trap")
    let exercise3 = Exercises(title: "Farmer Walk",     musclesWorked: "Upper Trap")
    
    return [exercise0, exercise1, exercise2, exercise3]
}

func getBWUpperTrapsExercises() -> [Exercises] {
    let exercise0 = Exercises(title: "Trap Pushaway",      musclesWorked:   "Upper Traps")
    let exercise1 = Exercises(title: "Inverted Y",         musclesWorked:  "Upper and Lower Traps")
    
    return [exercise0, exercise1]
}

func getLowerTrapsExercises() -> [Exercises] {
    let exercise0 = Exercises(title: "Lower Traps",      musclesWorked: "A single set towards Lower Traps")
    let exercise1 = Exercises(title: "Y Raise",          musclesWorked: "Lower Traps")
    let exercise2 = Exercises(title: "Reverse Pec Deck", musclesWorked: "Lower Traps, Post Delt")
    let exercise3 = Exercises(title: "W's",              musclesWorked: "Rotator Cuff, Lower Trap, Post Delt")
    let exercise4 = Exercises(title: "Facepulls",        musclesWorked: "Rotator Cuff, Lower Trap, Post Delt")
    
    return [exercise0, exercise1, exercise2, exercise3, exercise4]
}

func getBWLowerTrapsExercises() -> [Exercises] {
    let exercise0 = Exercises(title: "Ring Facepull",                     musclesWorked:   "Rotator Cuff, Lower Trap, Posterior Deltoid")
    let exercise1 = Exercises(title: "Hanging/Cable Scapular Retraction",        musclesWorked:  "Lower Traps")
    let exercise2 = Exercises(title: "Inverted Y",                         musclesWorked: "Upper and Lower Traps")
    let exercise3 = Exercises(title: "Angels of Death",                    musclesWorked: "Spinal Erectors, Lower Traps, Post Delt")
    let exercise4 = Exercises(title: "Floor/Dip Bar Scapular Depression", musclesWorked: "Lower Traps")
    
    return [exercise0, exercise1, exercise2, exercise3, exercise4]
}

}
