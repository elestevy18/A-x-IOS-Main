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

class ExercisesByMuscleVC: UIViewController, GADFullScreenContentDelegate {
    
    @IBOutlet weak var exercisesByMuscleTV: UITableView!
    var vm = WorkoutGeneratorVM.sharedWOGenerator
    var VTvm = VTTrackerVM.sharedVTVM
    let defaults = UserDefaults.standard
    var muscle = ""
    var exerciseArrays: ([Exercise], [Exercise])?
    var BWExerciseList = [Exercise]()
    var wieghtExerciseList = [Exercise]()
    var VT: VolumeTrackerVC!
    var isDismissed: (() -> Void)?
    var completionHandler : ((_ childVC:ExercisesByMuscleVC) -> Void)?
    var showTimer = false
    var exerciseName = ""
    var setsForTimer = 0
    var interstitial: GADInterstitialAd?
    let request = GADRequest()
    
    func toggleShowTimer() {
        showTimer.toggle()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if !(VTvm.isPremium ?? true) {
            loadInterstitial()
        }
        
        //wieghtExerciseList = vm.getExerciseList(muscle: muscle)
        muscle = defaults.string(forKey:Save.muscle) ?? "musel"
        exerciseArrays = vm.getSperatedExercisesList(muscle: muscle)
        wieghtExerciseList = exerciseArrays?.0 ?? []
        BWExerciseList = exerciseArrays?.1 ?? []
        
        DispatchQueue.main.async {
            self.exercisesByMuscleTV.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let showCase = defaults.bool(forKey: Save.firstTimeShowcaseExercises)
        
        if showCase == false {
            if let cell = exercisesByMuscleTV.visibleCells.first as? ExercisesTableViewCell{
                
                let showcase0 = MaterialShowcase()
                showcase0.setTargetView(view: cell.exerciseTitleLabel)
                showcase0.primaryText = "Click any exercise to view a form video"
                showcase0.secondaryText = "Stop half repping and swinging your sets. Maximize growth.\n\nThese exercises were selected to maximize gains and keep you safe. Perform any others at your discretion. You can track them by adding individual volume with the muscle name option at the top."
                showcase0.primaryTextColor = UIColor.black
                showcase0.secondaryTextColor = UIColor.black
                showcase0.backgroundViewType = .full
                showcase0.backgroundPromptColor = Colors.aXGreen
                showcase0.targetHolderColor = UIColor.black
                showcase0.show(completion: {
                    self.defaults.setValue(true, forKey: Save.firstTimeShowcaseExercises)
                })
                
                let showcase1 = MaterialShowcase()
                showcase1.setTargetView(view: cell.addSetButton)
                showcase1.primaryText = "Click to Fill Your Weekly Progress"
                showcase1.secondaryText = "This will add the exercise's volume to the volume tracker's progress bars.\nPrimary movers add one set to your weekly volume and secondary movers add 1/2 a set.\nEach exercise's description provides a list of all the muscles worked."
                showcase1.primaryTextColor = UIColor.black
                showcase1.secondaryTextColor = UIColor.black
                showcase1.backgroundViewType = .full
                showcase1.backgroundPromptColor = Colors.aXGreen
                showcase1.targetHolderColor = UIColor.black
                showcase1.show(completion: {
                    self.defaults.setValue(true, forKey: Save.firstTimeShowcaseExercises)
                })
            }
        }
    }
    
    func dismiss() {
        self.dismiss(animated: true) { self.completionHandler?(self) }
    }
    
    func goToVolumeTracker(){
        let nc = NotificationCenter.default
        nc.post(name: Notification.Name("reloadTV"), object: nil)
        self.dismiss(animated: true, completion: nil)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let dashBoard = storyboard.instantiateViewController(identifier: "volumeTracker")
        dashBoard.loadView()
        self.show(dashBoard, sender: self)
    }
    
    func goToFormVideo(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let formVC = storyboard.instantiateViewController(identifier: "formVideo") as FormVideosViewController
        let completionHandler:(FormVideosViewController)->Void = { childVC in
            if let ad = self.interstitial {
                ad.present(fromRootViewController: self)
            } else {
                //print("FormVideoAd wasn't ready ")
            }
        }
        formVC.completionHandler = completionHandler
        self.present(formVC, animated: true)
    }
    
    //MARK: Set timer data and present
    func setTimerDataAndDismissSelf(exerciseName: String, sets: Int) {
        DispatchQueue.main.async {
            self.showTimer = true
            self.exerciseName = exerciseName
            self.setsForTimer = sets
        }
        self.dismiss()
    }
    
    fileprivate func loadInterstitial() {
        GADInterstitialAd.load(withAdUnitID: Save.formAdID,
                               request: request,
                               completionHandler: { [self] ad, error in
            if let error = error {
                //print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                return
            }
            interstitial = ad
            interstitial?.fullScreenContentDelegate = self
        }
        )
    }
    
//    fileprivate func presentAd() {
//        if let ad = self.interstitial {
//            ad.present(fromRootViewController: self)
//        } else {
//            //print("FormVideoAd wasn't ready ")
//        }
//    }
    

        //MARK: Present Data In Sheet
    //This is where the set are being added
    fileprivate func presentDataInSheet(alert: UIAlertController, exercise: Exercise, title: String, isTimer: Bool) {
        //CAST SETS REPS AND WEIGHT STRING INPUT TO FLOATS
        //SETS
        let sets = alert.textFields![0] // Force unwrapping because we know it exists.
        let setsInt = Int(sets.text ?? "0")
        
        if setsInt ?? 0 < 0 {
            for _ in setsInt!..<0 {
                for i in exercise.primaryMuscles {
                    self.vm.subSetToVolumeTracker(muscle: i, isPrimary: true)
                }
                
                for i in exercise.secondaryMuscles {
                    self.vm.subSetToVolumeTracker(muscle: i, isPrimary: false)
                }
            }
        } else {
            for _ in 0..<setsInt!{
                for i in exercise.primaryMuscles {
                    self.vm.addSetToVolumeTracker(muscle: i, isPrimary: true)
                }
                
                for i in exercise.secondaryMuscles {
                    self.vm.addSetToVolumeTracker(muscle: i, isPrimary: false)
                }
            }
        }
          
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
    
    //MARK: Add Set Pressed
    
    @IBAction func addSetPressed(_ sender: Any) {
        let exercises = self.vm.getExerciseList(muscle: self.muscle)
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
                if alert?.textFields![0].text == "" { return }
                self.presentDataInSheet(alert: alert!, exercise: exercise, title: title, isTimer: false)
                //self.goToVolumeTracker()
            }))
        
