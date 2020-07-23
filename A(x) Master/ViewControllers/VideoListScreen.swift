//
//  VideoListScreen.swift
//  BeginnerTableView
//
//  Created by Sean Allen on 5/19/17.
//  Copyright © 2017 Sean Allen. All rights reserved.
//

//
//


import UIKit

class VideoListScreen: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addSetButton: UIButton!
    
    var videos: [Video] = []
    var VtData: [Float]        = []
    let defaults        = UserDefaults.standard
    var chestProgress   = Float()
     
     struct Keys {
        static let muscle                      = "muscle"
        static let chestTally                  = "chesttally"
        static let chestProgress               = "chestprogress"
        static let chestMax                    = "chestmax"
        static let chestProgressInt            = "chestProgressInt"
        static let chest                       = "chest"
        static let bicepsTally                 = "bicepstally"
        static let bicepsProgress              = "bicepsprogress"
        static let bicepsMax                   = "bicepsmax"
        static let bicepsProgressInt           = "bicepsProgressInt"
        static let biceps                      = "biceps"
        static let latsTally                   = "latstally"
        static let latsProgress                = "latsprogress"
        static let latsMax                     = "latsmax"
        static let latsProgressInt             = "latsProgressInt"
        static let lats                        = "lats"
        static let glutesTally                 = "glutestally"
        static let glutesProgress              = "glutesprogress"
        static let glutesMax                   = "glutesmax"
        static let glutesProgressInt           = "glutesProgressInt"
        static let glutes                      = "glutes"
        static let gluteMediusTally            = "glutemediustally"
        static let gluteMediusProgress         = "glutemediusprogress"
        static let gluteMediusMax              = "glutemediusmax"
        static let gluteMediusProgressInt      = "gluteMediusProgressInt"
        static let gluteMedius                 = "glutemedius"
        static let hamstringsTally             = "hamstringstally"
        static let hamstringsProgress          = "hamstringsprogress"
        static let hamstringsMax               = "hamstringsmax"
        static let hamstringsProgressInt       = "hamstringsProgressInt"
        static let hamstrings                  = "hamstrings"
        static let frontShoulderTally          = "frontshouldertally"
        static let frontShoulderProgress       = "frontshoulderprogress"
        static let frontShoulderMax            = "frontshouldermax"
        static let frontShoulderProgressInt    = "frontShoulderProgressInt"
        static let frontShoulder               = "frontshoulder"
        static let lateralShoulderTally        = "lateralshouldertally"
        static let lateralShoulderProgress     = "lateralshoulderprogress"
        static let lateralShoulderMax          = "lateralshouldermax"
        static let lateralShoulderProgressInt  = "lateralShoulderProgressInt"
        static let lateralShoulder             = "lateralshoulder"
        static let backShoulderTally           = "backshouldertally"
        static let backShoulderProgress        = "backshoulderprogress"
        static let backShoulderMax             = "backshouldermax"
        static let backShoulderProgressInt     = "backShoulderProgressInt"
        static let backShoulder                = "backshoulder"
        static let rotatorCuffTally            = "rotatorCufftally"
        static let rotatorCuffProgress         = "rotatorCuffprogress"
        static let rotatorCuffMax              = "rotatorCuffmax"
        static let rotatorCuffProgressInt     = "roatatorCuffProgressInt"
        static let rotatorCuff                 = "rotatorCuff"
        static let quadsTally                  = "quadstally"
        static let quadsProgress               = "quadsprogress"
        static let quadsMax                    = "quadsmax"
        static let quadsProgressInt            = "quadsProgressInt"
        static let quads                       = "quads"
        static let absTally                    = "abstally"
        static let absProgress                 = "absprogress"
        static let absMax                      = "absmax"
        static let absProgressInt              = "absProgressInt"
        static let abs                         = "abs"
        static let obliquesTally               = "obliquestally"
        static let obliquesProgress            = "obliquesprogress"
        static let obliquesMax                 = "obliquesmax"
        static let obliquesProgressInt         = "obliquesProgressInt"
        static let obliques                    = "obliques"
        static let serratusTally               = "serratustally"
        static let serratusProgress            = "serratusprogress"
        static let serratusMax                 = "serratusmax"
        static let serratusProgressInt         = "serratusProgressInt"
        static let serratus                    = "serratus"
        static let transverseAbTally           = "transverseabtally"
        static let transverseAbProgress        = "transverseabprogress"
        static let transverseAbMax             = "transverseabmax"
        static let transverseAbProgressInt     = "transverseAbProgressInt"
        static let transverseAb                = "transverseab"
        static let tricepsTally                = "tricepstally"
        static let tricepsProgress             = "tricepsprogress"
        static let tricepsMax                  = "tricepsmax"
        static let tricepsProgressInt          = "tricepsProgressInt"
        static let triceps                     = "triceps"
        static let calvesTally                 = "calvestally"
        static let calvesProgress              = "calvesprogress"
        static let calvesMax                   = "calvesmax"
        static let calvesProgressInt           = "calvesProgressInt"
        static let calves                      = "calves"
        static let neckTally                   = "necktally"
        static let neckProgress                = "neckprogress"
        static let neckMax                     = "neckmax"
        static let neckProgressInt             = "neckProgressInt"
        static let neck                        = "neck"
        static let forearmExtensorsTally       = "forearmextensorstally"
        static let forearmExtensorsProgress    = "forearmextensorsprogress"
        static let forearmExtensorsMax         = "forearmextensorsmax"
        static let forearmExtensorsProgressInt  = "forearmExtensorProgressInt"
        static let forearmExtensor             = "forearmextensor"
        static let ulnarForearmTally           = "ulnarforearmtally"
        static let ulnarForearmProgress        = "ulnarforearmprogress"
        static let ulnarForearmMax             = "ulnarforearmmax"
        static let ulnarForearmProgressInt     = "ulnarForearmProgressInt"
        static let ulnarForearm                = "ulnarforearm"
        static let forearmFlexorsTally         = "forearmflexorstally"
        static let forearmFlexorsProgress      = "forearmflexorsprogress"
        static let forearmFlexorsMax           = "forearmflexorsmax"
        static let forearmFlexorsProgressInt    = "forearmFlexorProgressInt"
        static let forearmFlexors              = "forearmflexors"
        static let radialForearmTally          = "radialforearmtally"
        static let radialForearmProgress       = "radialforearmprogress"
        static let radialForearmMax            = "radialforearmmax"
        static let radialForearmProgressInt    = "radialForearmProgressInt"
        static let radialForearm               = "radialForearm"
        static let spinalErectorsTally         = "spinalerectorstally"
        static let spinalErectorsProgress      = "spinalerectorsprogress"
        static let spinalErectorsMax           = "spinalerectorsmax"
        static let spinalErectorsProgressInt    = "spinalErectorProgressInt"
        static let spinalErector               = "spinalerector"
        static let upperTrapsTally             = "uppertrapstally"
        static let upperTrapsProgress          = "uppertrapsprogress"
        static let upperTrapsMax               = "uppertrapsmax"
        static let upperTrapsProgressInt       = "upperTrapsProgressInt"
        static let upperTrap                   = "uppertraps"
        static let lowerTrapsTally             = "lowertrapstally"
        static let lowerTrapsProgress          = "lowertrapsprogress"
        static let lowerTrapsMax               = "lowertrapsmax"
        static let lowerTrapsProgressInt       = "lowerTrapsProgressInt"
        static let lowerTraps                  = "lowertraps"
        static let muscleString                 = "musclestring"
     }
     
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true);
        
        //Decalre variable for tallies to be added to progress bar
        //muscleTally  is the sets to be addes
        //muuscleProgress is the currentweek'ss progress.
        //muscleMax is the default or user defined MAximum recoverable volume
        //muslceprogressForText is muscle progress multiplied by ten and rounded because regular muscle progress is accounting for the fixed 1.0 max value of apples stupid ass progres bars >>>:((( angry developer
        //CHEST
        
        var chestTally = defaults.float(forKey: Keys.chestTally)
        var chestProgress = defaults.float(forKey: Keys.chestProgress)
        var chestMax = defaults.float(forKey: Keys.chestMax)
        var chestProgressForText = defaults.float(forKey: Keys.chestProgressInt)
        chestProgressForText = chestProgressForText + chestTally
        defaults.set(chestProgressForText, forKey: Keys.chestProgressInt)
        if (chestMax == 0.0){chestMax = 12}
        chestTally = (1.0 / chestMax) * chestTally
        chestProgress = chestProgress + chestTally
        defaults.set(chestProgress, forKey: Keys.chestProgress)
        defaults.set(chestMax, forKey: Keys.chestMax)
        defaults.removeObject(forKey: Keys.chestTally)
        print(chestMax)
        
        //BICEPS
        
        var bicepsTally = defaults.float(forKey: Keys.bicepsTally)
        var bicepsProgress = defaults.float(forKey: Keys.bicepsProgress)
        var bicepsMax = defaults.float(forKey: Keys.bicepsMax)
        var bicepsProgressForText = defaults.float(forKey: Keys.bicepsProgressInt)
        bicepsProgressForText = bicepsProgressForText + bicepsTally
        defaults.set(bicepsProgressForText, forKey: Keys.bicepsProgressInt)
        if (bicepsMax == 0.0){bicepsMax = 14}
        bicepsTally = (1.0 / bicepsMax) * bicepsTally
        bicepsProgress = bicepsProgress + bicepsTally
        defaults.set(bicepsProgress, forKey: Keys.bicepsProgress)
        defaults.set(bicepsMax, forKey: Keys.bicepsMax)
        defaults.removeObject(forKey: Keys.bicepsTally)
        
        //LATS
        
        var latsTally = defaults.float(forKey: Keys.latsTally)
        var latsProgress = defaults.float(forKey: Keys.latsProgress)
        var latsMax = defaults.float(forKey: Keys.latsMax)
        var latsProgressForText = defaults.float(forKey: Keys.latsProgressInt)
        latsProgressForText = latsProgressForText + latsTally
        defaults.set(latsProgressForText, forKey: Keys.latsProgressInt)
        if (latsMax == 0.0){latsMax = 12}
        latsTally = (1.0 / latsMax) * latsTally
        latsProgress = latsProgress + latsTally
        defaults.set(latsProgress, forKey: Keys.latsProgress)
        defaults.set(latsMax, forKey: Keys.latsMax)
        defaults.removeObject(forKey: Keys.latsTally)
        
        //GLUTES
        
        var glutesTally = defaults.float(forKey: Keys.glutesTally)
        var glutesProgress = defaults.float(forKey: Keys.glutesProgress)
        var glutesMax = defaults.float(forKey: Keys.glutesMax)
        var glutesProgressForText = defaults.float(forKey: Keys.glutesProgressInt)
        glutesProgressForText = glutesProgressForText + glutesTally
        defaults.set(glutesProgressForText, forKey: Keys.glutesProgressInt)
        if (glutesMax == 0.0){glutesMax = 4}
        glutesTally = (1.0 / glutesMax) * glutesTally
        glutesProgress = glutesProgress + glutesTally
        defaults.set(glutesProgress, forKey: Keys.glutesProgress)
        defaults.set(glutesMax, forKey: Keys.glutesMax)
        defaults.removeObject(forKey: Keys.glutesTally)
        
        //GLUTE MEDIUS
        
        var gluteMediusTally = defaults.float(forKey: Keys.gluteMediusTally)
        var gluteMediusProgress = defaults.float(forKey: Keys.gluteMediusProgress)
        var gluteMediusMax = defaults.float(forKey: Keys.gluteMediusMax)
        var gluteMediusProgressForText = defaults.float(forKey: Keys.gluteMediusProgressInt)
        gluteMediusProgressForText = gluteMediusProgressForText + gluteMediusTally
        defaults.set(gluteMediusProgressForText, forKey: Keys.gluteMediusProgressInt)
        if (gluteMediusMax == 0.0){gluteMediusMax = 12}
        gluteMediusTally = (1.0 / gluteMediusMax) * gluteMediusTally
        gluteMediusProgress = gluteMediusProgress + gluteMediusTally
        defaults.set(gluteMediusProgress, forKey: Keys.gluteMediusProgress)
        defaults.set(gluteMediusMax, forKey: Keys.gluteMediusMax)
        defaults.removeObject(forKey: Keys.gluteMediusTally)
        
        //HAMSTRINGS
        
        var hamstringsTally = defaults.float(forKey: Keys.hamstringsTally)
        var hamstringsProgress = defaults.float(forKey: Keys.hamstringsProgress)
        var hamstringsMax = defaults.float(forKey: Keys.hamstringsMax)
        var hamstringsProgressForText = defaults.float(forKey: Keys.hamstringsProgressInt)
        hamstringsProgressForText = hamstringsProgressForText + hamstringsTally
        defaults.set(hamstringsProgressForText, forKey: Keys.hamstringsProgressInt)
        if (hamstringsMax == 0.0){hamstringsMax = 10}
        hamstringsTally = (1.0 / hamstringsMax) * hamstringsTally
        hamstringsProgress = hamstringsProgress + hamstringsTally
        defaults.set(hamstringsProgress, forKey: Keys.hamstringsProgress)
        defaults.set(hamstringsMax, forKey: Keys.hamstringsMax)
        defaults.removeObject(forKey: Keys.hamstringsTally)
        
        //FRONTSHOULDER
        
        var frontShoulderTally = defaults.float(forKey: Keys.frontShoulderTally)
        var frontShoulderProgress = defaults.float(forKey: Keys.frontShoulderProgress)
        var frontShoulderMax = defaults.float(forKey: Keys.frontShoulderMax)
        var frontShoulderProgressForText = defaults.float(forKey: Keys.frontShoulderProgressInt)
        frontShoulderProgressForText = frontShoulderProgressForText + frontShoulderTally
        defaults.set(frontShoulderProgressForText, forKey: Keys.frontShoulderProgressInt)
        if (frontShoulderMax == 0.0){frontShoulderMax = 16}
        frontShoulderTally = (1.0 / frontShoulderMax) * frontShoulderTally
        frontShoulderProgress = frontShoulderProgress + frontShoulderTally
        defaults.set(frontShoulderProgress, forKey: Keys.frontShoulderProgress)
        defaults.set(frontShoulderMax, forKey: Keys.frontShoulderMax)
        defaults.removeObject(forKey: Keys.frontShoulderTally)
        
        //LATERALSHOULDER
        
        var lateralShoulderTally = defaults.float(forKey: Keys.lateralShoulderTally)
        var lateralShoulderProgress = defaults.float(forKey: Keys.lateralShoulderProgress)
        var lateralShoulderMax = defaults.float(forKey: Keys.lateralShoulderMax)
        var lateralShoulderProgressForText = defaults.float(forKey: Keys.lateralShoulderProgressInt)
        lateralShoulderProgressForText = lateralShoulderProgressForText + lateralShoulderTally
        defaults.set(lateralShoulderProgressForText, forKey: Keys.lateralShoulderProgressInt)
        if (lateralShoulderMax == 0.0){lateralShoulderMax = 16}
        lateralShoulderTally = (1.0 / lateralShoulderMax) * lateralShoulderTally
        lateralShoulderProgress = lateralShoulderProgress + lateralShoulderTally
        defaults.set(lateralShoulderProgress, forKey: Keys.lateralShoulderProgress)
        defaults.set(lateralShoulderMax, forKey: Keys.lateralShoulderMax)
        defaults.removeObject(forKey: Keys.lateralShoulderTally)
        
        //BACKSHOULDER
        
        var backShoulderTally = defaults.float(forKey: Keys.backShoulderTally)
        var backShoulderProgress = defaults.float(forKey: Keys.backShoulderProgress)
        var backShoulderMax = defaults.float(forKey: Keys.backShoulderMax)
        var backShoulderProgressForText = defaults.float(forKey: Keys.backShoulderProgressInt)
        backShoulderProgressForText = backShoulderProgressForText + backShoulderTally
        defaults.set(backShoulderProgressForText, forKey: Keys.backShoulderProgressInt)
        if (backShoulderMax == 0.0){backShoulderMax = 16}
        backShoulderTally = (1.0 / backShoulderMax) * backShoulderTally
        backShoulderProgress = backShoulderProgress + backShoulderTally
        defaults.set(backShoulderProgress, forKey: Keys.backShoulderProgress)
        defaults.set(backShoulderMax, forKey: Keys.backShoulderMax)
        defaults.removeObject(forKey: Keys.backShoulderTally)
        
        //ROTATORCUFF
        
        var rotatorCuffTally = defaults.float(forKey: Keys.rotatorCuffTally)
        var rotatorCuffProgress = defaults.float(forKey: Keys.rotatorCuffProgress)
        var rotatorCuffMax = defaults.float(forKey: Keys.rotatorCuffMax)
        var rotatorCuffProgressForText = defaults.float(forKey: Keys.rotatorCuffProgressInt)
        rotatorCuffProgressForText = rotatorCuffProgressForText + rotatorCuffTally
        defaults.set(rotatorCuffProgressForText, forKey: Keys.rotatorCuffProgressInt)
        if (rotatorCuffMax == 0.0){rotatorCuffMax = 12}
        rotatorCuffTally = (1.0 / rotatorCuffMax) * rotatorCuffTally
        rotatorCuffProgress = rotatorCuffProgress + rotatorCuffTally
        defaults.set(rotatorCuffProgress, forKey: Keys.rotatorCuffProgress)
        defaults.set(rotatorCuffMax, forKey: Keys.rotatorCuffMax)
        defaults.removeObject(forKey: Keys.rotatorCuffTally)
        
        //TRICEPS
        
        var tricepsTally = defaults.float(forKey: Keys.tricepsTally)
        var tricepsProgress = defaults.float(forKey: Keys.tricepsProgress)
        var tricepsMax = defaults.float(forKey: Keys.tricepsMax)
        var tricepsProgressForText = defaults.float(forKey: Keys.tricepsProgressInt)
        tricepsProgressForText = tricepsProgressForText + tricepsTally
        defaults.set(tricepsProgressForText, forKey: Keys.tricepsProgressInt)
        if (tricepsMax == 0.0){tricepsMax = 10}
        tricepsTally = (1.0 / tricepsMax) * tricepsTally
        tricepsProgress = tricepsProgress + tricepsTally
        defaults.set(tricepsProgress, forKey: Keys.tricepsProgress)
        defaults.set(tricepsMax, forKey: Keys.tricepsMax)
        defaults.removeObject(forKey: Keys.tricepsTally)
        
        //QUADS
        
        var quadsTally = defaults.float(forKey: Keys.quadsTally)
        var quadsProgress = defaults.float(forKey: Keys.quadsProgress)
        var quadsMax = defaults.float(forKey: Keys.quadsMax)
        var quadsProgressForText = defaults.float(forKey: Keys.quadsProgressInt)
        quadsProgressForText = quadsProgressForText + quadsTally
        defaults.set(quadsProgressForText, forKey: Keys.quadsProgressInt)
        if (quadsMax == 0.0){quadsMax = 12}
        quadsTally = (1.0 / quadsMax) * quadsTally
        quadsProgress = quadsProgress + quadsTally
        defaults.set(quadsProgress, forKey: Keys.quadsProgress)
        defaults.set(quadsMax, forKey: Keys.quadsMax)
        defaults.removeObject(forKey: Keys.quadsTally)
        
        //ABS
        
        var absTally = defaults.float(forKey: Keys.absTally)
        var absProgress = defaults.float(forKey: Keys.absProgress)
        var absMax = defaults.float(forKey: Keys.absMax)
        var absProgressForText = defaults.float(forKey: Keys.absProgressInt)
        absProgressForText = absProgressForText + absTally
        defaults.set(absProgressForText, forKey: Keys.absProgressInt)
        if (absMax == 0.0){absMax = 16}
        absTally = (1.0 / absMax) * absTally
        absProgress = absProgress + absTally
        defaults.set(absProgress, forKey: Keys.absProgress)
        defaults.set(absMax, forKey: Keys.absMax)
        defaults.removeObject(forKey: Keys.absTally)
        
        //OBLIQUES
        
        var obliquesTally = defaults.float(forKey: Keys.obliquesTally)
        var obliquesProgress = defaults.float(forKey: Keys.obliquesProgress)
        var obliquesMax = defaults.float(forKey: Keys.obliquesMax)
        var obliquesProgressForText = defaults.float(forKey: Keys.obliquesProgressInt)
        obliquesProgressForText = obliquesProgressForText + obliquesTally
        defaults.set(obliquesProgressForText, forKey: Keys.obliquesProgressInt)
        if (obliquesMax == 0.0){obliquesMax = 16}
        obliquesTally = (1.0 / obliquesMax) * obliquesTally
        obliquesProgress = obliquesProgress + obliquesTally
        defaults.set(obliquesProgress, forKey: Keys.obliquesProgress)
        defaults.set(obliquesMax, forKey: Keys.obliquesMax)
        defaults.removeObject(forKey: Keys.obliquesTally)
        
        //SERRATUS
        
        var serratusTally = defaults.float(forKey: Keys.serratusTally)
        var serratusProgress = defaults.float(forKey: Keys.serratusProgress)
        var serratusMax = defaults.float(forKey: Keys.serratusMax)
        var serratusProgressForText = defaults.float(forKey: Keys.serratusProgressInt)
        serratusProgressForText = serratusProgressForText + serratusTally
        defaults.set(serratusProgressForText, forKey: Keys.serratusProgressInt)
        if (serratusMax == 0.0){serratusMax = 16}
        serratusTally = (1.0 / serratusMax) * serratusTally
        serratusProgress = serratusProgress + serratusTally
        defaults.set(serratusProgress, forKey: Keys.serratusProgress)
        defaults.set(serratusMax, forKey: Keys.serratusMax)
        defaults.removeObject(forKey: Keys.serratusTally)
        
        //TRANSVERSE ABS
        
        var transverseAbTally = defaults.float(forKey: Keys.transverseAbTally)
        var transverseAbProgress = defaults.float(forKey: Keys.transverseAbProgress)
        var transverseAbMax = defaults.float(forKey: Keys.transverseAbMax)
        var transverseAbProgressForText = defaults.float(forKey: Keys.transverseAbProgressInt)
        transverseAbProgressForText = transverseAbProgressForText + transverseAbTally
        defaults.set(transverseAbProgressForText, forKey: Keys.transverseAbProgressInt)
        if (transverseAbMax == 0.0){transverseAbMax = 16}
        transverseAbTally = (1.0 / transverseAbMax) * transverseAbTally
        transverseAbProgress = transverseAbProgress + transverseAbTally
        defaults.set(transverseAbProgress, forKey: Keys.transverseAbProgress)
        defaults.set(transverseAbMax, forKey: Keys.transverseAbMax)
        defaults.removeObject(forKey: Keys.transverseAbTally)
        
        //CALVES
        
        var calvesTally = defaults.float(forKey: Keys.calvesTally)
        var calvesProgress = defaults.float(forKey: Keys.calvesProgress)
        var calvesMax = defaults.float(forKey: Keys.calvesMax)
        var calvesProgressForText = defaults.float(forKey: Keys.calvesProgressInt)
        calvesProgressForText = calvesProgressForText + calvesTally
        defaults.set(calvesProgressForText, forKey: Keys.calvesProgressInt)
        if (calvesMax == 0.0){calvesMax = 12}
        calvesTally = (1.0 / calvesMax) * calvesTally
        calvesProgress = calvesProgress + calvesTally
        defaults.set(calvesProgress, forKey: Keys.calvesProgress)
        defaults.set(calvesMax, forKey: Keys.calvesMax)
        defaults.removeObject(forKey: Keys.calvesTally)
        
        //NECK
        
        var neckTally = defaults.float(forKey: Keys.neckTally)
        var neckProgress = defaults.float(forKey: Keys.neckProgress)
        var neckMax = defaults.float(forKey: Keys.neckMax)
        var neckProgressForText = defaults.float(forKey: Keys.neckProgressInt)
        neckProgressForText = neckProgressForText + neckTally
        defaults.set(neckProgressForText, forKey: Keys.neckProgressInt)
        if (neckMax == 0.0){neckMax = 10}
        neckTally = (1.0 / neckMax) * neckTally
        neckProgress = neckProgress + neckTally
        defaults.set(neckProgress, forKey: Keys.neckProgress)
        defaults.set(neckMax, forKey: Keys.neckMax)
        defaults.removeObject(forKey: Keys.neckTally)
        
        //FOREARM EXTENSORS
        
        var forearmExtensorsTally = defaults.float(forKey: Keys.forearmExtensorsTally)
        var forearmExtensorsProgress = defaults.float(forKey: Keys.forearmExtensorsProgress)
        var forearmExtensorsMax = defaults.float(forKey: Keys.forearmExtensorsMax)
        var forearmExtensorsProgressForText = defaults.float(forKey: Keys.forearmExtensorsProgressInt)
        forearmExtensorsProgressForText = forearmExtensorsProgressForText + forearmExtensorsTally
        defaults.set(forearmExtensorsProgressForText, forKey: Keys.forearmExtensorsProgressInt)
        if (forearmExtensorsMax == 0.0){forearmExtensorsMax = 10}
        forearmExtensorsTally = (1.0 / forearmExtensorsMax) * forearmExtensorsTally
        forearmExtensorsProgress = forearmExtensorsProgress + forearmExtensorsTally
        defaults.set(forearmExtensorsProgress, forKey: Keys.forearmExtensorsProgress)
        defaults.set(forearmExtensorsMax, forKey: Keys.forearmExtensorsMax)
        defaults.removeObject(forKey: Keys.forearmExtensorsTally)
        
        //ULNAR FOREARM
        
        var ulnarForearmTally = defaults.float(forKey: Keys.ulnarForearmTally)
        var ulnarForearmProgress = defaults.float(forKey: Keys.ulnarForearmProgress)
        var ulnarForearmMax = defaults.float(forKey: Keys.ulnarForearmMax)
        var ulnarForearmProgressForText = defaults.float(forKey: Keys.ulnarForearmProgressInt)
        ulnarForearmProgressForText = ulnarForearmProgressForText + ulnarForearmTally
        defaults.set(ulnarForearmProgressForText, forKey: Keys.ulnarForearmProgressInt)
        if (ulnarForearmMax == 0.0){ulnarForearmMax = 10}
        ulnarForearmTally = (1.0 / ulnarForearmMax) * ulnarForearmTally
        ulnarForearmProgress = ulnarForearmProgress + ulnarForearmTally
        defaults.set(ulnarForearmProgress, forKey: Keys.ulnarForearmProgress)
        defaults.set(ulnarForearmMax, forKey: Keys.ulnarForearmMax)
        defaults.removeObject(forKey: Keys.ulnarForearmTally)
        
        
        //FOREARM FLEXORS
        
        var forearmFlexorsTally = defaults.float(forKey: Keys.forearmFlexorsTally)
        var forearmFlexorsProgress = defaults.float(forKey: Keys.forearmFlexorsProgress)
        var forearmFlexorsMax = defaults.float(forKey: Keys.forearmFlexorsMax)
        var forearmFlexorsProgressForText = defaults.float(forKey: Keys.forearmFlexorsProgressInt)
        forearmFlexorsProgressForText = forearmFlexorsProgressForText + forearmFlexorsTally
        defaults.set(forearmFlexorsProgressForText, forKey: Keys.forearmFlexorsProgressInt)
        if (forearmFlexorsMax == 0.0){forearmFlexorsMax = 10}
        forearmFlexorsTally = (1.0 / forearmFlexorsMax) * forearmFlexorsTally
        forearmFlexorsProgress = forearmFlexorsProgress + forearmFlexorsTally
        defaults.set(forearmFlexorsProgress, forKey: Keys.forearmFlexorsProgress)
        defaults.set(forearmFlexorsMax, forKey: Keys.forearmFlexorsMax)
        defaults.removeObject(forKey: Keys.forearmFlexorsTally)
        
        
        //RADIAL FOREARM
        
        var radialForearmTally = defaults.float(forKey: Keys.radialForearmTally)
        var radialForearmProgress = defaults.float(forKey: Keys.radialForearmProgress)
        var radialForearmMax = defaults.float(forKey: Keys.radialForearmMax)
        var radialForearmProgressForText = defaults.float(forKey: Keys.radialForearmProgressInt)
        radialForearmProgressForText = radialForearmProgressForText + radialForearmTally
        defaults.set(radialForearmProgressForText, forKey: Keys.radialForearmProgressInt)
        if (radialForearmMax == 0.0){radialForearmMax = 10}
        radialForearmTally = (1.0 / radialForearmMax) * radialForearmTally
        radialForearmProgress = radialForearmProgress + radialForearmTally
        defaults.set(radialForearmProgress, forKey: Keys.radialForearmProgress)
        defaults.set(radialForearmMax, forKey: Keys.radialForearmMax)
        defaults.removeObject(forKey: Keys.radialForearmTally)
        
        //SPINAL ERECTORS
        
        var spinalErectorsTally = defaults.float(forKey: Keys.spinalErectorsTally)
        var spinalErectorsProgress = defaults.float(forKey: Keys.spinalErectorsProgress)
        var spinalErectorsMax = defaults.float(forKey: Keys.spinalErectorsMax)
        var spinalErectorsProgressForText = defaults.float(forKey: Keys.spinalErectorsProgressInt)
        spinalErectorsProgressForText = spinalErectorsProgressForText + spinalErectorsTally
        defaults.set(spinalErectorsProgressForText, forKey: Keys.spinalErectorsProgressInt)
        if (spinalErectorsMax == 0.0){spinalErectorsMax = 10}
        spinalErectorsTally = (1.0 / spinalErectorsMax) * spinalErectorsTally
        spinalErectorsProgress = spinalErectorsProgress + spinalErectorsTally
        defaults.set(spinalErectorsProgress, forKey: Keys.spinalErectorsProgress)
        defaults.set(spinalErectorsMax, forKey: Keys.spinalErectorsMax)
        defaults.removeObject(forKey: Keys.spinalErectorsTally)
        
        //UPPER TRAPS
        
        var upperTrapsTally = defaults.float(forKey: Keys.upperTrapsTally)
        var upperTrapsProgress = defaults.float(forKey: Keys.upperTrapsProgress)
        var upperTrapsMax = defaults.float(forKey: Keys.upperTrapsMax)
        var upperTrapsProgressForText = defaults.float(forKey: Keys.upperTrapsProgressInt)
        upperTrapsProgressForText = upperTrapsProgressForText + upperTrapsTally
        defaults.set(upperTrapsProgressForText, forKey: Keys.upperTrapsProgressInt)
        if (upperTrapsMax == 0.0){upperTrapsMax = 10}
        upperTrapsTally = (1.0 / upperTrapsMax) * upperTrapsTally
        upperTrapsProgress = upperTrapsProgress + upperTrapsTally
        defaults.set(upperTrapsProgress, forKey: Keys.upperTrapsProgress)
        defaults.set(upperTrapsMax, forKey: Keys.upperTrapsMax)
        defaults.removeObject(forKey: Keys.upperTrapsTally)
       

        
        //LOWER TRAPS
        
        var lowerTrapsTally = defaults.float(forKey: Keys.lowerTrapsTally)
        var lowerTrapsProgress = defaults.float(forKey: Keys.lowerTrapsProgress)
        var lowerTrapsMax = defaults.float(forKey: Keys.lowerTrapsMax)
        var lowerTrapsProgressForText = defaults.float(forKey: Keys.lowerTrapsProgressInt)
        lowerTrapsProgressForText = lowerTrapsProgressForText + lowerTrapsTally
        defaults.set(lowerTrapsProgressForText, forKey: Keys.lowerTrapsProgressInt)
        if (lowerTrapsMax == 0.0){lowerTrapsMax = 12}
        lowerTrapsTally = (1.0 / lowerTrapsMax) * lowerTrapsTally
        lowerTrapsProgress = lowerTrapsProgress + lowerTrapsTally
        defaults.set(lowerTrapsProgress, forKey: Keys.lowerTrapsProgress)
        defaults.set(lowerTrapsMax, forKey: Keys.lowerTrapsMax)
        defaults.removeObject(forKey: Keys.lowerTrapsTally)

    
        VtData = [chestProgressForText, chestMax, chestProgress, bicepsProgressForText, bicepsMax, bicepsProgress, latsProgressForText, latsMax, latsProgress, glutesProgressForText, glutesMax, glutesProgress, gluteMediusProgressForText, gluteMediusMax, gluteMediusProgress, hamstringsProgressForText, hamstringsMax, hamstringsProgress, frontShoulderProgressForText, frontShoulderMax, frontShoulderProgress, lateralShoulderProgressForText, lateralShoulderMax, lateralShoulderProgress, backShoulderProgressForText, backShoulderMax, backShoulderProgress, rotatorCuffProgressForText, rotatorCuffMax, rotatorCuffProgress, tricepsProgressForText, tricepsMax, tricepsProgress, quadsProgressForText, quadsMax, quadsProgress, absProgressForText, absMax, absProgress, obliquesProgressForText, obliquesMax, obliquesProgress, serratusProgressForText, serratusMax, serratusProgress, transverseAbProgressForText, transverseAbMax, transverseAbProgress, calvesProgressForText, calvesMax, calvesProgress, neckProgressForText, neckMax, neckProgress, forearmExtensorsProgressForText, forearmExtensorsMax, forearmExtensorsProgress, ulnarForearmProgressForText, ulnarForearmMax, ulnarForearmProgress, forearmFlexorsProgressForText, forearmFlexorsMax, forearmFlexorsProgress, radialForearmProgressForText, radialForearmMax, radialForearmProgress, spinalErectorsProgressForText, spinalErectorsMax, spinalErectorsProgress, upperTrapsProgressForText, upperTrapsMax, upperTrapsProgress, lowerTrapsProgressForText, lowerTrapsMax, lowerTrapsProgress]
        
        
        videos =  createArray(vtData: VtData)
        }
    
    
    func createArray(vtData: [Float]) -> [Video] {
        
        let exercise1  = Video(image: #imageLiteral(resourceName: "Dumbell Icon.jpg"), title: "Chest",            progressText: String(String(VtData[0]) + "/" + String(VtData[1])), mavText: "MAV: 12-20 FREQ: 2-3", progressFloat: vtData[2])
        let exercise2  = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Biceps",           progressText: String(String(VtData[3]) + "/" + String(VtData[4])), mavText: "MAV: 14-20 FREQ: 2-6",  progressFloat: vtData[5] )
        let exercise3  = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Lats",             progressText: String(String(VtData[6]) + "/" + String(VtData[7])), mavText: "MAV: 12-22 FREQ: 2-4",  progressFloat: vtData[8])
        let exercise4  = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Glutes",           progressText: String(String(VtData[9]) + "/" + String(VtData[10])), mavText: "MAV: 4-12 FREQ: 2-4",  progressFloat: vtData[11])
        let exercise5  = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Glute Medius",     progressText: String(String(VtData[12]) + "/" + String(VtData[13])), mavText: "MAV: 12-15 FREQ: 2-4",  progressFloat: vtData[14])
        let exercise6  = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Hamstrings",       progressText: String(String(VtData[15]) + "/" + String(VtData[16])), mavText: "MAV: 10-16 FREQ: 2-3",  progressFloat: vtData[17])
        let exercise7  = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Front Shoulder",   progressText: String(String(VtData[18]) + "/" + String(VtData[19])), mavText: "MAV: 16-22 FREQ: 1-2",  progressFloat: vtData[20])
        let exercise8  = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Lateral Shoulder", progressText: String(String(VtData[21]) + "/" + String(VtData[22])), mavText: "MAV: 16-22 FREQ: 2-6",  progressFloat: vtData[23])
        let exercise9  = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Back Shoulder",    progressText: String(String(VtData[24]) + "/" + String(VtData[25])), mavText: "MAV: 16-22 FREQ: 2-6",  progressFloat: vtData[26])
        let exercise10 = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Rotator Cuff",     progressText: String(String(VtData[27]) + "/" + String(VtData[28])), mavText: "MAV: 12-20 FREQ: 3-6",  progressFloat: vtData[29])
        let exercise11 = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Triceps",          progressText: String(String(VtData[30]) + "/" + String(VtData[31])), mavText: "MAV: 10-14 FREQ: 2-4",  progressFloat: vtData[32])
        let exercise12 = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Quads",            progressText: String(String(VtData[33]) + "/" + String(VtData[34])), mavText: "MAV: 12-18 FREQ: 1.5-3",  progressFloat: vtData[35] )
        let exercise13 = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Abs",              progressText: String(String(VtData[36]) + "/" + String(VtData[37])), mavText: "MAV: 16-20 FREQ: 3-5",  progressFloat: vtData[38])
        let exercise14 = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Obliques",         progressText: String(String(VtData[39]) + "/" + String(VtData[40])), mavText: "MAV: 16-20 FREQ: 3-5",  progressFloat: vtData[41])
        let exercise15 = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Serratus",         progressText: String(String(VtData[42]) + "/" + String(VtData[43])), mavText: "MAV: 16-20 FREQ: 3-5",  progressFloat: vtData[44])
        let exercise16 = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Transverse Ab",    progressText: String(String(VtData[45]) + "/" + String(VtData[46])), mavText: "MAV: 16-20 FREQ: 3-5",  progressFloat: vtData[47])
        let exercise17 = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Calves",           progressText: String(String(VtData[48]) + "/" + String(VtData[49])), mavText: "MAV: 12-16 FREQ: 2-4",  progressFloat: vtData[50])
        let exercise18 = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Neck",             progressText: String(String(VtData[51]) + "/" + String(VtData[52])), mavText: "MAV: 10-16 FREQ: 2-3",  progressFloat: vtData[53])
        let exercise19 = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Forearm Extensors",progressText: String(String(VtData[54]) + "/" + String(VtData[55])), mavText: "MAV: 10-20 FREQ: 2-6",  progressFloat: vtData[56])
        let exercise20 = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Ulnar Forearm",    progressText: String(String(VtData[57]) + "/" + String(VtData[58])), mavText: "MAV: 10-20 FREQ: 2-6",  progressFloat: vtData[59])
        let exercise21 = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Forearm Flexors",  progressText: String(String(VtData[60]) + "/" + String(VtData[61])), mavText: "MAV: 10-20 FREQ: 2-6",  progressFloat: vtData[62])
        let exercise22 = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Radial Forearm",   progressText: String(String(VtData[63]) + "/" + String(VtData[64])), mavText: "MAV: 10-20 FREQ: 2-6",  progressFloat: vtData[65])
        let exercise23 = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Spinal Erectors",  progressText: String(String(VtData[66]) + "/" + String(VtData[67])), mavText: "MAV: 10-15 FREQ: 2-4",  progressFloat: vtData[68])
        let exercise24 = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Upper Traps",      progressText: String(String(VtData[69]) + "/" + String(VtData[70])), mavText: "MAV: 10-20 FREQ: 2-6",  progressFloat: vtData[71])
        let exercise25 = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Lower Traps",      progressText: String(String(VtData[72]) + "/" + String(VtData[73])), mavText: "MAV: 12-20 FREQ: 2-6",  progressFloat: vtData[74])
        let exercise26 = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title:"Reset All",      progressText: String(String(VtData[72]) + "/" + String(VtData[73])), mavText: " ",  progressFloat: vtData[74])
        
        
        //Premium
//        let exercise26 = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Brachialis", progressText: "00.0/00", mavText: "MAV: 16-22 FREQ: 2-6", progressFloat: progressFloat: vtData[0])
//        let exercise27 = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Neck Extension", progressText: "00.0/00", mavText: "MAV: 16-22 FREQ: 2-6", progressFloat: progressFloat: vtData[0])
//        let exercise28 = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Neck Felxion", progressText: "00.0/00", mavText: "MAV: 16-22 FREQ: 2-6", progressFloat: progressFloat: vtData[0])
//        let exercise29 = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Neck Lateral Felxion", progressText: "00.0/00", mavText: "MAV: 16-22 FREQ: 2-6", progressFloat: progressFloat: vtData[0])
//        let exercise30 = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Anterior Tibialis", progressText: "00.0/00", mavText: "MAV: 16-22 FREQ: 2-6", progressFloat: progressFloat: vtData[0])
//
           
        return [exercise1, exercise2, exercise3, exercise4, exercise5, exercise6, exercise7, exercise8,
                exercise9, exercise10, exercise11, exercise12, exercise13, exercise14, exercise15, exercise16,
                exercise17, exercise18, exercise19, exercise20, exercise21, exercise22, exercise23, exercise24, exercise25, exercise26]
    }
    
    func styleButton(button: UIButton){
        button.backgroundColor = .clear
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
    }
    
}

