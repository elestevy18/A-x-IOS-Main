//
//  VTrackerVM.swift
//  AofX
//
//  Created by Kevin Jimenez on 6/23/21.
//  Copyright © 2021 Aesthet(X,. All rights reserved.
//

import Foundation

@objc protocol VTDelegate : NSObjectProtocol {
    func refreshVT()
    func createVTCellsArray()
}


class VTTrackerVM: NSObject {
    
    static let sharedVTVM: VTTrackerVM = VTTrackerVM()
    let defaults        = UserDefaults.standard
    var cells = [VTCell]()
    var delegate : VTDelegate? = nil
    var splitDateInitiated : Date? = nil
    var timerBaseDate:Date? = nil
    var isPremium: Bool?
    
    
    func checkIsUserPremium() {
        let annual = defaults.bool(forKey: Save.annualPurchased)
        let biannual = defaults.bool(forKey: Save.biannualPurchased)
        let monthly = defaults.bool(forKey: Save.monthlyPurchased)
        let hsPromo = defaults.bool(forKey: Save.HSPromo)
        isPremium = annual || biannual || monthly || hsPromo
    }
    
    func getMuscleArray() -> [String] {
        guard let musclesArray =  UserDefaults.standard.array(forKey: Save.musclesArray) else {
            let musclesArray = [
                Save.upperChestTitle,
                Save.middleChestTitle,
                Save.lowerChestTitle,
                Save.bicepsLongHeadTitle,
                Save.bicepsShortHeadTitle,
                Save.brachialisTitle,
                Save.latsRowingTitle,
                Save.latsPushdownTitle,
                Save.latsPullInTitle,
                Save.glutesTitle,
                Save.gluteMediusTitle,
                Save.adductorsTitle,
                Save.hamstringCurlTitle,
                Save.hamstringHingeTitle,
                Save.quadsTitle,
                Save.frontShoulderTitle,
                Save.lateralShoulderTitle,
                Save.backShoulderTitle,
                Save.rotatorCuffTitle,
                Save.tricepsLateralShortTitle,
                Save.tricepsLongTitle,
                Save.upperAbsTitle,
                Save.middleAbsTitle,
                Save.lowerAbsTitle,
                Save.upperObliquesTitle,
                Save.middleObliquesTitle,
                Save.lowerObliquesTitle,
                Save.serratusTitle,
                Save.transverseAbTitle,
                Save.gastrocnemiusTitle,
                Save.soleusTitle,
                Save.anteriorTibialisTitle,
                Save.neckFlexionTitle,
                Save.neckExtensionTitle,
                Save.transverseNeckTitle,
                Save.lateralNeckTitle,
                Save.forearmExtensorsTitle,
                Save.ulnarForearmTitle,
                Save.forearmFlexorsTitle,
                Save.radialForearmTitle,
                Save.spinalErectorsTitle,
                Save.upperTrapsTitle,
                Save.lowerTrapsTitle]
            
            return musclesArray as [String]
        }
        return musclesArray as? [String] ?? []
        
        
    }
   
