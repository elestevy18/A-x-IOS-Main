//
//  ExercisesByMuscleVC.swift
//  AofX
//
//  Created by Kevin Jimenez on 6/26/21.
//  Copyright © 2021 Aesthet(X). All rights reserved.
//

//add regular cursl to generator
//add more ab exercises
import UIKit
import GoogleMobileAds
import MaterialShowcase

class AllExercisesVC: UIViewController {
    
    @IBOutlet weak var allExerciseseTV: UITableView!
    var vm = WorkoutGeneratorVM.sharedWOGenerator
    var VTvm = VTTrackerVM.sharedVTVM
    let defaults = UserDefaults.standard
    var muscle = ""
    var exerciseList = [Exercise]()
    var initialDataAry = [Exercise]()
    var VT: VolumeTrackerVC!
    var isDismissed: (() -> Void)?
    var completionHandler : ((_ childVC:AllExercisesVC) -> Void)?
    var searching = false
    var showTimer = false
    var exerciseName = ""
    var setsForTimer = 0

    @IBOutlet weak var searchBar: UISearchBar!
    
    func toggleShowTimer() {
        showTimer.toggle()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exerciseList = ExerciseByMuscles().getAllExercises()
        
        DispatchQueue.main.async {
            self.allExerciseseTV.reloadData()
        }
        searchBar.becomeFirstResponder()
        
        //PLAYGOUND--------------->
//        var uniqueValues = Set<String>()
//        var codes = "["
//        for exercise in exerciseList {
//            if !uniqueValues.contains(exercise.title) {
//            codes.append("\"\(exercise.title)\":\"\",\n")
//            uniqueValues.insert(exercise.title)
//            }
//
//        }
//        //print(codes)
        
        //---------------------------_>
    }
    
    
    func dismiss() {
    self.dismiss(animated: true) {
            self.completionHandler?(self)
        }
    }
    
    func goToVolumeTracker(){
        let nc = NotificationCenter.default
        nc.post(name: Notification.Name("reloadTV"), object: nil)
        self.dismiss(animated: true, completion: nil)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let dashBoard = storyboard.instantiateViewController(identifier: "volumeTracker")
        dashBoard.loadView()
        self.show(dashBoard, sender: self)
        
        // VT.tableView.reloadData()
        
        
        
        
    }
    
    func goToFormVideo(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let dashBoard = storyboard.instantiateViewController(identifier: "formVideo")
        self.show(dashBoard, sender: self)
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: Present Data In Sheet
    //This is where the set are being added
    fileprivate func presentDataInSheet(alert: UIAlertController, exercise: Exercise, title: String, isTimer: Bool) {
        //CAST SETS REPS AND WEIGHT STRING INPUT TO FLOATS
        //SETS
        let sets = alert.textFields![0] // Force unwrapping because we know it exists.

        if let setsInt = Int(sets.text ?? "0") {
            if setsInt < 0 {
            for _ in setsInt..<0 {
                for i in exercise.primaryMuscles {
                    self.vm.subSetToVolumeTracker(muscle: i, isPrimary: true)
                }
                
                for i in exercise.secondaryMuscles {
                    self.vm.subSetToVolumeTracker(muscle: i, isPrimary: false)
                }
            }
        } else {
                for _ in 0..<setsInt{
                    for i in exercise.primaryMuscles {
                        self.vm.addSetToVolumeTracker(muscle: i, isPrimary: true)
                    }
                    
                    for i in exercise.secondaryMuscles {
                        self.vm.addSetToVolumeTracker(muscle: i, isPrimary: false)
                    }
                }
        }
        } else { return } //from if let
        
        let setsString:String? = String(sets.text ?? "")
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
        let reps = alert.textFields![1] // Force unwrapping because we know it exists.
        var repsString:String? = String(reps.text ?? "0.00")
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
        let weight = alert.textFields![2] // Force unwrapping because we know it exists.
        var weightString:String? = String(weight.text ?? "0.00")
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
        } else {
            var exTitleHist: [String] = []
            exTitleHist.append(title)
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
        let rpe = alert.textFields![3] // Force unwrapping because we know it exists.
        var rpeString:String? = String(rpe.text ?? "0.00")
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
        let note = alert.textFields![4]
        var noteString:String? = String(note.text ?? "0.00")
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
        
        if isTimer == false {
            self.dismiss()
        }
        
    }
    
    //MARK: Present Timer
    func presentTimer(exerciseName: String, sets: Int) {
        DispatchQueue.main.async {
            self.showTimer = true
            self.exerciseName = exerciseName
            self.setsForTimer = sets
        }
        self.dismiss()
    }
    
    @IBAction func addSetPressed(_ sender: Any) {
        
        
        
        let exercises = exerciseList
        let cellRow = (sender as AnyObject).tag ?? -1
        let exercise = exercises[cellRow]
        let title = exercise.title
        
        
        //  1. Create the alert controller.
        let alert = UIAlertController(title: "Input Set Information", message: "Input sets performed. Adds 1 set for primary movers, 1/2 for secondary. Optional (*) fields for history.", preferredStyle: .alert)
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
            textField.placeholder = "Intensity (0-10) *"
            textField.keyboardType = .numberPad
            textField.clearsOnBeginEditing = true
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Notes *"
            textField.clearsOnBeginEditing = true
        }
        // 3. Grab the value from the text field, and //print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            self.presentDataInSheet(alert: alert!, exercise: exercise, title: title, isTimer: false)
            //self.goToVolumeTracker()
        }))
        
        //Start timer button
        alert.addAction(UIAlertAction(title: "Start Timer", style: .default, handler: {
            action in
            let setsInput = alert.textFields![0]
            let sets = Int(setsInput.text ?? "0")
            
            self.presentDataInSheet(alert: alert, exercise: exercise, title: title, isTimer: true)
            self.presentTimer(exerciseName: title, sets: sets ?? 1)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
            action in
            // Called when user taps outside
        }))
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
    
    
}

