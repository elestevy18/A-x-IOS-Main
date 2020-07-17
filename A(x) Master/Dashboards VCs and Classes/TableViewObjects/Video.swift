//
//  Video.swift
//  BeginnerTableVie
//
// OBJECT FOR VOLUME TRACKER CELLS
import UIKit
//MAKE CLASS, DECLARE VARIBALES. VARIABLE ARE THE VIEWS IN THE CELL
class Video {
    var image: UIImage
    var title: String
    var progressText: String
    var mavText: String
    var progress: Float
    
    //INITIALIZE THE CLASS BY ASIGNING INIT PARAMATERS TO VARIABLES DECLARED ABOVE
    init(image: UIImage, title: String, progressText: String, mavText: String, progressFloat: Float) {
        self.image = image
        self.title = title
        self.progressText = progressText
        self.mavText = mavText
        self.progress = progressFloat
    }

}
