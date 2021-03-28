//
//  WeightHistoryCell.swift
//  AofX
//
//  Created by Kevin Jimenez on 10/12/20.
//  Copyright © 2020 Aesthet(X). All rights reserved.
//



import UIKit
//CREATE DELGATE FOR CUSTOM ACTION ON EACH CELL "ADD SET BUTTON"

class HistoryCell: UITableViewCell {
    
   // OUTLET TO OBJECTS IN THE CELL
    
//    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateText: UILabel!
    @IBOutlet weak var repsText: UILabel!
    @IBOutlet weak var weightText: UILabel!
       @IBOutlet weak var volumeText: UILabel!
    @IBOutlet weak var setsText: UILabel!
    @IBOutlet weak var RPEText: UILabel!


    
    var historyItem: History!

    func setHistory(history: History) {
        historyItem = history
      //  iconImageView.image = history.image
        titleLabel.text = history.title
        repsText.text =  history.repsText   //"Reps:\n" +
        weightText.text  =   history.weightText   //"Weights:\n"
        volumeText.text = history.volumeText   //"Set Volume:\n" +
        setsText.text = history.setText
        dateText.text = history.dateText
        RPEText.text = history.RPEText
        
    }
    
}