extension AllExercisesVC: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
            return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
                return exerciseList.count
          
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let exercise = exerciseList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllExercisesExerciseCell") as! ExercisesTableViewCell
        cell.setExercises(exercise: exercise )
            //cell.delegate = self
            cell.addSetButton.tag = indexPath.row
            return cell

        }
    
//    func searchBarTextDidEndEditing() {
//        //let searchText = searchBar.text
//        initialDataAry = exerciseList
//        if searchText.isEmpty {
//            exerciseList = ExerciseByMuscles().getAllExercises()
//            self.allExerciseseTV.reloadData()
//        } else {
//            exerciseList.removeAll()
//            
//            for i in 0..<initialDataAry.count{
//                if ( initialDataAry[i].title.lowercased().contains(searchText.lowercased())){
//                    exerciseList.append(initialDataAry[i])
//                }
//                ///TODO: consider adding logic to return searches by criteria
//                //                } else if ( initialDataAry[i].musclesWorked.lowercased().contains(searchText.lowercased())){
//                //                    exerciseList.append(initialDataAry[i])
//                //                }
//            }
//            DispatchQueue.main.async {
//                self.allExerciseseTV.reloadData()
//            }
//            
//        }
//    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        initialDataAry = exerciseList
        if searchText.isEmpty {
            exerciseList = ExerciseByMuscles().getAllExercises()
            self.allExerciseseTV.reloadData()
        } else {
            exerciseList.removeAll()
            
            for i in 0..<initialDataAry.count{
                if ( initialDataAry[i].title.lowercased().contains(searchText.lowercased())){
                    exerciseList.append(initialDataAry[i])
                }
                ///TODO: consider adding logic to return searches by criteria
//                } else if ( initialDataAry[i].musclesWorked.lowercased().contains(searchText.lowercased())){
//                    exerciseList.append(initialDataAry[i])
//                }
            }
            DispatchQueue.main.async {
                self.allExerciseseTV.reloadData()
            }
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        allExerciseseTV.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        let currentCell = tableView.cellForRow(at: indexPath!)! as! ExercisesTableViewCell
        let title = currentCell.exerciseTitleLabel.text
        //print(currentCell.exerciseTitleLabel.text!)
        defaults.set(title, forKey: Save.formExercise)
        goToFormVideo()
    }
    }
  
//    @objc private func titleWasTapped() {
//        guard let url = URL(string: "http://aesthet-x.com/about/") else {
//            return //be safe
//        }
//
//        if #available(iOS 10.0, *) {
//            UIApplication.shared.open(url, options: [:], completionHandler: nil)
//        } else {
//            UIApplication.shared.openURL(url)
//        }
//    }