extension VideoListScreen: VideoCellDelegate {
    
    func didTapAddSet(title: String) {
        if (title == "Reset All"){
           
            defaults.removeObject(forKey: Keys.chestProgress)
            defaults.removeObject(forKey: Keys.chestProgressInt)
            defaults.removeObject(forKey: Keys.bicepsProgress)
            defaults.removeObject(forKey: Keys.bicepsProgressInt)
            defaults.removeObject(forKey: Keys.latsProgress)
            defaults.removeObject(forKey: Keys.glutesProgress)
            defaults.removeObject(forKey: Keys.gluteMediusProgress)
            defaults.removeObject(forKey: Keys.hamstringsProgress)
            defaults.removeObject(forKey: Keys.frontShoulderProgress)
            defaults.removeObject(forKey: Keys.lateralShoulderProgress)
            defaults.removeObject(forKey: Keys.backShoulderProgress)
            defaults.removeObject(forKey: Keys.frontShoulderProgress)
            defaults.removeObject(forKey: Keys.rotatorCuffProgress)
            defaults.removeObject(forKey: Keys.tricepsProgress)
            defaults.removeObject(forKey: Keys.quadsProgress)
            defaults.removeObject(forKey: Keys.absProgress)
            defaults.removeObject(forKey: Keys.obliquesProgress)
            defaults.removeObject(forKey: Keys.serratusProgress)
            defaults.removeObject(forKey: Keys.transverseAbProgress)
            defaults.removeObject(forKey: Keys.calvesProgress)
            defaults.removeObject(forKey: Keys.neckProgress)
            defaults.removeObject(forKey: Keys.forearmExtensorsProgress)
            defaults.removeObject(forKey: Keys.ulnarForearmProgress)
            defaults.removeObject(forKey: Keys.forearmFlexorsProgress)
            defaults.removeObject(forKey: Keys.radialForearmProgress)
            defaults.removeObject(forKey: Keys.spinalErectorsProgress)
            defaults.removeObject(forKey: Keys.upperTrapsProgress)
            defaults.removeObject(forKey: Keys.lowerTrapsProgress)

            reloadInputViews()

        } else {
            
       let muscleGroup = String(title)
       defaults.set(muscleGroup, forKey: Keys.muscle)
       let storyboard = UIStoryboard(name: "Main", bundle: nil)
       let Exercises = storyboard.instantiateViewController(identifier: "Exercises")
       self.show(Exercises, sender: self)
       self.dismiss(animated: true, completion: nil)
            
        }
    }
}


