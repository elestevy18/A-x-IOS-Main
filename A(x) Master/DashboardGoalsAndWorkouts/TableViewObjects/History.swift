//
//  History.swift
//  AofX
//
//  Created by Kevin Jimenez on 10/13/20.
//  Copyright © 2020 Aesthet(X). All rights reserved.
//


import UIKit
//MAKE CLASS, DECLARE VARIBALES. VARIABLE ARE THE VIEWS IN THE CELL
class History {
    //var image: UIImage
    var title: String
    var dateText: String
    var weightText: String
    var repsText: String
    var volumeText: String
    var setText: String
    var RPEText: String
    var noteText: String

    
    //INITIALIZE THE CLASS BY ASIGNING INIT PARAMATERS TO VARIABLES DECLARED ABOVE
    init( title: String, dateText: String, weightText: String, repsText: String, volumeText: String, setText: String, RPEText: String, noteText: String) { //  image: UIImage,
       // self.image = image
        self.title = title
        self.dateText = dateText
        self.weightText = weightText
        self.repsText = repsText
        self.volumeText = volumeText
        self.setText = setText
        self.RPEText = RPEText
        self.noteText = setText
        
    }
}
