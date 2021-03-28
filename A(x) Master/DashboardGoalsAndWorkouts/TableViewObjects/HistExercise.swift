//
//  HistExercise.swift
//  AofX
//
//  Created by Kevin Jimenez on 10/13/20.
//  Copyright © 2020 Aesthet(X). All rights reserved.
//



import UIKit
//MAKE CLASS, DECLARE VARIBALES. VARIABLE ARE THE VIEWS IN THE CELL
class HistExercise {

    var title: String
    var prText: String
       var prDateText: String
    var vPrText: String
    var vPrDateText: String
    var unit: String
    

    
    //INITIALIZE THE CLASS BY ASIGNING INIT PARAMATERS TO VARIABLES DECLARED ABOVE
    init(title: String, prText: String, prDateText: String, vPrText: String, vPrDateText: String, unit: String) {
     
        self.title = title
        self.prText = prText
         self.prDateText = prDateText
        // v is for volume foo
        self.vPrText = vPrText
        self.vPrDateText = vPrDateText
        self.unit = unit
       
    }
}
