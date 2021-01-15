//
//  VolumeTrackerCellInfo.swift
//  AofX
//
//  Created by Kevin Jimenez on 7/1/20.
//  Copyright © 2020 Aesthet(X). All rights reserved.
//

import Foundation
import UIKit

class VolumeTrackerCellObject{
    var MuscleImage: UIImage
    var MuscleGroupTitle: String
    //var AddSetButton: UIButton
    var MavText: String
    var ProgressText: String
    //var ProgressBar: Float
    
    init(muscleImage: UIImage, muscleGroupTitle: String, mavText: String, progressText:String){
        self.MuscleImage = muscleImage
        self.MuscleGroupTitle = muscleGroupTitle
        //self.AddSetButton = addSetButton
        self.MavText = mavText
        self.ProgressText = progressText
        //self.ProgressBar = progressBar
    }
    
}
