//
//  BicepsVt.swift
//  A(x) Master
//
//  Created by Kevin Jimenez on 7/15/20.
//  Copyright © 2020 Aesthet(X). All rights reserved.
//

import UIKit

class BicepsVt: UIView {

}
//
//  ChestExercisesViewController.swift
//  BeginnerTableView
//
//  Created by Kevin Jimenez on 7/3/20.
//  Copyright © 2020 Sean Allen. All rights reserved.
//


import UIKit

class ChestListViewController: UIViewController {
    
    @IBOutlet weak var chestTableView: UITableView!
    
 
    
//creates array to populate exercise list cells
       var gymExercises: [Exercises] = []
       var bodyWeightExercises: [Exercises] = []
       let defaults = UserDefaults.standard
    
     struct Keys {
        //Keys for muscle group to be displayed
        static let chest = "chest"
        //Keys for tally that returns integer value to volume tracker to add volume to progress bars
        static let chestTally = "chesttally"
        static let tricepTally = "triceptally"
        
        //keys for progress bar
        static let chestProgress = "chestprogress"
        static let firstBoot = "firstBoot"
     }
     
    override func viewDidLoad() {
        super.viewDidLoad()
      
        let muscleGroup = defaults.string(forKey:Keys.chest)
        if (muscleGroup == "Chest"){
        gymExercises = createChestArray()
        bodyWeightExercises = createBWArray()
        }
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
       
        return [exercise0, exercise1, exercise2, exercise3, exercise4, exercise5
                , exercise6, exercise7, exercise8, exercise9, exercise10,
                exercise11, exercise12, exercise13, exercise14, exercise15]
    }
    
    func createBWArray() -> [Exercises] {
          let exercise0 = Exercises(title: "Push-Ups",     musclesWorked:   "Chest Secondary: Lateral and Medial Triceps, Anterior Deltoid")
          let exercise1 = Exercises(title: "Wide Dips",    musclesWorked:  "Chest Secondary: Lateral and Medial Triceps")
          let exercise2 = Exercises(title: "Banded Fly",   musclesWorked: "Upper/Middle/Lower Pectoral")
         
          return [exercise0, exercise1, exercise2]
      }
    
    func goToVolumeTracker(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let dashBoard = storyboard.instantiateViewController(identifier: "volumeTracker")
        self.show(dashBoard, sender: self)
        self.dismiss(animated: true, completion: nil)
    }
  
}
    
extension ChestListViewController: ExercisesTableViewCellDelegate {
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
                                 self.defaults.set(tricepTallyFloat, forKey: Keys.tricepTally)
                                 self.goToVolumeTracker()
                                 }))
                                 // 4. Present the alert.
                                 self.present(alert, animated: true, completion: nil)
    }
}
}


extension ChestListViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return gymExercises.count
        } else {
            return bodyWeightExercises.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //PRETTY SURE I DONT NEED THIS IDK YET
        var exercise = gymExercises[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell") as! ExercisesTableViewCell
        if (indexPath.section == 1){
                   exercise = bodyWeightExercises[indexPath.row]
               }
        cell.setExercises(exercise: exercise)
        cell.delegate = self
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "Weighted Exercises"
        } else{
            return "Bodyweight Exercises"
        }
    }
}
    
    func TableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         
}










