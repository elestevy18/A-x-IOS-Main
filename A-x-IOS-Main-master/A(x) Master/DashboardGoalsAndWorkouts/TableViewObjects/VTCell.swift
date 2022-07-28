//
//  Video.swift
//  BeginnerTableVie
//
// OBJECT FOR VOLUME TRACKER CELLS
import UIKit
//MAKE CLASS, DECLARE VARIBALES. VARIABLE ARE THE VIEWS IN THE CELL
class VTCell{//}:/Equatable {
//    static func == (lhs: VTCell, rhs: VTCell) -> Bool {
//        if lhs == rhs { return true
//        } else { return false }
//    }
    
    var image: UIImage
    var title: String
    var progressText: String
    var mavText: String
    var progress: Float
    var hideButton: Bool
    
    //INITIALIZE THE CLASS BY ASIGNING INIT PARAMATERS TO VARIABLES DECLARED ABOVE
    init(image: UIImage, title: String, progressText: String, mavText: String, progressFloat: Float, hideButton: Bool) {
        self.image = image
        self.title = title
        self.progressText = progressText
        self.mavText = mavText
        self.progress = progressFloat
        self.hideButton = hideButton
    }
}
