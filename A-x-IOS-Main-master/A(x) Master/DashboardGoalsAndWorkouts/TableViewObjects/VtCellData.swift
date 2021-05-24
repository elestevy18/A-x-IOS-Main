//
//  VtCellData.swift
//  AofX
//
//  Created by Kevin Jimenez on 7/15/20.
//  Copyright © 2020 Aesthet(X). All rights reserved.
//

import Foundation
import UIKit
//MAKE CLASS, DECLARE VARIBALES. VARIABLE ARE THE VIEWS IN THE CELL
class VtCellData {
   
    var chestProgress: Float
    var chestTally: Float
    
    //INITIALIZE THE CLASS BY ASIGNING INIT PARAMATERS TO VARIABLES DECLARED ABOVE
    init(chestTally: Float, chestProgress: Float) {
        self.chestProgress = chestProgress
        self.chestTally = chestTally
      
    }
    
}