    @objc func createVTCellsArray(){//} -> [VTCell] {
        cells = []
        let musclesArray = getMuscleArray()
        
        
        for muscle in musclesArray {
            
            switch muscle {
            case Save.upperChestTitle:
                let vtData = getCellData(muscle: muscle)
                let cell  = VTCell(image: #imageLiteral(resourceName: "upperchesticon"), title: muscle,            progressText:String(String(vtData[0]) + "/" + String(Int(vtData[1]))) + "\nweekly sets", mavText: "MAV: 4-7\nFREQ: 2-3", progressFloat: vtData[2], hideButton: false)
//                //if!cells.contains(cell){
                    cells.append(cell)
//                }
            case Save.middleChestTitle:
                let vtData = getCellData(muscle: muscle)
                let cell  = VTCell(image: #imageLiteral(resourceName: "midllechesticon"), title: muscle,            progressText:String(String(vtData[0]) + "/" + String(Int(vtData[1]))) + "\nweekly sets", mavText: "MAV: 4-7\nFREQ: 2-3", progressFloat: vtData[2], hideButton: false)
                cells.append(cell)
            case Save.lowerChestTitle:
                let vtData = getCellData(muscle: muscle)
                let cell  = VTCell(image: #imageLiteral(resourceName: "lowerchesticon"), title: muscle,            progressText:String(String(vtData[0]) + "/" + String(Int(vtData[1]))) + "\nweekly sets", mavText: "MAV: 4-7\nFREQ: 2-3", progressFloat: vtData[2], hideButton: false)
                cells.append(cell)
            case Save.bicepsLongHeadTitle:
                let vtData = getCellData(muscle: muscle)
                let cell  = VTCell(image: #imageLiteral(resourceName: "bicepsshortheadicon"), title: muscle,            progressText:String(String(vtData[0]) + "/" + String(Int(vtData[1]))) + "\nweekly sets", mavText: "MAV: 4-7\nFREQ: 2-3", progressFloat: vtData[2], hideButton: false)
                cells.append(cell)
            case Save.bicepsShortHeadTitle:
                let vtData = getCellData(muscle: muscle)
                let cell  = VTCell(image: #imageLiteral(resourceName: "bicepslongheadicon"), title: muscle,            progressText:String(String(vtData[0]) + "/" + String(Int(vtData[1]))) + "\nweekly sets", mavText: "MAV: 4-7\nFREQ: 2-3", progressFloat: vtData[2], hideButton: false)
                cells.append(cell)
            case Save.brachialisTitle:
                let vtData = getCellData(muscle: muscle)
                let cell  = VTCell(image: #imageLiteral(resourceName: "brachialisicon"), title: muscle,            progressText:String(String(vtData[0]) + "/" + String(Int(vtData[1]))) + "\nweekly sets", mavText: "MAV: 4-7\nFREQ: 2-3", progressFloat: vtData[2], hideButton: false)
                cells.append(cell)
            case Save.latsRowingTitle:
                let vtData = getCellData(muscle: muscle)
                let cell  = VTCell(image: #imageLiteral(resourceName: "latsicon"), title: muscle,            progressText:String(String(vtData[0]) + "/" + String(Int(vtData[1]))) + "\nweekly sets", mavText: "MAV: 4-7\nFREQ: 2-3", progressFloat: vtData[2], hideButton: false)
                cells.append(cell)
            case Save.latsPushdownTitle:
                let vtData = getCellData(muscle: muscle)
                let cell  = VTCell(image: #imageLiteral(resourceName: "latsicon"), title: muscle,            progressText:String(String(vtData[0]) + "/" + String(Int(vtData[1]))) + "\nweekly sets", mavText: "MAV: 4-7\nFREQ: 2-3", progressFloat: vtData[2], hideButton: false)
                cells.append(cell)
            case Save.latsPullInTitle:
                let vtData = getCellData(muscle: muscle)
                let cell  = VTCell(image: #imageLiteral(resourceName: "latsicon"), title: muscle,            progressText:String(String(vtData[0]) + "/" + String(Int(vtData[1]))) + "\nweekly sets", mavText: "MAV: 4-7\nFREQ: 2-3", progressFloat: vtData[2], hideButton: false)
                cells.append(cell)
            case Save.glutesTitle:
                let vtData = getCellData(muscle: muscle)
                let cell  = VTCell(image: #imageLiteral(resourceName: "glutesicon"), title: muscle,           progressText:String(String(vtData[0]) + "/" + String(Int(vtData[1]))) + "\nweekly sets", mavText: "MAV: 4-12\nFREQ: 2-4",  progressFloat: vtData[2], hideButton: false)
                cells.append(cell)
            case Save.gluteMediusTitle:
                let vtData = getCellData(muscle: muscle)
                let cell  = VTCell(image: #imageLiteral(resourceName: "glutemediusicon"), title: muscle,     progressText:String(String(vtData[0]) + "/" + String(Int(vtData[1]))) + "\nweekly sets", mavText: "MAV: 12-15\nFREQ: 2-4",  progressFloat: vtData[2], hideButton: false)
                cells.append(cell)
            case Save.hamstringCurlTitle:
                let vtData = getCellData(muscle: muscle)
                let cell  = VTCell(image: #imageLiteral(resourceName: "hamstringcurlsicon"), title: muscle,       progressText:String(String(vtData[0]) + "/" + String(Int(vtData[1]))) + "\nweekly sets", mavText: "MAV: 5-8\nFREQ: 2-3",  progressFloat: vtData[2], hideButton: false)
                cells.append(cell)
            case Save.hamstringHingeTitle:
                let vtData = getCellData(muscle: muscle)
                let cell  = VTCell(image: #imageLiteral(resourceName: "hingeicon"), title: muscle,       progressText:String(String(vtData[0]) + "/" + String(Int(vtData[1]))) + "\nweekly sets", mavText: "MAV: 5-8\nFREQ: 2-3",  progressFloat: vtData[2], hideButton: false)
                cells.append(cell)
            case Save.frontShoulderTitle:
                let vtData = getCellData(muscle: muscle)
                let cell  = VTCell(image: #imageLiteral(resourceName: "anteriordeltoidicon"), title: muscle,   progressText:String(String(vtData[0]) + "/" + String(Int(vtData[1]))) + "\nweekly sets", mavText: "MAV: 16-22\nFREQ: 1-2",  progressFloat: vtData[2], hideButton: false)
                cells.append(cell)
            case Save.lateralShoulderTitle:
                let vtData = getCellData(muscle: muscle)
                let cell  = VTCell(image: #imageLiteral(resourceName: "lateraldeltoidicon"), title: muscle, progressText:String(String(vtData[0]) + "/" + String(Int(vtData[1]))) + "\nweekly sets", mavText: "MAV: 16-22\nFREQ: 2-6",  progressFloat: vtData[2], hideButton: false)
                cells.append(cell)
            case Save.backShoulderTitle:
                let vtData = getCellData(muscle: muscle)
                let cell  = VTCell(image: #imageLiteral(resourceName: "postdeltsicon"), title: muscle,    progressText:String(String(vtData[0]) + "/" + String(Int(vtData[1]))) + "\nweekly sets", mavText: "MAV: 16-22\nFREQ: 2-6",  progressFloat: vtData[2], hideButton: false)
                cells.append(cell)
            case Save.rotatorCuffTitle:
                let vtData = getCellData(muscle: muscle)
                let cell = VTCell(image: #imageLiteral(resourceName: "rotatorcufficon"), title: muscle,     progressText:String(String(vtData[0]) + "/" + String(Int(vtData[1]))) + "\nweekly sets", mavText: "MAV: 12-20\nFREQ: 3-6",  progressFloat: vtData[2], hideButton: false)
                cells.append(cell)
            case Save.tricepsLateralShortTitle:
                let vtData = getCellData(muscle: muscle)
                let cell = VTCell(image: #imageLiteral(resourceName: "tricepsshortandlateralheadicon"), title: muscle,          progressText:String(String(vtData[0]) + "/" + String(Int(vtData[1]))) + "\nweekly sets", mavText: "MAV: 5-7\nFREQ: 2-3",  progressFloat: vtData[2], hideButton: false)
                cells.append(cell)
            case Save.tricepsLongTitle:
                let vtData = getCellData(muscle: muscle)
                let cell = VTCell(image: #imageLiteral(resourceName: "tricepslongheadicon"), title: muscle,          progressText:String(String(vtData[0]) + "/" + String(Int(vtData[1]))) + "\nweekly sets", mavText: "MAV: 5-7\nFREQ: 2-3",  progressFloat: vtData[2], hideButton: false)
                cells.append(cell)
            case Save.quadsTitle:
                let vtData = getCellData(muscle: muscle)
                let cell = VTCell(image: #imageLiteral(resourceName: "quadsicon"), title: muscle,            progressText:String(String(vtData[0]) + "/" + String(Int(vtData[1]))) + "\nweekly sets", mavText: "MAV: 12-18\nFREQ: 1.5-3",  progressFloat: vtData[2] , hideButton: false)
                cells.append(cell)
            case Save.adductorsTitle:
                let vtData = getCellData(muscle: muscle)
                let cell = VTCell(image: #imageLiteral(resourceName: "adductorsicon.png"), title: muscle,            progressText:String(String(vtData[0]) + "/" + String(Int(vtData[1]))) + "\nweekly sets", mavText: "MAV: 0-4\nFREQ: 1-2",  progressFloat: vtData[2] , hideButton: false)
                cells.append(cell)
            case Save.upperAbsTitle:
                let vtData = getCellData(muscle: muscle)
                let cell = VTCell(image: #imageLiteral(resourceName: "upperabsicon"), title: muscle,              progressText:String(String(vtData[0]) + "/" + String(Int(vtData[1]))) + "\nweekly sets", mavText: "MAV: 4-7\nFREQ: 2-3",  progressFloat: vtData[2], hideButton: false)
                cells.append(cell)
            case Save.middleAbsTitle:
                let vtData = getCellData(muscle: muscle)
                let cell = VTCell(image: #imageLiteral(resourceName: "middleabsicon"), title: muscle,              progressText:String(String(vtData[0]) + "/" + String(Int(vtData[1]))) + "\nweekly sets", mavText: "MAV: 4-7\nFREQ: 2-3",  progressFloat: vtData[2], hideButton: false)
                cells.append(cell)
            case Save.lowerAbsTitle:
                let vtData = getCellData(muscle: muscle)
                let cell = VTCell(image: #imageLiteral(resourceName: "lowerabsicon"), title: muscle,              progressText:String(String(vtData[0]) + "/" + String(Int(vtData[1]))) + "\nweekly sets", mavText: "MAV: 4-7\nFREQ: 2-3",  progressFloat: vtData[2], hideButton: false)
                cells.append(cell)
            case Save.upperObliquesTitle:
                let vtData = getCellData(muscle: muscle)
                let cell = VTCell(image: #imageLiteral(resourceName: "upperobliquesicon"), title: muscle,         progressText:String(String(vtData[0]) + "/" + String(Int(vtData[1]))) + "\nweekly sets", mavText: "MAV: 4-7\nFREQ: 2-3",  progressFloat: vtData[2], hideButton: false)
                cells.append(cell)
            case Save.middleObliquesTitle:
                let vtData = getCellData(muscle: muscle)
                let cell = VTCell(image: #imageLiteral(resourceName: "middleobliquesicon"), title: muscle,         progressText:String(String(vtData[0]) + "/" + String(Int(vtData[1]))) + "\nweekly sets", mavText: "MAV: 4-7\nFREQ: 2-3",  progressFloat: vtData[2], hideButton: false)
                cells.append(cell)
            case Save.lowerObliquesTitle:
                let vtData = getCellData(muscle: muscle)
                let cell = VTCell(image: #imageLiteral(resourceName: "lowerobliquesicon"), title: muscle,         progressText:String(String(vtData[0]) + "/" + String(Int(vtData[1]))) + "\nweekly sets", mavText: "MAV: 4-7\nFREQ: 2-3",  progressFloat: vtData[2], hideButton: false)
                cells.append(cell)
            case Save.serratusTitle:
                let vtData = getCellData(muscle: muscle)
                let cell = VTCell(image: #imageLiteral(resourceName: "serratusicon"), title: muscle,         progressText:String(String(vtData[0]) + "/" + String(Int(vtData[1]))) + "\nweekly sets", mavText: "MAV: 16-20\nFREQ: 3-5",  progressFloat: vtData[2], hideButton: false)
                cells.append(cell)
            case Save.transverseAbTitle:
                let vtData = getCellData(muscle: muscle)
                let cell = VTCell(image: #imageLiteral(resourceName: "transacicon"), title: muscle,    progressText:String(String(vtData[0]) + "/" + String(Int(vtData[1]))) + "\nweekly sets", mavText: "MAV: 16-20\nFREQ: 3-5",  progressFloat: vtData[2], hideButton: false)
                cells.append(cell)
            case Save.gastrocnemiusTitle:
                let vtData = getCellData(muscle: muscle)
                let cell = VTCell(image: #imageLiteral(resourceName: "gastrocnemiusicon"), title: muscle,           progressText:String(String(vtData[0]) + "/" + String(Int(vtData[1]))) + "\nweekly sets", mavText: "MAV: 6-8\nFREQ: 1-2",  progressFloat: vtData[2], hideButton: false)
                cells.append(cell)
            case Save.soleusTitle:
                let vtData = getCellData(muscle: muscle)
                let cell = VTCell(image: #imageLiteral(resourceName: "soleusicon"), title: muscle,           progressText:String(String(vtData[0]) + "/" + String(Int(vtData[1]))) + "\nweekly sets", mavText: "MAV: 6-8\nFREQ: 1-2",  progressFloat: vtData[2], hideButton: false)
                cells.append(cell)
            case Save.anteriorTibialisTitle:
                let vtData = getCellData(muscle: muscle)
                let cell = VTCell(image: #imageLiteral(resourceName: "tibialisicon"), title: muscle,           progressText:String(String(vtData[0]) + "/" + String(Int(vtData[1]))) + "\nweekly sets", mavText: "MAV: 6-8\nFREQ: 1-2",  progressFloat: vtData[2], hideButton: false)
                cells.append(cell)
            case Save.neckFlexionTitle:
                let vtData = getCellData(muscle: muscle)
                let cell = VTCell(image: #imageLiteral(resourceName: "neckflexionicon"), title: muscle,            progressText:String(String(vtData[0]) + "/" + String(Int(vtData[1]))) + "\nweekly sets", mavText: "MAV: 4-5\nFREQ: 2-3",  progressFloat: vtData[2], hideButton: false)
                cells.append(cell)
            case Save.neckExtensionTitle:
                let vtData = getCellData(muscle: muscle)
                let cell = VTCell(image: #imageLiteral(resourceName: "neckicon"), title: muscle,             progressText:String(String(vtData[0]) + "/" + String(Int(vtData[1]))) + "\nweekly sets", mavText: "MAV: 4-5\nFREQ: 2-3",  progressFloat: vtData[2], hideButton: false)
                cells.append(cell)
            case Save.transverseNeckTitle:
                let vtData = getCellData(muscle: muscle)
                let cell = VTCell(image: #imageLiteral(resourceName: "necktransverseicon"), title: muscle,             progressText:String(String(vtData[0]) + "/" + String(Int(vtData[1]))) + "\nweekly sets", mavText: "MAV: 4-5\nFREQ: 2-3",  progressFloat: vtData[2], hideButton: false)
                cells.append(cell)
            case Save.forearmExtensorsTitle:
                let vtData = getCellData(muscle: muscle)
                let cell = VTCell(image: #imageLiteral(resourceName: "extensorsicon"), title: muscle, progressText:String(String(vtData[0]) + "/" + String(Int(vtData[1]))) + "\nweekly sets", mavText: "MAV: 10-20\nFREQ: 2-6",  progressFloat: vtData[2], hideButton: false)
                cells.append(cell)
            case Save.ulnarForearmTitle:
                let vtData = getCellData(muscle: muscle)
                let cell = VTCell(image: #imageLiteral(resourceName: "ulnarforearmicon"), title: muscle,    progressText:String(String(vtData[0]) + "/" + String(Int(vtData[1]))) + "\nweekly sets", mavText: "MAV: 10-20\nFREQ: 2-6",  progressFloat: vtData[2], hideButton: false)
                cells.append(cell)
            case Save.forearmFlexorsTitle:
                let vtData = getCellData(muscle: muscle)
                let cell = VTCell(image: #imageLiteral(resourceName: "flexorsicon"), title: muscle,  progressText:String(String(vtData[0]) + "/" + String(Int(vtData[1]))) + "\nweekly sets", mavText: "MAV: 10-20\nFREQ: 2-6",  progressFloat: vtData[2], hideButton: false)
                cells.append(cell)
            case Save.radialForearmTitle:
                let vtData = getCellData(muscle: muscle)
                let cell = VTCell(image: #imageLiteral(resourceName: "radialforearmicon"), title: muscle,   progressText:String(String(vtData[0]) + "/" + String(Int(vtData[1]))) + "\nweekly sets", mavText: "MAV: 10-20\nFREQ: 2-6",  progressFloat: vtData[2], hideButton: false)
                cells.append(cell)
            case Save.spinalErectorsTitle:
                let vtData = getCellData(muscle: muscle)
                let cell = VTCell(image: #imageLiteral(resourceName: "erectorsicon"), title: muscle,  progressText:String(String(vtData[0]) + "/" + String(Int(vtData[1]))) + "\nweekly sets", mavText: "MAV: 10-15\nFREQ: 2-4",  progressFloat: vtData[2], hideButton: false)
                cells.append(cell)
            case Save.upperTrapsTitle:
                let vtData = getCellData(muscle: muscle)
                let cell = VTCell(image: #imageLiteral(resourceName: "uppertrapsicon"), title: muscle,      progressText:String(String(vtData[0]) + "/" + String(Int(vtData[1]))) + "\nweekly sets", mavText: "MAV: 10-20\nFREQ: 2-6",  progressFloat: vtData[2], hideButton: false)
                cells.append(cell)
            case Save.lowerTrapsTitle:
                let vtData = getCellData(muscle: muscle)
                let cell = VTCell(image: #imageLiteral(resourceName: "lowertrapsicon"), title: muscle,      progressText:String(String(vtData[0]) + "/" + String(Int(vtData[1]))) + "\nweekly sets", mavText: "MAV: 12-20\nFREQ: 2-6",  progressFloat: vtData[2], hideButton: false)
                cells.append(cell)
            default:
                // getExercise(muscle: muscle)
                print("EXERCISES NOT LOADED FOR \(muscle)")
            }
            
            guard delegate == nil else {
                delegate?.refreshVT()
                return
            }
        }
    }
   
    func getCellData(muscle: String) -> [Float] {
        switch muscle {
        case Save.upperChestTitle:
            
            var upperChestTally = defaults.float(forKey: Save.upperChestTally)
            var upperChestProgress = Float(0.0)
            var upperChestMax = defaults.float(forKey: Save.upperChestMax)
            var upperChestProgressForText = defaults.float(forKey: Save.upperChestProgressInt)
            
            upperChestProgressForText = upperChestProgressForText + upperChestTally
            defaults.set(upperChestProgressForText, forKey: Save.upperChestProgressInt)
           if (upperChestMax == 0.0){upperChestMax = 4}
            upperChestTally = (1.0 / upperChestMax) * upperChestTally
            
            defaults.set(upperChestMax, forKey: Save.upperChestMax)
            defaults.removeObject(forKey: Save.upperChestTally)
            let upperChestDifference = upperChestMax - (upperChestProgressForText )
            defaults.set(upperChestDifference, forKey: Save.upperChestDifference)
            upperChestProgress = (1.0/upperChestMax) * upperChestProgressForText// + upperChestTally
            return [upperChestProgressForText, upperChestMax, upperChestProgress]
         
        case Save.middleChestTitle:
            
            var middleChestTally = defaults.float(forKey: Save.middleChestTally)
            var middleChestProgress = Float(0.0)
            var middleChestMax = defaults.float(forKey: Save.middleChestMax)
            var middleChestProgressForText = defaults.float(forKey: Save.middleChestProgressInt)
            
            middleChestProgressForText = middleChestProgressForText + middleChestTally
            defaults.set(middleChestProgressForText, forKey: Save.middleChestProgressInt)
             if(middleChestMax == 0.0){middleChestMax = 4}
            middleChestTally = (1.0 / middleChestMax) * middleChestTally
            
            defaults.set(middleChestMax, forKey: Save.middleChestMax)
            defaults.removeObject(forKey: Save.middleChestTally)
            let middleChestDifference = middleChestMax - (middleChestProgressForText)
            defaults.set(middleChestDifference, forKey: Save.middleChestDifference)
            middleChestProgress = (1.0/middleChestMax) * middleChestProgressForText// + middleChestTally
            return [middleChestProgressForText, middleChestMax, middleChestProgress]
            
        case Save.lowerChestTitle:
            
            var lowerChestTally = defaults.float(forKey: Save.lowerChestTally)
            var lowerChestProgress = Float(0.0)//efaults.float(forKey: Save.lowerChestProgress)
            var lowerChestMax = defaults.float(forKey: Save.lowerChestMax)
            var lowerChestProgressForText = defaults.float(forKey: Save.lowerChestProgressInt)
            lowerChestProgressForText = lowerChestProgressForText + lowerChestTally
            defaults.set(lowerChestProgressForText, forKey: Save.lowerChestProgressInt)
            if(lowerChestMax == 0.0){lowerChestMax = 4}
            lowerChestTally = (1.0 / lowerChestMax) * lowerChestTally
            defaults.set(lowerChestMax, forKey: Save.lowerChestMax)
            defaults.removeObject(forKey: Save.lowerChestTally)
            let lowerChestDifference = lowerChestMax - (lowerChestProgressForText )
            defaults.set(lowerChestDifference, forKey: Save.lowerChestDifference)
            lowerChestProgress = (1.0/lowerChestMax) * lowerChestProgressForText// + lowerChestTally
            return [lowerChestProgressForText, lowerChestMax, lowerChestProgress]
            
        case Save.bicepsLongHeadTitle:
            
            var bicepsLongHeadTally = defaults.float(forKey: Save.bicepsLongHeadTally)
            var bicepsLongHeadProgress = Float(0.0)//efaults.float(forKey: Save.bicepsLongHeadProgress)
            var bicepsLongHeadMax = defaults.float(forKey: Save.bicepsLongHeadMax)
            var bicepsLongHeadProgressForText = defaults.float(forKey: Save.bicepsLongHeadProgressInt)
            bicepsLongHeadProgressForText = bicepsLongHeadProgressForText + bicepsLongHeadTally
            defaults.set(bicepsLongHeadProgressForText, forKey: Save.bicepsLongHeadProgressInt)
            if(bicepsLongHeadMax == 0.0){bicepsLongHeadMax = 4}
            bicepsLongHeadTally = (1.0 / bicepsLongHeadMax) * bicepsLongHeadTally
            defaults.set(bicepsLongHeadMax, forKey: Save.bicepsLongHeadMax)
            defaults.removeObject(forKey: Save.bicepsLongHeadTally)
            var bicepsLongHeadDifference = bicepsLongHeadMax - (bicepsLongHeadProgressForText)
            defaults.set(bicepsLongHeadDifference, forKey: Save.bicepsLongHeadDifference)
            bicepsLongHeadProgress = (1.0/bicepsLongHeadMax) * bicepsLongHeadProgressForText// + bicepsLongHeadTally
            return [bicepsLongHeadProgressForText, bicepsLongHeadMax, bicepsLongHeadProgress]
            
        case Save.bicepsShortHeadTitle:
            
            var bicepsShortHeadTally = defaults.float(forKey: Save.bicepsShortHeadTally)
            var bicepsShortHeadProgress = Float(0.0)//efaults.float(forKey: Save.bicepsShortHeadProgress)
            var bicepsShortHeadMax = defaults.float(forKey: Save.bicepsShortHeadMax)
            var bicepsShortHeadProgressForText = defaults.float(forKey: Save.bicepsShortHeadProgressInt)
            bicepsShortHeadProgressForText = bicepsShortHeadProgressForText + bicepsShortHeadTally
            defaults.set(bicepsShortHeadProgressForText, forKey: Save.bicepsShortHeadProgressInt)
            if(bicepsShortHeadMax == 0.0){bicepsShortHeadMax = 4}
            bicepsShortHeadTally = (1.0 / bicepsShortHeadMax) * bicepsShortHeadTally
            defaults.set(bicepsShortHeadMax, forKey: Save.bicepsShortHeadMax)
            defaults.removeObject(forKey: Save.bicepsShortHeadTally)
            let bicepsShortHeadDifference = bicepsShortHeadMax - (bicepsShortHeadProgressForText )
            defaults.set(bicepsShortHeadDifference, forKey: Save.bicepsShortHeadDifference)
            bicepsShortHeadProgress = (1.0/bicepsShortHeadMax) * bicepsShortHeadProgressForText// + bicepsShortHeadTally
            return [bicepsShortHeadProgressForText, bicepsShortHeadMax, bicepsShortHeadProgress]
            
        case Save.latsRowingTitle:
            
            var latsRowingTally = defaults.float(forKey: Save.latsRowingTally)
            var latsRowingProgress = Float(0.0)//efaults.float(forKey: Save.latsRowingProgress)
            var latsRowingMax = defaults.float(forKey: Save.latsRowingMax)
            var latsRowingProgressForText = defaults.float(forKey: Save.latsRowingProgressInt)
            latsRowingProgressForText = latsRowingProgressForText + latsRowingTally
            defaults.set(latsRowingProgressForText, forKey: Save.latsRowingProgressInt)
            if(latsRowingMax == 0.0){latsRowingMax = 4}
            latsRowingTally = (1.0 / latsRowingMax) * latsRowingTally
            defaults.set(latsRowingMax, forKey: Save.latsRowingMax)
            defaults.removeObject(forKey: Save.latsRowingTally)
            let latsRowingDifference = latsRowingMax - (latsRowingProgressForText )
            defaults.set(latsRowingDifference, forKey: Save.latsRowingDifference)
            latsRowingProgress = (1.0/latsRowingMax) * latsRowingProgressForText// + latsRowingTally
            return [latsRowingProgressForText, latsRowingMax, latsRowingProgress]
            
        case Save.latsPushdownTitle:
            
            var latsPushdownTally = defaults.float(forKey: Save.latsPushdownTally)
            var latsPushdownProgress = Float(0.0)//efaults.float(forKey: Save.latsPushdownProgress)
            var latsPushdownMax = defaults.float(forKey: Save.latsPushdownMax)
            var latsPushdownProgressForText = defaults.float(forKey: Save.latsPushdownProgressInt)
            latsPushdownProgressForText = latsPushdownProgressForText + latsPushdownTally
            defaults.set(latsPushdownProgressForText, forKey: Save.latsPushdownProgressInt)
            if(latsPushdownMax == 0.0){latsPushdownMax = 4}
            latsPushdownTally = (1.0 / latsPushdownMax) * latsPushdownTally
            defaults.set(latsPushdownMax, forKey: Save.latsPushdownMax)
            defaults.removeObject(forKey: Save.latsPushdownTally)
            let latsPushdownDifference = latsPushdownMax - (latsPushdownProgressForText )
            defaults.set(latsPushdownDifference, forKey: Save.latsPushdownDifference)
            latsPushdownProgress = (1.0/latsPushdownMax) * latsPushdownProgressForText// + latsPushdownTally
            return [latsPushdownProgressForText, latsPushdownMax, latsPushdownProgress]
            
        case Save.latsPullInTitle:
            
            var latsPullInTally = defaults.float(forKey: Save.latsPullInTally)
            var latsPullInProgress = Float(0.0)//efaults.float(forKey: Save.latsPullInProgress)
            var latsPullInMax = defaults.float(forKey: Save.latsPullInMax)
            var latsPullInProgressForText = defaults.float(forKey: Save.latsPullInProgressInt)
            latsPullInProgressForText = latsPullInProgressForText + latsPullInTally
            defaults.set(latsPullInProgressForText, forKey: Save.latsPullInProgressInt)
            if(latsPullInMax == 0.0){latsPullInMax = 4}
            latsPullInTally = (1.0 / latsPullInMax) * latsPullInTally
            defaults.set(latsPullInMax, forKey: Save.latsPullInMax)
            defaults.removeObject(forKey: Save.latsPullInTally)
            let latsPullInDifference = latsPullInMax - (latsPullInProgressForText)
            defaults.set(latsPullInDifference, forKey: Save.latsPullInDifference)
            latsPullInProgress = (1.0/latsPullInMax) * latsPullInProgressForText// + latsPullInTally
            return [latsPullInProgressForText, latsPullInMax, latsPullInProgress]
            
        case Save.glutesTitle:
            
            var glutesTally = defaults.float(forKey: Save.glutesTally)
            var glutesProgress = Float(0.0)//efaults.float(forKey: Save.glutesProgress)
            var glutesMax = defaults.float(forKey: Save.glutesMax)
            var glutesProgressForText = defaults.float(forKey: Save.glutesProgressInt)
            glutesProgressForText = glutesProgressForText + glutesTally
            defaults.set(glutesProgressForText, forKey: Save.glutesProgressInt)
            if(glutesMax == 0.0){glutesMax = 4}
            glutesTally = (1.0 / glutesMax) * glutesTally
            defaults.set(glutesMax, forKey: Save.glutesMax)
            defaults.removeObject(forKey: Save.glutesTally)
            let glutesDifference = glutesMax - (glutesProgressForText)
            defaults.set(glutesDifference, forKey: Save.glutesDifference)
            glutesProgress = (1.0/glutesMax) * glutesProgressForText// + glutesTally
            return [glutesProgressForText, glutesMax, glutesProgress]
            
        case Save.gluteMediusTitle:
            
            var gluteMediusTally = defaults.float(forKey: Save.gluteMediusTally)
            var gluteMediusProgress = Float(0.0)//efaults.float(forKey: Save.gluteMediusProgress)
            var gluteMediusMax = defaults.float(forKey: Save.gluteMediusMax)
            var gluteMediusProgressForText = defaults.float(forKey: Save.gluteMediusProgressInt)
            gluteMediusProgressForText = gluteMediusProgressForText + gluteMediusTally
            defaults.set(gluteMediusProgressForText, forKey: Save.gluteMediusProgressInt)
            if(gluteMediusMax == 0.0){gluteMediusMax = 12}
            gluteMediusTally = (1.0 / gluteMediusMax) * gluteMediusTally
            defaults.set(gluteMediusMax, forKey: Save.gluteMediusMax)
            defaults.removeObject(forKey: Save.gluteMediusTally)
            let gluteMediusDifference = gluteMediusMax - (gluteMediusProgressForText)
            defaults.set(gluteMediusDifference, forKey: Save.gluteMediusDifference)
            gluteMediusProgress = (1.0/gluteMediusMax) * gluteMediusProgressForText// + gluteMediusTally
            return [gluteMediusProgressForText, gluteMediusMax, gluteMediusProgress]
            
        case Save.adductorsTitle:
            
            //Adductors
            var adductorsTally = defaults.float(forKey: Save.adductorsTally)
            var adductorsProgress = Float(0.0)//efaults.float(forKey: Save.adductorsProgress)
            var adductorsMax = defaults.float(forKey: Save.adductorsMax)
            var adductorsProgressForText = defaults.float(forKey: Save.adductorsProgressInt)
            adductorsProgressForText = adductorsProgressForText + adductorsTally
            defaults.set(adductorsProgressForText, forKey: Save.adductorsProgressInt)
            if(adductorsMax == 0.0){adductorsMax = 0}
            adductorsTally = (1.0 / adductorsMax) * adductorsTally
            
            defaults.set(adductorsMax, forKey: Save.adductorsMax)
            defaults.removeObject(forKey: Save.adductorsTally)
            let adductorsDifference = adductorsMax - (adductorsProgressForText)
            defaults.set(adductorsDifference, forKey: Save.adductorsDifference)
            adductorsProgress = (1.0/adductorsMax) * adductorsProgressForText// + adductorsTally
            return [adductorsProgressForText, adductorsMax, adductorsProgress]
            
        case Save.hamstringCurlTitle:
            
            var hamstringCurlTally = defaults.float(forKey: Save.hamstringCurlTally)
            var hamstringCurlProgress = Float(0.0)//efaults.float(forKey: Save.hamstringCurlProgress)
            var hamstringCurlMax = defaults.float(forKey: Save.hamstringCurlMax)
            var hamstringCurlProgressForText = defaults.float(forKey: Save.hamstringCurlProgressInt)
            hamstringCurlProgressForText = hamstringCurlProgressForText + hamstringCurlTally
            defaults.set(hamstringCurlProgressForText, forKey: Save.hamstringCurlProgressInt)
            if(hamstringCurlMax == 0.0){hamstringCurlMax = 5}
            hamstringCurlTally = (1.0 / hamstringCurlMax) * hamstringCurlTally
            
            defaults.set(hamstringCurlMax, forKey: Save.hamstringCurlMax)
            defaults.removeObject(forKey: Save.hamstringCurlTally)
            let hamstringCurlDifference = hamstringCurlMax - (hamstringCurlProgressForText)
            defaults.set(hamstringCurlDifference, forKey: Save.hamstringCurlDifference)
            hamstringCurlProgress = (1.0/hamstringCurlMax) * hamstringCurlProgressForText// + hamstringCurlTally
            return [hamstringCurlProgressForText, hamstringCurlMax, hamstringCurlProgress]
            
        case Save.hamstringHingeTitle:
            
            var hamstringHingeTally = defaults.float(forKey: Save.hamstringHingeTally)
            var hamstringHingeProgress = Float(0.0)//efaults.float(forKey: Save.hamstringHingeProgress)
            var hamstringHingeMax = defaults.float(forKey: Save.hamstringHingeMax)
            var hamstringHingeProgressForText = defaults.float(forKey: Save.hamstringHingeProgressInt)
            hamstringHingeProgressForText = hamstringHingeProgressForText + hamstringHingeTally
            defaults.set(hamstringHingeProgressForText, forKey: Save.hamstringHingeProgressInt)
            if(hamstringHingeMax == 0.0){hamstringHingeMax = 5}
            hamstringHingeTally = (1.0 / hamstringHingeMax) * hamstringHingeTally
          
            defaults.set(hamstringHingeMax, forKey: Save.hamstringHingeMax)
            defaults.removeObject(forKey: Save.hamstringHingeTally)
            let hamstringHingeDifference = hamstringHingeMax - (hamstringHingeProgressForText)
            defaults.set(hamstringHingeDifference, forKey: Save.hamstringHingeDifference)
            hamstringHingeProgress = (1.0/hamstringHingeMax) * hamstringHingeProgressForText// + hamstringHingeTally
            return [hamstringHingeProgressForText, hamstringHingeMax, hamstringHingeProgress]
            
        case Save.frontShoulderTitle:
            
            var frontShoulderTally = defaults.float(forKey: Save.frontShoulderTally)
            var frontShoulderProgress = Float(0.0)//efaults.float(forKey: Save.frontShoulderProgress)
            var frontShoulderMax = defaults.float(forKey: Save.frontShoulderMax)
            var frontShoulderProgressForText = defaults.float(forKey: Save.frontShoulderProgressInt)
            frontShoulderProgressForText = frontShoulderProgressForText + frontShoulderTally
            defaults.set(frontShoulderProgressForText, forKey: Save.frontShoulderProgressInt)
            if(frontShoulderMax == 0.0){frontShoulderMax = 6}
            frontShoulderTally = (1.0 / frontShoulderMax) * frontShoulderTally
            defaults.set(frontShoulderProgress, forKey: Save.frontShoulderProgress)
            defaults.set(frontShoulderMax, forKey: Save.frontShoulderMax)
            defaults.removeObject(forKey: Save.frontShoulderTally)
            let frontShoulderDifference = frontShoulderMax - (frontShoulderProgressForText)
            defaults.set(frontShoulderDifference, forKey: Save.frontShoulderDifference)
            frontShoulderProgress = (1.0/frontShoulderMax) * frontShoulderProgressForText// + frontShoulderTally
            return [frontShoulderProgressForText, frontShoulderMax, frontShoulderProgress]
            
        case Save.lateralShoulderTitle:
            
            var lateralShoulderTally = defaults.float(forKey: Save.lateralShoulderTally)
            var lateralShoulderProgress = Float(0.0)//efaults.float(forKey: Save.lateralShoulderProgress)
            var lateralShoulderMax = defaults.float(forKey: Save.lateralShoulderMax)
            var lateralShoulderProgressForText = defaults.float(forKey: Save.lateralShoulderProgressInt)
            lateralShoulderProgressForText = lateralShoulderProgressForText + lateralShoulderTally
            defaults.set(lateralShoulderProgressForText, forKey: Save.lateralShoulderProgressInt)
            if(lateralShoulderMax == 0.0){lateralShoulderMax = 16}
            lateralShoulderTally = (1.0 / lateralShoulderMax) * lateralShoulderTally

            defaults.set(lateralShoulderMax, forKey: Save.lateralShoulderMax)
            defaults.removeObject(forKey: Save.lateralShoulderTally)
            let lateralShoulderDifference = lateralShoulderMax - (lateralShoulderProgressForText)
            defaults.set(lateralShoulderDifference, forKey: Save.lateralShoulderDifference)
            lateralShoulderProgress = (1.0/lateralShoulderMax) * lateralShoulderProgressForText// + lateralShoulderTally
            return [lateralShoulderProgressForText, lateralShoulderMax, lateralShoulderProgress]
            
        case Save.backShoulderTitle:
            
            var backShoulderTally = defaults.float(forKey: Save.backShoulderTally)
            var backShoulderProgress = Float(0.0)//efaults.float(forKey: Save.backShoulderProgress)
            var backShoulderMax = defaults.float(forKey: Save.backShoulderMax)
            var backShoulderProgressForText = defaults.float(forKey: Save.backShoulderProgressInt)
            backShoulderProgressForText = backShoulderProgressForText + backShoulderTally
            defaults.set(backShoulderProgressForText, forKey: Save.backShoulderProgressInt)
            if(backShoulderMax == 0.0){backShoulderMax = 16}
            backShoulderTally = (1.0 / backShoulderMax) * backShoulderTally
            
            defaults.set(backShoulderMax, forKey: Save.backShoulderMax)
            defaults.removeObject(forKey: Save.backShoulderTally)
            let backShoulderDifference = backShoulderMax - (backShoulderProgressForText)
            defaults.set(backShoulderDifference, forKey: Save.backShoulderDifference)
            backShoulderProgress = (1.0/backShoulderMax) * backShoulderProgressForText// + backShoulderTally
            return [backShoulderProgressForText, backShoulderMax, backShoulderProgress]
            
        case Save.rotatorCuffTitle:
            
            var rotatorCuffTally = defaults.float(forKey: Save.rotatorCuffTally)
            var rotatorCuffProgress = Float(0.0)//efaults.float(forKey: Save.rotatorCuffProgress)
            var rotatorCuffMax = defaults.float(forKey: Save.rotatorCuffMax)
            var rotatorCuffProgressForText = defaults.float(forKey: Save.rotatorCuffProgressInt)
            rotatorCuffProgressForText = rotatorCuffProgressForText + rotatorCuffTally
            defaults.set(rotatorCuffProgressForText, forKey: Save.rotatorCuffProgressInt)
            if(rotatorCuffMax == 0.0){rotatorCuffMax = 12}
            rotatorCuffTally = (1.0 / rotatorCuffMax) * rotatorCuffTally
            
            defaults.set(rotatorCuffMax, forKey: Save.rotatorCuffMax)
            defaults.removeObject(forKey: Save.rotatorCuffTally)
            let rotatorCuffDifference = rotatorCuffMax - (rotatorCuffProgressForText)
            defaults.set(rotatorCuffDifference, forKey: Save.rotatorCuffDifference)
            rotatorCuffProgress = (1.0/rotatorCuffMax) * rotatorCuffProgressForText// + rotatorCuffTally
            return [rotatorCuffProgressForText, rotatorCuffMax, rotatorCuffProgress]
            
        case Save.tricepsLateralShortTitle:
            
            var tricepsLateralShortTally = defaults.float(forKey: Save.tricepsLateralShortTally)
            var tricepsLateralShortProgress = Float(0.0)//efaults.float(forKey: Save.tricepsLateralShortProgress)
            var tricepsLateralShortMax = defaults.float(forKey: Save.tricepsLateralShortMax)
            var tricepsLateralShortProgressForText = defaults.float(forKey: Save.tricepsLateralShortProgressInt)
            tricepsLateralShortProgressForText = tricepsLateralShortProgressForText + tricepsLateralShortTally
            defaults.set(tricepsLateralShortProgressForText, forKey: Save.tricepsLateralShortProgressInt)
            if(tricepsLateralShortMax == 0.0){tricepsLateralShortMax = 5}
            tricepsLateralShortTally = (1.0 / tricepsLateralShortMax) * tricepsLateralShortTally
            
            defaults.set(tricepsLateralShortMax, forKey: Save.tricepsLateralShortMax)
            defaults.removeObject(forKey: Save.tricepsLateralShortTally)
            let tricepsLateralShortDifference = tricepsLateralShortMax - (tricepsLateralShortProgressForText)
            defaults.set(tricepsLateralShortDifference, forKey: Save.tricepsLateralShortDifference)
            tricepsLateralShortProgress = (1.0/tricepsLateralShortMax) * tricepsLateralShortProgressForText// + tricepsLateralShortTally
            return [tricepsLateralShortProgressForText, tricepsLateralShortMax, tricepsLateralShortProgress]
            
        case Save.tricepsLongTitle:
            
            var tricepsLongTally = defaults.float(forKey: Save.tricepsLongTally)
            var tricepsLongProgress = Float(0.0)//efaults.float(forKey: Save.tricepsLongProgress)
            var tricepsLongMax = defaults.float(forKey: Save.tricepsLongMax)
            var tricepsLongProgressForText = defaults.float(forKey: Save.tricepsLongProgressInt)
            tricepsLongProgressForText = tricepsLongProgressForText + tricepsLongTally
            defaults.set(tricepsLongProgressForText, forKey: Save.tricepsLongProgressInt)
            if(tricepsLongMax == 0.0){tricepsLongMax = 5}
            tricepsLongTally = (1.0 / tricepsLongMax) * tricepsLongTally
            defaults.set(tricepsLongMax, forKey: Save.tricepsLongMax)
            defaults.removeObject(forKey: Save.tricepsLongTally)
            let tricepsLongDifference = tricepsLongMax - (tricepsLongProgressForText)
            defaults.set(tricepsLongDifference, forKey: Save.tricepsLongDifference)
            tricepsLongProgress = (1.0/tricepsLongMax) * tricepsLongProgressForText// + tricepsLongTally
            return [tricepsLongProgressForText, tricepsLongMax, tricepsLongProgress]
            
        case Save.quadsTitle:
            
            var quadsTally = defaults.float(forKey: Save.quadsTally)
            var quadsProgress = Float(0.0)//efaults.float(forKey: Save.quadsProgress)
            var quadsMax = defaults.float(forKey: Save.quadsMax)
            var quadsProgressForText = defaults.float(forKey: Save.quadsProgressInt)
            quadsProgressForText = quadsProgressForText + quadsTally
            defaults.set(quadsProgressForText, forKey: Save.quadsProgressInt)
            if(quadsMax == 0.0){quadsMax = 12}
            quadsTally = (1.0 / quadsMax) * quadsTally
            defaults.set(quadsMax, forKey: Save.quadsMax)
            defaults.removeObject(forKey: Save.quadsTally)
            let quadsDifference = quadsMax - (quadsProgressForText)
            defaults.set(quadsDifference, forKey: Save.quadsDifference)
            quadsProgress = (1.0/quadsMax) * quadsProgressForText// + quadsTally
            return [quadsProgressForText, quadsMax, quadsProgress]
            
        case Save.upperAbsTitle:
            
            var upperAbsTally = defaults.float(forKey: Save.upperAbsTally)
            var upperAbsProgress = Float(0.0)//efaults.float(forKey: Save.upperAbsProgress)
            var upperAbsMax = defaults.float(forKey: Save.upperAbsMax)
            var upperAbsProgressForText = defaults.float(forKey: Save.upperAbsProgressInt)
            upperAbsProgressForText = upperAbsProgressForText + upperAbsTally
            defaults.set(upperAbsProgressForText, forKey: Save.upperAbsProgressInt)
            if(upperAbsMax == 0.0){upperAbsMax = 4}
            upperAbsTally = (1.0 / upperAbsMax) * upperAbsTally
            defaults.set(upperAbsMax, forKey: Save.upperAbsMax)
            defaults.removeObject(forKey: Save.upperAbsTally)
            let upperAbsDifference = upperAbsMax - (upperAbsProgressForText)
            defaults.set(upperAbsDifference, forKey: Save.upperAbsDifference)
            upperAbsProgress = (1.0/upperAbsMax) * upperAbsProgressForText// + upperAbsTally
            return [upperAbsProgressForText, upperAbsMax, upperAbsProgress]
            
        case Save.middleAbsTitle:
            
            var middleAbsTally = defaults.float(forKey: Save.middleAbsTally)
            var middleAbsProgress = Float(0.0)//efaults.float(forKey: Save.middleAbsProgress)
            var middleAbsMax = defaults.float(forKey: Save.middleAbsMax)
            var middleAbsProgressForText = defaults.float(forKey: Save.middleAbsProgressInt)
            middleAbsProgressForText = middleAbsProgressForText + middleAbsTally
            defaults.set(middleAbsProgressForText, forKey: Save.middleAbsProgressInt)
            if(middleAbsMax == 0.0){middleAbsMax = 4}
            middleAbsTally = (1.0 / middleAbsMax) * middleAbsTally

            defaults.set(middleAbsMax, forKey: Save.middleAbsMax)
            defaults.removeObject(forKey: Save.middleAbsTally)
            let middleAbsDifference = middleAbsMax - (middleAbsProgressForText)
            defaults.set(middleAbsDifference, forKey: Save.middleAbsDifference)
            middleAbsProgress = (1.0/middleAbsMax) * middleAbsProgressForText// + middleAbsTally
            return [middleAbsProgressForText, middleAbsMax, middleAbsProgress]
            
        case Save.lowerAbsTitle:
            
            var lowerAbsTally = defaults.float(forKey: Save.lowerAbsTally)
            var lowerAbsProgress = Float(0.0)//efaults.float(forKey: Save.lowerAbsProgress)
            var lowerAbsMax = defaults.float(forKey: Save.lowerAbsMax)
            var lowerAbsProgressForText = defaults.float(forKey: Save.lowerAbsProgressInt)
            lowerAbsProgressForText = lowerAbsProgressForText + lowerAbsTally
            defaults.set(lowerAbsProgressForText, forKey: Save.lowerAbsProgressInt)
            if(lowerAbsMax == 0.0){lowerAbsMax = 4}
            lowerAbsTally = (1.0 / lowerAbsMax) * lowerAbsTally
            defaults.set(lowerAbsMax, forKey: Save.lowerAbsMax)
            defaults.removeObject(forKey: Save.lowerAbsTally)
            let lowerAbsDifference = lowerAbsMax - (lowerAbsProgressForText)
            defaults.set(lowerAbsDifference, forKey: Save.lowerAbsDifference)
            lowerAbsProgress = (1.0/lowerAbsMax) * lowerAbsProgressForText// + lowerAbsTally
            return [lowerAbsProgressForText, lowerAbsMax, lowerAbsProgress]
            
        case Save.upperObliquesTitle:
            
            var upperObliquesTally = defaults.float(forKey: Save.upperObliquesTally)
            var upperObliquesProgress = Float(0.0)//efaults.float(forKey: Save.upperObliquesProgress)
            var upperObliquesMax = defaults.float(forKey: Save.upperObliquesMax)
            var upperObliquesProgressForText = defaults.float(forKey: Save.upperObliquesProgressInt)
            upperObliquesProgressForText = upperObliquesProgressForText + upperObliquesTally
            defaults.set(upperObliquesProgressForText, forKey: Save.upperObliquesProgressInt)
            if(upperObliquesMax == 0.0){upperObliquesMax = 4}
            upperObliquesTally = (1.0 / upperObliquesMax) * upperObliquesTally
            
            defaults.set(upperObliquesMax, forKey: Save.upperObliquesMax)
            defaults.removeObject(forKey: Save.upperObliquesTally)
            let upperObliquesDifference = upperObliquesMax - (upperObliquesProgressForText)
            defaults.set(upperObliquesDifference, forKey: Save.upperObliquesDifference)
            upperObliquesProgress = (1.0/upperObliquesMax) * upperObliquesProgressForText// + upperObliquesTally
            return [upperObliquesProgressForText, upperObliquesMax, upperObliquesProgress]
            
        case Save.middleObliquesTitle:
            
            var middleObliquesTally = defaults.float(forKey: Save.middleObliquesTally)
            var middleObliquesProgress = Float(0.0)//efaults.float(forKey: Save.middleObliquesProgress)
            var middleObliquesMax = defaults.float(forKey: Save.middleObliquesMax)
            var middleObliquesProgressForText = defaults.float(forKey: Save.middleObliquesProgressInt)
            middleObliquesProgressForText = middleObliquesProgressForText + middleObliquesTally
            defaults.set(middleObliquesProgressForText, forKey: Save.middleObliquesProgressInt)
            if(middleObliquesMax == 0.0){middleObliquesMax = 4}
            middleObliquesTally = (1.0 / middleObliquesMax) * middleObliquesTally
            
            defaults.set(middleObliquesMax, forKey: Save.middleObliquesMax)
            defaults.removeObject(forKey: Save.middleObliquesTally)
            let middleObliquesDifference = middleObliquesMax - (middleObliquesProgressForText)
            defaults.set(middleObliquesDifference, forKey: Save.middleObliquesDifference)
            middleObliquesProgress = (1.0/middleObliquesMax) * middleObliquesProgressForText// + middleObliquesTally
            return [middleObliquesProgressForText, middleObliquesMax, middleObliquesProgress]
            
        case Save.lowerObliquesTitle:
            
            var lowerObliquesTally = defaults.float(forKey: Save.lowerObliquesTally)
            var lowerObliquesProgress = Float(0.0)//efaults.float(forKey: Save.lowerObliquesProgress)
            var lowerObliquesMax = defaults.float(forKey: Save.lowerObliquesMax)
            var lowerObliquesProgressForText = defaults.float(forKey: Save.lowerObliquesProgressInt)
            lowerObliquesProgressForText = lowerObliquesProgressForText + lowerObliquesTally
            defaults.set(lowerObliquesProgressForText, forKey: Save.lowerObliquesProgressInt)
            if(lowerObliquesMax == 0.0){lowerObliquesMax = 4}
            lowerObliquesTally = (1.0 / lowerObliquesMax) * lowerObliquesTally
            
            defaults.set(lowerObliquesMax, forKey: Save.lowerObliquesMax)
            defaults.removeObject(forKey: Save.lowerObliquesTally)
            let lowerObliquesDifference = lowerObliquesMax - (lowerObliquesProgressForText)
            defaults.set(lowerObliquesDifference, forKey: Save.lowerObliquesDifference)
            lowerObliquesProgress = (1.0/lowerObliquesMax) * lowerObliquesProgressForText// + lowerObliquesTally
            return [lowerObliquesProgressForText, lowerObliquesMax, lowerObliquesProgress]
            
        case Save.serratusTitle:
            
            var serratusTally = defaults.float(forKey: Save.serratusTally)
            var serratusProgress = Float(0.0)//efaults.float(forKey: Save.serratusProgress)
            var serratusMax = defaults.float(forKey: Save.serratusMax)
            var serratusProgressForText = defaults.float(forKey: Save.serratusProgressInt)
            serratusProgressForText = serratusProgressForText + serratusTally
            defaults.set(serratusProgressForText, forKey: Save.serratusProgressInt)
            if(serratusMax == 0.0){serratusMax = 10}
            serratusTally = (1.0 / serratusMax) * serratusTally
            
            defaults.set(serratusMax, forKey: Save.serratusMax)
            defaults.removeObject(forKey: Save.serratusTally)
            let serratusDifference = serratusMax - (serratusProgressForText)
            defaults.set(serratusDifference, forKey: Save.serratusDifference)
            serratusProgress = (1.0/serratusMax) * serratusProgressForText// + serratusTally
            return [serratusProgressForText, serratusMax, serratusProgress]
            
        case Save.transverseAbTitle:
            
            var transverseAbTally = defaults.float(forKey: Save.transverseAbTally)
            var transverseAbProgress = Float(0.0)//efaults.float(forKey: Save.transverseAbProgress)
            var transverseAbMax = defaults.float(forKey: Save.transverseAbMax)
            var transverseAbProgressForText = defaults.float(forKey: Save.transverseAbProgressInt)
            transverseAbProgressForText = transverseAbProgressForText + transverseAbTally
            defaults.set(transverseAbProgressForText, forKey: Save.transverseAbProgressInt)
            if(transverseAbMax == 0.0){transverseAbMax = 10}
            transverseAbTally = (1.0 / transverseAbMax) * transverseAbTally
            
            defaults.set(transverseAbMax, forKey: Save.transverseAbMax)
            defaults.removeObject(forKey: Save.transverseAbTally)
            let transverseAbDifference = transverseAbMax - (transverseAbProgressForText)
            defaults.set(transverseAbDifference, forKey: Save.transverseAbDifference)
            transverseAbProgress = (1.0/transverseAbMax) * transverseAbProgressForText// + transverseAbTally
            return [transverseAbProgressForText, transverseAbMax, transverseAbProgress]
            
        case Save.gastrocnemiusTitle:
            
            var gastrocnemiusTally = defaults.float(forKey: Save.gastrocnemiusTally)
            var gastrocnemiusProgress = Float(0.0)//efaults.float(forKey: Save.gastrocnemiusProgress)
            var gastrocnemiusMax = defaults.float(forKey: Save.gastrocnemiusMax)
            var gastrocnemiusProgressForText = defaults.float(forKey: Save.gastrocnemiusProgressInt)
            gastrocnemiusProgressForText = gastrocnemiusProgressForText + gastrocnemiusTally
            defaults.set(gastrocnemiusProgressForText, forKey: Save.gastrocnemiusProgressInt)
            if(gastrocnemiusMax == 0.0){gastrocnemiusMax = 5}
            gastrocnemiusTally = (1.0 / gastrocnemiusMax) * gastrocnemiusTally
            
            defaults.set(gastrocnemiusMax, forKey: Save.gastrocnemiusMax)
            defaults.removeObject(forKey: Save.gastrocnemiusTally)
            let gastrocnemiusDifference = gastrocnemiusMax - (gastrocnemiusProgressForText)
            defaults.set(gastrocnemiusDifference, forKey: Save.gastrocnemiusDifference)
            gastrocnemiusProgress = (1.0/gastrocnemiusMax) * gastrocnemiusProgressForText// + gastrocnemiusTally
            return [gastrocnemiusProgressForText, gastrocnemiusMax, gastrocnemiusProgress]
            
        case Save.soleusTitle:
            
            var soleusTally = defaults.float(forKey: Save.soleusTally)
            var soleusProgress = Float(0.0)//efaults.float(forKey: Save.soleusProgress)
            var soleusMax = defaults.float(forKey: Save.soleusMax)
            var soleusProgressForText = defaults.float(forKey: Save.soleusProgressInt)
            soleusProgressForText = soleusProgressForText + soleusTally
            defaults.set(soleusProgressForText, forKey: Save.soleusProgressInt)
            if(soleusMax == 0.0){soleusMax = 5}
            soleusTally = (1.0 / soleusMax) * soleusTally
            
            defaults.set(soleusMax, forKey: Save.soleusMax)
            defaults.removeObject(forKey: Save.soleusTally)
            let soleusDifference = soleusMax - (soleusProgressForText)
            defaults.set(soleusDifference, forKey: Save.soleusDifference)
            soleusProgress = (1.0/soleusMax) * soleusProgressForText// + soleusTally
            return [soleusProgressForText, soleusMax, soleusProgress]
            
        case Save.anteriorTibialisTitle:
            
            var anteriorTibialisTally = defaults.float(forKey: Save.anteriorTibialisTally)
            var anteriorTibialisProgress = Float(0.0)//efaults.float(forKey: Save.anteriorTibialisProgress)
            var anteriorTibialisMax = defaults.float(forKey: Save.anteriorTibialisMax)
            var anteriorTibialisProgressForText = defaults.float(forKey: Save.anteriorTibialisProgressInt)
            anteriorTibialisProgressForText = anteriorTibialisProgressForText + anteriorTibialisTally
            defaults.set(anteriorTibialisProgressForText, forKey: Save.anteriorTibialisProgressInt)
            if(anteriorTibialisMax == 0.0){anteriorTibialisMax = 5}
            anteriorTibialisTally = (1.0 / anteriorTibialisMax) * anteriorTibialisTally
            
            defaults.set(anteriorTibialisMax, forKey: Save.anteriorTibialisMax)
            defaults.removeObject(forKey: Save.anteriorTibialisTally)
            let anteriorTibialisDifference = anteriorTibialisMax - (anteriorTibialisProgressForText)
            defaults.set(anteriorTibialisDifference, forKey: Save.anteriorTibialisDifference)
            anteriorTibialisProgress = (1.0/anteriorTibialisMax) * anteriorTibialisProgressForText// + anteriorTibialisTally
            return [anteriorTibialisProgressForText, anteriorTibialisMax, anteriorTibialisProgress]
            
        case Save.neckFlexionTitle:
            
            var neckFlexionTally = defaults.float(forKey: Save.neckFlexionTally)
            var neckFlexionProgress = Float(0.0)//efaults.float(forKey: Save.neckFlexionProgress)
            var neckFlexionMax = defaults.float(forKey: Save.neckFlexionMax)
            var neckFlexionProgressForText = defaults.float(forKey: Save.neckFlexionProgressInt)
            neckFlexionProgressForText = neckFlexionProgressForText + neckFlexionTally
            defaults.set(neckFlexionProgressForText, forKey: Save.neckFlexionProgressInt)
            if(neckFlexionMax == 0.0){neckFlexionMax = 4}
            neckFlexionTally = (1.0 / neckFlexionMax) * neckFlexionTally
            
            defaults.set(neckFlexionMax, forKey: Save.neckFlexionMax)
            defaults.removeObject(forKey: Save.neckFlexionTally)
            let neckFlexionDifference = neckFlexionMax - (neckFlexionProgressForText)
            defaults.set(neckFlexionDifference, forKey: Save.neckFlexionDifference)
            neckFlexionProgress = (1.0/neckFlexionMax) * neckFlexionProgressForText// + neckFlexionTally
            return [neckFlexionProgressForText, neckFlexionMax, neckFlexionProgress]
            
        case Save.neckExtensionTitle:
            
            var neckExtensionTally = defaults.float(forKey: Save.neckExtensionTally)
            var neckExtensionProgress = Float(0.0)//efaults.float(forKey: Save.neckExtensionProgress)
            var neckExtensionMax = defaults.float(forKey: Save.neckExtensionMax)
            var neckExtensionProgressForText = defaults.float(forKey: Save.neckExtensionProgressInt)
            neckExtensionProgressForText = neckExtensionProgressForText + neckExtensionTally
            defaults.set(neckExtensionProgressForText, forKey: Save.neckExtensionProgressInt)
            if(neckExtensionMax == 0.0){neckExtensionMax = 4}
            neckExtensionTally = (1.0 / neckExtensionMax) * neckExtensionTally
            
            defaults.set(neckExtensionMax, forKey: Save.neckExtensionMax)
            defaults.removeObject(forKey: Save.neckExtensionTally)
            let neckExtensionDifference = neckExtensionMax - (neckExtensionProgressForText)
            defaults.set(neckExtensionDifference, forKey: Save.neckExtensionDifference)
            neckExtensionProgress = (1.0/neckExtensionMax) * neckExtensionProgressForText// + neckExtensionTally
            return [neckExtensionProgressForText, neckExtensionMax, neckExtensionProgress]
            
        case Save.transverseNeckTitle:
            
            var transverseNeckTally = defaults.float(forKey: Save.transverseNeckTally)
            var transverseNeckProgress = Float(0.0)//efaults.float(forKey: Save.transverseNeckProgress)
            var transverseNeckMax = defaults.float(forKey: Save.transverseNeckMax)
            var transverseNeckProgressForText = defaults.float(forKey: Save.transverseNeckProgressInt)
            transverseNeckProgressForText = transverseNeckProgressForText + transverseNeckTally
            defaults.set(transverseNeckProgressForText, forKey: Save.transverseNeckProgressInt)
            if(transverseNeckMax == 0.0){transverseNeckMax = 4}
            transverseNeckTally = (1.0 / transverseNeckMax) * transverseNeckTally
            
            defaults.set(transverseNeckMax, forKey: Save.transverseNeckMax)
            defaults.removeObject(forKey: Save.transverseNeckTally)
            let transverseNeckDifference = transverseNeckMax - (transverseNeckProgressForText)
            defaults.set(transverseNeckDifference, forKey: Save.transverseNeckDifference)
            transverseNeckProgress = (1.0/transverseNeckMax) * transverseNeckProgressForText// + transverseNeckTally
            return [transverseNeckProgressForText, transverseNeckMax, transverseNeckProgress]
            
        case Save.lateralNeckTitle:
            
            var lateralNeckTally = defaults.float(forKey: Save.lateralNeckTally)
            var lateralNeckProgress = Float(0.0)//efaults.float(forKey: Save.lateralNeckProgress)
            var lateralNeckMax = defaults.float(forKey: Save.lateralNeckMax)
            var lateralNeckProgressForText = defaults.float(forKey: Save.lateralNeckProgressInt)
            lateralNeckProgressForText = lateralNeckProgressForText + lateralNeckTally
            defaults.set(lateralNeckProgressForText, forKey: Save.lateralNeckProgressInt)
            if(lateralNeckMax == 0.0){lateralNeckMax = 4}
            lateralNeckTally = (1.0 / lateralNeckMax) * lateralNeckTally
            
            defaults.set(lateralNeckMax, forKey: Save.lateralNeckMax)
            defaults.removeObject(forKey: Save.lateralNeckTally)
            let lateralNeckDifference = lateralNeckMax - (lateralNeckProgressForText)
            defaults.set(lateralNeckDifference, forKey: Save.lateralNeckDifference)
            lateralNeckProgress = (1.0/lateralNeckMax) * lateralNeckProgressForText// + lateralNeckTally
            return [lateralNeckProgressForText, lateralNeckMax, lateralNeckProgress]
            
        case Save.forearmExtensorsTitle:
            
            var forearmExtensorsTally = defaults.float(forKey: Save.forearmExtensorsTally)
            var forearmExtensorsProgress = Float(0.0)//efaults.float(forKey: Save.forearmExtensorsProgress)
            var forearmExtensorsMax = defaults.float(forKey: Save.forearmExtensorsMax)
            var forearmExtensorsProgressForText = defaults.float(forKey: Save.forearmExtensorsProgressInt)
            forearmExtensorsProgressForText = forearmExtensorsProgressForText + forearmExtensorsTally
            defaults.set(forearmExtensorsProgressForText, forKey: Save.forearmExtensorsProgressInt)
            if(forearmExtensorsMax == 0.0){forearmExtensorsMax = 10}
            forearmExtensorsTally = (1.0 / forearmExtensorsMax) * forearmExtensorsTally
            
            defaults.set(forearmExtensorsMax, forKey: Save.forearmExtensorsMax)
            defaults.removeObject(forKey: Save.forearmExtensorsTally)
            let forearmExtensorsDifference = forearmExtensorsMax - (forearmExtensorsProgressForText)
            defaults.set(forearmExtensorsDifference, forKey: Save.forearmExtensorsDifference)
            forearmExtensorsProgress = (1.0/forearmExtensorsMax) * forearmExtensorsProgressForText// + forearmExtensorsTally
            return [forearmExtensorsProgressForText, forearmExtensorsMax, forearmExtensorsProgress]
            
        case Save.ulnarForearmTitle:
            
            var ulnarForearmTally = defaults.float(forKey: Save.ulnarForearmTally)
            var ulnarForearmProgress = Float(0.0)//efaults.float(forKey: Save.ulnarForearmProgress)
            var ulnarForearmMax = defaults.float(forKey: Save.ulnarForearmMax)
            var ulnarForearmProgressForText = defaults.float(forKey: Save.ulnarForearmProgressInt)
            ulnarForearmProgressForText = ulnarForearmProgressForText + ulnarForearmTally
            defaults.set(ulnarForearmProgressForText, forKey: Save.ulnarForearmProgressInt)
            if(ulnarForearmMax == 0.0){ulnarForearmMax = 10}
            ulnarForearmTally = (1.0 / ulnarForearmMax) * ulnarForearmTally
            
            defaults.set(ulnarForearmMax, forKey: Save.ulnarForearmMax)
            defaults.removeObject(forKey: Save.ulnarForearmTally)
            let ulnarForearmDifference = ulnarForearmMax - (ulnarForearmProgressForText)
            defaults.set(ulnarForearmDifference, forKey: Save.ulnarForearmDifference)
            ulnarForearmProgress = (1.0/ulnarForearmMax) * ulnarForearmProgressForText// + ulnarForearmTally
            return [ulnarForearmProgressForText, ulnarForearmMax, ulnarForearmProgress]
            
        case Save.forearmFlexorsTitle:
            
            var forearmFlexorsTally = defaults.float(forKey: Save.forearmFlexorsTally)
            var forearmFlexorsProgress = Float(0.0)//efaults.float(forKey: Save.forearmFlexorsProgress)
            var forearmFlexorsMax = defaults.float(forKey: Save.forearmFlexorsMax)
            var forearmFlexorsProgressForText = defaults.float(forKey: Save.forearmFlexorsProgressInt)
            forearmFlexorsProgressForText = forearmFlexorsProgressForText + forearmFlexorsTally
            defaults.set(forearmFlexorsProgressForText, forKey: Save.forearmFlexorsProgressInt)
            if(forearmFlexorsMax == 0.0){forearmFlexorsMax = 5}
            forearmFlexorsTally = (1.0 / forearmFlexorsMax) * forearmFlexorsTally
            
            defaults.set(forearmFlexorsProgress, forKey: Save.forearmFlexorsProgress)
            defaults.set(forearmFlexorsMax, forKey: Save.forearmFlexorsMax)
            defaults.removeObject(forKey: Save.forearmFlexorsTally)
            let forearmFlexorsDifference = forearmFlexorsMax - (forearmFlexorsProgressForText)
            defaults.set(forearmFlexorsDifference, forKey: Save.forearmFlexorsDifference)
            forearmFlexorsProgress = (1.0/forearmFlexorsMax) * forearmFlexorsProgressForText// + forearmFlexorsTally
            return [forearmFlexorsProgressForText, forearmFlexorsMax, forearmFlexorsProgress]
            
        case Save.radialForearmTitle:
            
            var radialForearmTally = defaults.float(forKey: Save.radialForearmTally)
            var radialForearmProgress = Float(0.0)//efaults.float(forKey: Save.radialForearmProgress)
            var radialForearmMax = defaults.float(forKey: Save.radialForearmMax)
            var radialForearmProgressForText = defaults.float(forKey: Save.radialForearmProgressInt)
            radialForearmProgressForText = radialForearmProgressForText + radialForearmTally
            defaults.set(radialForearmProgressForText, forKey: Save.radialForearmProgressInt)
            if(radialForearmMax == 0.0){radialForearmMax = 6}
            radialForearmTally = (1.0 / radialForearmMax) * radialForearmTally
            
            defaults.set(radialForearmMax, forKey: Save.radialForearmMax)
            defaults.removeObject(forKey: Save.radialForearmTally)
            let radialForearmDifference = radialForearmMax - (radialForearmProgressForText)
            defaults.set(radialForearmDifference, forKey: Save.radialForearmDifference)
            radialForearmProgress = (1.0/radialForearmMax) * radialForearmProgressForText// + radialForearmTally
            return [radialForearmProgressForText, radialForearmMax, radialForearmProgress]
            
        case Save.spinalErectorsTitle:
            
            var spinalErectorsTally = defaults.float(forKey: Save.spinalErectorsTally)
            var spinalErectorsProgress = Float(0.0)//efaults.float(forKey: Save.spinalErectorsProgress)
            var spinalErectorsMax = defaults.float(forKey: Save.spinalErectorsMax)
            var spinalErectorsProgressForText = defaults.float(forKey: Save.spinalErectorsProgressInt)
            spinalErectorsProgressForText = spinalErectorsProgressForText + spinalErectorsTally
            defaults.set(spinalErectorsProgressForText, forKey: Save.spinalErectorsProgressInt)
            if(spinalErectorsMax == 0.0){spinalErectorsMax = 10}
            spinalErectorsTally = (1.0 / spinalErectorsMax) * spinalErectorsTally
            
            defaults.set(spinalErectorsMax, forKey: Save.spinalErectorsMax)
            defaults.removeObject(forKey: Save.spinalErectorsTally)
            let spinalErectorsDifference = spinalErectorsMax - (spinalErectorsProgressForText)
            defaults.set(spinalErectorsDifference, forKey: Save.spinalErectorsDifference)
            spinalErectorsProgress = (1.0/spinalErectorsMax) * spinalErectorsProgressForText// + spinalErectorsTally
            return [spinalErectorsProgressForText, spinalErectorsMax, spinalErectorsProgress]
            
        case Save.upperTrapsTitle:
            
            var upperTrapsTally = defaults.float(forKey: Save.upperTrapsTally)
            var upperTrapsProgress = Float(0.0)//efaults.float(forKey: Save.upperTrapsProgress)
            var upperTrapsMax = defaults.float(forKey: Save.upperTrapsMax)
            var upperTrapsProgressForText = defaults.float(forKey: Save.upperTrapsProgressInt)
            upperTrapsProgressForText = upperTrapsProgressForText + upperTrapsTally
            defaults.set(upperTrapsProgressForText, forKey: Save.upperTrapsProgressInt)
            if(upperTrapsMax == 0.0){upperTrapsMax = 10}
            upperTrapsTally = (1.0 / upperTrapsMax) * upperTrapsTally
            
            defaults.set(upperTrapsMax, forKey: Save.upperTrapsMax)
            defaults.removeObject(forKey: Save.upperTrapsTally)
            let upperTrapsDifference = upperTrapsMax - (upperTrapsProgressForText)
            defaults.set(upperTrapsDifference, forKey: Save.upperTrapsDifference)
            upperTrapsProgress = (1.0/upperTrapsMax) * upperTrapsProgressForText// + upperTrapsTally
            return [upperTrapsProgressForText, upperTrapsMax, upperTrapsProgress]
            
        case Save.lowerTrapsTitle:
            
            var lowerTrapsTally = defaults.float(forKey: Save.lowerTrapsTally)
            var lowerTrapsProgress = Float(0.0)//efaults.float(forKey: Save.lowerTrapsProgress)
            var lowerTrapsMax = defaults.float(forKey: Save.lowerTrapsMax)
            var lowerTrapsProgressForText = defaults.float(forKey: Save.lowerTrapsProgressInt)
            lowerTrapsProgressForText = lowerTrapsProgressForText + lowerTrapsTally
            defaults.set(lowerTrapsProgressForText, forKey: Save.lowerTrapsProgressInt)
            if(lowerTrapsMax == 0.0){lowerTrapsMax = 6}
            lowerTrapsTally = (1.0 / lowerTrapsMax) * lowerTrapsTally
            
            defaults.set(lowerTrapsMax, forKey: Save.lowerTrapsMax)
            defaults.removeObject(forKey: Save.lowerTrapsTally)
            let lowerTrapsDifference = lowerTrapsMax - (lowerTrapsProgressForText)
            defaults.set(lowerTrapsDifference, forKey: Save.lowerTrapsDifference)
            lowerTrapsProgress = (1.0/lowerTrapsMax) * lowerTrapsProgressForText// + lowerTrapsTally
            return [lowerTrapsProgressForText, lowerTrapsMax, lowerTrapsProgress]
            
        case Save.brachialisTitle:
            
            var brachialisTally = defaults.float(forKey: Save.brachialisTally)
            var brachialisProgress = Float(0.0)//efaults.float(forKey: Save.brachialisProgress)
            var brachialisMax = defaults.float(forKey: Save.brachialisMax)
            var brachialisProgressForText = defaults.float(forKey: Save.brachialisProgressInt)
            brachialisProgressForText = brachialisProgressForText + brachialisTally
            defaults.set(brachialisProgressForText, forKey: Save.brachialisProgressInt)
            if(brachialisMax == 0.0){brachialisMax = 4}
            brachialisTally = (1.0 / brachialisMax) * brachialisTally
           
            defaults.set(brachialisMax, forKey: Save.brachialisMax)
            defaults.removeObject(forKey: Save.brachialisTally)
            brachialisProgress = (1.0/brachialisMax) * brachialisProgressForText// + brachialisTally
            return [brachialisProgressForText, brachialisMax, brachialisProgress]
            
        default:
            return [0.0,0.0,0.0]
        }
    }
    
    func getBarProgress(muscle: String) -> Float? {
        var progress: Float?
        switch muscle {
        case Save.upperChestTitle:
            progress =   UserDefaults.standard.float(forKey: Save.upperChestProgress)
        case Save.middleChestTitle:
            progress =   UserDefaults.standard.float(forKey: Save.middleChestProgress)
        case Save.lowerChestTitle:
            progress =   UserDefaults.standard.float(forKey: Save.lowerChestProgress)
        case Save.bicepsLongHeadTitle:
            progress =   UserDefaults.standard.float(forKey: Save.bicepsLongHeadProgress)
        case Save.bicepsShortHeadTitle:
            progress =   UserDefaults.standard.float(forKey: Save.bicepsShortHeadProgress)
        case Save.latsRowingTitle:
            progress =   UserDefaults.standard.float(forKey: Save.latsRowingProgress)
        case Save.latsPushdownTitle:
            progress =   UserDefaults.standard.float(forKey: Save.latsPushdownProgress)
        case Save.latsPullInTitle:
            progress =   UserDefaults.standard.float(forKey: Save.latsPullInProgress)
        case Save.glutesTitle:
            progress =   UserDefaults.standard.float(forKey: Save.glutesProgress)
        case Save.gluteMediusTitle:
            progress =   UserDefaults.standard.float(forKey: Save.gluteMediusProgress)
        case Save.adductorsTitle:
            progress =   UserDefaults.standard.float(forKey: Save.adductorsProgress)
        case Save.hamstringCurlTitle:
            progress =   UserDefaults.standard.float(forKey: Save.hamstringCurlProgress)
        case Save.hamstringHingeTitle:
            progress =   UserDefaults.standard.float(forKey: Save.hamstringHingeProgress)
        case Save.frontShoulderTitle:
            progress =   UserDefaults.standard.float(forKey: Save.frontShoulderProgress)
        case Save.lateralShoulderTitle:
            progress =   UserDefaults.standard.float(forKey: Save.lateralShoulderProgress)
        case Save.backShoulderTitle:
            progress =   UserDefaults.standard.float(forKey: Save.backShoulderProgress)
        case Save.rotatorCuffTitle:
            progress =   UserDefaults.standard.float(forKey: Save.rotatorCuffProgress)
        case Save.tricepsLateralShortTitle:
            progress =   UserDefaults.standard.float(forKey: Save.tricepsLateralShortProgress)
        case Save.tricepsLongTitle:
            progress =   UserDefaults.standard.float(forKey: Save.tricepsLongProgress)
        case Save.quadsTitle:
            progress =   UserDefaults.standard.float(forKey: Save.quadsProgress)
        case Save.upperAbsTitle:
            progress =   UserDefaults.standard.float(forKey: Save.upperAbsProgress)
        case Save.middleAbsTitle:
            progress =   UserDefaults.standard.float(forKey: Save.middleAbsProgress)
        case Save.lowerAbsTitle:
            progress =   UserDefaults.standard.float(forKey: Save.lowerAbsProgress)
        case Save.upperObliquesTitle:
            progress =   UserDefaults.standard.float(forKey: Save.upperObliquesProgress)
        case Save.middleObliquesTitle:
            progress =   UserDefaults.standard.float(forKey: Save.middleObliquesProgress)
        case Save.lowerObliquesTitle:
            progress =   UserDefaults.standard.float(forKey: Save.lowerObliquesProgress)
        case Save.serratusTitle:
            progress =   UserDefaults.standard.float(forKey: Save.serratusProgress)
        case Save.transverseAbTitle:
            progress =   UserDefaults.standard.float(forKey: Save.transverseAbProgress)
        case Save.gastrocnemiusTitle:
            progress =   UserDefaults.standard.float(forKey: Save.gastrocnemiusProgress)
        case Save.soleusTitle:
            progress =   UserDefaults.standard.float(forKey: Save.soleusProgress)
        case Save.anteriorTibialisTitle:
            progress =   UserDefaults.standard.float(forKey: Save.anteriorTibialisProgress)
        case Save.neckFlexionTitle:
            progress =   UserDefaults.standard.float(forKey: Save.neckFlexionProgress)
        case Save.neckExtensionTitle:
            progress =   UserDefaults.standard.float(forKey: Save.neckExtensionProgress)
        case Save.transverseNeckTitle:
            progress =   UserDefaults.standard.float(forKey: Save.transverseNeckProgress)
        case Save.lateralNeckTitle:
            progress =   UserDefaults.standard.float(forKey: Save.lateralNeckProgress)
        case Save.forearmExtensorsTitle:
            progress =   UserDefaults.standard.float(forKey: Save.forearmExtensorsProgress)
        case Save.ulnarForearmTitle:
            progress =   UserDefaults.standard.float(forKey: Save.ulnarForearmProgress)
        case Save.forearmFlexorsTitle:
            progress =   UserDefaults.standard.float(forKey: Save.forearmFlexorsProgress)
        case Save.radialForearmTitle:
            progress =   UserDefaults.standard.float(forKey: Save.radialForearmProgress)
        case Save.spinalErectorsTitle:
            progress =   UserDefaults.standard.float(forKey: Save.spinalErectorsProgress)
        case Save.upperTrapsTitle:
            progress =   UserDefaults.standard.float(forKey: Save.upperTrapsProgress)
        case Save.lowerTrapsTitle:
            progress =   UserDefaults.standard.float(forKey: Save.lowerTrapsProgress)
        case Save.brachialisTitle:
            progress =   UserDefaults.standard.float(forKey: Save.brachialisProgress)
        default:
            print("Weekly Volume not returned for \(muscle)")
            
        }
        return progress ?? -1.0
    }
    
    func updateData(muscle: String) {
        switch muscle {
        case Save.upperChestTitle:
            
            var upperChestTally = defaults.float(forKey: Save.upperChestTally)
            var upperChestProgress = Float(0.0)// = defaults.float(forKey: Save.upperChestProgress)
            var upperChestMax = defaults.float(forKey: Save.upperChestMax)
            var upperChestProgressForText = defaults.float(forKey: Save.upperChestProgressInt)
            upperChestProgressForText = upperChestProgressForText + upperChestTally
            defaults.set(upperChestProgressForText, forKey: Save.upperChestProgressInt)
            if(upperChestMax == 0.0){upperChestMax = 4}
            upperChestTally = (1.0 / upperChestMax) * upperChestTally
            
            defaults.set(upperChestMax, forKey: Save.upperChestMax)
            defaults.removeObject(forKey: Save.upperChestTally)
            let upperChestDifference = upperChestMax - (upperChestProgressForText )
            defaults.set(upperChestDifference, forKey: Save.upperChestDifference)
            
            //return [upperChestProgressForText, upperChestMax, upperChestProgress]
            
            
            upperChestProgress = (1.0/upperChestMax) * upperChestProgressForText// + upperChestTally
        
        //defaults.set(upperChestProgress, forKey: Save.upperChestProgress)
        case Save.middleChestTitle:
            
            var middleChestTally = defaults.float(forKey: Save.middleChestTally)
            var middleChestProgress = Float(0.0)//efaults.float(forKey: Save.middleChestProgress)
            var middleChestMax = defaults.float(forKey: Save.middleChestMax)
            var middleChestProgressForText = defaults.float(forKey: Save.middleChestProgressInt)
            middleChestProgressForText = middleChestProgressForText + middleChestTally
            defaults.set(middleChestProgressForText, forKey: Save.middleChestProgressInt)
            if(middleChestMax == 0.0){middleChestMax = 4}
            middleChestTally = (1.0 / middleChestMax) * middleChestTally
            defaults.set(middleChestMax, forKey: Save.middleChestMax)
            defaults.removeObject(forKey: Save.middleChestTally)
            let middleChestDifference = middleChestMax - (middleChestProgressForText )//POTENTIAL BUG  MATH IS OFF HERE
            defaults.set(middleChestDifference, forKey: Save.middleChestDifference)
            middleChestProgress = (1.0/middleChestMax) * middleChestProgressForText// + middleChestTally
           
        case Save.lowerChestTitle:
            
            var lowerChestTally = defaults.float(forKey: Save.lowerChestTally)
            var lowerChestProgress = Float(0.0)//efaults.float(forKey: Save.lowerChestProgress)
            var lowerChestMax = defaults.float(forKey: Save.lowerChestMax)
            var lowerChestProgressForText = defaults.float(forKey: Save.lowerChestProgressInt)
            lowerChestProgressForText = lowerChestProgressForText + lowerChestTally
            defaults.set(lowerChestProgressForText, forKey: Save.lowerChestProgressInt)
            if(lowerChestMax == 0.0){lowerChestMax = 4}
            lowerChestTally = (1.0 / lowerChestMax) * lowerChestTally
            defaults.set(lowerChestMax, forKey: Save.lowerChestMax)
            defaults.removeObject(forKey: Save.lowerChestTally)
            let lowerChestDifference = lowerChestMax - (lowerChestProgressForText )
            defaults.set(lowerChestDifference, forKey: Save.lowerChestDifference)
            lowerChestProgress = (1.0/lowerChestMax) * lowerChestProgressForText// + lowerChestTally
            
        case Save.bicepsLongHeadTitle:
            
            var bicepsLongHeadTally = defaults.float(forKey: Save.bicepsLongHeadTally)
            var bicepsLongHeadProgress = Float(0.0)//efaults.float(forKey: Save.bicepsLongHeadProgress)
            var bicepsLongHeadMax = defaults.float(forKey: Save.bicepsLongHeadMax)
            var bicepsLongHeadProgressForText = defaults.float(forKey: Save.bicepsLongHeadProgressInt)
            bicepsLongHeadProgressForText = bicepsLongHeadProgressForText + bicepsLongHeadTally
            defaults.set(bicepsLongHeadProgressForText, forKey: Save.bicepsLongHeadProgressInt)
            if(bicepsLongHeadMax == 0.0){bicepsLongHeadMax = 4}
            bicepsLongHeadTally = (1.0 / bicepsLongHeadMax) * bicepsLongHeadTally
            defaults.set(bicepsLongHeadMax, forKey: Save.bicepsLongHeadMax)
            defaults.removeObject(forKey: Save.bicepsLongHeadTally)
            var bicepsLongHeadDifference = bicepsLongHeadMax - (bicepsLongHeadProgressForText)
            defaults.set(bicepsLongHeadDifference, forKey: Save.bicepsLongHeadDifference)
            bicepsLongHeadProgress = (1.0/bicepsLongHeadMax) * bicepsLongHeadProgressForText// + bicepsLongHeadTally
           
        case Save.bicepsShortHeadTitle:
            
            var bicepsShortHeadTally = defaults.float(forKey: Save.bicepsShortHeadTally)
            var bicepsShortHeadProgress = Float(0.0)//efaults.float(forKey: Save.bicepsShortHeadProgress)
            var bicepsShortHeadMax = defaults.float(forKey: Save.bicepsShortHeadMax)
            var bicepsShortHeadProgressForText = defaults.float(forKey: Save.bicepsShortHeadProgressInt)
            bicepsShortHeadProgressForText = bicepsShortHeadProgressForText + bicepsShortHeadTally
            defaults.set(bicepsShortHeadProgressForText, forKey: Save.bicepsShortHeadProgressInt)
            if(bicepsShortHeadMax == 0.0){bicepsShortHeadMax = 4}
            bicepsShortHeadTally = (1.0 / bicepsShortHeadMax) * bicepsShortHeadTally
            defaults.set(bicepsShortHeadMax, forKey: Save.bicepsShortHeadMax)
            defaults.removeObject(forKey: Save.bicepsShortHeadTally)
            let bicepsShortHeadDifference = bicepsShortHeadMax - (bicepsShortHeadProgressForText )
            defaults.set(bicepsShortHeadDifference, forKey: Save.bicepsShortHeadDifference)
            bicepsShortHeadProgress = (1.0/bicepsShortHeadMax) * bicepsShortHeadProgressForText// + bicepsShortHeadTally
           
        case Save.latsRowingTitle:
            
            var latsRowingTally = defaults.float(forKey: Save.latsRowingTally)
            var latsRowingProgress = Float(0.0)//efaults.float(forKey: Save.latsRowingProgress)
            var latsRowingMax = defaults.float(forKey: Save.latsRowingMax)
            var latsRowingProgressForText = defaults.float(forKey: Save.latsRowingProgressInt)
            latsRowingProgressForText = latsRowingProgressForText + latsRowingTally
            defaults.set(latsRowingProgressForText, forKey: Save.latsRowingProgressInt)
            if(latsRowingMax == 0.0){latsRowingMax = 4}
            latsRowingTally = (1.0 / latsRowingMax) * latsRowingTally
            defaults.set(latsRowingMax, forKey: Save.latsRowingMax)
            defaults.removeObject(forKey: Save.latsRowingTally)
            let latsRowingDifference = latsRowingMax - (latsRowingProgressForText )
            defaults.set(latsRowingDifference, forKey: Save.latsRowingDifference)
            latsRowingProgress = (1.0/latsRowingMax) * latsRowingProgressForText// + latsRowingTally
            
        case Save.latsPushdownTitle:
            
            var latsPushdownTally = defaults.float(forKey: Save.latsPushdownTally)
            var latsPushdownProgress = Float(0.0)//efaults.float(forKey: Save.latsPushdownProgress)
            var latsPushdownMax = defaults.float(forKey: Save.latsPushdownMax)
            var latsPushdownProgressForText = defaults.float(forKey: Save.latsPushdownProgressInt)
            latsPushdownProgressForText = latsPushdownProgressForText + latsPushdownTally
            defaults.set(latsPushdownProgressForText, forKey: Save.latsPushdownProgressInt)
            if(latsPushdownMax == 0.0){latsPushdownMax = 4}
            latsPushdownTally = (1.0 / latsPushdownMax) * latsPushdownTally
            defaults.set(latsPushdownMax, forKey: Save.latsPushdownMax)
            defaults.removeObject(forKey: Save.latsPushdownTally)
            let latsPushdownDifference = latsPushdownMax - (latsPushdownProgressForText )
            defaults.set(latsPushdownDifference, forKey: Save.latsPushdownDifference)
            latsPushdownProgress = (1.0/latsPushdownMax) * latsPushdownProgressForText// + latsPushdownTally
            
        case Save.latsPullInTitle:
            
            var latsPullInTally = defaults.float(forKey: Save.latsPullInTally)
            var latsPullInProgress = Float(0.0)//efaults.float(forKey: Save.latsPullInProgress)
            var latsPullInMax = defaults.float(forKey: Save.latsPullInMax)
            var latsPullInProgressForText = defaults.float(forKey: Save.latsPullInProgressInt)
            latsPullInProgressForText = latsPullInProgressForText + latsPullInTally
            defaults.set(latsPullInProgressForText, forKey: Save.latsPullInProgressInt)
            if(latsPullInMax == 0.0){latsPullInMax = 4}
            latsPullInTally = (1.0 / latsPullInMax) * latsPullInTally
            defaults.set(latsPullInMax, forKey: Save.latsPullInMax)
            defaults.removeObject(forKey: Save.latsPullInTally)
            let latsPullInDifference = latsPullInMax - (latsPullInProgressForText)
            defaults.set(latsPullInDifference, forKey: Save.latsPullInDifference)
            latsPullInProgress = (1.0/latsPullInMax) * latsPullInProgressForText// + latsPullInTally
            
        case Save.glutesTitle:
            
            var glutesTally = defaults.float(forKey: Save.glutesTally)
            var glutesProgress = Float(0.0)//efaults.float(forKey: Save.glutesProgress)
            var glutesMax = defaults.float(forKey: Save.glutesMax)
            var glutesProgressForText = defaults.float(forKey: Save.glutesProgressInt)
            glutesProgressForText = glutesProgressForText + glutesTally
            defaults.set(glutesProgressForText, forKey: Save.glutesProgressInt)
            if(glutesMax == 0.0){glutesMax = 4}
            glutesTally = (1.0 / glutesMax) * glutesTally
            defaults.set(glutesMax, forKey: Save.glutesMax)
            defaults.removeObject(forKey: Save.glutesTally)
            let glutesDifference = glutesMax - (glutesProgressForText)
            defaults.set(glutesDifference, forKey: Save.glutesDifference)
            glutesProgress = (1.0/glutesMax) * glutesProgressForText// + glutesTally
          
        case Save.gluteMediusTitle:
            
            var gluteMediusTally = defaults.float(forKey: Save.gluteMediusTally)
            var gluteMediusProgress = Float(0.0)//efaults.float(forKey: Save.gluteMediusProgress)
            var gluteMediusMax = defaults.float(forKey: Save.gluteMediusMax)
            var gluteMediusProgressForText = defaults.float(forKey: Save.gluteMediusProgressInt)
            gluteMediusProgressForText = gluteMediusProgressForText + gluteMediusTally
            defaults.set(gluteMediusProgressForText, forKey: Save.gluteMediusProgressInt)
            if(gluteMediusMax == 0.0){gluteMediusMax = 12}
            gluteMediusTally = (1.0 / gluteMediusMax) * gluteMediusTally
            defaults.set(gluteMediusMax, forKey: Save.gluteMediusMax)
            defaults.removeObject(forKey: Save.gluteMediusTally)
            let gluteMediusDifference = gluteMediusMax - (gluteMediusProgressForText)
            defaults.set(gluteMediusDifference, forKey: Save.gluteMediusDifference)
            gluteMediusProgress = (1.0/gluteMediusMax) * gluteMediusProgressForText// + gluteMediusTally
         
        case Save.adductorsTitle:
            
            //Adductors
            var adductorsTally = defaults.float(forKey: Save.adductorsTally)
            var adductorsProgress = Float(0.0)//efaults.float(forKey: Save.adductorsProgress)
            var adductorsMax = defaults.float(forKey: Save.adductorsMax)
            var adductorsProgressForText = defaults.float(forKey: Save.adductorsProgressInt)
            adductorsProgressForText = adductorsProgressForText + adductorsTally
            defaults.set(adductorsProgressForText, forKey: Save.adductorsProgressInt)
            if(adductorsMax == 0.0){adductorsMax = 0}
            adductorsTally = (1.0 / adductorsMax) * adductorsTally
            
            defaults.set(adductorsMax, forKey: Save.adductorsMax)
            defaults.removeObject(forKey: Save.adductorsTally)
            let adductorsDifference = adductorsMax - (adductorsProgressForText)
            defaults.set(adductorsDifference, forKey: Save.adductorsDifference)
            adductorsProgress = (1.0/adductorsMax) * adductorsProgressForText// + adductorsTally
          
        case Save.hamstringCurlTitle:
            
            var hamstringCurlTally = defaults.float(forKey: Save.hamstringCurlTally)
            var hamstringCurlProgress = Float(0.0)//efaults.float(forKey: Save.hamstringCurlProgress)
            var hamstringCurlMax = defaults.float(forKey: Save.hamstringCurlMax)
            var hamstringCurlProgressForText = defaults.float(forKey: Save.hamstringCurlProgressInt)
            hamstringCurlProgressForText = hamstringCurlProgressForText + hamstringCurlTally
            defaults.set(hamstringCurlProgressForText, forKey: Save.hamstringCurlProgressInt)
            if(hamstringCurlMax == 0.0){hamstringCurlMax = 5}
            hamstringCurlTally = (1.0 / hamstringCurlMax) * hamstringCurlTally
            
            defaults.set(hamstringCurlMax, forKey: Save.hamstringCurlMax)
            defaults.removeObject(forKey: Save.hamstringCurlTally)
            let hamstringCurlDifference = hamstringCurlMax - (hamstringCurlProgressForText)
            defaults.set(hamstringCurlDifference, forKey: Save.hamstringCurlDifference)
            hamstringCurlProgress = (1.0/hamstringCurlMax) * hamstringCurlProgressForText// + hamstringCurlTally
           
        case Save.hamstringHingeTitle:
            
            var hamstringHingeTally = defaults.float(forKey: Save.hamstringHingeTally)
            var hamstringHingeProgress = Float(0.0)//efaults.float(forKey: Save.hamstringHingeProgress)
            var hamstringHingeMax = defaults.float(forKey: Save.hamstringHingeMax)
            var hamstringHingeProgressForText = defaults.float(forKey: Save.hamstringHingeProgressInt)
            hamstringHingeProgressForText = hamstringHingeProgressForText + hamstringHingeTally
            defaults.set(hamstringHingeProgressForText, forKey: Save.hamstringHingeProgressInt)
            if(hamstringHingeMax == 0.0){hamstringHingeMax = 5}
            hamstringHingeTally = (1.0 / hamstringHingeMax) * hamstringHingeTally
            
            defaults.set(hamstringHingeMax, forKey: Save.hamstringHingeMax)
            defaults.removeObject(forKey: Save.hamstringHingeTally)
            let hamstringHingeDifference = hamstringHingeMax - (hamstringHingeProgressForText)
            defaults.set(hamstringHingeDifference, forKey: Save.hamstringHingeDifference)
            hamstringHingeProgress = (1.0/hamstringHingeMax) * hamstringHingeProgressForText// + hamstringHingeTally

        case Save.frontShoulderTitle:
            
            var frontShoulderTally = defaults.float(forKey: Save.frontShoulderTally)
            var frontShoulderProgress = Float(0.0)//efaults.float(forKey: Save.frontShoulderProgress)
            var frontShoulderMax = defaults.float(forKey: Save.frontShoulderMax)
            var frontShoulderProgressForText = defaults.float(forKey: Save.frontShoulderProgressInt)
            frontShoulderProgressForText = frontShoulderProgressForText + frontShoulderTally
            defaults.set(frontShoulderProgressForText, forKey: Save.frontShoulderProgressInt)
            if(frontShoulderMax == 0.0){frontShoulderMax = 16}
            frontShoulderTally = (1.0 / frontShoulderMax) * frontShoulderTally
            defaults.set(frontShoulderProgress, forKey: Save.frontShoulderProgress)
            defaults.set(frontShoulderMax, forKey: Save.frontShoulderMax)
            defaults.removeObject(forKey: Save.frontShoulderTally)
            let frontShoulderDifference = frontShoulderMax - (frontShoulderProgressForText)
            defaults.set(frontShoulderDifference, forKey: Save.frontShoulderDifference)
            frontShoulderProgress = (1.0/frontShoulderMax) * frontShoulderProgressForText// + frontShoulderTally
            
        case Save.lateralShoulderTitle:
            
            var lateralShoulderTally = defaults.float(forKey: Save.lateralShoulderTally)
            var lateralShoulderProgress = Float(0.0)//efaults.float(forKey: Save.lateralShoulderProgress)
            var lateralShoulderMax = defaults.float(forKey: Save.lateralShoulderMax)
            var lateralShoulderProgressForText = defaults.float(forKey: Save.lateralShoulderProgressInt)
            lateralShoulderProgressForText = lateralShoulderProgressForText + lateralShoulderTally
            defaults.set(lateralShoulderProgressForText, forKey: Save.lateralShoulderProgressInt)
            if(lateralShoulderMax == 0.0){lateralShoulderMax = 16}
            lateralShoulderTally = (1.0 / lateralShoulderMax) * lateralShoulderTally
            
            defaults.set(lateralShoulderMax, forKey: Save.lateralShoulderMax)
            defaults.removeObject(forKey: Save.lateralShoulderTally)
            let lateralShoulderDifference = lateralShoulderMax - (lateralShoulderProgressForText)
            defaults.set(lateralShoulderDifference, forKey: Save.lateralShoulderDifference)
            lateralShoulderProgress = (1.0/lateralShoulderMax) * lateralShoulderProgressForText// + lateralShoulderTally
            
        case Save.backShoulderTitle:
            
            var backShoulderTally = defaults.float(forKey: Save.backShoulderTally)
            var backShoulderProgress = Float(0.0)//efaults.float(forKey: Save.backShoulderProgress)
            var backShoulderMax = defaults.float(forKey: Save.backShoulderMax)
            var backShoulderProgressForText = defaults.float(forKey: Save.backShoulderProgressInt)
            backShoulderProgressForText = backShoulderProgressForText + backShoulderTally
            defaults.set(backShoulderProgressForText, forKey: Save.backShoulderProgressInt)
            if(backShoulderMax == 0.0){backShoulderMax = 16}
            backShoulderTally = (1.0 / backShoulderMax) * backShoulderTally
            
            defaults.set(backShoulderMax, forKey: Save.backShoulderMax)
            defaults.removeObject(forKey: Save.backShoulderTally)
            let backShoulderDifference = backShoulderMax - (backShoulderProgressForText)
            defaults.set(backShoulderDifference, forKey: Save.backShoulderDifference)
            backShoulderProgress = (1.0/backShoulderMax) * backShoulderProgressForText// + backShoulderTally
          
        case Save.rotatorCuffTitle:
            
            var rotatorCuffTally = defaults.float(forKey: Save.rotatorCuffTally)
            var rotatorCuffProgress = Float(0.0)//efaults.float(forKey: Save.rotatorCuffProgress)
            var rotatorCuffMax = defaults.float(forKey: Save.rotatorCuffMax)
            var rotatorCuffProgressForText = defaults.float(forKey: Save.rotatorCuffProgressInt)
            rotatorCuffProgressForText = rotatorCuffProgressForText + rotatorCuffTally
            defaults.set(rotatorCuffProgressForText, forKey: Save.rotatorCuffProgressInt)
            if(rotatorCuffMax == 0.0){rotatorCuffMax = 12}
            rotatorCuffTally = (1.0 / rotatorCuffMax) * rotatorCuffTally
            
            defaults.set(rotatorCuffMax, forKey: Save.rotatorCuffMax)
            defaults.removeObject(forKey: Save.rotatorCuffTally)
            let rotatorCuffDifference = rotatorCuffMax - (rotatorCuffProgressForText)
            defaults.set(rotatorCuffDifference, forKey: Save.rotatorCuffDifference)
            rotatorCuffProgress = (1.0/rotatorCuffMax) * rotatorCuffProgressForText// + rotatorCuffTally
        
        case Save.tricepsLateralShortTitle:
            
            var tricepsLateralShortTally = defaults.float(forKey: Save.tricepsLateralShortTally)
            var tricepsLateralShortProgress = Float(0.0)//efaults.float(forKey: Save.tricepsLateralShortProgress)
            var tricepsLateralShortMax = defaults.float(forKey: Save.tricepsLateralShortMax)
            var tricepsLateralShortProgressForText = defaults.float(forKey: Save.tricepsLateralShortProgressInt)
            tricepsLateralShortProgressForText = tricepsLateralShortProgressForText + tricepsLateralShortTally
            defaults.set(tricepsLateralShortProgressForText, forKey: Save.tricepsLateralShortProgressInt)
            if(tricepsLateralShortMax == 0.0){tricepsLateralShortMax = 5}
            tricepsLateralShortTally = (1.0 / tricepsLateralShortMax) * tricepsLateralShortTally
            
            defaults.set(tricepsLateralShortMax, forKey: Save.tricepsLateralShortMax)
            defaults.removeObject(forKey: Save.tricepsLateralShortTally)
            let tricepsLateralShortDifference = tricepsLateralShortMax - (tricepsLateralShortProgressForText)
            defaults.set(tricepsLateralShortDifference, forKey: Save.tricepsLateralShortDifference)
            tricepsLateralShortProgress = (1.0/tricepsLateralShortMax) * tricepsLateralShortProgressForText// + tricepsLateralShortTally
         
        case Save.tricepsLongTitle:
            
            var tricepsLongTally = defaults.float(forKey: Save.tricepsLongTally)
            var tricepsLongProgress = Float(0.0)//efaults.float(forKey: Save.tricepsLongProgress)
            var tricepsLongMax = defaults.float(forKey: Save.tricepsLongMax)
            var tricepsLongProgressForText = defaults.float(forKey: Save.tricepsLongProgressInt)
            tricepsLongProgressForText = tricepsLongProgressForText + tricepsLongTally
            defaults.set(tricepsLongProgressForText, forKey: Save.tricepsLongProgressInt)
            if(tricepsLongMax == 0.0){tricepsLongMax = 5}
            tricepsLongTally = (1.0 / tricepsLongMax) * tricepsLongTally
            defaults.set(tricepsLongMax, forKey: Save.tricepsLongMax)
            defaults.removeObject(forKey: Save.tricepsLongTally)
            let tricepsLongDifference = tricepsLongMax - (tricepsLongProgressForText)
            defaults.set(tricepsLongDifference, forKey: Save.tricepsLongDifference)
            tricepsLongProgress = (1.0/tricepsLongMax) * tricepsLongProgressForText// + tricepsLongTally
  
        case Save.quadsTitle:
            
            var quadsTally = defaults.float(forKey: Save.quadsTally)
            var quadsProgress = Float(0.0)//efaults.float(forKey: Save.quadsProgress)
            var quadsMax = defaults.float(forKey: Save.quadsMax)
            var quadsProgressForText = defaults.float(forKey: Save.quadsProgressInt)
            quadsProgressForText = quadsProgressForText + quadsTally
            defaults.set(quadsProgressForText, forKey: Save.quadsProgressInt)
            if(quadsMax == 0.0){quadsMax = 12}
            quadsTally = (1.0 / quadsMax) * quadsTally
            defaults.set(quadsMax, forKey: Save.quadsMax)
            defaults.removeObject(forKey: Save.quadsTally)
            let quadsDifference = quadsMax - (quadsProgressForText)
            defaults.set(quadsDifference, forKey: Save.quadsDifference)
            quadsProgress = (1.0/quadsMax) * quadsProgressForText// + quadsTally
     
        case Save.upperAbsTitle:
            
            var upperAbsTally = defaults.float(forKey: Save.upperAbsTally)
            var upperAbsProgress = Float(0.0)//efaults.float(forKey: Save.upperAbsProgress)
            var upperAbsMax = defaults.float(forKey: Save.upperAbsMax)
            var upperAbsProgressForText = defaults.float(forKey: Save.upperAbsProgressInt)
            upperAbsProgressForText = upperAbsProgressForText + upperAbsTally
            defaults.set(upperAbsProgressForText, forKey: Save.upperAbsProgressInt)
            if(upperAbsMax == 0.0){upperAbsMax = 4}
            upperAbsTally = (1.0 / upperAbsMax) * upperAbsTally
            defaults.set(upperAbsMax, forKey: Save.upperAbsMax)
            defaults.removeObject(forKey: Save.upperAbsTally)
            let upperAbsDifference = upperAbsMax - (upperAbsProgressForText)
            defaults.set(upperAbsDifference, forKey: Save.upperAbsDifference)
            upperAbsProgress = (1.0/upperAbsMax) * upperAbsProgressForText// + upperAbsTally
   
        case Save.middleAbsTitle:
            
            var middleAbsTally = defaults.float(forKey: Save.middleAbsTally)
            var middleAbsProgress = Float(0.0)//efaults.float(forKey: Save.middleAbsProgress)
            var middleAbsMax = defaults.float(forKey: Save.middleAbsMax)
            var middleAbsProgressForText = defaults.float(forKey: Save.middleAbsProgressInt)
            middleAbsProgressForText = middleAbsProgressForText + middleAbsTally
            defaults.set(middleAbsProgressForText, forKey: Save.middleAbsProgressInt)
            if(middleAbsMax == 0.0){middleAbsMax = 4}
            middleAbsTally = (1.0 / middleAbsMax) * middleAbsTally
            
            defaults.set(middleAbsMax, forKey: Save.middleAbsMax)
            defaults.removeObject(forKey: Save.middleAbsTally)
            let middleAbsDifference = middleAbsMax - (middleAbsProgressForText)
            defaults.set(middleAbsDifference, forKey: Save.middleAbsDifference)
            middleAbsProgress = (1.0/middleAbsMax) * middleAbsProgressForText// + middleAbsTally
    
        case Save.lowerAbsTitle:
            
            var lowerAbsTally = defaults.float(forKey: Save.lowerAbsTally)
            var lowerAbsProgress = Float(0.0)//efaults.float(forKey: Save.lowerAbsProgress)
            var lowerAbsMax = defaults.float(forKey: Save.lowerAbsMax)
            var lowerAbsProgressForText = defaults.float(forKey: Save.lowerAbsProgressInt)
            lowerAbsProgressForText = lowerAbsProgressForText + lowerAbsTally
            defaults.set(lowerAbsProgressForText, forKey: Save.lowerAbsProgressInt)
            if(lowerAbsMax == 0.0){lowerAbsMax = 4}
            lowerAbsTally = (1.0 / lowerAbsMax) * lowerAbsTally
            defaults.set(lowerAbsMax, forKey: Save.lowerAbsMax)
            defaults.removeObject(forKey: Save.lowerAbsTally)
            let lowerAbsDifference = lowerAbsMax - (lowerAbsProgressForText)
            defaults.set(lowerAbsDifference, forKey: Save.lowerAbsDifference)
            lowerAbsProgress = (1.0/lowerAbsMax) * lowerAbsProgressForText// + lowerAbsTally
  
        case Save.upperObliquesTitle:
            
            var upperObliquesTally = defaults.float(forKey: Save.upperObliquesTally)
            var upperObliquesProgress = Float(0.0)//efaults.float(forKey: Save.upperObliquesProgress)
            var upperObliquesMax = defaults.float(forKey: Save.upperObliquesMax)
            var upperObliquesProgressForText = defaults.float(forKey: Save.upperObliquesProgressInt)
            upperObliquesProgressForText = upperObliquesProgressForText + upperObliquesTally
            defaults.set(upperObliquesProgressForText, forKey: Save.upperObliquesProgressInt)
            if(upperObliquesMax == 0.0){upperObliquesMax = 4}
            upperObliquesTally = (1.0 / upperObliquesMax) * upperObliquesTally
            
            defaults.set(upperObliquesMax, forKey: Save.upperObliquesMax)
            defaults.removeObject(forKey: Save.upperObliquesTally)
            let upperObliquesDifference = upperObliquesMax - (upperObliquesProgressForText)
            defaults.set(upperObliquesDifference, forKey: Save.upperObliquesDifference)
            upperObliquesProgress = (1.0/upperObliquesMax) * upperObliquesProgressForText// + upperObliquesTally
    
        case Save.middleObliquesTitle:
            
            var middleObliquesTally = defaults.float(forKey: Save.middleObliquesTally)
            var middleObliquesProgress = Float(0.0)//efaults.float(forKey: Save.middleObliquesProgress)
            var middleObliquesMax = defaults.float(forKey: Save.middleObliquesMax)
            var middleObliquesProgressForText = defaults.float(forKey: Save.middleObliquesProgressInt)
            middleObliquesProgressForText = middleObliquesProgressForText + middleObliquesTally
            defaults.set(middleObliquesProgressForText, forKey: Save.middleObliquesProgressInt)
            if(middleObliquesMax == 0.0){middleObliquesMax = 4}
            middleObliquesTally = (1.0 / middleObliquesMax) * middleObliquesTally
            
            defaults.set(middleObliquesMax, forKey: Save.middleObliquesMax)
            defaults.removeObject(forKey: Save.middleObliquesTally)
            let middleObliquesDifference = middleObliquesMax - (middleObliquesProgressForText)
            defaults.set(middleObliquesDifference, forKey: Save.middleObliquesDifference)
            middleObliquesProgress = (1.0/middleObliquesMax) * middleObliquesProgressForText// + middleObliquesTally
   
        case Save.lowerObliquesTitle:
            
            var lowerObliquesTally = defaults.float(forKey: Save.lowerObliquesTally)
            var lowerObliquesProgress = Float(0.0)//efaults.float(forKey: Save.lowerObliquesProgress)
            var lowerObliquesMax = defaults.float(forKey: Save.lowerObliquesMax)
            var lowerObliquesProgressForText = defaults.float(forKey: Save.lowerObliquesProgressInt)
            lowerObliquesProgressForText = lowerObliquesProgressForText + lowerObliquesTally
            defaults.set(lowerObliquesProgressForText, forKey: Save.lowerObliquesProgressInt)
            if(lowerObliquesMax == 0.0){lowerObliquesMax = 4}
            lowerObliquesTally = (1.0 / lowerObliquesMax) * lowerObliquesTally
            
            defaults.set(lowerObliquesMax, forKey: Save.lowerObliquesMax)
            defaults.removeObject(forKey: Save.lowerObliquesTally)
            let lowerObliquesDifference = lowerObliquesMax - (lowerObliquesProgressForText)
            defaults.set(lowerObliquesDifference, forKey: Save.lowerObliquesDifference)
            lowerObliquesProgress = (1.0/lowerObliquesMax) * lowerObliquesProgressForText// + lowerObliquesTally
     
        case Save.serratusTitle:
            
            var serratusTally = defaults.float(forKey: Save.serratusTally)
            var serratusProgress = Float(0.0)//efaults.float(forKey: Save.serratusProgress)
            var serratusMax = defaults.float(forKey: Save.serratusMax)
            var serratusProgressForText = defaults.float(forKey: Save.serratusProgressInt)
            serratusProgressForText = serratusProgressForText + serratusTally
            defaults.set(serratusProgressForText, forKey: Save.serratusProgressInt)
            if(serratusMax == 0.0){serratusMax = 16}
            serratusTally = (1.0 / serratusMax) * serratusTally
            
            defaults.set(serratusMax, forKey: Save.serratusMax)
            defaults.removeObject(forKey: Save.serratusTally)
            let serratusDifference = serratusMax - (serratusProgressForText)
            defaults.set(serratusDifference, forKey: Save.serratusDifference)
            serratusProgress = (1.0/serratusMax) * serratusProgressForText// + serratusTally
        
        case Save.transverseAbTitle:
            
            var transverseAbTally = defaults.float(forKey: Save.transverseAbTally)
            var transverseAbProgress = Float(0.0)//efaults.float(forKey: Save.transverseAbProgress)
            var transverseAbMax = defaults.float(forKey: Save.transverseAbMax)
            var transverseAbProgressForText = defaults.float(forKey: Save.transverseAbProgressInt)
            transverseAbProgressForText = transverseAbProgressForText + transverseAbTally
            defaults.set(transverseAbProgressForText, forKey: Save.transverseAbProgressInt)
            if(transverseAbMax == 0.0){transverseAbMax = 16}
            transverseAbTally = (1.0 / transverseAbMax) * transverseAbTally
            
            defaults.set(transverseAbMax, forKey: Save.transverseAbMax)
            defaults.removeObject(forKey: Save.transverseAbTally)
            let transverseAbDifference = transverseAbMax - (transverseAbProgressForText)
            defaults.set(transverseAbDifference, forKey: Save.transverseAbDifference)
            transverseAbProgress = (1.0/transverseAbMax) * transverseAbProgressForText// + transverseAbTally
      
        case Save.gastrocnemiusTitle:
            
            var gastrocnemiusTally = defaults.float(forKey: Save.gastrocnemiusTally)
            var gastrocnemiusProgress = Float(0.0)//efaults.float(forKey: Save.gastrocnemiusProgress)
            var gastrocnemiusMax = defaults.float(forKey: Save.gastrocnemiusMax)
            var gastrocnemiusProgressForText = defaults.float(forKey: Save.gastrocnemiusProgressInt)
            gastrocnemiusProgressForText = gastrocnemiusProgressForText + gastrocnemiusTally
            defaults.set(gastrocnemiusProgressForText, forKey: Save.gastrocnemiusProgressInt)
            if(gastrocnemiusMax == 0.0){gastrocnemiusMax = 5}
            gastrocnemiusTally = (1.0 / gastrocnemiusMax) * gastrocnemiusTally
            
            defaults.set(gastrocnemiusMax, forKey: Save.gastrocnemiusMax)
            defaults.removeObject(forKey: Save.gastrocnemiusTally)
            let gastrocnemiusDifference = gastrocnemiusMax - (gastrocnemiusProgressForText)
            defaults.set(gastrocnemiusDifference, forKey: Save.gastrocnemiusDifference)
            gastrocnemiusProgress = (1.0/gastrocnemiusMax) * gastrocnemiusProgressForText// + gastrocnemiusTally
       
        case Save.soleusTitle:
            
            var soleusTally = defaults.float(forKey: Save.soleusTally)
            var soleusProgress = Float(0.0)//efaults.float(forKey: Save.soleusProgress)
            var soleusMax = defaults.float(forKey: Save.soleusMax)
            var soleusProgressForText = defaults.float(forKey: Save.soleusProgressInt)
            soleusProgressForText = soleusProgressForText + soleusTally
            defaults.set(soleusProgressForText, forKey: Save.soleusProgressInt)
            if(soleusMax == 0.0){soleusMax = 5}
            soleusTally = (1.0 / soleusMax) * soleusTally
            
            defaults.set(soleusMax, forKey: Save.soleusMax)
            defaults.removeObject(forKey: Save.soleusTally)
            let soleusDifference = soleusMax - (soleusProgressForText)
            defaults.set(soleusDifference, forKey: Save.soleusDifference)
            soleusProgress = (1.0/soleusMax) * soleusProgressForText// + soleusTally
 
        case Save.anteriorTibialisTitle:
            
            var anteriorTibialisTally = defaults.float(forKey: Save.anteriorTibialisTally)
            var anteriorTibialisProgress = Float(0.0)//efaults.float(forKey: Save.anteriorTibialisProgress)
            var anteriorTibialisMax = defaults.float(forKey: Save.anteriorTibialisMax)
            var anteriorTibialisProgressForText = defaults.float(forKey: Save.anteriorTibialisProgressInt)
            anteriorTibialisProgressForText = anteriorTibialisProgressForText + anteriorTibialisTally
            defaults.set(anteriorTibialisProgressForText, forKey: Save.anteriorTibialisProgressInt)
            if(anteriorTibialisMax == 0.0){anteriorTibialisMax = 5}
            anteriorTibialisTally = (1.0 / anteriorTibialisMax) * anteriorTibialisTally
            
            defaults.set(anteriorTibialisMax, forKey: Save.anteriorTibialisMax)
            defaults.removeObject(forKey: Save.anteriorTibialisTally)
            let anteriorTibialisDifference = anteriorTibialisMax - (anteriorTibialisProgressForText)
            defaults.set(anteriorTibialisDifference, forKey: Save.anteriorTibialisDifference)
            anteriorTibialisProgress = (1.0/anteriorTibialisMax) * anteriorTibialisProgressForText// + anteriorTibialisTally
      
            
        case Save.neckFlexionTitle:
            
            var neckFlexionTally = defaults.float(forKey: Save.neckFlexionTally)
            var neckFlexionProgress = Float(0.0)//efaults.float(forKey: Save.neckFlexionProgress)
            var neckFlexionMax = defaults.float(forKey: Save.neckFlexionMax)
            var neckFlexionProgressForText = defaults.float(forKey: Save.neckFlexionProgressInt)
            neckFlexionProgressForText = neckFlexionProgressForText + neckFlexionTally
            defaults.set(neckFlexionProgressForText, forKey: Save.neckFlexionProgressInt)
            if(neckFlexionMax == 0.0){neckFlexionMax = 4}
            neckFlexionTally = (1.0 / neckFlexionMax) * neckFlexionTally
            
            defaults.set(neckFlexionMax, forKey: Save.neckFlexionMax)
            defaults.removeObject(forKey: Save.neckFlexionTally)
            let neckFlexionDifference = neckFlexionMax - (neckFlexionProgressForText)
            defaults.set(neckFlexionDifference, forKey: Save.neckFlexionDifference)
            neckFlexionProgress = (1.0/neckFlexionMax) * neckFlexionProgressForText// + neckFlexionTally
           
        case Save.neckExtensionTitle:
            
            var neckExtensionTally = defaults.float(forKey: Save.neckExtensionTally)
            var neckExtensionProgress = Float(0.0)//efaults.float(forKey: Save.neckExtensionProgress)
            var neckExtensionMax = defaults.float(forKey: Save.neckExtensionMax)
            var neckExtensionProgressForText = defaults.float(forKey: Save.neckExtensionProgressInt)
            neckExtensionProgressForText = neckExtensionProgressForText + neckExtensionTally
            defaults.set(neckExtensionProgressForText, forKey: Save.neckExtensionProgressInt)
            if(neckExtensionMax == 0.0){neckExtensionMax = 4}
            neckExtensionTally = (1.0 / neckExtensionMax) * neckExtensionTally
            
            defaults.set(neckExtensionMax, forKey: Save.neckExtensionMax)
            defaults.removeObject(forKey: Save.neckExtensionTally)
            let neckExtensionDifference = neckExtensionMax - (neckExtensionProgressForText)
            defaults.set(neckExtensionDifference, forKey: Save.neckExtensionDifference)
            neckExtensionProgress = (1.0/neckExtensionMax) * neckExtensionProgressForText// + neckExtensionTally

            
        case Save.transverseNeckTitle:
            
            var transverseNeckTally = defaults.float(forKey: Save.transverseNeckTally)
            var transverseNeckProgress = Float(0.0)//efaults.float(forKey: Save.transverseNeckProgress)
            var transverseNeckMax = defaults.float(forKey: Save.transverseNeckMax)
            var transverseNeckProgressForText = defaults.float(forKey: Save.transverseNeckProgressInt)
            transverseNeckProgressForText = transverseNeckProgressForText + transverseNeckTally
            defaults.set(transverseNeckProgressForText, forKey: Save.transverseNeckProgressInt)
            if(transverseNeckMax == 0.0){transverseNeckMax = 4}
            transverseNeckTally = (1.0 / transverseNeckMax) * transverseNeckTally
            
            defaults.set(transverseNeckMax, forKey: Save.transverseNeckMax)
            defaults.removeObject(forKey: Save.transverseNeckTally)
            let transverseNeckDifference = transverseNeckMax - (transverseNeckProgressForText)
            defaults.set(transverseNeckDifference, forKey: Save.transverseNeckDifference)
            transverseNeckProgress = (1.0/transverseNeckMax) * transverseNeckProgressForText// + transverseNeckTally
            
            
        case Save.lateralNeckTitle:
            
            var lateralNeckTally = defaults.float(forKey: Save.lateralNeckTally)
            var lateralNeckProgress = Float(0.0)//efaults.float(forKey: Save.lateralNeckProgress)
            var lateralNeckMax = defaults.float(forKey: Save.lateralNeckMax)
            var lateralNeckProgressForText = defaults.float(forKey: Save.lateralNeckProgressInt)
            lateralNeckProgressForText = lateralNeckProgressForText + lateralNeckTally
            defaults.set(lateralNeckProgressForText, forKey: Save.lateralNeckProgressInt)
            if(lateralNeckMax == 0.0){lateralNeckMax = 4}
            lateralNeckTally = (1.0 / lateralNeckMax) * lateralNeckTally
            
            defaults.set(lateralNeckMax, forKey: Save.lateralNeckMax)
            defaults.removeObject(forKey: Save.lateralNeckTally)
            let lateralNeckDifference = lateralNeckMax - (lateralNeckProgressForText)
            defaults.set(lateralNeckDifference, forKey: Save.lateralNeckDifference)
            lateralNeckProgress = (1.0/lateralNeckMax) * lateralNeckProgressForText// + lateralNeckTally
       
            
        case Save.forearmExtensorsTitle:
            
            var forearmExtensorsTally = defaults.float(forKey: Save.forearmExtensorsTally)
            var forearmExtensorsProgress = Float(0.0)//efaults.float(forKey: Save.forearmExtensorsProgress)
            var forearmExtensorsMax = defaults.float(forKey: Save.forearmExtensorsMax)
            var forearmExtensorsProgressForText = defaults.float(forKey: Save.forearmExtensorsProgressInt)
            forearmExtensorsProgressForText = forearmExtensorsProgressForText + forearmExtensorsTally
            defaults.set(forearmExtensorsProgressForText, forKey: Save.forearmExtensorsProgressInt)
            if(forearmExtensorsMax == 0.0){forearmExtensorsMax = 10}
            forearmExtensorsTally = (1.0 / forearmExtensorsMax) * forearmExtensorsTally
            
            defaults.set(forearmExtensorsMax, forKey: Save.forearmExtensorsMax)
            defaults.removeObject(forKey: Save.forearmExtensorsTally)
            let forearmExtensorsDifference = forearmExtensorsMax - (forearmExtensorsProgressForText)
            defaults.set(forearmExtensorsDifference, forKey: Save.forearmExtensorsDifference)
            forearmExtensorsProgress = (1.0/forearmExtensorsMax) * forearmExtensorsProgressForText// + forearmExtensorsTally
           
            
        case Save.ulnarForearmTitle:
            
            var ulnarForearmTally = defaults.float(forKey: Save.ulnarForearmTally)
            var ulnarForearmProgress = Float(0.0)//efaults.float(forKey: Save.ulnarForearmProgress)
            var ulnarForearmMax = defaults.float(forKey: Save.ulnarForearmMax)
            var ulnarForearmProgressForText = defaults.float(forKey: Save.ulnarForearmProgressInt)
            ulnarForearmProgressForText = ulnarForearmProgressForText + ulnarForearmTally
            defaults.set(ulnarForearmProgressForText, forKey: Save.ulnarForearmProgressInt)
            if(ulnarForearmMax == 0.0){ulnarForearmMax = 10}
            ulnarForearmTally = (1.0 / ulnarForearmMax) * ulnarForearmTally
            
            defaults.set(ulnarForearmMax, forKey: Save.ulnarForearmMax)
            defaults.removeObject(forKey: Save.ulnarForearmTally)
            let ulnarForearmDifference = ulnarForearmMax - (ulnarForearmProgressForText)
            defaults.set(ulnarForearmDifference, forKey: Save.ulnarForearmDifference)
            ulnarForearmProgress = (1.0/ulnarForearmMax) * ulnarForearmProgressForText// + ulnarForearmTally
        
            
        case Save.forearmFlexorsTitle:
            
            var forearmFlexorsTally = defaults.float(forKey: Save.forearmFlexorsTally)
            var forearmFlexorsProgress = Float(0.0)//efaults.float(forKey: Save.forearmFlexorsProgress)
            var forearmFlexorsMax = defaults.float(forKey: Save.forearmFlexorsMax)
            var forearmFlexorsProgressForText = defaults.float(forKey: Save.forearmFlexorsProgressInt)
            forearmFlexorsProgressForText = forearmFlexorsProgressForText + forearmFlexorsTally
            defaults.set(forearmFlexorsProgressForText, forKey: Save.forearmFlexorsProgressInt)
            if(forearmFlexorsMax == 0.0){forearmFlexorsMax = 10}
            forearmFlexorsTally = (1.0 / forearmFlexorsMax) * forearmFlexorsTally
            
            defaults.set(forearmFlexorsProgress, forKey: Save.forearmFlexorsProgress)
            defaults.set(forearmFlexorsMax, forKey: Save.forearmFlexorsMax)
            defaults.removeObject(forKey: Save.forearmFlexorsTally)
            let forearmFlexorsDifference = forearmFlexorsMax - (forearmFlexorsProgressForText)
            defaults.set(forearmFlexorsDifference, forKey: Save.forearmFlexorsDifference)
            forearmFlexorsProgress = (1.0/forearmFlexorsMax) * forearmFlexorsProgressForText// + forearmFlexorsTally
            
            
        case Save.radialForearmTitle:
            
            var radialForearmTally = defaults.float(forKey: Save.radialForearmTally)
            var radialForearmProgress = Float(0.0)//efaults.float(forKey: Save.radialForearmProgress)
            var radialForearmMax = defaults.float(forKey: Save.radialForearmMax)
            var radialForearmProgressForText = defaults.float(forKey: Save.radialForearmProgressInt)
            radialForearmProgressForText = radialForearmProgressForText + radialForearmTally
            defaults.set(radialForearmProgressForText, forKey: Save.radialForearmProgressInt)
            if(radialForearmMax == 0.0){radialForearmMax = 10}
            radialForearmTally = (1.0 / radialForearmMax) * radialForearmTally
            
            defaults.set(radialForearmMax, forKey: Save.radialForearmMax)
            defaults.removeObject(forKey: Save.radialForearmTally)
            let radialForearmDifference = radialForearmMax - (radialForearmProgressForText)
            defaults.set(radialForearmDifference, forKey: Save.radialForearmDifference)
            radialForearmProgress = (1.0/radialForearmMax) * radialForearmProgressForText// + radialForearmTally
           
            
        case Save.spinalErectorsTitle:
            
            var spinalErectorsTally = defaults.float(forKey: Save.spinalErectorsTally)
            var spinalErectorsProgress = Float(0.0)//efaults.float(forKey: Save.spinalErectorsProgress)
            var spinalErectorsMax = defaults.float(forKey: Save.spinalErectorsMax)
            var spinalErectorsProgressForText = defaults.float(forKey: Save.spinalErectorsProgressInt)
            spinalErectorsProgressForText = spinalErectorsProgressForText + spinalErectorsTally
            defaults.set(spinalErectorsProgressForText, forKey: Save.spinalErectorsProgressInt)
            if(spinalErectorsMax == 0.0){spinalErectorsMax = 10}
            spinalErectorsTally = (1.0 / spinalErectorsMax) * spinalErectorsTally
            
            defaults.set(spinalErectorsMax, forKey: Save.spinalErectorsMax)
            defaults.removeObject(forKey: Save.spinalErectorsTally)
            let spinalErectorsDifference = spinalErectorsMax - (spinalErectorsProgressForText)
            defaults.set(spinalErectorsDifference, forKey: Save.spinalErectorsDifference)
            spinalErectorsProgress = (1.0/spinalErectorsMax) * spinalErectorsProgressForText// + spinalErectorsTally
            
            
        case Save.upperTrapsTitle:
            
            var upperTrapsTally = defaults.float(forKey: Save.upperTrapsTally)
            var upperTrapsProgress = Float(0.0)//efaults.float(forKey: Save.upperTrapsProgress)
            var upperTrapsMax = defaults.float(forKey: Save.upperTrapsMax)
            var upperTrapsProgressForText = defaults.float(forKey: Save.upperTrapsProgressInt)
            upperTrapsProgressForText = upperTrapsProgressForText + upperTrapsTally
            defaults.set(upperTrapsProgressForText, forKey: Save.upperTrapsProgressInt)
            if(upperTrapsMax == 0.0){upperTrapsMax = 10}
            upperTrapsTally = (1.0 / upperTrapsMax) * upperTrapsTally
            
            defaults.set(upperTrapsMax, forKey: Save.upperTrapsMax)
            defaults.removeObject(forKey: Save.upperTrapsTally)
            let upperTrapsDifference = upperTrapsMax - (upperTrapsProgressForText)
            defaults.set(upperTrapsDifference, forKey: Save.upperTrapsDifference)
            upperTrapsProgress = (1.0/upperTrapsMax) * upperTrapsProgressForText// + upperTrapsTally
          
            
        case Save.lowerTrapsTitle:
            
            var lowerTrapsTally = defaults.float(forKey: Save.lowerTrapsTally)
            var lowerTrapsProgress = Float(0.0)//efaults.float(forKey: Save.lowerTrapsProgress)
            var lowerTrapsMax = defaults.float(forKey: Save.lowerTrapsMax)
            var lowerTrapsProgressForText = defaults.float(forKey: Save.lowerTrapsProgressInt)
            lowerTrapsProgressForText = lowerTrapsProgressForText + lowerTrapsTally
            defaults.set(lowerTrapsProgressForText, forKey: Save.lowerTrapsProgressInt)
            if(lowerTrapsMax == 0.0){lowerTrapsMax = 12}
            lowerTrapsTally = (1.0 / lowerTrapsMax) * lowerTrapsTally
            
            defaults.set(lowerTrapsMax, forKey: Save.lowerTrapsMax)
            defaults.removeObject(forKey: Save.lowerTrapsTally)
            let lowerTrapsDifference = lowerTrapsMax - (lowerTrapsProgressForText)
            defaults.set(lowerTrapsDifference, forKey: Save.lowerTrapsDifference)
            lowerTrapsProgress = (1.0/lowerTrapsMax) * lowerTrapsProgressForText// + lowerTrapsTally
            
        case Save.brachialisTitle:
            
            var brachialisTally = defaults.float(forKey: Save.brachialisTally)
            var brachialisProgress = Float(0.0)//efaults.float(forKey: Save.brachialisProgress)
            var brachialisMax = defaults.float(forKey: Save.brachialisMax)
            var brachialisProgressForText = defaults.float(forKey: Save.brachialisProgressInt)
            brachialisProgressForText = brachialisProgressForText + brachialisTally
            defaults.set(brachialisProgressForText, forKey: Save.brachialisProgressInt)
            if(brachialisMax == 0.0){brachialisMax = 4}
            brachialisTally = (1.0 / brachialisMax) * brachialisTally
            
            defaults.set(brachialisMax, forKey: Save.brachialisMax)
            defaults.removeObject(forKey: Save.brachialisTally)
            brachialisProgress = (1.0/brachialisMax) * brachialisProgressForText// + brachialisTally
           
            
        default:
            print("sonething")
            //return [0.0,0.0,0.0]
        }
    }
    
    func getBarProgressForText(muscle: String) -> Float? {
        var progress: Float?
        switch muscle {
        case Save.upperChestTitle:
            progress =   UserDefaults.standard.float(forKey: Save.upperChestProgressInt)
        case Save.middleChestTitle:
            progress =   UserDefaults.standard.float(forKey: Save.middleChestProgressInt)
        case Save.lowerChestTitle:
            progress =   UserDefaults.standard.float(forKey: Save.lowerChestProgressInt)
        case Save.bicepsLongHeadTitle:
            progress =   UserDefaults.standard.float(forKey: Save.bicepsLongHeadProgressInt)
        case Save.bicepsShortHeadTitle:
            progress =   UserDefaults.standard.float(forKey: Save.bicepsShortHeadProgressInt)
        case Save.latsRowingTitle:
            progress =   UserDefaults.standard.float(forKey: Save.latsRowingProgressInt)
        case Save.latsPushdownTitle:
            progress =   UserDefaults.standard.float(forKey: Save.latsPushdownProgressInt)
        case Save.latsPullInTitle:
            progress =   UserDefaults.standard.float(forKey: Save.latsPullInProgressInt)
        case Save.glutesTitle:
            progress =   UserDefaults.standard.float(forKey: Save.glutesProgressInt)
        case Save.gluteMediusTitle:
            progress =   UserDefaults.standard.float(forKey: Save.gluteMediusProgressInt)
        case Save.adductorsTitle:
            progress =   UserDefaults.standard.float(forKey: Save.adductorsProgressInt)
        case Save.hamstringCurlTitle:
            progress =   UserDefaults.standard.float(forKey: Save.hamstringCurlProgressInt)
        case Save.hamstringHingeTitle:
            progress =   UserDefaults.standard.float(forKey: Save.hamstringHingeProgressInt)
        case Save.frontShoulderTitle:
            progress =   UserDefaults.standard.float(forKey: Save.frontShoulderProgressInt)
        case Save.lateralShoulderTitle:
            progress =   UserDefaults.standard.float(forKey: Save.lateralShoulderProgressInt)
        case Save.backShoulderTitle:
            progress =   UserDefaults.standard.float(forKey: Save.backShoulderProgressInt)
        case Save.rotatorCuffTitle:
            progress =   UserDefaults.standard.float(forKey: Save.rotatorCuffProgressInt)
        case Save.tricepsLateralShortTitle:
            progress =   UserDefaults.standard.float(forKey: Save.tricepsLateralShortProgressInt)
        case Save.tricepsLongTitle:
            progress =   UserDefaults.standard.float(forKey: Save.tricepsLongProgressInt)
        case Save.quadsTitle:
            progress =   UserDefaults.standard.float(forKey: Save.quadsProgressInt)
        case Save.upperAbsTitle:
            progress =   UserDefaults.standard.float(forKey: Save.upperAbsProgressInt)
        case Save.middleAbsTitle:
            progress =   UserDefaults.standard.float(forKey: Save.middleAbsProgressInt)
        case Save.lowerAbsTitle:
            progress =   UserDefaults.standard.float(forKey: Save.lowerAbsProgressInt)
        case Save.upperObliquesTitle:
            progress =   UserDefaults.standard.float(forKey: Save.upperObliquesProgressInt)
        case Save.middleObliquesTitle:
            progress =   UserDefaults.standard.float(forKey: Save.middleObliquesProgressInt)
        case Save.lowerObliquesTitle:
            progress =   UserDefaults.standard.float(forKey: Save.lowerObliquesProgressInt)
        case Save.serratusTitle:
            progress =   UserDefaults.standard.float(forKey: Save.serratusProgressInt)
        case Save.transverseAbTitle:
            progress =   UserDefaults.standard.float(forKey: Save.transverseAbProgressInt)
        case Save.gastrocnemiusTitle:
            progress =   UserDefaults.standard.float(forKey: Save.gastrocnemiusProgressInt)
        case Save.soleusTitle:
            progress =   UserDefaults.standard.float(forKey: Save.soleusProgressInt)
        case Save.anteriorTibialisTitle:
            progress =   UserDefaults.standard.float(forKey: Save.soleusProgressInt)
        case Save.neckFlexionTitle:
            progress =   UserDefaults.standard.float(forKey: Save.neckFlexionProgressInt)
        case Save.neckExtensionTitle:
            progress =   UserDefaults.standard.float(forKey: Save.neckExtensionProgressInt)
        case Save.transverseNeckTitle:
            progress =   UserDefaults.standard.float(forKey: Save.transverseNeckProgressInt)
        case Save.lateralNeckTitle:
            progress =   UserDefaults.standard.float(forKey: Save.lateralNeckProgressInt)
        case Save.forearmExtensorsTitle:
            progress =   UserDefaults.standard.float(forKey: Save.forearmExtensorsProgressInt)
        case Save.ulnarForearmTitle:
            progress =   UserDefaults.standard.float(forKey: Save.ulnarForearmProgressInt)
        case Save.forearmFlexorsTitle:
            progress =   UserDefaults.standard.float(forKey: Save.forearmFlexorsProgressInt)
        case Save.radialForearmTitle:
            progress =   UserDefaults.standard.float(forKey: Save.radialForearmProgressInt)
        case Save.spinalErectorsTitle:
            progress =   UserDefaults.standard.float(forKey: Save.spinalErectorsProgressInt)
        case Save.upperTrapsTitle:
            progress =   UserDefaults.standard.float(forKey: Save.upperTrapsProgressInt)
        case Save.lowerTrapsTitle:
            progress =   UserDefaults.standard.float(forKey: Save.lowerTrapsProgressInt)
        case Save.brachialisTitle:
            progress =   UserDefaults.standard.float(forKey: Save.brachialisProgressInt)
        default:
            print("Weekly Volume not returned for \(muscle)")
            
        }
        return progress ?? -1.0
    }
    
    func getWeeklySets(muscle: String) -> Float {
        var max: Float?
        switch muscle {
        case Save.upperChestTitle:
            max =   UserDefaults.standard.float(forKey: Save.upperChestMax)
        case Save.middleChestTitle:
            max =   UserDefaults.standard.float(forKey: Save.middleChestMax)
        case Save.lowerChestTitle:
            max =   UserDefaults.standard.float(forKey: Save.lowerChestMax)
        case Save.bicepsLongHeadTitle:
            max =   UserDefaults.standard.float(forKey: Save.bicepsLongHeadMax)
        case Save.bicepsShortHeadTitle:
            max =   UserDefaults.standard.float(forKey: Save.bicepsShortHeadMax)
        case Save.latsRowingTitle:
            max =   UserDefaults.standard.float(forKey: Save.latsRowingMax)
        case Save.latsPushdownTitle:
            max =   UserDefaults.standard.float(forKey: Save.latsPushdownMax)
        case Save.latsPullInTitle:
            max =   UserDefaults.standard.float(forKey: Save.latsPullInMax)
        case Save.glutesTitle:
            max =   UserDefaults.standard.float(forKey: Save.glutesMax)
        case Save.gluteMediusTitle:
            max =   UserDefaults.standard.float(forKey: Save.gluteMediusMax)
        case Save.adductorsTitle:
            max =   UserDefaults.standard.float(forKey: Save.adductorsMax)
        case Save.hamstringCurlTitle:
            max =   UserDefaults.standard.float(forKey: Save.hamstringCurlMax)
        case Save.hamstringHingeTitle:
            max =   UserDefaults.standard.float(forKey: Save.hamstringHingeMax)
        case Save.frontShoulderTitle:
            max =   UserDefaults.standard.float(forKey: Save.frontShoulderMax)
        case Save.lateralShoulderTitle:
            max =   UserDefaults.standard.float(forKey: Save.lateralShoulderMax)
        case Save.backShoulderTitle:
            max =   UserDefaults.standard.float(forKey: Save.backShoulderMax)
        case Save.rotatorCuffTitle:
            max =   UserDefaults.standard.float(forKey: Save.rotatorCuffMax)
        case Save.tricepsLateralShortTitle:
            max =   UserDefaults.standard.float(forKey: Save.tricepsLateralShortMax)
        case Save.tricepsLongTitle:
            max =   UserDefaults.standard.float(forKey: Save.tricepsLongMax)
        case Save.quadsTitle:
            max =   UserDefaults.standard.float(forKey: Save.quadsMax)
        case Save.upperAbsTitle:
            max =   UserDefaults.standard.float(forKey: Save.upperAbsMax)
        case Save.middleAbsTitle:
            max =   UserDefaults.standard.float(forKey: Save.middleAbsMax)
        case Save.lowerAbsTitle:
            max =   UserDefaults.standard.float(forKey: Save.lowerAbsMax)
        case Save.upperObliquesTitle:
            max =   UserDefaults.standard.float(forKey: Save.upperObliquesMax)
        case Save.middleObliquesTitle:
            max =   UserDefaults.standard.float(forKey: Save.middleObliquesMax)
        case Save.lowerObliquesTitle:
            max =   UserDefaults.standard.float(forKey: Save.lowerObliquesMax)
        case Save.serratusTitle:
            max =   UserDefaults.standard.float(forKey: Save.serratusMax)
        case Save.transverseAbTitle:
            max =   UserDefaults.standard.float(forKey: Save.transverseAbMax)
        case Save.gastrocnemiusTitle:
            max =   UserDefaults.standard.float(forKey: Save.gastrocnemiusMax)
        case Save.soleusTitle:
            max =   UserDefaults.standard.float(forKey: Save.soleusMax)
        case Save.anteriorTibialisTitle:
            max =   UserDefaults.standard.float(forKey: Save.anteriorTibialisMax)
        case Save.neckFlexionTitle:
            max =   UserDefaults.standard.float(forKey: Save.neckFlexionMax)
        case Save.neckExtensionTitle:
            max =   UserDefaults.standard.float(forKey: Save.neckExtensionMax)
        case Save.transverseNeckTitle:
            max =   UserDefaults.standard.float(forKey: Save.transverseNeckMax)
        case Save.lateralNeckTitle:
            max =   UserDefaults.standard.float(forKey: Save.lateralNeckMax)
        case Save.forearmExtensorsTitle:
            max =   UserDefaults.standard.float(forKey: Save.forearmExtensorsMax)
        case Save.ulnarForearmTitle:
            max =   UserDefaults.standard.float(forKey: Save.ulnarForearmMax)
        case Save.forearmFlexorsTitle:
            max =   UserDefaults.standard.float(forKey: Save.forearmFlexorsMax)
        case Save.radialForearmTitle:
            max =   UserDefaults.standard.float(forKey: Save.radialForearmMax)
        case Save.spinalErectorsTitle:
            max =   UserDefaults.standard.float(forKey: Save.spinalErectorsMax)
        case Save.upperTrapsTitle:
            max =   UserDefaults.standard.float(forKey: Save.upperTrapsMax)
        case Save.lowerTrapsTitle:
            max =   UserDefaults.standard.float(forKey: Save.lowerTrapsMax)
        case Save.brachialisTitle:
            max =   UserDefaults.standard.float(forKey: Save.brachialisMax)
        default:
            print("Weekly Volume not returned for \(muscle)")
            
        }
        return max ?? -1.0
    }

}
