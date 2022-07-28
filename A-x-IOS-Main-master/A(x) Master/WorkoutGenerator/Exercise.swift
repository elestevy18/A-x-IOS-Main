//
//  WorkoutGenerator.swift
//  AofX
//
//  Created by Kevin Jimenez on 3/26/21.
//  Copyright © 2021 Aesthet(X). All rights reserved.
//

import Foundation


struct Exercise: Comparable {
    static func < (lhs: Exercise, rhs: Exercise) -> Bool {
        let lhsTotal = lhs.primaryMuscles.count + (lhs.secondaryMuscles.count / 2)
        let rhsTotal = rhs.primaryMuscles.count + (rhs.secondaryMuscles.count / 2)
        return lhsTotal > rhsTotal
    }
    
    let title: String
    let primaryMuscles: [String]
    let secondaryMuscles: [String]
    let peakTension: [String]
    let isBW: Bool
}

struct Muscle {
    var title: String
    var antagonist: [String]
    
}
struct Muscles {
    /* let chest = Muscle(title: "Chest", antagonist: ["Lats", "PostDelts"], neighbors: "Lower Chest, ")
 let tricepsShortHead = Muscle(title: "Triceps Short Head", antagonists: "Biceps Short Head", neighbors: ["Anterior Shoulder", "ForearmFlexors"])*/
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




