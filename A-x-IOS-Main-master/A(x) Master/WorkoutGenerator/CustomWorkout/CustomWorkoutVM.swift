//
//  CustomWorkoutVM.swift
//  AofX
//
//  Created by Kevin Jimenez on 7/19/21.
//  Copyright © 2021 Aesthet(X). All rights reserved.
//

import Foundation

class CustomWorkoutVM: NSObject {
    
    static let sharedWOGenerator: CustomWorkoutVM = CustomWorkoutVM()
    var vm = WorkoutGeneratorVM.sharedWOGenerator
    var customWorkoutArray = [Exercise]()
    var customSetsArray =  [Float]()
    var resTimeArray = [Float]()
    
    func addExerciseToWorkout(exercise: Exercise) {
        customWorkoutArray.append(exercise)
    }
    
    func addSetsToTVArray(sets: Float) {
        customSetsArray.append(sets)
    }
    
    func commitWorkout() {
        vm.workoutArray = []
        vm.workoutArray = customWorkoutArray
        vm.weeklySetsArray = customSetsArray
    }
    
    func addRestTime(time: Float) {
        resTimeArray.append(time)
    }
    
}
