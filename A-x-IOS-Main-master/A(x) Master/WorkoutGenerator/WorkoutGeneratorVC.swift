//
//  WorkoutGeneratorVC.swift
//  AofX
//
//  Created by Kevin Jimenez on 3/26/21.
//  Copyright © 2021 Aesthet(X). All rights reserved.
//

import UIKit
import GoogleMobileAds

class WorkoutGeneratorVC: UIViewController, GADFullScreenContentDelegate {
    var vm = WorkoutGeneratorVM.sharedWOGenerator
    var currentWorkoutArray: [Exercise]?
    let defaults        = UserDefaults.standard
    var interstitial: GADInterstitialAd?
    let request = GADRequest()
    var premium = true
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var currentWorkoutTV: UITableView!
    @IBOutlet weak var reorderBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vm.generateWorkout() {
            DispatchQueue.main.async {
                self.currentWorkoutTV.reloadData()
            }
        }
        currentWorkoutArray = vm.workoutArray
        premium = isUserPremium()
        if !premium {
            loadInterstitial()
            
        }
    }
    
    fileprivate func loadInterstitial() {
        defaults.set(true, forKey: Save.displayGenerator)
        GADInterstitialAd.load(withAdUnitID: Save.WOGeneratorAdID,
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
    
    @IBAction func didTapSwap(_ sender: Any) {
        vm.swapExercise(index: (sender as AnyObject).tag ?? -1)
        DispatchQueue.main.async {
            self.currentWorkoutTV.reloadData()
        }
    }
    
    @IBAction func tappedSwapnotMain(_ sender: Any) {
        vm.swapExercise(index: (sender as AnyObject).tag ?? -1)
        DispatchQueue.main.async {
            self.currentWorkoutTV.reloadData()
        }
    }
    
    @IBAction func addExercise(_ sender: Any) {
        vm.addNextExercise(exerciseNum: vm.workoutArray.count)
        DispatchQueue.main.async {
            self.currentWorkoutTV.reloadData()
        }
    }

    @IBAction func popTopCell(_ sender: Any) {
        
        //Check if this is the last set to not crash the app
       // if vm.weeklySetsArray[0] == 1 && vm.weeklySetsArray.count == 1 { return }
        if vm.sets == Int(vm.weeklySetsArray[0]-1) && vm.resting == false  {
                //check if is premium
            if !self.premium {
                if let ad = self.interstitial {
                    ad.present(fromRootViewController: self)
                } else {
                    //print("Ad wasn't ready")
                }
            }
        }
            
        //If the setsount reaches the prescribed sets
        if vm.sets >= Int(vm.weeklySetsArray[0])  {
            vm.sets = 0
            vm.weeklySetsArray.removeFirst()
            vm.sets = 0
            DispatchQueue.main.async {
                self.vm.sets = 0
                self.currentWorkoutTV.reloadData()
            }
        } else if vm.sets >= Int(vm.weeklySetsArray[0]-1) {
            DispatchQueue.main.async {
                self.currentWorkoutTV.reloadData()
            }
        }
    }
    
    @IBAction func createWorkoutTapped(_ sender: Any) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let Exercises = storyboard.instantiateViewController(identifier: "CustomWorkoutListVC") as CustomWorkoutListVC
            self.show(Exercises, sender: self)
            // self.dismiss(animated: true, completion: nil)
            let completionHandler:(CustomWorkoutListVC)->Void = { childVC in
                //self.vm.workoutArray
                self.currentWorkoutArray = self.vm.workoutArray
            self.currentWorkoutTV.reloadData()
            }
            Exercises.completionHandler=completionHandler
    }
    
    fileprivate func isUserPremium() -> Bool {
        let annual = defaults.bool(forKey: Save.annualPurchased)
        let biannual = defaults.bool(forKey: Save.biannualPurchased)
        let monthly = defaults.bool(forKey: Save.monthlyPurchased)
        let hsPromo = defaults.bool(forKey: Save.HSPromo)
        return annual || biannual || monthly || hsPromo
    }
    
    func goToFormVideo(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let dashBoard = storyboard.instantiateViewController(identifier: "formVideo")
        self.show(dashBoard, sender: self)
        // self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func toggleTVEdit(_ sender: Any) {
        if currentWorkoutTV.isEditing {
            currentWorkoutTV.isEditing = false
            reorderBtn.setTitle("Reorder", for: UIControl.State.normal)
        } else {
            currentWorkoutTV.isEditing = true
            reorderBtn.setTitle("Done", for: UIControl.State.normal)
        }
    }
    
}

