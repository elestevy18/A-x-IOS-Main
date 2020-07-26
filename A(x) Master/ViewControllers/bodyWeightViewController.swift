//
//  bodyWeightViewController.swift
//  A(x) Master
//
//  Created by Kevin Jimenez on 7/23/20.
//  Copyright © 2020 Aesthet(X). All rights reserved.
//

import UIKit

class bodyWeightViewController: UIViewController {

     
        
        
          @IBOutlet weak var bodyWeightExercisesTableView: UITableView!
            
         
            
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
                    static let formMuscle                  = "formMuscle"
                    static let formExercise                = "formExercise"
            
         }
        
         //Place code to add volume according to exercise here
            
        override func viewDidLoad() {
            super.viewDidLoad()
            
            bodyWeightExercisesTableView.allowsSelection = true
          
            chestExercises = createChestArray()
            bicepExercises = createBicepArray()
            latsExercises  = createLatsArray()

        }


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
            let exercise16 = Exercises(title: "Push-Ups",     musclesWorked:   "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
            let exercise17 = Exercises(title: "Wide Dips",    musclesWorked:  "Chest Secondary: Lateral and Medial Triceps")
            let exercise18 = Exercises(title: "Banded Fly",   musclesWorked: "Upper/Middle/Lower Pectoral")
           
            return [exercise0, exercise1, exercise2, exercise3, exercise4, exercise5
                    , exercise6, exercise7, exercise8, exercise9, exercise10,
                    exercise11, exercise12, exercise13, exercise14, exercise15, exercise16, exercise17, exercise18]
        }
        
        func createBicepArray() -> [Exercises] {
              let exercise0 = Exercises(title: "Push-Ups",     musclesWorked:   "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
              let exercise1 = Exercises(title: "Wide Dips",    musclesWorked:  "Chest Secondary: Lateral and Medial Triceps")
              let exercise2 = Exercises(title: "Banded Fly",   musclesWorked: "Upper/Middle/Lower Pectoral")
             
              return [exercise0, exercise1, exercise2]
          }
        
        func createLatsArray() -> [Exercises] {
                 let exercise0 = Exercises(title: "LAts",     musclesWorked:   "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
                 let exercise1 = Exercises(title: "lats",    musclesWorked:  "Chest Secondary: Lateral and Medial Triceps")
                 let exercise2 = Exercises(title: "lats",   musclesWorked: "Upper/Middle/Lower Pectoral")
                
                 return [exercise0, exercise1, exercise2]
             }
        
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

    extension bodyWeightViewController: ExercisesTableViewCellDelegate {
    func didTapAddSet(title: String) {

        //ADD CODE TO OPEN ADD SET WINDOW FOR PROPER EXERCISE
        //Each else bracket identifies the exercise that was click and stores its corersponding volume into variable in the format musclegroupTally. I tried abstracting a function but failed sorry future self/ coders

         if (title == "Chest"){
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
         } else if (title == "Bench Press"){

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
            }
        }
    }


    extension bodyWeightViewController: UITableViewDataSource, UITableViewDelegate {
        func numberOfSections(in tableView: UITableView) -> Int {
            return 26
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if section == 0 {
                return chestExercises.count
            } else if section == 1 {
                return bicepExercises.count
            } else if section == 2 {
                return latsExercises.count
            } else if section == 3 {
                return glutesExercises.count
            } else if section == 4 {
                return gluteMediusExercises.count
            }  else if section == 5 {
                return hamstringsExercises.count
            } else if section == 6 {
                return frontShoulderExercises.count
            } else if section == 7 {
                return lateralShoulderExercises.count
            } else if section == 8 {
                return backShoulderExercises.count
            } else if section == 9 {
                return rotatorCuffExercises.count
            } else if section == 10 {
                return tricepsExercises.count
            } else if section == 11 {
                return quadsExercises.count
            } else if section == 12 {
                return absExercises.count
            } else if section == 13 {
                return obliquesExercises.count
            } else if section == 14 {
                return serratusExercises.count
            } else if section == 15 {
                return transverseAbExercises.count
            } else if section == 16 {
                return calvesExercises.count
            } else if section == 17 {
                return neckExercises.count
            } else if section == 18 {
                return forearmExtensorsExercises.count
            } else if section == 19 {
                return ulnarForearmExercises.count
            } else if section == 20 {
                return forearmFlexorsExercises.count
            } else if section == 21 {
                return radialForearmExercises.count
            } else if section == 22 {
                return spinalErectorsExercises.count
            } else if section == 23 {
                return upperTrapsExercises.count
            } else if section == 24 {
                return lowerTrapsExercises.count
            } else {
                return chestExercises.count
            }}
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            //PRETTY SURE I DONT NEED THIS IDK YET
            var exercise = chestExercises[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell") as! ExercisesTableViewCell
                if (indexPath.section == 1){
                    exercise = bicepExercises[indexPath.row]
                } else if indexPath.section == 2 {
                    exercise = latsExercises[indexPath.row]
                } else if indexPath.section ==  3{
                    exercise = latsExercises[indexPath.row]
                } else if indexPath.section == 4 {
                    exercise = latsExercises[indexPath.row]
                } else if indexPath.section == 5 {
                    exercise = latsExercises[indexPath.row]
                } else if indexPath.section == 6 {
                    exercise = latsExercises[indexPath.row]
                } else if indexPath.section == 7 {
                    exercise = latsExercises[indexPath.row]
                } else if indexPath.section == 8 {
                    exercise = latsExercises[indexPath.row]
                } else if indexPath.section == 9 {
                    exercise = latsExercises[indexPath.row]
                } else if indexPath.section == 10 {
                    exercise = latsExercises[indexPath.row]
                } else if indexPath.section == 11 {
                    exercise = latsExercises[indexPath.row]
                } else if indexPath.section == 12 {
                    exercise = latsExercises[indexPath.row]
                } else if indexPath.section == 13 {
                    exercise = latsExercises[indexPath.row]
                } else if indexPath.section == 14 {
                    exercise = latsExercises[indexPath.row]
                } else if indexPath.section == 15 {
                    exercise = latsExercises[indexPath.row]
                } else if indexPath.section == 16 {
                    exercise = latsExercises[indexPath.row]
                } else if indexPath.section == 17 {
                    exercise = latsExercises[indexPath.row]
                } else if indexPath.section == 18 {
                    exercise = latsExercises[indexPath.row]
                } else if indexPath.section == 19 {
                    exercise = latsExercises[indexPath.row]
                } else if indexPath.section == 20 {
                    exercise = latsExercises[indexPath.row]
                } else if indexPath.section == 21 {
                    exercise = latsExercises[indexPath.row]
                } else if indexPath.section == 22 {
                    exercise = latsExercises[indexPath.row]
                } else if indexPath.section == 23 {
                    exercise = latsExercises[indexPath.row]
            }
            cell.setExercises(exercise: exercise)
            cell.delegate = self
            return cell
        }
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            if section == 0{
                return "Chest"
            } else if section == 1{
                return "Biceps"
            } else if section == 2{
                return "Lats"
                } else if section == 3{
                return "Glutes"
                } else if section == 4{
                return "Glute Medius"
                } else if section == 5{
                return "Hamstrings"
                } else if section == 6{
                return "Front Shoulders"
                } else if section == 7{
                return "Lateral Shoulders"
                } else if section == 8{
                return "Back Shoulders"
                } else if section == 9{
                return "Rotator Cuffs"
                } else if section == 10{
                return "Triceps"
                } else if section == 11{
                return "Quads"
                } else if section == 12{
                return "Abs"
                } else if section == 13{
                return "Obliques"
                } else if section == 14{
                return "Serratus"
                } else if section == 15{
                return "Transverse Ab"
                } else if section == 16{
                return "Calves"
                } else if section == 17{
                return "Neck"
                } else if section == 18{
                return "Forearm Extensors"
                } else if section == 19{
                return "Ulnar Forearm"
                } else if section == 20{
                return "Forearm Flexors"
                }else if section == 21{
                return "Radial Forearm"
                } else if section == 22{
                return "Spinal Erectors"
                } else if section == 23{
                return "Upper Traps"
                } else if section == 24{
                return "Lower Traps"
            } else {
                return "nutin "
            }
        
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           goToFormVideo()
            
            let indexPath = tableView.indexPathForSelectedRow
            let currentCell = tableView.cellForRow(at: indexPath!)! as! ExercisesTableViewCell
            let title = currentCell.exerciseTitleLabel.text
            print(currentCell.exerciseTitleLabel.text!)
            defaults.set(title, forKey: Keys.formExercise)
                   
                  }
    
}
   

