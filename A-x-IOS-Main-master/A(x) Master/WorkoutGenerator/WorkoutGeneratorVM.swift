//
//  WorkoutGeneratorVM.swift
//  AofX
//
//  Created by Kevin Jimenez on 5/31/21.
//  Copyright © 2021 Aesthet(X). All rights reserved.
//

import Foundation

@objc protocol TimerDelagate : NSObjectProtocol {
    func updateTimer()
}

@objc protocol VolumeTrackerUpdateDelegate : NSObjectProtocol {
    func updateVolumeTracker()
}
class WorkoutGeneratorVM: NSObject {
    
    static let sharedWOGenerator: WorkoutGeneratorVM = WorkoutGeneratorVM()
    var delegate : TimerDelagate? = nil
    var workoutArray = [Exercise]()
    var workTime = 0
    var workingOut = false
    var sets = 0
    var setIsActive = false
    var resting = true
    var restTime = 0
    var setTime = 0
    var providedRestTimeInt: Int?
    var Time: Int?
    var timer = Timer()
    var totalDateInitiated : Date? = nil
    var restDateInitiated : Date? = nil
    var setDateInitiated : Date? = nil
    var maxCounter = 7800 //90minutes
    var weeklySetsArray =  [Float]()
    let defaults        = UserDefaults.standard
    var musclesToSkip = [String]()
    var nextDayWO = UserDefaults.standard.bool(forKey: Save.nextDayWO)
    
    //Active workout funcs
    func isWokingOut() -> Bool{ return workingOut }
    
