//
//  HistMusc.swift
//  AofX
//
//  Created by Kevin Jimenez on 10/12/20.
//  Copyright © 2020 Aesthet(X). All rights reserved.
//

// OBJECT FOR VOLUME TRACKER CELLS
import UIKit
//MAKE CLASS, DECLARE VARIBALES. VARIABLE ARE THE VIEWS IN THE CELL
class HistMusc {
   // var image: UIImage
    var title: String
    var image: UIImage
    
    //INITIALIZE THE CLASS BY ASIGNING INIT PARAMATERS TO VARIABLES DECLARED ABOVE
    init(image: UIImage, title: String) {
        //self.image = image
        self.title = title
     self.image = image
        //self.hideButton = hideButton
    }
}
