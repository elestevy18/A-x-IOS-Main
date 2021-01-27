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
import Floaty
import GoogleMobileAds
import StoreKit

class VideoListScreen: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addSetButton: UIButton!
    @IBOutlet weak var bWFAB: UIButton!
    @IBOutlet weak var exercisesFAB: UIButton!
    
    var videos: [Video] = []
    var VtData: [Float]        = []
    let defaults        = UserDefaults.standard
    var chestProgress   = Float()
    var installDate = Date()
    var expired = Bool()
    
     
 
    
 
    private var interstitialAd: GADInterstitial?
    
    struct Constants{
        static let volumeAD = "ca-app-pub-3950672419252348/8930486777"
    }
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstTime = defaults.bool(forKey: Save.firstTime)
        
        if (!firstTime) {
            let FAQAction = UIAlertAction(title: "Go to FAQ", style: UIAlertAction.Style.default) {
                UIAlertAction in
                NSLog("FAq pressed")
                //  UIApplication.shared.openURL(NSURL(string: "")! as URL)
                guard let url = URL(string: "http://aesthet-x.com/faqs/") else {
                  return //be safe
                }

                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                } else {
                    UIApplication.shared.openURL(url)
                }
                self.defaults.set(true, forKey: Save.firstTime)
            }
            
            let OKAction = UIAlertAction(title: "I'm OK", style: UIAlertAction.Style.default) {
                UIAlertAction in
                NSLog("I'm OK Pressed")
                self.defaults.set(true, forKey: Save.firstTime)
            }
            let alert = UIAlertController(title: "Welcome", message: "Check out the FAQ page to get you up to speed on how to train properly and how to use the app. If you are new to fitness we know there's a lot to learn. We got you covered.If you want to check it out in the future you can click on the red 'FAQ' button under 'Dashboard'.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(OKAction)
            alert.addAction(FAQAction)
            self.present(alert, animated: true, completion: nil)
        }
        
        self.navigationItem.setHidesBackButton(true, animated: true);
       
        
        //ADS
        self.interstitialAd = createAd()
        print("line below creating ad")
        
        //Set logo in navigation bar and make it clickable
          
          let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
          imageView.contentMode = .scaleAspectFit
          let image = UIImage(named: "aesthetx30times100")
          imageView.image = image
          navigationItem.titleView = imageView
          let recognizer = UITapGestureRecognizer(target: self, action: #selector(VideoListScreen.titleWasTapped))
          navigationItem.titleView?.isUserInteractionEnabled = true
          navigationItem.titleView?.addGestureRecognizer(recognizer)
        //GIVE TABLE VIEW EXTRA SPACE FOR THE FABS
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
        self.tableView.contentInset = insets
        
        //Style FABS
        
        styleButton(button: bWFAB)
        bWFAB.layer.cornerRadius = bWFAB.frame.height/2
        bWFAB.contentHorizontalAlignment = .center
        bWFAB.contentEdgeInsets = UIEdgeInsets(top: 10, left: 8, bottom: 10, right: 7)
        
        styleButton(button: exercisesFAB)
        exercisesFAB.layer.cornerRadius = exercisesFAB.frame.height/2
        exercisesFAB.contentHorizontalAlignment = .center
        exercisesFAB.contentEdgeInsets = UIEdgeInsets(top: 10, left: 8, bottom: 10, right: 7)
        
        /*Decalre variable for tallies to be added to progress bar
        muscleTally  is the sets to be addes
        muscleProgress is the currentweek'ss progress.
        muscleMax is the default or user defined MAximum recoverable volume
        muslceprogressForText is muscle progress multiplied by ten and rounded because regular muscle progress is accounting for the fixed 1.0 max value of apples stupid ass progres bars >>>:((( angry developer
        
        */
        //CHEST
        
        var chestTally = defaults.float(forKey: Save.chestTally)
        var chestProgress = defaults.float(forKey: Save.chestProgress)
        var chestMax = defaults.float(forKey: Save.chestMax)
        var chestProgressForText = defaults.float(forKey: Save.chestProgressInt)
        chestProgressForText = chestProgressForText + chestTally
        defaults.set(chestProgressForText, forKey: Save.chestProgressInt)
        if (chestMax == 0.0){chestMax = 12}
        chestTally = (1.0 / chestMax) * chestTally
        chestProgress = chestProgress + chestTally
        defaults.set(chestProgress, forKey: Save.chestProgress)
        defaults.set(chestMax, forKey: Save.chestMax)
        defaults.removeObject(forKey: Save.chestTally)
        print(chestMax)
        
        //BICEPS
        
        var bicepsTally = defaults.float(forKey: Save.bicepsTally)
        var bicepsProgress = defaults.float(forKey: Save.bicepsProgress)
        var bicepsMax = defaults.float(forKey: Save.bicepsMax)
        var bicepsProgressForText = defaults.float(forKey: Save.bicepsProgressInt)
        bicepsProgressForText = bicepsProgressForText + bicepsTally
        defaults.set(bicepsProgressForText, forKey: Save.bicepsProgressInt)
        if (bicepsMax == 0.0){bicepsMax = 14}
        bicepsTally = (1.0 / bicepsMax) * bicepsTally
        bicepsProgress = bicepsProgress + bicepsTally
        defaults.set(bicepsProgress, forKey: Save.bicepsProgress)
        defaults.set(bicepsMax, forKey: Save.bicepsMax)
        defaults.removeObject(forKey: Save.bicepsTally)
        
        //LATS
        
        var latsTally = defaults.float(forKey: Save.latsTally)
        var latsProgress = defaults.float(forKey: Save.latsProgress)
        var latsMax = defaults.float(forKey: Save.latsMax)
        var latsProgressForText = defaults.float(forKey: Save.latsProgressInt)
        latsProgressForText = latsProgressForText + latsTally
        defaults.set(latsProgressForText, forKey: Save.latsProgressInt)
        if (latsMax == 0.0){latsMax = 12}
        latsTally = (1.0 / latsMax) * latsTally
        latsProgress = latsProgress + latsTally
        defaults.set(latsProgress, forKey: Save.latsProgress)
        defaults.set(latsMax, forKey: Save.latsMax)
        defaults.removeObject(forKey: Save.latsTally)
        
        //GLUTES
        
        var glutesTally = defaults.float(forKey: Save.glutesTally)
        var glutesProgress = defaults.float(forKey: Save.glutesProgress)
        var glutesMax = defaults.float(forKey: Save.glutesMax)
        var glutesProgressForText = defaults.float(forKey: Save.glutesProgressInt)
        glutesProgressForText = glutesProgressForText + glutesTally
        defaults.set(glutesProgressForText, forKey: Save.glutesProgressInt)
        if (glutesMax == 0.0){glutesMax = 4}
        glutesTally = (1.0 / glutesMax) * glutesTally
        glutesProgress = glutesProgress + glutesTally
        defaults.set(glutesProgress, forKey: Save.glutesProgress)
        defaults.set(glutesMax, forKey: Save.glutesMax)
        defaults.removeObject(forKey: Save.glutesTally)
        
        //GLUTE MEDIUS
        
        var gluteMediusTally = defaults.float(forKey: Save.gluteMediusTally)
        var gluteMediusProgress = defaults.float(forKey: Save.gluteMediusProgress)
        var gluteMediusMax = defaults.float(forKey: Save.gluteMediusMax)
        var gluteMediusProgressForText = defaults.float(forKey: Save.gluteMediusProgressInt)
        gluteMediusProgressForText = gluteMediusProgressForText + gluteMediusTally
        defaults.set(gluteMediusProgressForText, forKey: Save.gluteMediusProgressInt)
        if (gluteMediusMax == 0.0){gluteMediusMax = 12}
        gluteMediusTally = (1.0 / gluteMediusMax) * gluteMediusTally
        gluteMediusProgress = gluteMediusProgress + gluteMediusTally
        defaults.set(gluteMediusProgress, forKey: Save.gluteMediusProgress)
        defaults.set(gluteMediusMax, forKey: Save.gluteMediusMax)
        defaults.removeObject(forKey: Save.gluteMediusTally)
        
        //HAMSTRINGS
        
        var hamstringsTally = defaults.float(forKey: Save.hamstringsTally)
        var hamstringsProgress = defaults.float(forKey: Save.hamstringsProgress)
        var hamstringsMax = defaults.float(forKey: Save.hamstringsMax)
        var hamstringsProgressForText = defaults.float(forKey: Save.hamstringsProgressInt)
        hamstringsProgressForText = hamstringsProgressForText + hamstringsTally
        defaults.set(hamstringsProgressForText, forKey: Save.hamstringsProgressInt)
        if (hamstringsMax == 0.0){hamstringsMax = 10}
        hamstringsTally = (1.0 / hamstringsMax) * hamstringsTally
        hamstringsProgress = hamstringsProgress + hamstringsTally
        defaults.set(hamstringsProgress, forKey: Save.hamstringsProgress)
        defaults.set(hamstringsMax, forKey: Save.hamstringsMax)
        defaults.removeObject(forKey: Save.hamstringsTally)
        
        //FRONTSHOULDER
        
        var frontShoulderTally = defaults.float(forKey: Save.frontShoulderTally)
        var frontShoulderProgress = defaults.float(forKey: Save.frontShoulderProgress)
        var frontShoulderMax = defaults.float(forKey: Save.frontShoulderMax)
        var frontShoulderProgressForText = defaults.float(forKey: Save.frontShoulderProgressInt)
        frontShoulderProgressForText = frontShoulderProgressForText + frontShoulderTally
        defaults.set(frontShoulderProgressForText, forKey: Save.frontShoulderProgressInt)
        if (frontShoulderMax == 0.0){frontShoulderMax = 16}
        frontShoulderTally = (1.0 / frontShoulderMax) * frontShoulderTally
        frontShoulderProgress = frontShoulderProgress + frontShoulderTally
        defaults.set(frontShoulderProgress, forKey: Save.frontShoulderProgress)
        defaults.set(frontShoulderMax, forKey: Save.frontShoulderMax)
        defaults.removeObject(forKey: Save.frontShoulderTally)
        
        //LATERALSHOULDER
        
        var lateralShoulderTally = defaults.float(forKey: Save.lateralShoulderTally)
        var lateralShoulderProgress = defaults.float(forKey: Save.lateralShoulderProgress)
        var lateralShoulderMax = defaults.float(forKey: Save.lateralShoulderMax)
        var lateralShoulderProgressForText = defaults.float(forKey: Save.lateralShoulderProgressInt)
        lateralShoulderProgressForText = lateralShoulderProgressForText + lateralShoulderTally
        defaults.set(lateralShoulderProgressForText, forKey: Save.lateralShoulderProgressInt)
        if (lateralShoulderMax == 0.0){lateralShoulderMax = 16}
        lateralShoulderTally = (1.0 / lateralShoulderMax) * lateralShoulderTally
        lateralShoulderProgress = lateralShoulderProgress + lateralShoulderTally
        defaults.set(lateralShoulderProgress, forKey: Save.lateralShoulderProgress)
        defaults.set(lateralShoulderMax, forKey: Save.lateralShoulderMax)
        defaults.removeObject(forKey: Save.lateralShoulderTally)
        
        //BACKSHOULDER
        
        var backShoulderTally = defaults.float(forKey: Save.backShoulderTally)
        var backShoulderProgress = defaults.float(forKey: Save.backShoulderProgress)
        var backShoulderMax = defaults.float(forKey: Save.backShoulderMax)
        var backShoulderProgressForText = defaults.float(forKey: Save.backShoulderProgressInt)
        backShoulderProgressForText = backShoulderProgressForText + backShoulderTally
        defaults.set(backShoulderProgressForText, forKey: Save.backShoulderProgressInt)
        if (backShoulderMax == 0.0){backShoulderMax = 16}
        backShoulderTally = (1.0 / backShoulderMax) * backShoulderTally
        backShoulderProgress = backShoulderProgress + backShoulderTally
        defaults.set(backShoulderProgress, forKey: Save.backShoulderProgress)
        defaults.set(backShoulderMax, forKey: Save.backShoulderMax)
        defaults.removeObject(forKey: Save.backShoulderTally)
        
        //ROTATORCUFF
        
        var rotatorCuffTally = defaults.float(forKey: Save.rotatorCuffTally)
        var rotatorCuffProgress = defaults.float(forKey: Save.rotatorCuffProgress)
        var rotatorCuffMax = defaults.float(forKey: Save.rotatorCuffMax)
        var rotatorCuffProgressForText = defaults.float(forKey: Save.rotatorCuffProgressInt)
        rotatorCuffProgressForText = rotatorCuffProgressForText + rotatorCuffTally
        defaults.set(rotatorCuffProgressForText, forKey: Save.rotatorCuffProgressInt)
        if (rotatorCuffMax == 0.0){rotatorCuffMax = 12}
        rotatorCuffTally = (1.0 / rotatorCuffMax) * rotatorCuffTally
        rotatorCuffProgress = rotatorCuffProgress + rotatorCuffTally
        defaults.set(rotatorCuffProgress, forKey: Save.rotatorCuffProgress)
        defaults.set(rotatorCuffMax, forKey: Save.rotatorCuffMax)
        defaults.removeObject(forKey: Save.rotatorCuffTally)
        
        //TRICEPS
        
        var tricepsTally = defaults.float(forKey: Save.tricepsTally)
        var tricepsProgress = defaults.float(forKey: Save.tricepsProgress)
        var tricepsMax = defaults.float(forKey: Save.tricepsMax)
        var tricepsProgressForText = defaults.float(forKey: Save.tricepsProgressInt)
        tricepsProgressForText = tricepsProgressForText + tricepsTally
        defaults.set(tricepsProgressForText, forKey: Save.tricepsProgressInt)
        if (tricepsMax == 0.0){tricepsMax = 10}
        tricepsTally = (1.0 / tricepsMax) * tricepsTally
        tricepsProgress = tricepsProgress + tricepsTally
        defaults.set(tricepsProgress, forKey: Save.tricepsProgress)
        defaults.set(tricepsMax, forKey: Save.tricepsMax)
        defaults.removeObject(forKey: Save.tricepsTally)
        
        //QUADS
        
        var quadsTally = defaults.float(forKey: Save.quadsTally)
        var quadsProgress = defaults.float(forKey: Save.quadsProgress)
        var quadsMax = defaults.float(forKey: Save.quadsMax)
        var quadsProgressForText = defaults.float(forKey: Save.quadsProgressInt)
        quadsProgressForText = quadsProgressForText + quadsTally
        defaults.set(quadsProgressForText, forKey: Save.quadsProgressInt)
        if (quadsMax == 0.0){quadsMax = 12}
        quadsTally = (1.0 / quadsMax) * quadsTally
        quadsProgress = quadsProgress + quadsTally
        defaults.set(quadsProgress, forKey: Save.quadsProgress)
        defaults.set(quadsMax, forKey: Save.quadsMax)
        defaults.removeObject(forKey: Save.quadsTally)
        
        //ABS
        
        var absTally = defaults.float(forKey: Save.absTally)
        var absProgress = defaults.float(forKey: Save.absProgress)
        var absMax = defaults.float(forKey: Save.absMax)
        var absProgressForText = defaults.float(forKey: Save.absProgressInt)
        absProgressForText = absProgressForText + absTally
        defaults.set(absProgressForText, forKey: Save.absProgressInt)
        if (absMax == 0.0){absMax = 16}
        absTally = (1.0 / absMax) * absTally
        absProgress = absProgress + absTally
        defaults.set(absProgress, forKey: Save.absProgress)
        defaults.set(absMax, forKey: Save.absMax)
        defaults.removeObject(forKey: Save.absTally)
        
        //OBLIQUES
        
        var obliquesTally = defaults.float(forKey: Save.obliquesTally)
        var obliquesProgress = defaults.float(forKey: Save.obliquesProgress)
        var obliquesMax = defaults.float(forKey: Save.obliquesMax)
        var obliquesProgressForText = defaults.float(forKey: Save.obliquesProgressInt)
        obliquesProgressForText = obliquesProgressForText + obliquesTally
        defaults.set(obliquesProgressForText, forKey: Save.obliquesProgressInt)
        if (obliquesMax == 0.0){obliquesMax = 16}
        obliquesTally = (1.0 / obliquesMax) * obliquesTally
        obliquesProgress = obliquesProgress + obliquesTally
        defaults.set(obliquesProgress, forKey: Save.obliquesProgress)
        defaults.set(obliquesMax, forKey: Save.obliquesMax)
        defaults.removeObject(forKey: Save.obliquesTally)
        
        //SERRATUS
        
        var serratusTally = defaults.float(forKey: Save.serratusTally)
        var serratusProgress = defaults.float(forKey: Save.serratusProgress)
        var serratusMax = defaults.float(forKey: Save.serratusMax)
        var serratusProgressForText = defaults.float(forKey: Save.serratusProgressInt)
        serratusProgressForText = serratusProgressForText + serratusTally
        defaults.set(serratusProgressForText, forKey: Save.serratusProgressInt)
        if (serratusMax == 0.0){serratusMax = 16}
        serratusTally = (1.0 / serratusMax) * serratusTally
        serratusProgress = serratusProgress + serratusTally
        defaults.set(serratusProgress, forKey: Save.serratusProgress)
        defaults.set(serratusMax, forKey: Save.serratusMax)
        defaults.removeObject(forKey: Save.serratusTally)
        
        //TRANSVERSE ABS
        
        var transverseAbTally = defaults.float(forKey: Save.transverseAbTally)
        var transverseAbProgress = defaults.float(forKey: Save.transverseAbProgress)
        var transverseAbMax = defaults.float(forKey: Save.transverseAbMax)
        var transverseAbProgressForText = defaults.float(forKey: Save.transverseAbProgressInt)
        transverseAbProgressForText = transverseAbProgressForText + transverseAbTally
        defaults.set(transverseAbProgressForText, forKey: Save.transverseAbProgressInt)
        if (transverseAbMax == 0.0){transverseAbMax = 16}
        transverseAbTally = (1.0 / transverseAbMax) * transverseAbTally
        transverseAbProgress = transverseAbProgress + transverseAbTally
        defaults.set(transverseAbProgress, forKey: Save.transverseAbProgress)
        defaults.set(transverseAbMax, forKey: Save.transverseAbMax)
        defaults.removeObject(forKey: Save.transverseAbTally)
        
        //CALVES
        
        var calvesTally = defaults.float(forKey: Save.calvesTally)
        var calvesProgress = defaults.float(forKey: Save.calvesProgress)
        var calvesMax = defaults.float(forKey: Save.calvesMax)
        var calvesProgressForText = defaults.float(forKey: Save.calvesProgressInt)
        calvesProgressForText = calvesProgressForText + calvesTally
        defaults.set(calvesProgressForText, forKey: Save.calvesProgressInt)
        if (calvesMax == 0.0){calvesMax = 12}
        calvesTally = (1.0 / calvesMax) * calvesTally
        calvesProgress = calvesProgress + calvesTally
        defaults.set(calvesProgress, forKey: Save.calvesProgress)
        defaults.set(calvesMax, forKey: Save.calvesMax)
        defaults.removeObject(forKey: Save.calvesTally)
        
        //NECK
        
        var neckTally = defaults.float(forKey: Save.neckTally)
        var neckProgress = defaults.float(forKey: Save.neckProgress)
        var neckMax = defaults.float(forKey: Save.neckMax)
        var neckProgressForText = defaults.float(forKey: Save.neckProgressInt)
        neckProgressForText = neckProgressForText + neckTally
        defaults.set(neckProgressForText, forKey: Save.neckProgressInt)
        if (neckMax == 0.0){neckMax = 10}
        neckTally = (1.0 / neckMax) * neckTally
        neckProgress = neckProgress + neckTally
        defaults.set(neckProgress, forKey: Save.neckProgress)
        defaults.set(neckMax, forKey: Save.neckMax)
        defaults.removeObject(forKey: Save.neckTally)
        
        //FOREARM EXTENSORS
        
        var forearmExtensorsTally = defaults.float(forKey: Save.forearmExtensorsTally)
        var forearmExtensorsProgress = defaults.float(forKey: Save.forearmExtensorsProgress)
        var forearmExtensorsMax = defaults.float(forKey: Save.forearmExtensorsMax)
        var forearmExtensorsProgressForText = defaults.float(forKey: Save.forearmExtensorsProgressInt)
        forearmExtensorsProgressForText = forearmExtensorsProgressForText + forearmExtensorsTally
        defaults.set(forearmExtensorsProgressForText, forKey: Save.forearmExtensorsProgressInt)
        if (forearmExtensorsMax == 0.0){forearmExtensorsMax = 10}
        forearmExtensorsTally = (1.0 / forearmExtensorsMax) * forearmExtensorsTally
        forearmExtensorsProgress = forearmExtensorsProgress + forearmExtensorsTally
        defaults.set(forearmExtensorsProgress, forKey: Save.forearmExtensorsProgress)
        defaults.set(forearmExtensorsMax, forKey: Save.forearmExtensorsMax)
        defaults.removeObject(forKey: Save.forearmExtensorsTally)
        
        //ULNAR FOREARM
        
        var ulnarForearmTally = defaults.float(forKey: Save.ulnarForearmTally)
        var ulnarForearmProgress = defaults.float(forKey: Save.ulnarForearmProgress)
        var ulnarForearmMax = defaults.float(forKey: Save.ulnarForearmMax)
        var ulnarForearmProgressForText = defaults.float(forKey: Save.ulnarForearmProgressInt)
        ulnarForearmProgressForText = ulnarForearmProgressForText + ulnarForearmTally
        defaults.set(ulnarForearmProgressForText, forKey: Save.ulnarForearmProgressInt)
        if (ulnarForearmMax == 0.0){ulnarForearmMax = 10}
        ulnarForearmTally = (1.0 / ulnarForearmMax) * ulnarForearmTally
        ulnarForearmProgress = ulnarForearmProgress + ulnarForearmTally
        defaults.set(ulnarForearmProgress, forKey: Save.ulnarForearmProgress)
        defaults.set(ulnarForearmMax, forKey: Save.ulnarForearmMax)
        defaults.removeObject(forKey: Save.ulnarForearmTally)
        
        
        //FOREARM FLEXORS
        
        var forearmFlexorsTally = defaults.float(forKey: Save.forearmFlexorsTally)
        var forearmFlexorsProgress = defaults.float(forKey: Save.forearmFlexorsProgress)
        var forearmFlexorsMax = defaults.float(forKey: Save.forearmFlexorsMax)
        var forearmFlexorsProgressForText = defaults.float(forKey: Save.forearmFlexorsProgressInt)
        forearmFlexorsProgressForText = forearmFlexorsProgressForText + forearmFlexorsTally
        defaults.set(forearmFlexorsProgressForText, forKey: Save.forearmFlexorsProgressInt)
        if (forearmFlexorsMax == 0.0){forearmFlexorsMax = 10}
        forearmFlexorsTally = (1.0 / forearmFlexorsMax) * forearmFlexorsTally
        forearmFlexorsProgress = forearmFlexorsProgress + forearmFlexorsTally
        defaults.set(forearmFlexorsProgress, forKey: Save.forearmFlexorsProgress)
        defaults.set(forearmFlexorsMax, forKey: Save.forearmFlexorsMax)
        defaults.removeObject(forKey: Save.forearmFlexorsTally)
        
        
        //RADIAL FOREARM
        
        var radialForearmTally = defaults.float(forKey: Save.radialForearmTally)
        var radialForearmProgress = defaults.float(forKey: Save.radialForearmProgress)
        var radialForearmMax = defaults.float(forKey: Save.radialForearmMax)
        var radialForearmProgressForText = defaults.float(forKey: Save.radialForearmProgressInt)
        radialForearmProgressForText = radialForearmProgressForText + radialForearmTally
        defaults.set(radialForearmProgressForText, forKey: Save.radialForearmProgressInt)
        if (radialForearmMax == 0.0){radialForearmMax = 10}
        radialForearmTally = (1.0 / radialForearmMax) * radialForearmTally
        radialForearmProgress = radialForearmProgress + radialForearmTally
        defaults.set(radialForearmProgress, forKey: Save.radialForearmProgress)
        defaults.set(radialForearmMax, forKey: Save.radialForearmMax)
        defaults.removeObject(forKey: Save.radialForearmTally)
        
        //SPINAL ERECTORS
        
        var spinalErectorsTally = defaults.float(forKey: Save.spinalErectorsTally)
        var spinalErectorsProgress = defaults.float(forKey: Save.spinalErectorsProgress)
        var spinalErectorsMax = defaults.float(forKey: Save.spinalErectorsMax)
        var spinalErectorsProgressForText = defaults.float(forKey: Save.spinalErectorsProgressInt)
        spinalErectorsProgressForText = spinalErectorsProgressForText + spinalErectorsTally
        defaults.set(spinalErectorsProgressForText, forKey: Save.spinalErectorsProgressInt)
        if (spinalErectorsMax == 0.0){spinalErectorsMax = 10}
        spinalErectorsTally = (1.0 / spinalErectorsMax) * spinalErectorsTally
        spinalErectorsProgress = spinalErectorsProgress + spinalErectorsTally
        defaults.set(spinalErectorsProgress, forKey: Save.spinalErectorsProgress)
        defaults.set(spinalErectorsMax, forKey: Save.spinalErectorsMax)
        defaults.removeObject(forKey: Save.spinalErectorsTally)
        
        //UPPER TRAPS
        
        var upperTrapsTally = defaults.float(forKey: Save.upperTrapsTally)
        var upperTrapsProgress = defaults.float(forKey: Save.upperTrapsProgress)
        var upperTrapsMax = defaults.float(forKey: Save.upperTrapsMax)
        var upperTrapsProgressForText = defaults.float(forKey: Save.upperTrapsProgressInt)
        upperTrapsProgressForText = upperTrapsProgressForText + upperTrapsTally
        defaults.set(upperTrapsProgressForText, forKey: Save.upperTrapsProgressInt)
        if (upperTrapsMax == 0.0){upperTrapsMax = 10}
        upperTrapsTally = (1.0 / upperTrapsMax) * upperTrapsTally
        upperTrapsProgress = upperTrapsProgress + upperTrapsTally
        defaults.set(upperTrapsProgress, forKey: Save.upperTrapsProgress)
        defaults.set(upperTrapsMax, forKey: Save.upperTrapsMax)
        defaults.removeObject(forKey: Save.upperTrapsTally)
       

        
        //LOWER TRAPS
        
        var lowerTrapsTally = defaults.float(forKey: Save.lowerTrapsTally)
        var lowerTrapsProgress = defaults.float(forKey: Save.lowerTrapsProgress)
        var lowerTrapsMax = defaults.float(forKey: Save.lowerTrapsMax)
        var lowerTrapsProgressForText = defaults.float(forKey: Save.lowerTrapsProgressInt)
        lowerTrapsProgressForText = lowerTrapsProgressForText + lowerTrapsTally
        defaults.set(lowerTrapsProgressForText, forKey: Save.lowerTrapsProgressInt)
        if (lowerTrapsMax == 0.0){lowerTrapsMax = 12}
        lowerTrapsTally = (1.0 / lowerTrapsMax) * lowerTrapsTally
        lowerTrapsProgress = lowerTrapsProgress + lowerTrapsTally
        defaults.set(lowerTrapsProgress, forKey: Save.lowerTrapsProgress)
        defaults.set(lowerTrapsMax, forKey: Save.lowerTrapsMax)
        defaults.removeObject(forKey: Save.lowerTrapsTally)

    
        VtData = [chestProgressForText, chestMax, chestProgress, bicepsProgressForText, bicepsMax, bicepsProgress, latsProgressForText, latsMax, latsProgress, glutesProgressForText, glutesMax, glutesProgress, gluteMediusProgressForText, gluteMediusMax, gluteMediusProgress, hamstringsProgressForText, hamstringsMax, hamstringsProgress, frontShoulderProgressForText, frontShoulderMax, frontShoulderProgress, lateralShoulderProgressForText, lateralShoulderMax, lateralShoulderProgress, backShoulderProgressForText, backShoulderMax, backShoulderProgress, rotatorCuffProgressForText, rotatorCuffMax, rotatorCuffProgress, tricepsProgressForText, tricepsMax, tricepsProgress, quadsProgressForText, quadsMax, quadsProgress, absProgressForText, absMax, absProgress, obliquesProgressForText, obliquesMax, obliquesProgress, serratusProgressForText, serratusMax, serratusProgress, transverseAbProgressForText, transverseAbMax, transverseAbProgress, calvesProgressForText, calvesMax, calvesProgress, neckProgressForText, neckMax, neckProgress, forearmExtensorsProgressForText, forearmExtensorsMax, forearmExtensorsProgress, ulnarForearmProgressForText, ulnarForearmMax, ulnarForearmProgress, forearmFlexorsProgressForText, forearmFlexorsMax, forearmFlexorsProgress, radialForearmProgressForText, radialForearmMax, radialForearmProgress, spinalErectorsProgressForText, spinalErectorsMax, spinalErectorsProgress, upperTrapsProgressForText, upperTrapsMax, upperTrapsProgress, lowerTrapsProgressForText, lowerTrapsMax, lowerTrapsProgress]
        
        
        videos =  createArray(vtData: VtData)
        
//       ADS
        
       // if interstitialAd?.isReady ==  true {
   // interstitialAd?.present(fromRootViewController: self)
       // }
        }
    
    
    func createArray(vtData: [Float]) -> [Video] {
        
        let exercise1  = Video(image: #imageLiteral(resourceName: "Dumbell Icon.jpg"), title: "Chest",            progressText: String(String(VtData[0]) + "/" + String(VtData[1])), mavText: "MAV: 12-20 FREQ: 2-3", progressFloat: vtData[2], hideButton: false)
        let exercise2  = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Biceps",           progressText: String(String(VtData[3]) + "/" + String(VtData[4])), mavText: "MAV: 14-20 FREQ: 2-6",  progressFloat: vtData[5], hideButton: false )
        let exercise3  = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Lats",             progressText: String(String(VtData[6]) + "/" + String(VtData[7])), mavText: "MAV: 12-22 FREQ: 2-4",  progressFloat: vtData[8], hideButton: false)
        let exercise4  = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Glutes",           progressText: String(String(VtData[9]) + "/" + String(VtData[10])), mavText: "MAV: 4-12 FREQ: 2-4",  progressFloat: vtData[11], hideButton: false)
        let exercise5  = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Glute Medius",     progressText: String(String(VtData[12]) + "/" + String(VtData[13])), mavText: "MAV: 12-15 FREQ: 2-4",  progressFloat: vtData[14], hideButton: false)
        let exercise6  = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Hamstrings",       progressText: String(String(VtData[15]) + "/" + String(VtData[16])), mavText: "MAV: 10-16 FREQ: 2-3",  progressFloat: vtData[17], hideButton: false)
        let exercise7  = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Front Shoulder",   progressText: String(String(VtData[18]) + "/" + String(VtData[19])), mavText: "MAV: 16-22 FREQ: 1-2",  progressFloat: vtData[20], hideButton: false)
        let exercise8  = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Lateral Shoulder", progressText: String(String(VtData[21]) + "/" + String(VtData[22])), mavText: "MAV: 16-22 FREQ: 2-6",  progressFloat: vtData[23], hideButton: false)
        let exercise9  = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Back Shoulder",    progressText: String(String(VtData[24]) + "/" + String(VtData[25])), mavText: "MAV: 16-22 FREQ: 2-6",  progressFloat: vtData[26], hideButton: false)
        let exercise10 = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Rotator Cuff",     progressText: String(String(VtData[27]) + "/" + String(VtData[28])), mavText: "MAV: 12-20 FREQ: 3-6",  progressFloat: vtData[29], hideButton: false)
        let exercise11 = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Triceps",          progressText: String(String(VtData[30]) + "/" + String(VtData[31])), mavText: "MAV: 10-14 FREQ: 2-4",  progressFloat: vtData[32], hideButton: false)
        let exercise12 = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Quads",            progressText: String(String(VtData[33]) + "/" + String(VtData[34])), mavText: "MAV: 12-18 FREQ: 1.5-3",  progressFloat: vtData[35] , hideButton: false)
        let exercise13 = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Abs",              progressText: String(String(VtData[36]) + "/" + String(VtData[37])), mavText: "MAV: 16-20 FREQ: 3-5",  progressFloat: vtData[38], hideButton: false)
        let exercise14 = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Obliques",         progressText: String(String(VtData[39]) + "/" + String(VtData[40])), mavText: "MAV: 16-20 FREQ: 3-5",  progressFloat: vtData[41], hideButton: false)
        let exercise15 = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Serratus",         progressText: String(String(VtData[42]) + "/" + String(VtData[43])), mavText: "MAV: 16-20 FREQ: 3-5",  progressFloat: vtData[44], hideButton: false)
        let exercise16 = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Transverse Ab",    progressText: String(String(VtData[45]) + "/" + String(VtData[46])), mavText: "MAV: 16-20 FREQ: 3-5",  progressFloat: vtData[47], hideButton: false)
        let exercise17 = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Calves",           progressText: String(String(VtData[48]) + "/" + String(VtData[49])), mavText: "MAV: 12-16 FREQ: 2-4",  progressFloat: vtData[50], hideButton: false)
        let exercise18 = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Neck",             progressText: String(String(VtData[51]) + "/" + String(VtData[52])), mavText: "MAV: 10-16 FREQ: 2-3",  progressFloat: vtData[53], hideButton: false)
        let exercise19 = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Forearm Extensors",progressText: String(String(VtData[54]) + "/" + String(VtData[55])), mavText: "MAV: 10-20 FREQ: 2-6",  progressFloat: vtData[56], hideButton: false)
        let exercise20 = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Ulnar Forearm",    progressText: String(String(VtData[57]) + "/" + String(VtData[58])), mavText: "MAV: 10-20 FREQ: 2-6",  progressFloat: vtData[59], hideButton: false)
        let exercise21 = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Forearm Flexors",  progressText: String(String(VtData[60]) + "/" + String(VtData[61])), mavText: "MAV: 10-20 FREQ: 2-6",  progressFloat: vtData[62], hideButton: false)
        let exercise22 = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Radial Forearm",   progressText: String(String(VtData[63]) + "/" + String(VtData[64])), mavText: "MAV: 10-20 FREQ: 2-6",  progressFloat: vtData[65], hideButton: false)
        let exercise23 = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Spinal Erectors",  progressText: String(String(VtData[66]) + "/" + String(VtData[67])), mavText: "MAV: 10-15 FREQ: 2-4",  progressFloat: vtData[68], hideButton: false)
        let exercise24 = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Upper Traps",      progressText: String(String(VtData[69]) + "/" + String(VtData[70])), mavText: "MAV: 10-20 FREQ: 2-6",  progressFloat: vtData[71], hideButton: false)
        let exercise25 = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Lower Traps",      progressText: String(String(VtData[72]) + "/" + String(VtData[73])), mavText: "MAV: 12-20 FREQ: 2-6",  progressFloat: vtData[74], hideButton: false)
      let exercise26 = Video(image:#imageLiteral(resourceName: "Dumbell Icon"), title:"Reset All",      progressText:" ", mavText: " ",  progressFloat: 0.0, hideButton: true)
      
        
        
        //Premium
//        let exercise26 = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Brachialis", progressText: "00.0/00", mavText: "MAV: 16-22 FREQ: 2-6", progressFloat: progressFloat: vtData[0])
//        let exercise27 = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Neck Extension", progressText: "00.0/00", mavText: "MAV: 16-22 FREQ: 2-6", progressFloat: progressFloat: vtData[0])
//        let exercise28 = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Neck Felxion", progressText: "00.0/00", mavText: "MAV: 16-22 FREQ: 2-6", progressFloat: progressFloat: vtData[0])
//        let exercise29 = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Neck Lateral Felxion", progressText: "00.0/00", mavText: "MAV: 16-22 FREQ: 2-6", progressFloat: progressFloat: vtData[0])
//        let exercise30 = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Anterior Tibialis", progressText: "00.0/00", mavText: "MAV: 16-22 FREQ: 2-6", progressFloat: progressFloat: vtData[0])
//
           
        return [exercise1, exercise2, exercise3, exercise4, exercise5, exercise6, exercise7, exercise8,
                exercise9, exercise10, exercise11, exercise12, exercise13, exercise14, exercise15, exercise16,
                exercise17, exercise18, exercise19, exercise20, exercise21, exercise22, exercise23, exercise24, exercise25, exercise26]//, exercise27]
    }
    
    func styleButton(button: UIButton){
        button.layer.borderWidth = 1
       
    }
    
    @IBAction func allExercisesClicked(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let Exercises = storyboard.instantiateViewController(identifier: "allExercises")
        self.show(Exercises, sender: self)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func bodyWeightExercisesClicked(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
              let Exercises = storyboard.instantiateViewController(identifier: "specificExerciseHistory")
              self.show(Exercises, sender: self)
              self.dismiss(animated: true, completion: nil)
    }
}

extension VideoListScreen: VideoCellDelegate {
    
    func didTapAddSet(title: String) {
        if (title == "Reset All"){

            defaults.removeObject(forKey: Save.chestProgress)
            defaults.removeObject(forKey: Save.chestProgressInt)
            defaults.removeObject(forKey: Save.bicepsProgress)
            defaults.removeObject(forKey: Save.bicepsProgressInt)
            defaults.removeObject(forKey: Save.latsProgress)
            defaults.removeObject(forKey: Save.latsProgressInt)
            defaults.removeObject(forKey: Save.glutesProgress)
            defaults.removeObject(forKey: Save.glutesProgressInt)
            defaults.removeObject(forKey: Save.gluteMediusProgress)
            defaults.removeObject(forKey: Save.gluteMediusProgressInt)
            defaults.removeObject(forKey: Save.hamstringsProgress)
            defaults.removeObject(forKey: Save.hamstringsProgressInt)
            defaults.removeObject(forKey: Save.frontShoulderProgress)
            defaults.removeObject(forKey: Save.frontShoulderProgressInt)
            defaults.removeObject(forKey: Save.lateralShoulderProgress)
            defaults.removeObject(forKey: Save.lateralShoulderProgressInt)
            defaults.removeObject(forKey: Save.backShoulderProgress)
            defaults.removeObject(forKey: Save.backShoulderProgressInt)
            defaults.removeObject(forKey: Save.rotatorCuffProgress)
            defaults.removeObject(forKey: Save.rotatorCuffProgressInt)
            defaults.removeObject(forKey: Save.tricepsProgress)
            defaults.removeObject(forKey: Save.tricepsProgressInt)
            defaults.removeObject(forKey: Save.quadsProgress)
            defaults.removeObject(forKey: Save.quadsProgressInt)
            defaults.removeObject(forKey: Save.absProgress)
            defaults.removeObject(forKey: Save.absProgressInt)
            defaults.removeObject(forKey: Save.obliquesProgress)
            defaults.removeObject(forKey: Save.obliquesProgressInt)
            defaults.removeObject(forKey: Save.serratusProgress)
            defaults.removeObject(forKey: Save.serratusProgressInt)
            defaults.removeObject(forKey: Save.transverseAbProgress)
            defaults.removeObject(forKey: Save.transverseAbProgressInt)
            defaults.removeObject(forKey: Save.calvesProgress)
            defaults.removeObject(forKey: Save.calvesProgressInt)
            defaults.removeObject(forKey: Save.neckProgress)
            defaults.removeObject(forKey: Save.neckProgressInt)
            defaults.removeObject(forKey: Save.forearmExtensorsProgress)
            defaults.removeObject(forKey: Save.forearmExtensorsProgressInt)
            defaults.removeObject(forKey: Save.ulnarForearmProgress)
            defaults.removeObject(forKey: Save.ulnarForearmProgressInt)
            defaults.removeObject(forKey: Save.forearmFlexorsProgress)
            defaults.removeObject(forKey: Save.forearmFlexorsProgressInt)
            defaults.removeObject(forKey: Save.radialForearmProgress)
            defaults.removeObject(forKey: Save.radialForearmProgressInt)
            defaults.removeObject(forKey: Save.spinalErectorsProgress)
            defaults.removeObject(forKey: Save.spinalErectorsProgressInt)
            defaults.removeObject(forKey: Save.upperTrapsProgress)
            defaults.removeObject(forKey: Save.upperTrapsProgressInt)
            defaults.removeObject(forKey: Save.lowerTrapsProgress)
            defaults.removeObject(forKey: Save.lowerTrapsProgressInt)

            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let dashBoard = storyboard.instantiateViewController(identifier: "volumeTracker")
            self.show(dashBoard, sender: self)
            self.dismiss(animated: true, completion: nil)
//            self.viewDidLoad()
//            self.viewWillAppear(true)
      //      self.tableView.reloadData()
            print("reset all clicked")
            //Alert
//            let alertController = UIAlertController(title: "Volume Removed", message:
//                "Your volume will be reset for next time.", preferredStyle: .alert)
//            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
//            self.present(alertController, animated: true, completion: nil)

        } else {
        
        let muscleGroup = String(title)
              defaults.set(muscleGroup, forKey: Save.muscle)
              let storyboard = UIStoryboard(name: "Main", bundle: nil)
              let Exercises = storyboard.instantiateViewController(identifier: "Exercises")
              self.show(Exercises, sender: self)
              self.dismiss(animated: true, completion: nil)
               
               
               //Retrieve info for premium And SHOWADS
               let annual = defaults.bool(forKey: Save.annualPurchased)
                      let biannual = defaults.bool(forKey: Save.biannualPurchased)
                      let monthly = defaults.bool(forKey: Save.monthlyPurchased)
            let hsPromo = defaults.bool(forKey: Save.HSPromo)
            
            
                     // print("annual", annual, "\nbiannual", biannual, "\nmonthly", monthly)
            
            //TODO logic to see if promo is expired
            
            if (hsPromo){
                var promoLength = defaults.double(forKey: Save.promoLength)
                promoLength = promoLength * 31536000
                
                installDate = defaults.object(forKey: Save.installDate) as! Date
                let expDate = installDate.addingTimeInterval(promoLength)
                if( Date() < expDate){
                    defaults.set(false, forKey: Save.HSPromo)
                }
                  
            }
            
            
            let premium = annual || biannual || monthly || hsPromo
            let x = Int.random(in: 0..<10)
            
               
               if interstitialAd?.isReady ==  true && !premium && (x % 2 == 0 ){
                   interstitialAd?.present(fromRootViewController: self)
               }
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
            defaults.set(muscleString, forKey: Save.muscleString)
        } else if (index == [1]){
            let muscleString = "Biceps"
            defaults.set(muscleString, forKey: Save.muscleString)
        } else if (index == [2]){
            let muscleString = "Lats"
            defaults.set(muscleString, forKey: Save.muscleString)
        } else if (index == [3]){
            let muscleString = "Glutes"
            defaults.set(muscleString, forKey: Save.muscleString)
        } else if (index == [4]){
            let muscleString = "Glute Medius"
            defaults.set(muscleString, forKey: Save.muscleString)
        } else if (index == [5]){
            let muscleString = "Hamstrings"
            defaults.set(muscleString, forKey: Save.muscleString)
        } else if (index == [6]){
            let muscleString = "Front Shoulder"
            defaults.set(muscleString, forKey: Save.muscleString)
        } else if (index == [7]){
            let muscleString = "Lateral Shoulder"
            defaults.set(muscleString, forKey: Save.muscleString)
        } else if (index == [8]){
            let muscleString = "Back Shoulder"
            defaults.set(muscleString, forKey: Save.muscleString)
        } else if (index == [9]){
            let muscleString = "Rotator Cuff"
            defaults.set(muscleString, forKey: Save.muscleString)
        } else if (index == [10]){
            let muscleString = "Triceps"
            defaults.set(muscleString, forKey: Save.muscleString)
        } else if (index == [11]){
            let muscleString = "Quads"
            defaults.set(muscleString, forKey: Save.muscleString)
        } else if (index == [12]){
            let muscleString = "Abs"
            defaults.set(muscleString, forKey: Save.muscleString)
        } else if (index == [13]){
            let muscleString = "Obliques"
            defaults.set(muscleString, forKey: Save.muscleString)
        } else if (index == [14]){
            let muscleString = "Serratus"
            defaults.set(muscleString, forKey: Save.muscleString)
        } else if (index == [15]){
            let muscleString = "Transverse Ab"
            defaults.set(muscleString, forKey: Save.muscleString)
        } else if (index == [16]){
            let muscleString = "Calves"
            defaults.set(muscleString, forKey: Save.muscleString)
        } else if (index == [17]){
            let muscleString = "Neck"
            defaults.set(muscleString, forKey: Save.muscleString)
        } else if (index == [18]){
            let muscleString = "Forearm Extensors"
            defaults.set(muscleString, forKey: Save.muscleString)
        } else if (index == [19]){
            let muscleString = "Ulnar Forearm"
            defaults.set(muscleString, forKey: Save.muscleString)
        } else if (index == [20]){
            let muscleString = "Forearm Flexors"
            defaults.set(muscleString, forKey: Save.muscleString)
        } else if (index == [21]){
            let muscleString = "Radial Forearm"
            defaults.set(muscleString, forKey: Save.muscleString)
        } else if (index == [22]){
            let muscleString = "Spinal Erectors"
            defaults.set(muscleString, forKey: Save.muscleString)
        } else if (index == [23]){
            let muscleString = "Upper Traps"
            defaults.set(muscleString, forKey: Save.muscleString)
        } else if (index == [24]){
            let muscleString = "Lower Traps"
            defaults.set(muscleString, forKey: Save.muscleString)
        }
       }
    
 @objc private func titleWasTapped() {
        guard let url = URL(string: "http://aesthet-x.com/about/") else {
            return //be safe
          }

          if #available(iOS 10.0, *) {
              UIApplication.shared.open(url, options: [:], completionHandler: nil)
          } else {
              UIApplication.shared.openURL(url)
          }
 }
    
    private func createAd() -> GADInterstitial{
         print("Creating interstitial")
        let ad = GADInterstitial(adUnitID: Constants.volumeAD)
        ad.delegate = self
        ad.load(GADRequest())
        return ad
    }
}

extension VideoListScreen: GADInterstitialDelegate{
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        interstitialAd = createAd()
    }
}






