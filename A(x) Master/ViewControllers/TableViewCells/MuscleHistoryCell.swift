//
//  MuscleHistoryCell.swift
//  AofX
//
//  Created by Kevin Jimenez on 10/12/20.
//  Copyright © 2020 Aesthet(X). All rights reserved.
//


// video == histMusc
import UIKit
//CREATE DELGATE FOR CUSTOM ACTION ON EACH CELL "ADD SET BUTTON"
protocol MuscleHistoryCellDelegate {
      
      func didTapViewExercises(title: String)

}
class MuscleHistoryCell: UITableViewCell {
   // OUTLET TO OBJECTS IN THE CELL
    
    @IBOutlet weak var muscleHistoryImageView: UIImageView!
      @IBOutlet weak var muscleHistoryTitleLabel: UILabel!
      @IBOutlet weak var viewExercisesButton: UIButton!
    
    
    var histMuscItem: HistMusc!
    var delegate: MuscleHistoryCellDelegate?
       
    
    func setHistMusc(histMusc: HistMusc) {
        histMuscItem  = histMusc
        //muscleHistoryImageView.image = histMusc.image
         muscleHistoryTitleLabel.text = histMusc.title
        muscleHistoryImageView.image = histMusc.image
        viewExercisesButton.backgroundColor = .clear
        viewExercisesButton.layer.borderWidth = 1
        viewExercisesButton.layer.borderColor = Colors.aXGreen.cgColor
        viewExercisesButton.layer.cornerRadius = 8

    }
    

    @IBAction func viewExercisesTapped(_ sender: Any) {
        delegate?.didTapViewExercises(title: histMuscItem.title)
    }
    
    
}