    func toggleWorkingOut() {
        workingOut.toggle()
        if workingOut == false {
            workTime = 0
            timer.invalidate()
        }
    }
    // Workout time length funcs
    func startWorkout() {
        if timer.isValid { timer.invalidate() }
        totalDateInitiated = Date()
        workingOut = true
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(WorkoutGeneratorVM.addWorkTime), userInfo: nil, repeats: true)
    }
    func WOTime() -> String { return String(Int(floor(Double(Int(workTime / 60))))) }
    
    func resetWOTime() { workTime = 0 }
    // Current exercises sets funcs
    func setsText() -> String { return String(sets) }
    
    func addSet() {
        DispatchQueue.main.async {
            self.sets += 1
    }
        
    }
    
    func resetSets() { sets = 0 }
    // Set time functions
    func subtractRestTime(){
        if isWokingOut() {
            restTime -= restTime
        }
    }
    
    func restTimeLeft() -> String {
        let minutes = String(Int(floor(Double(Int(restTime ?? 0 / 60)))))
        let seconds = String(Int(floor(Double(Int(restTime ?? 0 % 60)))))
        
        let restString = minutes + ":" + seconds
        return restString
    }
    func initRestLeft (primeMuscles: Int) -> Int {
        if primeMuscles == 1 {
            return 120
        } else if primeMuscles == 2 {
            return 180
        } else {
            return 240
        }
    }
    
    func addExerciseToHistory(sets: String) {
        //SETS
        //let setsString:String? = "1"
        if (!(sets == "")){ //I question this line but fuck it
            if var setsTxts = self.defaults.object(forKey:Save.setsTxts) as? [String] {
                setsTxts.append(sets)
                self.defaults.set(setsTxts, forKey: Save.setsTxts)
            } else {
                var setsTxts: [String] = []
                setsTxts.append(sets)
                self.defaults.set(setsTxts, forKey: Save.setsTxts)
            }
        }
        
        //REPS
   
        var repsString:String? = "0.0"
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
            
            //print("reps input and stored: " + repsString! )
        }
        
        //WEIGHTS
        
        var weightString:String? = "0.00"
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
            exTitleHist.append(workoutArray[0].title)
            self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
        } else {
            var exTitleHist: [String] = []
            exTitleHist.append(workoutArray[0].title)
            self.defaults.set(exTitleHist, forKey: Save.exTitleHist)
        }
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
        var rpeString:String? = "0.00"
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
        
        var noteString:String? = ""
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
        
        
    }
    
    //Start or start button
    func startOrStartText() -> String {
        if sets == Int(weeklySetsArray[0]-1) && setIsActive {
            addExerciseToHistory(sets: "\(weeklySetsArray.first ?? 0)")
        }
        
        if isWokingOut() == false {
            workingOut.toggle()
            totalDateInitiated = Date()
            startActiveScreen()
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(WorkoutGeneratorVM.addWorkTime), userInfo: nil, repeats: true)
        }
        if setIsActive { //goes to incative
            for i in workoutArray[0].primaryMuscles{
                addSetToVolumeTracker(muscle: i, isPrimary: true)
            }
            for i in workoutArray[0].secondaryMuscles{
                addSetToVolumeTracker(muscle: i, isPrimary: false)
            }
            restTime = providedRestTime()
            startRestScreen()
            setIsActive.toggle()
            //Mage sets, pop vm workout array if necessary and reset sets
            sets += 1
            if sets == Int(weeklySetsArray[0]) {
                workoutArray.removeFirst()
                weeklySetsArray.removeFirst()
            }
            return "Start\n Set"
        } else {
          startActiveScreen()
            setIsActive.toggle()
            setTime = 0
            return "End\nSet"
        }
    }
    
    //Manage timers for restScreen
    func startRestScreen() {
        restDateInitiated = Date()
        workingOut = true
    }
    
    @objc func addWorkTime() {
        guard workingOut == true else { return }
        guard workTime <= maxCounter else {
            timer.invalidate()
            return }
        workTime += 1
        setTime += 1
        restTime -= 1
        
        guard delegate == nil else {
            delegate?.updateTimer()
            return
        }
    }
    
    @objc func addSetTime() {
        guard workingOut == true else { return }
        setTime += 1
        guard delegate == nil else {
            delegate?.updateTimer()
            return
        }
    }
    
    func getTotalTimestamp() -> String {
        let totalStr = "Total time:\n" + getTimeText(from: totalDateInitiated ?? Date())
        return totalStr
    }
    
    func getTimerTimestamp() -> String {
        if setIsActive {
            return getTimeText(from: setDateInitiated ?? Date())
        } else {
         return getRestText()
        }
      
    }
    
    func getTimeText(from: Date) -> String {
        let dateComponents = Calendar.current.dateComponents([.minute, .second], from: from, to: Date())
        if dateComponents.second! <= 9 {
            return "\(dateComponents.minute!):0\(dateComponents.second!)"
        }
        return "\(dateComponents.minute!):\(dateComponents.second!)"
    }
    
    func isTimeLessThanZero() -> Bool {
        if restTime < 0 && !setIsActive { return true}
        return false
    }
    
    func getRestText() -> String {
        if restTime < 0 { return String(restTime)}
        var string = String(restTime/60)
        var secs = String(abs(restTime%60))
        if restTime%60 <= 9 {
            secs = "0" + secs
        }
        string = "Rest\n" + string + ":" + secs
        return string
    }
    //ManageActiveScreen
    func  startActiveScreen() {
        setDateInitiated = Date()
    }
    
    func providedRestTime() -> Int{
        //TODO hard code exercises with long. short rest times
        if workoutArray.count > 0 {
            let totalMuscles = round(Double(workoutArray[0].primaryMuscles.count) +  Double(workoutArray[0].secondaryMuscles.count) / 2)
            switch  totalMuscles {
            case 1:
                return 60
            case 2:
                return 120
            case 3:
                return 180
            case 4:
                return 240
            default:
                return 150
            }
        }
        return 00
    }
    
    func getSetsText() -> String {
        if sets >= Int(weeklySetsArray[0]) {
            return "Sets:\n" + "0/" + String(Int(weeklySetsArray[1]))
        } else {
            return "Sets:\n" + String(sets) + "/" + String(Int(weeklySetsArray[0]))
        }
        //return "Sets:\n" + String(sets) + "/" + String(Int(weeklySetsArray[0]))
    }
    
    func genWeeklySets() {
        if workoutArray.count >= 1 {
            var exerciseSets: Float?
            var weeklyVolume: Float?
            for i in 0..<workoutArray.count {
                
                weeklyVolume = self.weeklyVolume(muscle: workoutArray[i].primaryMuscles[0])
                if weeklyVolume ?? -1.0 <= 4 {
                    exerciseSets  = weeklyVolume
                    
                    if exerciseSets ?? 0.0 > 4 {
                        weeklySetsArray.append(4)
                    } else {
                        weeklySetsArray.append(exerciseSets ?? -1.0)
                    }
                    
                } else {
                    exerciseSets = weeklyVolume ?? 1.0 / 3
                    exerciseSets = round(Float(Double(exerciseSets! / 3)))
                    if exerciseSets ?? 0.0 > 4 {
                        weeklySetsArray.append(4)
                    } else {
                        weeklySetsArray.append(exerciseSets ?? -1.0)
                    }
                }
            }
        }
        }
    
    func addNextExercise(exerciseNum: Int) {
        let upperChestHypeDifference = defaults.float(forKey: Save.upperChestHypeDifference)
        let middleChestHypeDifference = defaults.float(forKey: Save.middleChestHypeDifference)
        let lowerChestHypeDifference = defaults.float(forKey: Save.lowerChestHypeDifference)
        let bicepsLongHeadHypeDifference = defaults.float(forKey: Save.bicepsLongHeadHypeDifference)
        let bicepsShortHeadHypeDifference = defaults.float(forKey: Save.bicepsShortHeadHypeDifference)
        let latsRowingHypeDifference = defaults.float(forKey: Save.latsRowingHypeDifference)
        let latsPushdownHypeDifference = defaults.float(forKey: Save.latsPushdownHypeDifference)
        let latsPullInHypeDifference = defaults.float(forKey: Save.latsPullInHypeDifference)
        let glutesHypeDifference = defaults.float(forKey: Save.glutesHypeDifference)
        let gluteMediusHypeDifference = defaults.float(forKey: Save.gluteMediusHypeDifference)
        let adductorsHypeDifference = defaults.float(forKey: Save.adductorsHypeDifference)
        let hamstringCurlHypeDifference = defaults.float(forKey: Save.hamstringCurlHypeDifference)
        let hamstringHingeHypeDifference = defaults.float(forKey: Save.hamstringHingeHypeDifference)
        let frontShoulderHypeDifference = defaults.float(forKey: Save.frontShoulderHypeDifference)
        let lateralShoulderHypeDifference = defaults.float(forKey: Save.lateralShoulderHypeDifference)
        let backShoulderHypeDifference = defaults.float(forKey: Save.backShoulderHypeDifference)
        let rotatorCuffHypeDifference = defaults.float(forKey: Save.rotatorCuffHypeDifference)
        let tricepsLateralShortHypeDifference = defaults.float(forKey: Save.tricepsLateralShortHypeDifference)
        let tricepsLongHypeDifference = defaults.float(forKey: Save.tricepsLongHeadHypeDifference)
        let quadsHypeDifference = defaults.float(forKey: Save.quadsHypeDifference)
        let upperAbsHypeDifference = defaults.float(forKey: Save.upperAbsHypeDifference)
        let middleAbsHypeDifference = defaults.float(forKey: Save.middleAbsHypeDifference)
        let lowerAbsHypeDifference = defaults.float(forKey: Save.lowerAbsHypeDifference)
        let upperObliquesHypeDifference = defaults.float(forKey: Save.upperObliquesHypeDifference)
        let middleObliquesHypeDifference = defaults.float(forKey: Save.middleObliquesHypeDifference)
        let lowerObliquesHypeDifference = defaults.float(forKey: Save.lowerObliquesHypeDifference)
        let serratusHypeDifference = defaults.float(forKey: Save.serratusHypeDifference)
        let transverseAbHypeDifference = defaults.float(forKey: Save.transverseAbHypeDifference)
        let gastrocnemiusHypeDifference = defaults.float(forKey: Save.gastrocnemiusHypeDifference)
        let soleusHypeDifference = defaults.float(forKey: Save.soleusHypeDifference)
        let tibialisHypeDifference = defaults.float(forKey: Save.anteriorTibialisHypeDifference)
        let neckExtensionHypeDifference = defaults.float(forKey: Save.neckExtensionHypeDifference)
        let neckFlexionHypeDifference = defaults.float(forKey: Save.neckFlexionHypeDifference)
        let transverseNeckHypeDifference = defaults.float(forKey: Save.transverseNeckHypeDifference)
        let lateralNeckHypeDifference = defaults.float(forKey: Save.lateralNeckHypeDifference)
        let forearmExtensorsHypeDifference = defaults.float(forKey: Save.forearmExtensorsHypeDifference)
        let ulnarForearmHypeDifference = defaults.float(forKey: Save.ulnarForearmHypeDifference)
        let forearmFlexorsHypeDifference = defaults.float(forKey: Save.forearmFlexorsHypeDifference)
        let radialForearmHypeDifference = defaults.float(forKey: Save.radialForearmHypeDifference)
        let spinalErectorsHypeDifference = defaults.float(forKey: Save.spinalErectorsHypeDifference)
        let upperTrapsHypeDifference = defaults.float(forKey: Save.upperTrapsHypeDifference)
        let lowerTrapsHypeDifference = defaults.float(forKey: Save.lowerTrapsHypeDifference)
        
        let musclesHypeDifferences = [Save.upperChestTitle:upperChestHypeDifference,
                                  Save.middleChestTitle:middleChestHypeDifference,
                                  Save.lowerChestTitle:lowerChestHypeDifference,
                                  Save.bicepsLongHeadTitle: bicepsLongHeadHypeDifference,
                                  Save.bicepsShortHeadTitle: bicepsShortHeadHypeDifference,
                                  Save.latsRowingTitle: latsRowingHypeDifference,
                                  Save.latsPushdownTitle: latsPushdownHypeDifference,
                                  Save.latsPullInTitle :latsPullInHypeDifference,
                                  Save.glutesTitle :glutesHypeDifference,
                                  Save.gluteMediusTitle:gluteMediusHypeDifference,
                                  Save.adductorsTitle:adductorsHypeDifference,
                                  Save.hamstringCurlTitle :hamstringCurlHypeDifference,
                                  Save.hamstringHingeTitle :hamstringHingeHypeDifference,
                                  Save.frontShoulderTitle :frontShoulderHypeDifference,
                                  Save.lateralShoulderTitle :lateralShoulderHypeDifference,
                                  Save.backShoulderTitle: backShoulderHypeDifference,
                                  Save.rotatorCuffTitle :rotatorCuffHypeDifference,
                                  Save.tricepsLateralShortTitle :tricepsLateralShortHypeDifference,
                                  Save.tricepsLongTitle :tricepsLongHypeDifference,
                                  Save.quadsTitle :quadsHypeDifference,
                                  Save.upperAbsTitle :upperAbsHypeDifference,
                                  Save.middleAbsTitle:middleAbsHypeDifference,
                                  Save.lowerAbsTitle :lowerAbsHypeDifference,
                                  Save.upperObliquesTitle :upperObliquesHypeDifference,
                                  Save.middleObliquesTitle :middleObliquesHypeDifference,
                                  Save.lowerObliquesTitle :lowerObliquesHypeDifference,
                                  Save.serratusTitle :serratusHypeDifference,
                                  Save.transverseAbTitle :transverseAbHypeDifference,
                                  Save.gastrocnemiusTitle :gastrocnemiusHypeDifference,
                                  Save.soleusTitle :soleusHypeDifference,
                                  Save.anteriorTibialisTitle :tibialisHypeDifference,
                                  Save.neckFlexionTitle: neckFlexionHypeDifference,
                                  Save.neckExtensionTitle: neckExtensionHypeDifference,
                                  Save.transverseNeckTitle :transverseNeckHypeDifference,
                                  Save.lateralNeckTitle: lateralNeckHypeDifference,
                                  Save.forearmExtensorsTitle :forearmExtensorsHypeDifference,
                                  Save.ulnarForearmTitle :ulnarForearmHypeDifference,
                                  Save.forearmFlexorsTitle :forearmFlexorsHypeDifference,
                                  Save.radialForearmTitle :radialForearmHypeDifference,
                                  Save.spinalErectorsTitle :spinalErectorsHypeDifference,
                                  Save.upperTrapsTitle :upperTrapsHypeDifference,
                                  Save.lowerTrapsTitle :lowerTrapsHypeDifference]
        
        let  sortedMusclesDifferences = musclesHypeDifferences.sorted {return $0.value > $1.value}
    
            //ALL CASES WILL NEED THE FIRST EXERCISES AS FOLLOWS
        //make it so that we dont re calculate an already worked muscle
        var index = 0
        var muscle = Array(sortedMusclesDifferences)[index].key
        //This block will make sure that the first workouts wont include support muscles that are targeted in other compunds
        for _ in 0...10 {
            if musclesToSkip.contains(muscle) {
                index += 1
                muscle = Array(sortedMusclesDifferences)[index].key
            }
        }
        
           //Get exercise and add to array
            workoutArray.append(getExercise(muscle: muscle))
            //print("getNextexercise() muscle: \(muscle)")
            genWeeklySets()
        musclesToSkip.append(muscle)
        
        //Hypthetically add the exercises volumes
            for muscle in workoutArray[exerciseNum].primaryMuscles {
                hypotheticallyAddSet(muscle: muscle, isPrimary: true, sets: Int(weeklySetsArray[exerciseNum])) //find how to dynamically assign weeklysets
            }
            for muscle in workoutArray[exerciseNum].secondaryMuscles {
                hypotheticallyAddSet(muscle: muscle, isPrimary: false, sets: Int(weeklySetsArray[exerciseNum])) //find how to dynamically assign weeklysets
            }
    }
    
    func generateWorkout(closure: ()->()) {
        
        //This will make sure that the support muscles arent leading a workout at the beginning of the week.
        
        let supportMusclesArray = [Save.frontShoulderTitle,
                                   Save.lowerTrapsTitle,
                                   Save.ulnarForearmTitle,
                                   Save.radialForearmTitle,
                                   Save.forearmFlexorsTitle,
                                   Save.forearmExtensorsTitle,
                                   Save.spinalErectorsTitle,
                                   Save.rotatorCuffTitle]
        
        let weeklyWorkoutNumber = defaults.integer(forKey: Save.weeklyWorkoutNumber)
        if weeklyWorkoutNumber <= 3 { musclesToSkip.append(contentsOf: supportMusclesArray)}
        if weeklyWorkoutNumber >= 6 {
            defaults.set(0, forKey: Save.weeklyWorkoutNumber)
        } else {
            defaults.set(weeklyWorkoutNumber + 1, forKey: Save.weeklyWorkoutNumber)
        }
        
        
        //Get the missing volume for all muscle groups.
        let upperChestDifference = defaults.float(forKey: Save.upperChestDifference)
        let middleChestDifference = defaults.float(forKey: Save.middleChestDifference)
        let lowerChestDifference = defaults.float(forKey: Save.lowerChestDifference)
        let bicepsLongHeadDifference = defaults.float(forKey: Save.bicepsLongHeadDifference)
        let bicepsShortHeadDifference = defaults.float(forKey: Save.bicepsShortHeadDifference)
        let latsRowingDifference = defaults.float(forKey: Save.latsRowingDifference)
        let latsPushdownDifference = defaults.float(forKey: Save.latsPushdownDifference)
        let latsPullInDifference = defaults.float(forKey: Save.latsPullInDifference)
        let glutesDifference = defaults.float(forKey: Save.glutesDifference)
        let gluteMediusDifference = defaults.float(forKey: Save.gluteMediusDifference)
        let adductorsDifference = defaults.float(forKey: Save.adductorsDifference)
        let hamstringCurlDifference = defaults.float(forKey: Save.hamstringCurlDifference)
        let hamstringHingeDifference = defaults.float(forKey: Save.hamstringHingeDifference)
        let frontShoulderDifference = defaults.float(forKey: Save.frontShoulderDifference)
        let lateralShoulderDifference = defaults.float(forKey: Save.lateralShoulderDifference)
        let backShoulderDifference = defaults.float(forKey: Save.backShoulderDifference)
        let rotatorCuffDifference = defaults.float(forKey: Save.rotatorCuffDifference)
        let tricepsLateralShortDifference = defaults.float(forKey: Save.tricepsLateralShortDifference)
        let tricepsLongDifference = defaults.float(forKey: Save.tricepsLongDifference)
        let quadsDifference = defaults.float(forKey: Save.quadsDifference)
        let upperAbsDifference = defaults.float(forKey: Save.upperAbsDifference)
        let middleAbsDifference = defaults.float(forKey: Save.middleAbsDifference)
        let lowerAbsDifference = defaults.float(forKey: Save.lowerAbsDifference)
        let upperObliquesDifference = defaults.float(forKey: Save.upperObliquesDifference)
        let middleObliquesDifference = defaults.float(forKey: Save.middleObliquesDifference)
        let lowerObliquesDifference = defaults.float(forKey: Save.lowerObliquesDifference)
        let serratusDifference = defaults.float(forKey: Save.serratusDifference)
        let transverseAbDifference = defaults.float(forKey: Save.transverseAbDifference)
        let gastrocnemiusDifference = defaults.float(forKey: Save.gastrocnemiusDifference)
        let soleusDifference = defaults.float(forKey: Save.soleusDifference)
        let tibialisDifference = defaults.float(forKey: Save.anteriorTibialisDifference)
        let neckExtensionDifference = defaults.float(forKey: Save.neckExtensionDifference)
        let neckFlexionDifference = defaults.float(forKey: Save.neckFlexionDifference)
        let transverseNeckDifference = defaults.float(forKey: Save.transverseNeckDifference)
        let lateralNeckDifference = defaults.float(forKey: Save.lateralNeckDifference)
        let forearmExtensorsDifference = defaults.float(forKey: Save.forearmExtensorsDifference)
        let ulnarForearmDifference = defaults.float(forKey: Save.ulnarForearmDifference)
        let forearmFlexorsDifference = defaults.float(forKey: Save.forearmFlexorsDifference)
        let radialForearmDifference = defaults.float(forKey: Save.radialForearmDifference)
        let spinalErectorsDifference = defaults.float(forKey: Save.spinalErectorsDifference)
        let upperTrapsDifference = defaults.float(forKey: Save.upperTrapsDifference)
        let lowerTrapsDifference = defaults.float(forKey: Save.lowerTrapsDifference)
        //var adductorsDifference = defaults.float(forKey: Save.adductorsDifference)
        
        defaults.setValue(upperChestDifference, forKey: Save.upperChestHypeDifference)
        defaults.setValue(middleChestDifference, forKey: Save.middleChestHypeDifference)
        defaults.setValue(lowerChestDifference, forKey: Save.lowerChestHypeDifference)
        defaults.setValue(bicepsLongHeadDifference, forKey: Save.bicepsLongHeadHypeDifference)
        defaults.setValue(bicepsShortHeadDifference, forKey: Save.bicepsShortHeadHypeDifference)
        defaults.setValue(latsRowingDifference, forKey: Save.latsRowingHypeDifference)
        defaults.setValue(latsPushdownDifference, forKey: Save.latsPushdownHypeDifference)
        defaults.setValue(latsPullInDifference, forKey: Save.latsPullInHypeDifference)
        defaults.setValue(glutesDifference, forKey: Save.glutesHypeDifference)
        defaults.setValue(gluteMediusDifference, forKey: Save.gluteMediusHypeDifference)
        defaults.setValue(adductorsDifference, forKey: Save.adductorsHypeDifference)
        defaults.setValue(hamstringCurlDifference, forKey: Save.hamstringCurlHypeDifference)
        defaults.setValue(hamstringHingeDifference, forKey: Save.hamstringHingeHypeDifference)
        defaults.setValue(frontShoulderDifference, forKey: Save.frontShoulderHypeDifference)
        defaults.setValue(lateralShoulderDifference, forKey: Save.lateralShoulderHypeDifference)
        defaults.setValue(backShoulderDifference, forKey: Save.backShoulderHypeDifference)
        defaults.setValue(rotatorCuffDifference, forKey: Save.rotatorCuffHypeDifference)
        defaults.setValue(tricepsLateralShortDifference, forKey: Save.tricepsLateralShortHypeDifference)
        defaults.setValue(tricepsLongDifference, forKey: Save.tricepsLongHeadHypeDifference)
        defaults.setValue(quadsDifference, forKey: Save.quadsHypeDifference)
        defaults.setValue(upperAbsDifference, forKey: Save.upperAbsHypeDifference)
        defaults.setValue(middleAbsDifference, forKey: Save.middleAbsHypeDifference)
        defaults.setValue(lowerAbsDifference, forKey: Save.lowerAbsHypeDifference)
        defaults.setValue(upperObliquesDifference, forKey: Save.upperObliquesHypeDifference)
        defaults.setValue(middleObliquesDifference, forKey: Save.middleObliquesHypeDifference)
        defaults.setValue(lowerObliquesDifference, forKey: Save.lowerObliquesHypeDifference)
        defaults.setValue(serratusDifference, forKey: Save.serratusHypeDifference)
        defaults.setValue(transverseAbDifference, forKey: Save.transverseAbHypeDifference)
        defaults.setValue(gastrocnemiusDifference, forKey: Save.gastrocnemiusHypeDifference)
        defaults.setValue(soleusDifference, forKey: Save.soleusHypeDifference)
        defaults.setValue(tibialisDifference, forKey: Save.anteriorTibialisHypeDifference)
        defaults.setValue(neckExtensionDifference, forKey: Save.neckExtensionHypeDifference)
        defaults.setValue(neckFlexionDifference, forKey: Save.neckFlexionHypeDifference)
        defaults.setValue(transverseNeckDifference, forKey: Save.transverseNeckHypeDifference)
        defaults.setValue(lateralNeckDifference, forKey: Save.lateralNeckHypeDifference)
        defaults.setValue(forearmExtensorsDifference, forKey: Save.forearmExtensorsHypeDifference)
        defaults.setValue(ulnarForearmDifference, forKey: Save.ulnarForearmHypeDifference)
        defaults.setValue(forearmFlexorsDifference, forKey: Save.forearmFlexorsHypeDifference)
        defaults.setValue(radialForearmDifference, forKey: Save.radialForearmHypeDifference)
        defaults.setValue(spinalErectorsDifference, forKey: Save.spinalErectorsHypeDifference)
        defaults.setValue(upperTrapsDifference, forKey: Save.upperTrapsHypeDifference)
        defaults.setValue(lowerTrapsDifference, forKey: Save.lowerTrapsHypeDifference)
        
        let musclesDifferences = [Save.upperChestTitle:upperChestDifference,
                                  Save.middleChestTitle:middleChestDifference,
                                  Save.lowerChestTitle:lowerChestDifference,
                                  Save.bicepsLongHeadTitle: bicepsLongHeadDifference,
                                  Save.bicepsShortHeadTitle: bicepsShortHeadDifference,
                                  Save.latsRowingTitle: latsRowingDifference,
                                  Save.latsPushdownTitle: latsPushdownDifference,
                                  Save.latsPullInTitle :latsPullInDifference,
                                  Save.glutesTitle :glutesDifference,
                                  Save.gluteMediusTitle:gluteMediusDifference,
                                  Save.adductorsTitle:adductorsDifference,
                                  Save.hamstringCurlTitle :hamstringCurlDifference,
                                  Save.hamstringHingeTitle :hamstringHingeDifference,
                                  Save.frontShoulderTitle :frontShoulderDifference,
                                  Save.lateralShoulderTitle :lateralShoulderDifference,
                                  Save.backShoulderTitle: backShoulderDifference,
                                  Save.rotatorCuffTitle :rotatorCuffDifference,
                                  Save.tricepsLateralShortTitle :tricepsLateralShortDifference,
                                  Save.tricepsLongTitle :tricepsLongDifference,
                                  Save.quadsTitle :quadsDifference,
                                  Save.upperAbsTitle :upperAbsDifference,
                                  Save.middleAbsTitle:middleAbsDifference,
                                  Save.lowerAbsTitle :lowerAbsDifference,
                                  Save.upperObliquesTitle :upperObliquesDifference,
                                  Save.middleObliquesTitle :middleObliquesDifference,
                                  Save.lowerObliquesTitle :lowerObliquesDifference,
                                  Save.serratusTitle :serratusDifference,
                                  Save.transverseAbTitle :transverseAbDifference,
                                  Save.gastrocnemiusTitle :gastrocnemiusDifference,
                                  Save.soleusTitle :soleusDifference,
                                  Save.anteriorTibialisTitle :tibialisDifference,
                                  Save.neckFlexionTitle: neckFlexionDifference,
                                  Save.neckExtensionTitle: neckExtensionDifference,
                                  Save.transverseNeckTitle :transverseNeckDifference,
                                  Save.lateralNeckTitle: lateralNeckDifference,
                                  Save.forearmExtensorsTitle :forearmExtensorsDifference,
                                  Save.ulnarForearmTitle :ulnarForearmDifference,
                                  Save.forearmFlexorsTitle :forearmFlexorsDifference,
                                  Save.radialForearmTitle :radialForearmDifference,
                                  Save.spinalErectorsTitle :spinalErectorsDifference,
                                  Save.upperTrapsTitle :upperTrapsDifference,
                                  Save.lowerTrapsTitle :lowerTrapsDifference]
        
        let  sortedMusclesDifferences = musclesDifferences.sorted {return $0.value > $1.value}
        let workoutLength = defaults.float(forKey: Save.workoutLength)
        
        //Adding first exercise from big six
        var remainigSixPostion = defaults.integer(forKey: Save.bigSixCount)
        //append exercise
        if remainigSixPostion >= 6 { remainigSixPostion = 0 }
        var exercise = ExerciseByMuscles().getBigSixExercise(position: remainigSixPostion)
        workoutArray.append(exercise)
        
        //Adding second directly vs hypotheticlly
        let workoutMuscles = sortedMusclesDifferences.prefix(1)
        let muscle = Array(workoutMuscles)[0].key
    
        musclesToSkip.append(exercise.primaryMuscles[0])
        if remainigSixPostion >= 5 {
            remainigSixPostion = 0
        }
 
        defaults.setValue(remainigSixPostion + 1, forKey: Save.bigSixCount)
        
        
        musclesToSkip.append(muscle)
        workoutArray.append(getExercise(muscle: muscle))
        //print(muscle)
        genWeeklySets()
        for muscle in workoutArray[0].primaryMuscles {
            hypotheticallyAddSet(muscle: muscle, isPrimary: true, sets: Int(weeklySetsArray[0])) //find how to dynamically assign weeklysets
        }
        for muscle in workoutArray[0].secondaryMuscles {
            hypotheticallyAddSet(muscle: muscle, isPrimary: false, sets: Int(weeklySetsArray[0])) //find how to dynamically assign weeklysets
        }
        
        //FOR THE REST OF THE EXERCISES ROLL WITH THE HYOTHETICAL
        switch workoutLength {
        case 45: //min
            for i in 1...2 { addNextExercise(exerciseNum: i) }
        case 60: //min //5 exercises with 2:30-3 min rest
            for i in 1...3 { addNextExercise(exerciseNum: i) }
        case 90: //min    //7 exercises with 2-:30-3:00 min rest
            for i in 1...5 { addNextExercise(exerciseNum: i) }
        default:
            for i in 1...5 { addNextExercise(exerciseNum: i) }
//            let workoutMuscles = sortedMusclesDifferences.prefix(7)
//            for (muscle, _) in workoutMuscles { workoutArray.append(getExercise(muscle: muscle)) }
        }
        //Sorting places the hardest compound movements first
        workoutArray.sort(by: <)
        //If the "vanilla exercises is added in the workout, swap it.
//
        //This will create the weekly sets that will populate the tableview sets.
        genWeeklySets()
    }
    
    func getExercise (muscle: String) -> Exercise {
        //TODO find how to account for usin multiple head exercises
        var exercise = Exercise(title: "Error", primaryMuscles: [], secondaryMuscles: [], peakTension: [], isBW: false)
        switch muscle {
        case Save.upperChestTitle:
            let exerciseArray = ExerciseByMuscles().getUpperChestExercise()
            exercise = exerciseArray[Int.random(in: 1..<exerciseArray.count)]
        case Save.middleChestTitle:
            let exerciseArray = ExerciseByMuscles().getMiddleChestExercise()
            exercise = exerciseArray[Int.random(in: 1..<exerciseArray.count)]
        case Save.lowerChestTitle:
            let exerciseArray = ExerciseByMuscles().getLowerChestExercise()
            exercise = exerciseArray[Int.random(in: 1..<exerciseArray.count)]
        case Save.bicepsLongHeadTitle:
            let exerciseArray = ExerciseByMuscles().getBicepsLongHeadExercise()
            exercise = exerciseArray[Int.random(in: 1..<exerciseArray.count)]
        case Save.bicepsShortHeadTitle:
            let exerciseArray = ExerciseByMuscles().getBicepsShortHeadExercise()
            exercise = exerciseArray[Int.random(in: 1..<exerciseArray.count)]
        case Save.latsRowingTitle:
            let exerciseArray = ExerciseByMuscles().getLatsRowingExercise()
            exercise = exerciseArray[Int.random(in: 1..<exerciseArray.count)]
        case Save.latsPushdownTitle:
            let exerciseArray = ExerciseByMuscles().getLatsPushdownExercise()
            exercise = exerciseArray[Int.random(in: 1..<exerciseArray.count)]
        case Save.latsPullInTitle:
            let exerciseArray = ExerciseByMuscles().getLatsPushdownExercise()
            exercise = exerciseArray[Int.random(in: 1..<exerciseArray.count)]
        case Save.glutesTitle:
            let exerciseArray = ExerciseByMuscles().getGluteTitleExercise()
            exercise = exerciseArray[Int.random(in: 1..<exerciseArray.count)]
        case Save.gluteMediusTitle:
            let exerciseArray = ExerciseByMuscles().getGluteMediusExercise()
            exercise = exerciseArray[Int.random(in: 1..<exerciseArray.count)]
        case Save.adductorsTitle:
            let exerciseArray = ExerciseByMuscles().getAdductorsExercises()
            exercise = exerciseArray[Int.random(in: 1..<exerciseArray.count)]
        case Save.hamstringCurlTitle:
            let exerciseArray = ExerciseByMuscles().getHamstringsCurlExercise()
            exercise = exerciseArray[Int.random(in: 1..<exerciseArray.count)]
        case Save.hamstringHingeTitle:
            let exerciseArray = ExerciseByMuscles().getHamstringsHingeExercise()
            exercise = exerciseArray[Int.random(in: 1..<exerciseArray.count)]
        case Save.frontShoulderTitle:
            let exerciseArray = ExerciseByMuscles().getFrontShoulderExercise()
            exercise = exerciseArray[Int.random(in: 1..<exerciseArray.count)]
        case Save.lateralShoulderTitle:
            let exerciseArray = ExerciseByMuscles().getLateralShoulderExercise()
            exercise = exerciseArray[Int.random(in: 1..<exerciseArray.count)]
        case Save.backShoulderTitle:
            let exerciseArray = ExerciseByMuscles().getBackShoulderExercise()
            exercise = exerciseArray[Int.random(in: 1..<exerciseArray.count)]
        case Save.rotatorCuffTitle:
            let exerciseArray = ExerciseByMuscles().getRotatorCuffExercise()
            exercise = exerciseArray[Int.random(in: 1..<exerciseArray.count)]
        case Save.tricepsLateralShortTitle:
            let exerciseArray = ExerciseByMuscles().getTricepsLateralAndShortExercise()
            exercise = exerciseArray[Int.random(in: 1..<exerciseArray.count)]
        case Save.tricepsLongTitle:
            let exerciseArray = ExerciseByMuscles().getTricepsLongExercise()
            exercise = exerciseArray[Int.random(in: 1..<exerciseArray.count)]
        case Save.quadsTitle:
            let exerciseArray = ExerciseByMuscles().getQuadsExercise()
            exercise = exerciseArray[Int.random(in: 1..<exerciseArray.count)]
        case Save.upperAbsTitle:
            let exerciseArray = ExerciseByMuscles().getUpperAbsExercise()
            exercise = exerciseArray[Int.random(in: 1..<exerciseArray.count)]
        case Save.middleAbsTitle:
            let exerciseArray = ExerciseByMuscles().getMiddleAbsExercise()
            exercise = exerciseArray[Int.random(in: 1..<exerciseArray.count)]
        case Save.lowerAbsTitle:
            let exerciseArray = ExerciseByMuscles().getLowerAbsExercise()
            exercise = exerciseArray[Int.random(in: 1..<exerciseArray.count)]
        case Save.upperObliquesTitle:
            let exerciseArray = ExerciseByMuscles().getUpperObliquesExercise()
            exercise = exerciseArray[Int.random(in: 1..<exerciseArray.count)]
        case Save.middleObliquesTitle:
            let exerciseArray = ExerciseByMuscles().getMiddleObliquesExercise()
            exercise = exerciseArray[Int.random(in: 1..<exerciseArray.count)]
        case Save.lowerObliquesTitle:
            let exerciseArray = ExerciseByMuscles().getLowerObliquesExercise()
            exercise = exerciseArray[Int.random(in: 1..<exerciseArray.count)]
        case Save.serratusTitle:
            let exerciseArray = ExerciseByMuscles().getSerratusTitle()
            exercise = exerciseArray[Int.random(in: 1..<exerciseArray.count)]
        case Save.transverseAbTitle:
            let exerciseArray = ExerciseByMuscles().getTransverseAbExercise()
            exercise = exerciseArray[Int.random(in: 1..<exerciseArray.count)]
        case Save.gastrocnemiusTitle:
            let exerciseArray = ExerciseByMuscles().getGastrocExercise()
            exercise = exerciseArray[Int.random(in: 1..<exerciseArray.count)]
        case Save.soleusTitle:
            let exerciseArray = ExerciseByMuscles().getSoleusExercise()
            exercise = exerciseArray[Int.random(in: 1..<exerciseArray.count)]
        case Save.anteriorTibialisTitle:
            let exerciseArray = ExerciseByMuscles().getTibialisExercises()
            exercise = exerciseArray[Int.random(in: 1..<exerciseArray.count)]
        case Save.neckFlexionTitle:
            let exerciseArray = ExerciseByMuscles().getNeckFlexionExercise()
            exercise = exerciseArray[Int.random(in: 1..<exerciseArray.count)]
        case Save.neckExtensionTitle:
            let exerciseArray = ExerciseByMuscles().getNeckExtensionExercise() //TODO all neck implementations
            exercise = exerciseArray[Int.random(in: 1..<exerciseArray.count)]
        case Save.transverseNeckTitle:
            let exerciseArray = ExerciseByMuscles().getNeckTransverseExercise() //TODO all neck implementations
            exercise = exerciseArray[Int.random(in: 1..<exerciseArray.count)]
        case Save.transverseNeckTitle:
            let exerciseArray = ExerciseByMuscles().getNeckTransverseExercise()
            exercise = exerciseArray[Int.random(in: 1..<exerciseArray.count)]
        case Save.lateralNeckTitle:
            let exerciseArray = ExerciseByMuscles().getUpperChestExercise()
            exercise = exerciseArray[Int.random(in: 1..<exerciseArray.count)]
        case Save.forearmExtensorsTitle:
            let exerciseArray = ExerciseByMuscles().getForearmExtensorsExercise()
            exercise = exerciseArray[Int.random(in: 1..<exerciseArray.count)]
        case Save.ulnarForearmTitle:
            let exerciseArray = ExerciseByMuscles().getUlnarForearmExercise()
            exercise = exerciseArray[Int.random(in: 1..<exerciseArray.count)]
        case Save.forearmFlexorsTitle:
            let exerciseArray = ExerciseByMuscles().getForearmFlexorsExercise()
            exercise = exerciseArray[Int.random(in: 1..<exerciseArray.count)]
        case Save.radialForearmTitle:
            let exerciseArray = ExerciseByMuscles().getRadialForearmExercise()
            exercise = exerciseArray[Int.random(in: 1..<exerciseArray.count)]
        case Save.spinalErectorsTitle:let exerciseArray = ExerciseByMuscles().getspinalErectorsExercise()
            exercise = exerciseArray[Int.random(in: 1..<exerciseArray.count)]
        case Save.upperTrapsTitle:
            let exerciseArray = ExerciseByMuscles().getUpperTrapsExercise()
            exercise = exerciseArray[Int.random(in: 1..<exerciseArray.count)]
        case Save.lowerTrapsTitle:
            let exerciseArray = ExerciseByMuscles().getLowerTrapsExercise()
            exercise = exerciseArray[Int.random(in: 1..<exerciseArray.count)]
        case Save.brachialisTitle:
            let exerciseArray = ExerciseByMuscles().getBrachialisExercises()
            exercise = exerciseArray[Int.random(in: 1..<exerciseArray.count)]
        default:
            // getExercise(muscle: muscle)
            print("EXERCISES NOT LOADED FOR \(muscle)")
        }
        return exercise
    }
    
    func getExerciseList (muscle: String) -> [Exercise] {
        //TODO find how to account for usin multiple head exercises
        var exerciseArray = [Exercise]()
        switch muscle {
        case Save.upperChestTitle:
            exerciseArray = ExerciseByMuscles().getUpperChestExercise()
        case Save.middleChestTitle:
            exerciseArray = ExerciseByMuscles().getMiddleChestExercise()
            
        case Save.lowerChestTitle:
            exerciseArray = ExerciseByMuscles().getLowerChestExercise()
            
        case Save.bicepsLongHeadTitle:
            exerciseArray = ExerciseByMuscles().getBicepsLongHeadExercise()
            
        case Save.bicepsShortHeadTitle:
            exerciseArray = ExerciseByMuscles().getBicepsShortHeadExercise()
            
        case Save.latsRowingTitle:
            exerciseArray = ExerciseByMuscles().getLatsRowingExercise()
            
        case Save.latsPushdownTitle:
            exerciseArray = ExerciseByMuscles().getLatsPushdownExercise()
            
        case Save.latsPullInTitle:
            exerciseArray = ExerciseByMuscles().getLatsPullinExercise()
            
        case Save.glutesTitle:
            exerciseArray = ExerciseByMuscles().getGluteTitleExercise()
            
        case Save.gluteMediusTitle:
            exerciseArray = ExerciseByMuscles().getGluteMediusExercise()
        case Save.adductorsTitle:
            exerciseArray = ExerciseByMuscles().getAdductorsExercises()
            
        case Save.adductorsTitle:
            exerciseArray = ExerciseByMuscles().getAdductorsExercises()
            
        case Save.hamstringCurlTitle:
            exerciseArray = ExerciseByMuscles().getHamstringsCurlExercise()
            
        case Save.hamstringHingeTitle:
            exerciseArray = ExerciseByMuscles().getHamstringsHingeExercise()
            
        case Save.frontShoulderTitle:
            exerciseArray = ExerciseByMuscles().getFrontShoulderExercise()
            
        case Save.lateralShoulderTitle:
            exerciseArray = ExerciseByMuscles().getLateralShoulderExercise()
            
        case Save.backShoulderTitle:
            exerciseArray = ExerciseByMuscles().getBackShoulderExercise()
            
        case Save.rotatorCuffTitle:
            exerciseArray = ExerciseByMuscles().getRotatorCuffExercise()
            
        case Save.tricepsLateralShortTitle:
            exerciseArray = ExerciseByMuscles().getTricepsLateralAndShortExercise()
            
        case Save.tricepsLongTitle:
            exerciseArray = ExerciseByMuscles().getTricepsLongExercise()
            
        case Save.quadsTitle:
            exerciseArray = ExerciseByMuscles().getQuadsExercise()
            
        case Save.upperAbsTitle:
            exerciseArray = ExerciseByMuscles().getUpperAbsExercise()
            
        case Save.middleAbsTitle:
            exerciseArray = ExerciseByMuscles().getMiddleAbsExercise()
            
        case Save.lowerAbsTitle:
            exerciseArray = ExerciseByMuscles().getLowerAbsExercise()
            
        case Save.upperObliquesTitle:
            exerciseArray = ExerciseByMuscles().getUpperObliquesExercise()
            
        case Save.middleObliquesTitle:
            exerciseArray = ExerciseByMuscles().getMiddleObliquesExercise()
            
        case Save.lowerObliquesTitle:
            exerciseArray = ExerciseByMuscles().getLowerObliquesExercise()
            
        case Save.serratusTitle:
            exerciseArray = ExerciseByMuscles().getSerratusTitle()
            
        case Save.transverseAbTitle:
            exerciseArray = ExerciseByMuscles().getTransverseAbExercise()
            
        case Save.gastrocnemiusTitle:
            exerciseArray = ExerciseByMuscles().getGastrocExercise()
            
        case Save.soleusTitle:
            exerciseArray = ExerciseByMuscles().getSoleusExercise()
            
        case Save.anteriorTibialisTitle:
            exerciseArray = ExerciseByMuscles().getTibialisExercises()
            
        case Save.neckFlexionTitle:
            exerciseArray = ExerciseByMuscles().getNeckFlexionExercise()
            
        case Save.neckExtensionTitle:
            exerciseArray = ExerciseByMuscles().getNeckExtensionExercise() //TODO all neck implementations
            
        case Save.transverseNeckTitle:
            exerciseArray = ExerciseByMuscles().getNeckTransverseExercise() //TODO all neck implementations
            
        case Save.transverseNeckTitle:
            exerciseArray = ExerciseByMuscles().getNeckTransverseExercise()
            
        case Save.lateralNeckTitle:
            exerciseArray = ExerciseByMuscles().getUpperChestExercise()
            
        case Save.forearmExtensorsTitle:
            exerciseArray = ExerciseByMuscles().getForearmExtensorsExercise()
            
        case Save.ulnarForearmTitle:
            exerciseArray = ExerciseByMuscles().getUlnarForearmExercise()
            
        case Save.forearmFlexorsTitle:
            exerciseArray = ExerciseByMuscles().getForearmFlexorsExercise()
            
        case Save.radialForearmTitle:
            exerciseArray = ExerciseByMuscles().getRadialForearmExercise()
            
        case Save.spinalErectorsTitle:exerciseArray = ExerciseByMuscles().getspinalErectorsExercise()
            
        case Save.upperTrapsTitle:
            exerciseArray = ExerciseByMuscles().getUpperTrapsExercise()
            
        case Save.lowerTrapsTitle:
            exerciseArray = ExerciseByMuscles().getLowerTrapsExercise()
        case Save.brachialisTitle:
            exerciseArray = ExerciseByMuscles().getBrachialisExercises()
            
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
    
    func weeklyVolume(muscle: String) -> Float {
        var max: Float?
        switch muscle {
        case Save.upperChestTitle:
            max =   UserDefaults.standard.float(forKey: Save.upperChestMax)
        case Save.middleChestTitle:
            max =   UserDefaults.standard.float(forKey: Save.middleChestMax)
        case Save.lowerChestTitle:
            max =   UserDefaults.standard.float(forKey: Save.lowerChestMax)
        case Save.bicepsLongHeadTitle:
            max =   UserDefaults.standard.float(forKey: Save.bicepsLongHeadMax)
        case Save.bicepsShortHeadTitle:
            max =   UserDefaults.standard.float(forKey: Save.bicepsShortHeadMax)
        case Save.latsRowingTitle:
            max =   UserDefaults.standard.float(forKey: Save.latsRowingMax)
        case Save.latsPushdownTitle:
            max =   UserDefaults.standard.float(forKey: Save.latsPushdownMax)
        case Save.latsPullInTitle:
            max =   UserDefaults.standard.float(forKey: Save.latsPullInMax)
        case Save.glutesTitle:
            max =   UserDefaults.standard.float(forKey: Save.glutesMax)
        case Save.gluteMediusTitle:
            max =   UserDefaults.standard.float(forKey: Save.gluteMediusMax)
        case Save.adductorsTitle:
            max =   UserDefaults.standard.float(forKey: Save.adductorsMax)
        case Save.hamstringCurlTitle:
            max =   UserDefaults.standard.float(forKey: Save.hamstringCurlMax)
        case Save.hamstringHingeTitle:
            max =   UserDefaults.standard.float(forKey: Save.hamstringHingeMax)
        case Save.frontShoulderTitle:
            max =   UserDefaults.standard.float(forKey: Save.frontShoulderMax)
        case Save.lateralShoulderTitle:
            max =   UserDefaults.standard.float(forKey: Save.lateralShoulderMax)
        case Save.backShoulderTitle:
            max =   UserDefaults.standard.float(forKey: Save.backShoulderMax)
        case Save.rotatorCuffTitle:
            max =   UserDefaults.standard.float(forKey: Save.rotatorCuffMax)
        case Save.tricepsLateralShortTitle:
            max =   UserDefaults.standard.float(forKey: Save.tricepsLateralShortMax)
        case Save.tricepsLongTitle:
            max =   UserDefaults.standard.float(forKey: Save.tricepsLongMax)
        case Save.quadsTitle:
            max =   UserDefaults.standard.float(forKey: Save.quadsMax)
        case Save.upperAbsTitle:
            max =   UserDefaults.standard.float(forKey: Save.upperAbsMax)
        case Save.middleAbsTitle:
            max =   UserDefaults.standard.float(forKey: Save.middleAbsMax)
        case Save.lowerAbsTitle:
            max =   UserDefaults.standard.float(forKey: Save.lowerAbsMax)
        case Save.upperObliquesTitle:
            max =   UserDefaults.standard.float(forKey: Save.upperObliquesMax)
        case Save.middleObliquesTitle:
            max =   UserDefaults.standard.float(forKey: Save.middleObliquesMax)
        case Save.lowerObliquesTitle:
            max =   UserDefaults.standard.float(forKey: Save.lowerObliquesMax)
        case Save.serratusTitle:
            max =   UserDefaults.standard.float(forKey: Save.serratusMax)
        case Save.transverseAbTitle:
            max =   UserDefaults.standard.float(forKey: Save.transverseAbMax)
        case Save.gastrocnemiusTitle:
            max =   UserDefaults.standard.float(forKey: Save.gastrocnemiusMax)
        case Save.soleusTitle:
            max =   UserDefaults.standard.float(forKey: Save.soleusMax)
        case Save.anteriorTibialisTitle:
            max =   UserDefaults.standard.float(forKey: Save.anteriorTibialisMax)
        case Save.neckFlexionTitle:
            max =   UserDefaults.standard.float(forKey: Save.neckFlexionMax)
        case Save.neckExtension:
            max =   UserDefaults.standard.float(forKey: Save.neckExtensionMax)
        case Save.transverseNeckTitle:
            max =   UserDefaults.standard.float(forKey: Save.transverseNeckMax)
        case Save.lateralNeckTitle:
            max =   UserDefaults.standard.float(forKey: Save.lateralNeckMax)
        case Save.forearmExtensorsTitle:
            max =   UserDefaults.standard.float(forKey: Save.forearmExtensorsMax)
        case Save.ulnarForearmTitle:
            max =   UserDefaults.standard.float(forKey: Save.ulnarForearmMax)
        case Save.forearmFlexorsTitle:
            max =   UserDefaults.standard.float(forKey: Save.forearmFlexorsMax)
        case Save.radialForearmTitle:
            max =   UserDefaults.standard.float(forKey: Save.radialForearmMax)
        case Save.spinalErectorsTitle:
            max =   UserDefaults.standard.float(forKey: Save.spinalErectorsMax)
        case Save.upperTrapsTitle:
            max =   UserDefaults.standard.float(forKey: Save.upperTrapsMax)
        case Save.lowerTrapsTitle:
            max =   UserDefaults.standard.float(forKey: Save.lowerTrapsMax)
        case Save.brachialisTitle:
            max =   UserDefaults.standard.float(forKey: Save.brachialisMax)
        default:
            print("Weekly Volume not returned for \(muscle)")
            
        }
        return max ?? -1.0
    }
    
    //Add the current exercie's volume to the main volume tracker
    
    func addSetToVolumeTracker(muscle: String, isPrimary: Bool) {
        //TODO find how to account for usin multiple head exercises
        var setToAdd = 1.0
        if !isPrimary {
            setToAdd = 0.5
        }
        
    switch muscle {
    case Save.upperChestTitle:
        let currentTally = defaults.float(forKey: Save.upperChestTally)
        let updatedTally = currentTally + Float(setToAdd)
        defaults.set(updatedTally, forKey: Save.upperChestTally)
    case Save.middleChestTitle:
        let currentTally = defaults.float(forKey: Save.middleChestTally)
        let updatedTally = currentTally + Float(setToAdd)
        defaults.set(updatedTally, forKey: Save.middleChestTally)
    case Save.lowerChestTitle:
        let currentTally = defaults.float(forKey: Save.lowerChestTally)
        let updatedTally = currentTally + Float(setToAdd)
        defaults.set(updatedTally, forKey: Save.lowerChestTally)
    case Save.bicepsLongHeadTitle:
        let currentTally = defaults.float(forKey: Save.bicepsLongHeadTally)
        let updatedTally = currentTally + Float(setToAdd)
        defaults.set(updatedTally, forKey: Save.bicepsLongHeadTally)
    case Save.bicepsShortHeadTitle:
        let currentTally = defaults.float(forKey: Save.bicepsShortHeadTally)
        let updatedTally = currentTally + Float(setToAdd)
        defaults.set(updatedTally, forKey: Save.bicepsShortHeadTally)
    case Save.brachialisTitle:
        let currentTally = defaults.float(forKey: Save.brachialisTally)
        let updatedTally = currentTally + Float(setToAdd)
        defaults.set(updatedTally, forKey: Save.brachialisTally)
    case Save.latsRowingTitle:
        let currentTally = defaults.float(forKey: Save.latsRowingTally)
        let updatedTally = currentTally + Float(setToAdd)
        defaults.set(updatedTally, forKey: Save.latsRowingTally)
    case Save.latsPushdownTitle:
        let currentTally = defaults.float(forKey: Save.latsPushdownTally)
        let updatedTally = currentTally + Float(setToAdd)
        defaults.set(updatedTally, forKey: Save.latsPushdownTally)
    case Save.latsPullInTitle:
        let currentTally = defaults.float(forKey: Save.latsPullInTally)
        let updatedTally = currentTally + Float(setToAdd)
        defaults.set(updatedTally, forKey: Save.latsPullInTally)
    case Save.glutesTitle:
        let currentTally = defaults.float(forKey: Save.glutesTally)
        let updatedTally = currentTally + Float(setToAdd)
        defaults.set(updatedTally, forKey: Save.glutesTally)
    case Save.gluteMediusTitle:
        let currentTally = defaults.float(forKey: Save.gluteMediusTally)
        let updatedTally = currentTally + Float(setToAdd)
        defaults.set(updatedTally, forKey: Save.gluteMediusTally)
    case Save.adductorsTitle:
        let currentTally = defaults.float(forKey: Save.adductorsTally)
        let updatedTally = currentTally + Float(setToAdd)
        defaults.set(updatedTally, forKey: Save.adductorsTally)
    case Save.hamstringCurlTitle:
        let currentTally = defaults.float(forKey: Save.hamstringCurlTally)
        let updatedTally = currentTally + Float(setToAdd)
        defaults.set(updatedTally, forKey: Save.hamstringCurlTally)
    case Save.hamstringHingeTitle:
        let currentTally = defaults.float(forKey: Save.hamstringHingeTally)
        let updatedTally = currentTally + Float(setToAdd)
        defaults.set(updatedTally, forKey: Save.hamstringHingeTally)
    case Save.frontShoulderTitle:
        let currentTally = defaults.float(forKey: Save.frontShoulderTally)
        let updatedTally = currentTally + Float(setToAdd)
        defaults.set(updatedTally, forKey: Save.frontShoulderTally)
    case Save.lateralShoulderTitle:
        let currentTally = defaults.float(forKey: Save.lateralShoulderTally)
        let updatedTally = currentTally + Float(setToAdd)
        defaults.set(updatedTally, forKey: Save.lateralShoulderTally)
    case Save.backShoulderTitle:
        let currentTally = defaults.float(forKey: Save.backShoulderTally)
        let updatedTally = currentTally + Float(setToAdd)
        defaults.set(updatedTally, forKey: Save.backShoulderTally)
    case Save.rotatorCuffTitle:
        let currentTally = defaults.float(forKey: Save.rotatorCuffTally)
        let updatedTally = currentTally + Float(setToAdd)
        defaults.set(updatedTally, forKey: Save.rotatorCuffTally)
    case Save.tricepsLateralShortTitle:
        let currentTally = defaults.float(forKey: Save.tricepsLateralShortTally)
        let updatedTally = currentTally + Float(setToAdd)
        defaults.set(updatedTally, forKey: Save.tricepsLateralShortTally)
    case Save.tricepsLongTitle:
        let currentTally = defaults.float(forKey: Save.tricepsLongTally)
        let updatedTally = currentTally + Float(setToAdd)
        defaults.set(updatedTally, forKey: Save.tricepsLongTally)
    case Save.quadsTitle:
        let currentTally = defaults.float(forKey: Save.quadsTally)
        let updatedTally = currentTally + Float(setToAdd)
        defaults.set(updatedTally, forKey: Save.quadsTally)
    case Save.upperAbsTitle:
        let currentTally = defaults.float(forKey: Save.upperAbsTally)
        let updatedTally = currentTally + Float(setToAdd)
        defaults.set(updatedTally, forKey: Save.upperAbsTally)
    case Save.middleAbsTitle:
        let currentTally = defaults.float(forKey: Save.middleAbsTally)
        let updatedTally = currentTally + Float(setToAdd)
        defaults.set(updatedTally, forKey: Save.middleAbsTally)
    case Save.lowerAbsTitle:
        let currentTally = defaults.float(forKey: Save.lowerAbsTally)
        let updatedTally = currentTally + Float(setToAdd)
        defaults.set(updatedTally, forKey: Save.lowerAbsTally)
    case Save.upperObliquesTitle:
        let currentTally = defaults.float(forKey: Save.upperObliquesTally)
        let updatedTally = currentTally + Float(setToAdd)
        defaults.set(updatedTally, forKey: Save.upperObliquesTally)
    case Save.middleObliquesTitle:
        let currentTally = defaults.float(forKey: Save.middleObliquesTally)
        let updatedTally = currentTally + Float(setToAdd)
        defaults.set(updatedTally, forKey: Save.middleObliquesTally)
    case Save.lowerObliquesTitle:
        let currentTally = defaults.float(forKey: Save.lowerObliquesTally)
        let updatedTally = currentTally + Float(setToAdd)
        defaults.set(updatedTally, forKey: Save.lowerObliquesTally)
    case Save.serratusTitle:
        let currentTally = defaults.float(forKey: Save.serratusTally)
        let updatedTally = currentTally + Float(setToAdd)
        defaults.set(updatedTally, forKey: Save.serratusTally)
    case Save.transverseAbTitle:
        let currentTally = defaults.float(forKey: Save.transverseAbTally)
        let updatedTally = currentTally + Float(setToAdd)
        defaults.set(updatedTally, forKey: Save.transverseAbTally)
    case Save.gastrocnemiusTitle:
        let currentTally = defaults.float(forKey: Save.gastrocnemiusTally)
        let updatedTally = currentTally + Float(setToAdd)
        defaults.set(updatedTally, forKey: Save.gastrocnemiusTally)
    case Save.soleusTitle:
        let currentTally = defaults.float(forKey: Save.soleusTally)
        let updatedTally = currentTally + Float(setToAdd)
        defaults.set(updatedTally, forKey: Save.soleusTally)
    case Save.anteriorTibialisTitle:
        let currentTally = defaults.float(forKey: Save.anteriorTibialisTally)
        let updatedTally = currentTally + Float(setToAdd)
        defaults.set(updatedTally, forKey: Save.anteriorTibialisTally)
    case Save.neckFlexionTitle:
        let currentTally = defaults.float(forKey: Save.neckFlexionTally)
        let updatedTally = currentTally + Float(setToAdd)
        defaults.set(updatedTally, forKey: Save.neckFlexionTally)
    case Save.neckExtensionTitle:
        let currentTally = defaults.float(forKey: Save.neckExtensionTally)
        let updatedTally = currentTally + Float(setToAdd)
        defaults.set(updatedTally, forKey: Save.neckExtensionTally)
    case Save.transverseNeckTitle:
        let currentTally = defaults.float(forKey: Save.transverseNeckTally)
        let updatedTally = currentTally + Float(setToAdd)
        defaults.set(updatedTally, forKey: Save.transverseNeckTally)
    case Save.forearmExtensorsTitle:
        let currentTally = defaults.float(forKey: Save.forearmExtensorsTally)
        let updatedTally = currentTally + Float(setToAdd)
        defaults.set(updatedTally, forKey: Save.forearmExtensorsTally)
    case Save.ulnarForearmTitle:
        let currentTally = defaults.float(forKey: Save.ulnarForearmTally)
        let updatedTally = currentTally + Float(setToAdd)
        defaults.set(updatedTally, forKey: Save.ulnarForearmTally)
    case Save.forearmFlexorsTitle:
        let currentTally = defaults.float(forKey: Save.forearmFlexorsTally)
        let updatedTally = currentTally + Float(setToAdd)
        defaults.set(updatedTally, forKey: Save.forearmFlexorsTally)
    case Save.radialForearmTitle:
        let currentTally = defaults.float(forKey: Save.radialForearmTally)
        let updatedTally = currentTally + Float(setToAdd)
        defaults.set(updatedTally, forKey: Save.radialForearmTally)
    case Save.spinalErectorsTitle:
        let currentTally = defaults.float(forKey: Save.spinalErectorsTally)
        let updatedTally = currentTally + Float(setToAdd)
        defaults.set(updatedTally, forKey: Save.spinalErectorsTally)
    case Save.upperTrapsTitle:
        let currentTally = defaults.float(forKey: Save.upperTrapsTally)
        let updatedTally = currentTally + Float(setToAdd)
        defaults.set(updatedTally, forKey: Save.upperTrapsTally)
    case Save.lowerTrapsTitle:
        let currentTally = defaults.float(forKey: Save.lowerTrapsTally)
        let updatedTally = currentTally + Float(setToAdd)
        defaults.set(updatedTally, forKey: Save.lowerTrapsTally)
    default:
        // getExercise(muscle: muscle)
        print("EXERCISES NOT LOADED FOR \(muscle)")
}
      //  VolumeTrackerVC().tableView.reloadData()
        //return exercise
    }
    
    func subSetToVolumeTracker(muscle: String, isPrimary: Bool) {
        //TODO find how to account for usin multiple head exercises
        var setToAdd = -1.0
        if !isPrimary {
            setToAdd = -0.5
        }
        
        switch muscle {
        case Save.upperChestTitle:
            let currentTally = defaults.float(forKey: Save.upperChestTally)
            let updatedTally = currentTally + Float(setToAdd)
            defaults.set(updatedTally, forKey: Save.upperChestTally)
        case Save.middleChestTitle:
            let currentTally = defaults.float(forKey: Save.middleChestTally)
            let updatedTally = currentTally + Float(setToAdd)
            defaults.set(updatedTally, forKey: Save.middleChestTally)
        case Save.lowerChestTitle:
            let currentTally = defaults.float(forKey: Save.lowerChestTally)
            let updatedTally = currentTally + Float(setToAdd)
            defaults.set(updatedTally, forKey: Save.lowerChestTally)
        case Save.bicepsLongHeadTitle:
            let currentTally = defaults.float(forKey: Save.bicepsLongHeadTally)
            let updatedTally = currentTally + Float(setToAdd)
            defaults.set(updatedTally, forKey: Save.bicepsLongHeadTally)
        case Save.bicepsShortHeadTitle:
            let currentTally = defaults.float(forKey: Save.bicepsShortHeadTally)
            let updatedTally = currentTally + Float(setToAdd)
            defaults.set(updatedTally, forKey: Save.bicepsShortHeadTally)
        case Save.brachialisTitle:
            let currentTally = defaults.float(forKey: Save.brachialisTally)
            let updatedTally = currentTally + Float(setToAdd)
            defaults.set(updatedTally, forKey: Save.brachialisTally)
        case Save.latsRowingTitle:
            let currentTally = defaults.float(forKey: Save.latsRowingTally)
            let updatedTally = currentTally + Float(setToAdd)
            defaults.set(updatedTally, forKey: Save.latsRowingTally)
        case Save.latsPushdownTitle:
            let currentTally = defaults.float(forKey: Save.latsPushdownTally)
            let updatedTally = currentTally + Float(setToAdd)
            defaults.set(updatedTally, forKey: Save.latsPushdownTally)
        case Save.latsPullInTitle:
            let currentTally = defaults.float(forKey: Save.latsPullInTally)
            let updatedTally = currentTally + Float(setToAdd)
            defaults.set(updatedTally, forKey: Save.latsPullInTally)
        case Save.glutesTitle:
            let currentTally = defaults.float(forKey: Save.glutesTally)
            let updatedTally = currentTally + Float(setToAdd)
            defaults.set(updatedTally, forKey: Save.glutesTally)
        case Save.gluteMediusTitle:
            let currentTally = defaults.float(forKey: Save.gluteMediusTally)
            let updatedTally = currentTally + Float(setToAdd)
            defaults.set(updatedTally, forKey: Save.gluteMediusTally)
        case Save.adductorsTitle:
            let currentTally = defaults.float(forKey: Save.adductorsTally)
            let updatedTally = currentTally + Float(setToAdd)
            defaults.set(updatedTally, forKey: Save.adductorsTally)
        case Save.hamstringCurlTitle:
            let currentTally = defaults.float(forKey: Save.hamstringCurlTally)
            let updatedTally = currentTally + Float(setToAdd)
            defaults.set(updatedTally, forKey: Save.hamstringCurlTally)
        case Save.hamstringHingeTitle:
            let currentTally = defaults.float(forKey: Save.hamstringHingeTally)
            let updatedTally = currentTally + Float(setToAdd)
            defaults.set(updatedTally, forKey: Save.hamstringHingeTally)
        case Save.frontShoulderTitle:
            let currentTally = defaults.float(forKey: Save.frontShoulderTally)
            let updatedTally = currentTally + Float(setToAdd)
            defaults.set(updatedTally, forKey: Save.frontShoulderTally)
        case Save.lateralShoulderTitle:
            let currentTally = defaults.float(forKey: Save.lateralShoulderTally)
            let updatedTally = currentTally + Float(setToAdd)
            defaults.set(updatedTally, forKey: Save.lateralShoulderTally)
        case Save.backShoulderTitle:
            let currentTally = defaults.float(forKey: Save.backShoulderTally)
            let updatedTally = currentTally + Float(setToAdd)
            defaults.set(updatedTally, forKey: Save.backShoulderTally)
        case Save.rotatorCuffTitle:
            let currentTally = defaults.float(forKey: Save.rotatorCuffTally)
            let updatedTally = currentTally + Float(setToAdd)
            defaults.set(updatedTally, forKey: Save.rotatorCuffTally)
        case Save.tricepsLateralShortTitle:
            let currentTally = defaults.float(forKey: Save.tricepsLateralShortTally)
            let updatedTally = currentTally + Float(setToAdd)
            defaults.set(updatedTally, forKey: Save.tricepsLateralShortTally)
        case Save.tricepsLongTitle:
            let currentTally = defaults.float(forKey: Save.tricepsLongTally)
            let updatedTally = currentTally + Float(setToAdd)
            defaults.set(updatedTally, forKey: Save.tricepsLongTally)
        case Save.quadsTitle:
            let currentTally = defaults.float(forKey: Save.quadsTally)
            let updatedTally = currentTally + Float(setToAdd)
            defaults.set(updatedTally, forKey: Save.quadsTally)
        case Save.upperAbsTitle:
            let currentTally = defaults.float(forKey: Save.upperAbsTally)
            let updatedTally = currentTally + Float(setToAdd)
            defaults.set(updatedTally, forKey: Save.upperAbsTally)
        case Save.middleAbsTitle:
            let currentTally = defaults.float(forKey: Save.middleAbsTally)
            let updatedTally = currentTally + Float(setToAdd)
            defaults.set(updatedTally, forKey: Save.middleAbsTally)
        case Save.lowerAbsTitle:
            let currentTally = defaults.float(forKey: Save.lowerAbsTally)
            let updatedTally = currentTally + Float(setToAdd)
            defaults.set(updatedTally, forKey: Save.lowerAbsTally)
        case Save.upperObliquesTitle:
            let currentTally = defaults.float(forKey: Save.upperObliquesTally)
            let updatedTally = currentTally + Float(setToAdd)
            defaults.set(updatedTally, forKey: Save.upperObliquesTally)
        case Save.middleObliquesTitle:
            let currentTally = defaults.float(forKey: Save.middleObliquesTally)
            let updatedTally = currentTally + Float(setToAdd)
            defaults.set(updatedTally, forKey: Save.middleObliquesTally)
        case Save.lowerObliquesTitle:
            let currentTally = defaults.float(forKey: Save.lowerObliquesTally)
            let updatedTally = currentTally + Float(setToAdd)
            defaults.set(updatedTally, forKey: Save.lowerObliquesTally)
        case Save.serratusTitle:
            let currentTally = defaults.float(forKey: Save.serratusTally)
            let updatedTally = currentTally + Float(setToAdd)
            defaults.set(updatedTally, forKey: Save.serratusTally)
        case Save.transverseAbTitle:
            let currentTally = defaults.float(forKey: Save.transverseAbTally)
            let updatedTally = currentTally + Float(setToAdd)
            defaults.set(updatedTally, forKey: Save.transverseAbTally)
        case Save.gastrocnemiusTitle:
            let currentTally = defaults.float(forKey: Save.gastrocnemiusTally)
            let updatedTally = currentTally + Float(setToAdd)
            defaults.set(updatedTally, forKey: Save.gastrocnemiusTally)
        case Save.soleusTitle:
            let currentTally = defaults.float(forKey: Save.soleusTally)
            let updatedTally = currentTally + Float(setToAdd)
            defaults.set(updatedTally, forKey: Save.soleusTally)
        case Save.anteriorTibialisTitle:
            let currentTally = defaults.float(forKey: Save.anteriorTibialisTally)
            let updatedTally = currentTally + Float(setToAdd)
            defaults.set(updatedTally, forKey: Save.anteriorTibialisTally)
        case Save.neckFlexionTitle:
            let currentTally = defaults.float(forKey: Save.neckFlexionTally)
            let updatedTally = currentTally + Float(setToAdd)
            defaults.set(updatedTally, forKey: Save.neckFlexionTally)
        case Save.neckExtensionTitle:
            let currentTally = defaults.float(forKey: Save.neckExtensionTally)
            let updatedTally = currentTally + Float(setToAdd)
            defaults.set(updatedTally, forKey: Save.neckExtensionTally)
        case Save.transverseNeckTitle:
            let currentTally = defaults.float(forKey: Save.transverseNeckTally)
            let updatedTally = currentTally + Float(setToAdd)
            defaults.set(updatedTally, forKey: Save.transverseNeckTally)
        case Save.forearmExtensorsTitle:
            let currentTally = defaults.float(forKey: Save.forearmExtensorsTally)
            let updatedTally = currentTally + Float(setToAdd)
            defaults.set(updatedTally, forKey: Save.forearmExtensorsTally)
        case Save.ulnarForearmTitle:
            let currentTally = defaults.float(forKey: Save.ulnarForearmTally)
            let updatedTally = currentTally + Float(setToAdd)
            defaults.set(updatedTally, forKey: Save.ulnarForearmTally)
        case Save.forearmFlexorsTitle:
            let currentTally = defaults.float(forKey: Save.forearmFlexorsTally)
            let updatedTally = currentTally + Float(setToAdd)
            defaults.set(updatedTally, forKey: Save.forearmFlexorsTally)
        case Save.radialForearmTitle:
            let currentTally = defaults.float(forKey: Save.radialForearmTally)
            let updatedTally = currentTally + Float(setToAdd)
            defaults.set(updatedTally, forKey: Save.radialForearmTally)
        case Save.spinalErectorsTitle:
            let currentTally = defaults.float(forKey: Save.spinalErectorsTally)
            let updatedTally = currentTally + Float(setToAdd)
            defaults.set(updatedTally, forKey: Save.spinalErectorsTally)
        case Save.upperTrapsTitle:
            let currentTally = defaults.float(forKey: Save.upperTrapsTally)
            let updatedTally = currentTally + Float(setToAdd)
            defaults.set(updatedTally, forKey: Save.upperTrapsTally)
        case Save.lowerTrapsTitle:
            let currentTally = defaults.float(forKey: Save.lowerTrapsTally)
            let updatedTally = currentTally + Float(setToAdd)
            defaults.set(updatedTally, forKey: Save.lowerTrapsTally)
        default:
            // getExercise(muscle: muscle)
            print("EXERCISES NOT LOADED FOR \(muscle)")
        }
        //VolumeTrackerVC().tableView.reloadData()
        //return exercise
    }
    
    func swapExercise(index: Int) {
        workoutArray[index] = getExercise(muscle: workoutArray[index].primaryMuscles[0])
    }
    
    //Create copy of the current volume tracker progress and add every exercise at it is being generated
    func hypotheticallyAddSet(muscle: String, isPrimary: Bool, sets: Int) {
        let weeklyVolume = defaults.float(forKey: Save.lowerTrapsMax)
        let currentProgress = defaults.float(forKey: Save.lowerTrapsMax)
        let lowerTrapHypeDifference = weeklyVolume - (currentProgress + Float(sets))
        defaults.set(lowerTrapHypeDifference, forKey: Save.lowerTrapsHypeDifference)
    }
  
    func add30secs() {
        restTime = restTime + 30
    }
    
    func sub30secs() {
        restTime = restTime - 30
    }
}

//what im doing: GETTHE MAXVOLUME OF A MUSCLE PASSING THE MUSCLE TITLE NA,E

