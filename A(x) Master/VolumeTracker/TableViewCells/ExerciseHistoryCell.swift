
//
//  MuscleHistoryCell.swift
//  AofX
//
//  Created by Kevin Jimenez on 10/12/20.
//  Copyright © 2020 Aesthet(X). All rights reserved.
//
// This one is for the view that shows list of exercises (by muscle group selected or all of them) and the view history button

// video == histMusc
import UIKit
//CREATE DELGATE FOR CUSTOM ACTION ON EACH CELL "ADD SET BUTTON"
protocol ExerciseHistoryCellDelegate {
      
      func didTapViewHistory(title: String)
      func didTapViewNotes(title: String)
}
class ExerciseHistoryCell: UITableViewCell {
   // OUTLET TO OBJECTS IN THE CELL

@IBOutlet weak var muscleHistoryTitleLabel: UILabel!
    @IBOutlet weak var prDateLabel: UILabel!
    @IBOutlet weak var volumeDateLabel: UILabel!
    @IBOutlet weak var prLabel: UILabel!
       @IBOutlet weak var units: UILabel!
           @IBOutlet weak var units2: UILabel!
@IBOutlet weak var viewHistoryButton: UIButton!
     @IBOutlet weak var volumePrLabel: UILabel!
    
    
    
    var histExerciseItem: HistExercise!
    var delegate: ExerciseHistoryCellDelegate?
       
    
    func setHistExercise(histExercise: HistExercise) {
        histExerciseItem                            = histExercise
        muscleHistoryTitleLabel.text       = histExercise.title
        prDateLabel.text                             = histExercise.prDateText
        prLabel.text                                    = histExercise.prText
        volumePrLabel.text                         = histExercise.vPrText
        volumeDateLabel.text                     = histExercise.vPrDateText
        units.text                                        = histExercise.unit
        units2.text                                       = histExercise.unit
        //muscleHistoryTitleLabel.text = histExercise.title
        
        //View history button styling
        viewHistoryButton.backgroundColor = .clear
        viewHistoryButton.layer.borderWidth = 1
        viewHistoryButton.layer.borderColor = Colors.aXGreen.cgColor
        viewHistoryButton.layer.cornerRadius = 8
        
        //View notes button styling
        viewHistoryButton.backgroundColor = .clear
        viewHistoryButton.layer.borderWidth = 1
        viewHistoryButton.layer.borderColor = Colors.aXOrange.cgColor
        viewHistoryButton.layer.cornerRadius = 8

    }
    
    @IBAction func viewHistoryTapped(_ sender: Any) {
        delegate?.didTapViewHistory(title: histExerciseItem.title)
    }
    
    @IBAction func viewNotesTapped(_ sender: Any) {
        delegate?.didTapViewNotes(title: histExerciseItem.title)
    }
    
    
}

//HistExrcise Object here just for refernence


//
//class HistExercise {
//
//    var title: String
//    var prText: String
//       var prDateText: String
//    var vPrText: String
//    var vPrDateText: String
//
//
//
//    //INITIALIZE THE CLASS BY ASIGNING INIT PARAMATERS TO VARIABLES DECLARED ABOVE
//    init(title: String, prText: String, prDateText: String, vPrText: String, vPrDateText: String) {
//
//        self.title = title
//        self.prText = prText
//         self.prDateText = prDateText
//        // v is for volume foo
//        self.vPrText = vPrText
//        self.vPrDateText = vPrDateText
//
//    }
//}
