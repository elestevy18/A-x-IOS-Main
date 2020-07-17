//
//  VideoCell.swift
//  BeginnerTableView
//
//  Created by Sean Allen on 5/19/17.
//  Copyright © 2017 Sean Allen. All rights reserved.
//

import UIKit

//CREATE DELGATE FOR CUSTOM ACTION ON EACH CELL "ADD SET BUTTON"
protocol ExercisesTableViewCellDelegate {
    
     func didTapAddSet(title: String)
}

class ExercisesTableViewCell: UITableViewCell {
    

    // OUTLET TO OBJECTS IN THE CELL
 
    @IBOutlet weak var exerciseTitleLabel: UILabel!
    @IBOutlet weak var musclesWorkText: UILabel!
    
    
    var exercisesItem: Exercises!
    var delegate: ExercisesTableViewCellDelegate?
       
    
    func setExercises(exercise: Exercises) {
        exercisesItem = exercise
        exerciseTitleLabel.text = exercise.title
        musclesWorkText.text    = exercise.musclesWorked
    }
    
    @IBAction func addSetTapped(_ sender: Any) {
        delegate?.didTapAddSet(title: exercisesItem.title)
    }

    
 
    
}