extension WorkoutGeneratorVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.workoutArray.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MainExerciseTimerTVCell") as! MainExerciseTimerTVCell

            if vm.sets >= Int(vm.weeklySetsArray[0]) {
                if vm.workoutArray.count > 1 { cell.exerciseTitleLabel.text = "Up Next:" + vm.workoutArray[0].title }
                if vm.workoutArray.count == 0  {
                    cell.exerciseTitleLabel.text = "Good Job. Restart app for new workout."
                    cell.startStopBtn.isHidden = true //isUserInteractionEnabled = false
                    vm.toggleWorkingOut()
                }
            } else {
                cell.exerciseTitleLabel.text = vm.workoutArray[0].title
            }
            cell.swapBtn.tag = indexPath.row
            return cell

        } else if indexPath.row == vm.workoutArray.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddExerciseCell") as! AddExerciseCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "WorkoutExerciseTVCell") as! WorkoutExerciseTVCell
            // Set up cell.button
            cell.exerciseTitleLabel.text = vm.workoutArray[indexPath.row].title
            if  vm.weeklySetsArray.count != 0 {
                cell.setsLabel.text = String(Int(vm.weeklySetsArray[indexPath.row])) + " Sets"
                cell.swapBtn.tag = indexPath.row
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == 0 { vm.delegate = cell as? MainExerciseTimerTVCell }
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == 0 { vm.delegate = nil }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == currentWorkoutArray?.count { return }
        let title = vm.workoutArray[indexPath.row].title//    currentWorkoutArray?[indexPath.row].title
        defaults.set(title, forKey: Save.formExercise)
        goToFormVideo()
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt  indexPath: IndexPath) -> Bool {
        return true // Yes, the table view can be reordered
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        var destination = destinationIndexPath.row
        if destinationIndexPath.row == currentWorkoutTV.numberOfRows(inSection: 0) - 1 {
            destination = destinationIndexPath.row - 1
        }
        
        vm.workoutArray.swapAt(sourceIndexPath.row, destination)
        currentWorkoutArray?.swapAt(sourceIndexPath.row, destination)
        vm.weeklySetsArray.swapAt(sourceIndexPath.row, destination)
        DispatchQueue.main.async {
            self.currentWorkoutTV.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      //  if indexPath.row == currentWorkoutTV.numberOfRows(inSection: 0) { return }
        if (editingStyle == .delete) {
            self.vm.workoutArray.remove(at: indexPath.item)
            self.vm.weeklySetsArray.remove(at: indexPath.item)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
     func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
        //ADMOB Methods
        /// Tells the delegate that the ad failed to present full screen content.
    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        //print("Ad did fail to present full screen content.")
    }
    
        /// Tells the delegate that the ad presented full screen content.
    func adDidPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        //print("Ad did present full screen content.")
        let nc = NotificationCenter.default
        nc.post(name: Notification.Name("displayGenerator"), object: nil)
        DispatchQueue.main.async {
            self.defaults.set(true, forKey: Save.displayGenerator)
        }
    }
    
        /// Tells the delegate that the ad dismissed full screen content.
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        loadInterstitial()
    }
    
    @objc func displayGenerator() {
        self.defaults.set(true, forKey: Save.displayGenerator)
    }
    
}
