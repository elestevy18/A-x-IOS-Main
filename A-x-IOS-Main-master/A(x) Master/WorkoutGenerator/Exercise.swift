//
//  WorkoutGenerator.swift
//  AofX
//
//  Created by Kevin Jimenez on 3/26/21.
//  Copyright © 2021 Aesthet(X). All rights reserved.
//

import Foundation


class Exercise {
    
}
 
    /*static let biceps = "Chest"
    Biceps
    Lats
    Glutes
    GluteMedius
    Bicep Femoris
    Hamstrings
    FrontShoulder
    LateralShoulder
    BackShoulder
    RotatorCuff
    Triceps Long Head
    Triceps Short Head
    Quads
    Abs
    Upper Obliques
    Lower Obliques
    Obliques
    Serratus
    TransverseAb
    Calves
    ForearmExtensors
    UlnarForearm
    ForearmFlexors
    RadialForearm
    SpinalErectors
    UpperTraps
    LowerTraps
    Brachialis
    Neck Extension
    Neck Flexion
    Neck Lateral Flexion
    Neck Rotation
    Anterior Tibialis*/

struct ExercisesModel {
    let title: String
    let primaryMuscles: String
    let secondaryMuscles: String
}

 
struct  Exericses {
    
    
   /* let chest = Muscle(title: "Chest", antagonist: ["Lats", "PostDelts"], neighbors: "Lower Chest, ")
    let tricepsShortHead = Muscle(title: "Triceps Short Head", antagonists: "Biceps Short Head", neighbors: ["Anterior Shoulder", "ForearmFlexors"])
    
    print(tricepsShortHead.self.String)*/
    static let ChestPress = ExercisesModel(title: "Chest Press", primaryMuscles: "Chest" , secondaryMuscles: "tricepsShortHead")
    
    func getChestExercise() -> [ExercisesModel] {
        return [Exericses.ChestPress]
    }
}



