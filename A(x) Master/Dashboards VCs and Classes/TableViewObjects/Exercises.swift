//
//  Exercises.swift
//  BeginnerTableView
//
//  Created by Kevin Jimenez on 7/6/20
//
// OBJECT FOR EXERCISE LIST CELLS
import UIKit
//MAKE CLASS, DECLARE VARIBALES. VARIABLE ARE THE VIEWS IN THE CELL
class Exercises {

    var title: String
    var musclesWorked: String
  
    
    //INITIALIZE THE CLASS BY ASIGNING INIT PARAMATERS TO VARIABLES DECLARED ABOVE
    init(title: String, musclesWorked: String) {
        
        self.title = title
        self.musclesWorked = musclesWorked
     
    }
}