extension VideoListScreen: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let video = videos[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell") as! VideoCell
        cell.setVideo(video: video)
        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = [indexPath.row]
        
        if (index == [0]){
            let muscleString = "Chest"
            defaults.set(muscleString, forKey: Keys.muscleString)
        } else if (index == [1]){
            let muscleString = "Biceps"
            defaults.set(muscleString, forKey: Keys.muscleString)
        } else if (index == [2]){
            let muscleString = "Lats"
            defaults.set(muscleString, forKey: Keys.muscleString)
        } else if (index == [3]){
            let muscleString = "Glutes"
            defaults.set(muscleString, forKey: Keys.muscleString)
        } else if (index == [4]){
            let muscleString = "Glute Medius"
            defaults.set(muscleString, forKey: Keys.muscleString)
        } else if (index == [5]){
            let muscleString = "Hamstrings"
            defaults.set(muscleString, forKey: Keys.muscleString)
        } else if (index == [6]){
            let muscleString = "Front Shoulder"
            defaults.set(muscleString, forKey: Keys.muscleString)
        } else if (index == [7]){
            let muscleString = "Lateral Shoulder"
            defaults.set(muscleString, forKey: Keys.muscleString)
        } else if (index == [8]){
            let muscleString = "Back Shoulder"
            defaults.set(muscleString, forKey: Keys.muscleString)
        } else if (index == [9]){
            let muscleString = "Rotator Cuff"
            defaults.set(muscleString, forKey: Keys.muscleString)
        } else if (index == [10]){
            let muscleString = "Triceps"
            defaults.set(muscleString, forKey: Keys.muscleString)
        } else if (index == [11]){
            let muscleString = "Quads"
            defaults.set(muscleString, forKey: Keys.muscleString)
        } else if (index == [12]){
            let muscleString = "Abs"
            defaults.set(muscleString, forKey: Keys.muscleString)
        } else if (index == [13]){
            let muscleString = "Obliques"
            defaults.set(muscleString, forKey: Keys.muscleString)
        } else if (index == [14]){
            let muscleString = "Serratus"
            defaults.set(muscleString, forKey: Keys.muscleString)
        } else if (index == [15]){
            let muscleString = "Transverse Ab"
            defaults.set(muscleString, forKey: Keys.muscleString)
        } else if (index == [16]){
            let muscleString = "Calves"
            defaults.set(muscleString, forKey: Keys.muscleString)
        } else if (index == [17]){
            let muscleString = "Neck"
            defaults.set(muscleString, forKey: Keys.muscleString)
        } else if (index == [18]){
            let muscleString = "Forearm Extensors"
            defaults.set(muscleString, forKey: Keys.muscleString)
        } else if (index == [19]){
            let muscleString = "Ulnar Forearm"
            defaults.set(muscleString, forKey: Keys.muscleString)
        } else if (index == [20]){
            let muscleString = "Forearm Flexors"
            defaults.set(muscleString, forKey: Keys.muscleString)
        } else if (index == [21]){
            let muscleString = "Radial Forearm"
            defaults.set(muscleString, forKey: Keys.muscleString)
        } else if (index == [22]){
            let muscleString = "Spinal Erectors"
            defaults.set(muscleString, forKey: Keys.muscleString)
        } else if (index == [23]){
            let muscleString = "Upper Traps"
            defaults.set(muscleString, forKey: Keys.muscleString)
        } else if (index == [24]){
            let muscleString = "Lower Traps"
            defaults.set(muscleString, forKey: Keys.muscleString)
        }
       }
}