        //Start timer button
        alert.addAction(UIAlertAction(title: "Start Timer", style: .default, handler: {
            action in
            let setsInput = alert.textFields![0]
            if setsInput.text == ""  { return }
            let sets = Int(setsInput.text ?? "0")
            if sets ?? 0 <= 0 { return }
            
            self.presentDataInSheet(alert: alert, exercise: exercise, title: title, isTimer: true)
            self.setTimerDataAndDismissSelf(exerciseName: title, sets: sets ?? 1)
        }))
        
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                action in
                // Called when user taps outside
            }))
            // 4. Present the alert.
            self.present(alert, animated: true, completion: nil)
    }
    
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        loadInterstitial()
    }
}

extension ExercisesByMuscleVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
      
        if (wieghtExerciseList.count == 0 || BWExerciseList.count == 0){
            return 1
        }
        else{
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let muscleGroup = defaults.string(forKey:Save.muscle)!
        let exceptionsArray = [""]// [Save.lowerAbsTitle, Save.middleAbsTitle, Save.upperAbsTitle,Save.lowerObliquesTitle, Save.middleObliquesTitle, Save.upperObliquesTitle ]
        
        if (wieghtExerciseList.count == 0 || BWExerciseList.count == 0) {
            return wieghtExerciseList.count + BWExerciseList.count
        }else{
            if section == 0 {
                return wieghtExerciseList.count
            } else {
                return BWExerciseList.count
            }
        }
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let exceptionsArray = [String]()
        if (exceptionsArray.contains(muscle)){
            var joinedList = wieghtExerciseList
            joinedList.append(contentsOf: BWExerciseList)
            let exercise = joinedList[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell") as! ExercisesTableViewCell
            DispatchQueue.main.async { [weak self] in
                cell.setExercises(exercise: exercise)
            }
            cell.addSetButton.tag = indexPath.row
            return cell
        } else {
            var exercise: Exercise?
            let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell") as! ExercisesTableViewCell
            if (indexPath.section  == 0){
            if wieghtExerciseList.count > 0 {
                exercise = wieghtExerciseList[indexPath.row]
                cell.addSetButton.tag = indexPath.row
                }
            } else if (indexPath.section == 1){
                    if BWExerciseList.count > 0 {
                    exercise = BWExerciseList[indexPath.row]
                        cell.addSetButton.tag = indexPath.row + wieghtExerciseList.count
                    }
                }
            cell.setExercises(exercise: exercise ?? Exercise(title: "404", primaryMuscles: [], secondaryMuscles: [], peakTension: [], isBW: true))
            
                return cell
            }
        }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (wieghtExerciseList.count == 0 || BWExerciseList.count == 0){ return "Exercises" }
            if section == 0 {
                return "Weighted Exercises"
            } else{
                return "Bodyweight Exercises"
            }
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        if indexPath?.row == 0 { return }
        let currentCell = tableView.cellForRow(at: indexPath!)! as! ExercisesTableViewCell
        let title = currentCell.exerciseTitleLabel.text
        //print(currentCell.exerciseTitleLabel.text!)
        defaults.set(title, forKey: Save.formExercise)
        goToFormVideo()
        }
    }

extension UITextField {
    
    func addNumericAccessory(addPlusMinus: Bool) {
        let numberToolbar = UIToolbar()
        numberToolbar.barStyle = UIBarStyle.default
        
        var accessories : [UIBarButtonItem] = []
        
        if addPlusMinus {
            accessories.append(UIBarButtonItem(title: "+/-", style: UIBarButtonItem.Style.plain, target: self, action: #selector(plusMinusPressed)))
            accessories.append(UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil))   //add padding after
        }
        
        accessories.append(UIBarButtonItem(title: "Clear", style: UIBarButtonItem.Style.plain, target: self, action: #selector(numberPadClear)))
        accessories.append(UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil))   //add padding space
        accessories.append(UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(numberPadDone)))
        
        numberToolbar.items = accessories
        numberToolbar.sizeToFit()
        
        inputAccessoryView = numberToolbar
    }
    
    @objc func numberPadDone() {
        self.resignFirstResponder()
    }
    
    @objc func numberPadClear() {
        self.text = ""
    }
    
    @objc func plusMinusPressed() {
        guard let currentText = self.text else {
            return
        }
        if currentText.hasPrefix("-") {
            let offsetIndex = currentText.index(currentText.startIndex, offsetBy: 1)
            let substring = currentText[offsetIndex...]  //remove first character
            self.text = String(substring)
        }
        else {
            self.text = "-" + currentText
        }
    }
}
