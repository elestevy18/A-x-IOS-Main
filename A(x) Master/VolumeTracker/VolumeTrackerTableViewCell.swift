//
//  VolumeTrackerTableViewCell.swift
//  AofX
//
//  Created by Kevin Jimenez on 7/1/20.
//  Copyright © 2020 Aesthet(X). All rights reserved.
//

import UIKit

class VolumeTrackerTableViewCell: UITableViewCell {
    
    // 07/03/2020 KEVIN JIMENEZ
    //OUTLETS TO ALL ELEMENTS IN THE CELL

    @IBOutlet weak var MuscleVector: UIImageView!
    @IBOutlet weak var MuscleGroupText: UILabel!
   // @IBOutlet weak var AddSetButton: UIButton!
    @IBOutlet weak var MavFreqText: UILabel!
    @IBOutlet weak var ProgressText: UILabel!
    //@IBOutlet weak var ProgressBar: UIProgressView!
  //  @IBOutlet weak var tableView: UITableView!
    //
    func setCell(cell: VolumeTrackerCellObject) {
        MuscleVector.image = cell.MuscleImage
        MuscleGroupText.text = cell.MuscleGroupTitle
        MavFreqText.text = cell.MavText
        ProgressText.text = cell.ProgressText
       }
       
       
}
