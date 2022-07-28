//
//  CustomWorkoutListVC.swift
//  AofX
//
//  Created by Kevin Jimenez on 7/19/21.
//  Copyright © 2021 Aesthet(X). All rights reserved.
//

import UIKit

class CustomWorkoutListVC: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    
    var exerciseList = [Exercise]()
    var initialDataAry = [Exercise]()
    @IBOutlet weak var exercisesTV: UITableView!
    var completionHandler : ((_ childVC:CustomWorkoutListVC) -> Void)?
    var searching = false
    let defaults = UserDefaults.standard
    let vm = CustomWorkoutVM.sharedWOGenerator

    override func viewDidLoad() {
        super.viewDidLoad()
        exerciseList = ExerciseByMuscles().getAllExercises()
        
        DispatchQueue.main.async {
            self.exercisesTV.reloadData()
        }
        //searchBar.becomeFirstResponder()
        
        // Do any additional setup after loading the view.
    }
    
    func goToFormVideo(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let dashBoard = storyboard.instantiateViewController(identifier: "formVideo")
        self.show(dashBoard, sender: self)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addToWorkoutPressed(_ sender: Any) {
        //TODO
        //ifthe button says remove, remove exercises array()
        // let title = exercise.title
       // let cellRow = (sender as AnyObject).text
        //add to VM
        let exercises = exerciseList
        let cellRow = (sender as AnyObject).tag ?? -1
        let exercise = exercises[cellRow]
      
        
        vm.customWorkoutArray.append(exercise)
    }
    @IBAction func savePressed(_ sender: Any) {
        vm.commitWorkout()
        self.dismiss(animated: true, completion: nil)
    }
}



extension CustomWorkoutListVC: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
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
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        initialDataAry = exerciseList
        if searchText.isEmpty {
            exerciseList = ExerciseByMuscles().getAllExercises()
            self.exercisesTV.reloadData()
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
            exercisesTV.reloadData()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        exercisesTV.reloadData()
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
