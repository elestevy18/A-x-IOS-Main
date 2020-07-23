//
//  MuscleInfoViewController.swift
//  A(x) Master
//
//  Created by Kevin Jimenez on 7/20/20.
//  Copyright © 2020 Aesthet(X). All rights reserved.
//

import UIKit

class MuscleInfoViewController: UIViewController {
    
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

    @IBOutlet weak var anatomyImage: UIImageView!
    @IBOutlet weak var resetMaxButton: UIButton!
    @IBOutlet weak var resetVolumeButton: UIButton!
    @IBOutlet weak var setMRVButton: UIButton!
    @IBOutlet weak var currentMaxLabel: UILabel!
    @IBOutlet weak var currentVolumeLabel: UILabel!
    @IBOutlet weak var MRVTextField: UITextField!
    
    var imageList:[String] = [] //= ["bicepsthreedee", "biceps", "brachioradialis"]
    var maxImages: Int = 0
    static var imageIndex: NSInteger = 0
    
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Swiping through images. set images according to muscle group
        
        
        var maxString = "Vanilla"
        var currentVolumeString = "Vanilla"
        let muscleString = defaults.string(forKey: Keys.muscleString)
        
        if(muscleString == "Chest"){
            anatomyImage.image = UIImage(named:"pecs")
            currentMaxLabel.text = maxString
            currentVolumeLabel.text = currentVolumeString
            //Assign volume and max text
            let chestMax = defaults.integer(forKey: Keys.chestMax)
            maxString = "Current Max: " + String(chestMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Keys.chestProgressInt))
        } else if(muscleString == "Biceps"){
            setGestures()
           anatomyImage.image = UIImage(named:"bicepsthreedee")
            maxImages = 1
            imageList = ["bicepsthreedee", "biceps"]
            
            let bicepsMax = defaults.integer(forKey: Keys.bicepsMax)
            maxString = "Current Max: " + String(bicepsMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Keys.bicepsProgressInt))
        } else if(muscleString == "Lats"){
            print(muscleString!)
            anatomyImage.image = UIImage(named:"latissimusdorsi")
            
            let latsMax = defaults.integer(forKey: Keys.latsMax)
            maxString = "Current Max: " + String(latsMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Keys.latsProgressInt))
        } else if(muscleString == "Glutes"){
            setGestures()
            anatomyImage.image = UIImage(named:"glutemax")
            maxImages = 1
            imageList = ["glutemax", "glutescutmajor"]
            
            let glutesMax = defaults.integer(forKey: Keys.glutesMax)
            maxString = "Current Max: " + String(glutesMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Keys.glutesProgressInt))
        } else if(muscleString == "Glute Medius"){
            print(muscleString!)
            setGestures()
            anatomyImage.image = UIImage(named:"glutemedius")
            maxImages = 1
            imageList = ["glutemedius", "glutescutmajor"]
            
            let gluteMediusMax = defaults.integer(forKey: Keys.gluteMediusMax)
            maxString = "Current Max: " + String(gluteMediusMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Keys.gluteMediusProgressInt))
        } else if(muscleString == "Hamstrings"){
            setGestures()
            anatomyImage.image = UIImage(named:"hamstringbicepfemoris")
            maxImages = 2
            imageList = ["hamstringbicepfemoris", "hamstringsemimembranosus", "hamstringsemitendinosus"]
            
            let hamstringsMax = defaults.integer(forKey: Keys.hamstringsMax)
            maxString = "Current Max: " + String(hamstringsMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Keys.hamstringsProgressInt))
        } else if(muscleString == "Front Shoulder"){
            print(muscleString!)
            anatomyImage.image = UIImage(named:"anteriordeltoid")
            
            let frontShoulderMax = defaults.integer(forKey: Keys.frontShoulderMax)
            maxString = "Current Max: " + String(frontShoulderMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Keys.frontShoulderProgressInt))
        }  else if(muscleString == "Lateral Shoulder"){
            print(muscleString!)
            anatomyImage.image = UIImage(named:"medialdeltoidlateralview")
            
            let lateralShoulderMax = defaults.integer(forKey: Keys.lateralShoulderMax)
            maxString = "Current Max: " + String(lateralShoulderMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Keys.lateralShoulderProgressInt))
        } else if(muscleString == "Back Shoulder"){
            setGestures()
           anatomyImage.image = UIImage(named:"posteriordeltoidsuperior")
            maxImages = 1
            imageList = ["posteriordeltoidsuperior", "posteriordeltoidposteriorview"]
            
            let backShoulderMax = defaults.integer(forKey: Keys.backShoulderMax)
            maxString = "Current Max: " + String(backShoulderMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Keys.backShoulderProgressInt))
        } else if(muscleString == "Rotator Cuff"){
            setGestures()
            print(muscleString!)
            anatomyImage.image = UIImage(named:"rotatorcuff")
            maxImages = 1
            imageList = ["rotatorcuff", "infraspinatusthreedee"]
            
            let rotatorCuffMax = defaults.integer(forKey: Keys.rotatorCuffMax)
            maxString = "Current Max: " + String(rotatorCuffMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Keys.rotatorCuffProgressInt))
        } else if(muscleString == "Triceps"){
            setGestures()
            print(muscleString!)
            anatomyImage.image = UIImage(named:"triceps")
            maxImages = 1
            imageList = ["triceps", "tricepswhole"]
            
            let tricepsMax = defaults.integer(forKey: Keys.tricepsMax)
            maxString = "Current Max: " + String(tricepsMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Keys.tricepsProgressInt))
        } else if(muscleString == "Quads"){
            anatomyImage.image = UIImage(named:"quadriceps")
            
            let quadsMax = defaults.integer(forKey: Keys.quadsMax)
            maxString = "Current Max: " + String(quadsMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Keys.quadsProgressInt))
        } else if(muscleString == "Abs"){
            anatomyImage.image = UIImage(named:"rectusabdominis")
            
            let absMax = defaults.integer(forKey: Keys.absMax)
            maxString = "Current Max: " + String(absMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Keys.absProgressInt))
        } else if(muscleString == "Obliques"){
            anatomyImage.image = UIImage(named:"obliques")
            
            let obliquesMax = defaults.integer(forKey: Keys.obliquesMax)
            maxString = "Current Max: " + String(obliquesMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Keys.obliquesProgressInt))
        } else if(muscleString == "Serratus"){
            anatomyImage.image = UIImage(named:"serratus")
            maxImages = 1
            imageList = ["serratus", "serratusanterior"]
            
            let serratusMax = defaults.integer(forKey: Keys.serratusMax)
            maxString = "Current Max: " + String(serratusMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Keys.serratusProgressInt))
        } else if(muscleString == "Transverse Ab"){
            anatomyImage.image = UIImage(named:"transversusabdominis")
            
            let transverseAbMax = defaults.integer(forKey: Keys.transverseAbMax)
            maxString = "Current Max: " + String(transverseAbMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Keys.transverseAbProgressInt))
        } else if(muscleString == "Calves"){
            setGestures()
            print(muscleString!)
            anatomyImage.image = UIImage(named:"calfgastroc")
            maxImages = 1
            imageList = ["calfgastroc", "calfsoleus"]
            
            let calvesMax = defaults.integer(forKey: Keys.calvesMax)
            maxString = "Current Max: " + String(calvesMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Keys.calvesProgressInt))
        } else if(muscleString == "Neck"){
            setGestures()
            anatomyImage.image = UIImage(named:"neckanteriorview")
            maxImages = 2
            imageList = ["neckanteriorview", "necklateralview", "neckposteriorview"]
            
            let neckMax = defaults.integer(forKey: Keys.neckMax)
            maxString = "Current Max: " + String(neckMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Keys.neckProgressInt))
        } else if(muscleString == "Forearm Extensors"){
            setGestures()
            print(muscleString!)
            anatomyImage.image = UIImage(named:"extensors")
            maxImages = 1
            imageList = ["extensors", "forearmcorsssection"]
            
            let forearmExtensorsMax = defaults.integer(forKey: Keys.forearmExtensorsMax)
            maxString = "Current Max: " + String(forearmExtensorsMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Keys.forearmExtensorsProgressInt))
        } else if(muscleString == "Ulnar Forearm"){
            setGestures()
            print(muscleString!)
            anatomyImage.image = UIImage(named:"ulnarforearm")
            maxImages = 1
            imageList = ["ulnarforearm", "forearmcorsssection"]
            
            let ulnarForearmMax = defaults.integer(forKey: Keys.ulnarForearmMax)
            maxString = "Current Max: " + String(ulnarForearmMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Keys.ulnarForearmProgressInt))
        } else if(muscleString == "Forearm Flexors"){
            setGestures()
            anatomyImage.image = UIImage(named:"superficialforearmflexor")
            maxImages = 2
            imageList = ["superficialforearmflexor", "deepforearmflexors", "forearmcorsssection"]
            
            let forearmFlexorsMax = defaults.integer(forKey: Keys.forearmFlexorsMax)
            maxString = "Current Max: " + String(forearmFlexorsMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Keys.forearmFlexorsProgressInt))
        } else if(muscleString == "Forearm Flexors"){
            setGestures()
            anatomyImage.image = UIImage(named:"superficialforearmflexor")
            maxImages = 2
            imageList = ["superficialforearmflexor", "deepforearmflexors", "forearmcorsssection"]
            
            let forearmFlexorsMax = defaults.integer(forKey: Keys.forearmFlexorsMax)
            maxString = "Current Max: " + String(forearmFlexorsMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Keys.forearmFlexorsProgressInt))
        } else if(muscleString == "Radial Forearm"){
            setGestures()
            print(muscleString!)
            anatomyImage.image = UIImage(named:"brachioradialis")
            maxImages = 1
            imageList = ["brachioradialis", "forearmcorsssection"]
            
            let radialForearmMax = defaults.integer(forKey: Keys.radialForearmMax)
            maxString = "Current Max: " + String(radialForearmMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Keys.radialForearmProgressInt))
        } else if(muscleString == "Spinal Erectors"){
            print(muscleString!)
            anatomyImage.image = UIImage(named:"erectors")
            
            let spinalErectorsMax = defaults.integer(forKey: Keys.spinalErectorsMax)
            maxString = "Current Max: " + String(spinalErectorsMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Keys.spinalErectorsProgressInt))
        } else if(muscleString == "Upper Traps"){
            print(muscleString!)
            anatomyImage.image = UIImage(named:"uppertrapszoom")
            
            let upperTrapsMax = defaults.integer(forKey: Keys.upperTrapsMax)
            maxString = "Current Max: " + String(upperTrapsMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Keys.upperTrapsProgressInt))
        } else if(muscleString == "Lower Traps"){
            print(muscleString!)
            anatomyImage.image = UIImage(named:"lowertraps")
            
            let lowerTrapsMax = defaults.integer(forKey: Keys.lowerTrapsMax)
            maxString = "Current Max: " + String(lowerTrapsMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Keys.lowerTrapsProgressInt))
        }
        
        currentMaxLabel.text = maxString
        currentVolumeLabel.text = currentVolumeString
        
        //Set text for current max and current volume
//        var maxString = "Vanilla"
//        var currentVolumeString = "Vanilla"
        if(muscleString == "Chest"){
      
              } else if(muscleString == "Biceps"){
                  setGestures()
                 anatomyImage.image = UIImage(named:"bicepsthreedee")
                  maxImages = 1
                  imageList = ["bicepsthreedee", "biceps"]
              } else if(muscleString == "Lats"){
                  print(muscleString!)
                  anatomyImage.image = UIImage(named:"latissimusdorsi")
              } else if(muscleString == "Glutes"){
                  setGestures()
                  anatomyImage.image = UIImage(named:"glutemax")
                  maxImages = 1
                  imageList = ["glutemax", "glutescutmajor"]
              } else if(muscleString == "Glute Medius"){
                  print(muscleString!)
                  setGestures()
                  anatomyImage.image = UIImage(named:"glutemedius")
                  maxImages = 1
                  imageList = ["glutemedius", "glutescutmajor"]
              } else if(muscleString == "Hamstrings"){
                  setGestures()
                  anatomyImage.image = UIImage(named:"hamstringbicepfemoris")
                  maxImages = 2
                  imageList = ["hamstringbicepfemoris", "hamstringsemimembranosus", "hamstringsemitendinosus"]
              } else if(muscleString == "Front Shoulder"){
                  print(muscleString!)
                  anatomyImage.image = UIImage(named:"anteriordeltoid")
              }  else if(muscleString == "Lateral Shoulder"){
                  print(muscleString!)
                  anatomyImage.image = UIImage(named:"medialdeltoidlateralview")
              } else if(muscleString == "Back Shoulder"){
                  setGestures()
                 anatomyImage.image = UIImage(named:"posteriordeltoidsuperior")
                  maxImages = 1
                  imageList = ["posteriordeltoidsuperior", "posteriordeltoidposteriorview"]
              } else if(muscleString == "Rotator Cuff"){
                  setGestures()
                  print(muscleString!)
                  anatomyImage.image = UIImage(named:"rotatorcuff")
                  maxImages = 1
                  imageList = ["rotatorcuff", "infraspinatusthreedee"]
              } else if(muscleString == "Triceps"){
                  setGestures()
                  print(muscleString!)
                  anatomyImage.image = UIImage(named:"triceps")
                  maxImages = 1
                  imageList = ["triceps", "tricepswhole"]
              } else if(muscleString == "Quads"){
              
                   print(muscleString!)
                  anatomyImage.image = UIImage(named:"quadriceps")
              } else if(muscleString == "Abs"){
          
                   print(muscleString!)
                  anatomyImage.image = UIImage(named:"rectusabdominis")
              } else if(muscleString == "Obliques"){

                  print(muscleString!)
                  anatomyImage.image = UIImage(named:"obliques")
              } else if(muscleString == "Serratus"){
                  print(muscleString!)
                  anatomyImage.image = UIImage(named:"serratus")
                  maxImages = 1
                  imageList = ["serratus", "serratusanterior"]
              } else if(muscleString == "Transverse Ab"){

                  print(muscleString!)
                  anatomyImage.image = UIImage(named:"transversusabdominis")
              } else if(muscleString == "Calves"){
                  setGestures()
                  print(muscleString!)
                  anatomyImage.image = UIImage(named:"calfgastroc")
                  maxImages = 1
                  imageList = ["calfgastroc", "calfsoleus"]
              } else if(muscleString == "Neck"){
                  setGestures()
                  anatomyImage.image = UIImage(named:"neckanteriorview")
                  maxImages = 2
                  imageList = ["neckanteriorview", "necklateralview", "neckposteriorview"]
              } else if(muscleString == "Forearm Extensors"){
                  setGestures()
                  print(muscleString!)
                  anatomyImage.image = UIImage(named:"extensors")
                  maxImages = 1
                  imageList = ["extensors", "forearmcorsssection"]
              } else if(muscleString == "Ulnar Forearm"){
                  setGestures()
                  print(muscleString!)
                  anatomyImage.image = UIImage(named:"ulnarforearm")
                  maxImages = 1
                  imageList = ["ulnarforearm", "forearmcorsssection"]
              } else if(muscleString == "Forearm Flexors"){
                  setGestures()
                  anatomyImage.image = UIImage(named:"superficialforearmflexor")
                  maxImages = 2
                  imageList = ["superficialforearmflexor", "deepforearmflexors", "forearmcorsssection"]
              } else if(muscleString == "Forearm Flexors"){
                  setGestures()
                  anatomyImage.image = UIImage(named:"superficialforearmflexor")
                  maxImages = 2
                  imageList = ["superficialforearmflexor", "deepforearmflexors", "forearmcorsssection"]
              } else if(muscleString == "Radial Forearm"){
                  setGestures()
                  print(muscleString!)
                  anatomyImage.image = UIImage(named:"brachioradialis")
                  maxImages = 1
                  imageList = ["brachioradialis", "forearmcorsssection"]
              } else if(muscleString == "Spinal Erectors"){
                  print(muscleString!)
                  anatomyImage.image = UIImage(named:"erectors")
              } else if(muscleString == "Upper Traps"){
                  print(muscleString!)
                  anatomyImage.image = UIImage(named:"uppertrapszoom")
              } else if(muscleString == "Lower Traps"){
                  print(muscleString!)
                  anatomyImage.image = UIImage(named:"lowertraps")
              }
        


        
        styleButton(button: resetMaxButton)
        resetMaxButton.layer.cornerRadius = 15
        styleButton(button: resetVolumeButton)
        resetVolumeButton.layer.cornerRadius = 15
        styleButton(button: setMRVButton)
        setMRVButton.layer.cornerRadius = 15
    
    }
   
    func styleButton(button: UIButton){
        button.backgroundColor = .clear
        button.layer.borderWidth = 1
        button.layer.borderColor = Colors.aXGreen.cgColor
          //  UIColor.lightGray.cgColor
    }
    
    func setGestures(){
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swiped)) // put : at the end of method name
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)

        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swiped)) // put : at the end of method name
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)

    }
    
    @objc func swiped(gesture: UIGestureRecognizer) {

    if let swipeGesture = gesture as? UISwipeGestureRecognizer {
        switch swipeGesture.direction {
        case UISwipeGestureRecognizer.Direction.right :
            print("User swiped right")
            // decrease index first
            MuscleInfoViewController.imageIndex-=1
            // check if index is in range
            if MuscleInfoViewController.imageIndex < 0 {
                MuscleInfoViewController.imageIndex = maxImages
            }
            anatomyImage.image = UIImage(named: imageList[MuscleInfoViewController.imageIndex])

        case UISwipeGestureRecognizer.Direction.left:
            print("User swiped Left")
            // increase index first
            MuscleInfoViewController.imageIndex += 1
            // check if index is in range
            if MuscleInfoViewController.imageIndex > maxImages {
                MuscleInfoViewController.imageIndex = 0
            }

           anatomyImage.image = UIImage(named: imageList[MuscleInfoViewController.imageIndex])

        default:
            break //stops the code/codes nothing.

        }

    }


    }

    @IBAction func resetVolumePressed(_ sender: Any) {
         let muscleString = defaults.string(forKey: Keys.muscleString)
       if(muscleString == "Chest"){
        print("chest printed")
                defaults.removeObject(forKey: Keys.chestProgress)
                defaults.removeObject(forKey: Keys.chestProgressInt)
            } else if(muscleString == "Biceps"){
                defaults.removeObject(forKey: Keys.bicepsProgress)
                defaults.removeObject(forKey: Keys.bicepsProgressInt)
            } else if(muscleString == "Lats"){
                defaults.removeObject(forKey: Keys.latsProgress)
                defaults.removeObject(forKey: Keys.latsProgressInt)
            } else if(muscleString == "Glutes"){
                defaults.removeObject(forKey: Keys.glutesProgress)
                defaults.removeObject(forKey: Keys.glutesProgressInt)
            } else if(muscleString == "Glute Medius"){
                print(muscleString!)
                defaults.removeObject(forKey: Keys.gluteMediusProgress)
                defaults.removeObject(forKey: Keys.gluteMediusProgressInt)
            } else if(muscleString == "Hamstrings"){
                defaults.removeObject(forKey: Keys.hamstringsProgress)
                defaults.removeObject(forKey: Keys.hamstringsProgressInt)
            } else if(muscleString == "Front Shoulder"){
                defaults.removeObject(forKey: Keys.frontShoulderProgress)
                defaults.removeObject(forKey: Keys.frontShoulderProgressInt)
            }  else if(muscleString == "Lateral Shoulder"){
                defaults.removeObject(forKey: Keys.lateralShoulderProgress)
                defaults.removeObject(forKey: Keys.lateralShoulderProgressInt)
            } else if(muscleString == "Back Shoulder"){
                defaults.removeObject(forKey: Keys.backShoulderProgress)
                defaults.removeObject(forKey: Keys.backShoulderProgressInt)
            } else if(muscleString == "Rotator Cuff"){
                defaults.removeObject(forKey: Keys.rotatorCuffProgress)
                defaults.removeObject(forKey: Keys.rotatorCuffProgressInt)
            } else if(muscleString == "Triceps"){
                defaults.removeObject(forKey: Keys.tricepsProgress)
                defaults.removeObject(forKey: Keys.tricepsProgressInt)
            } else if(muscleString == "Quads"){
                defaults.removeObject(forKey: Keys.quadsProgress)
                defaults.removeObject(forKey: Keys.quadsProgressInt)
            } else if(muscleString == "Abs"){
                defaults.removeObject(forKey: Keys.absProgress)
                defaults.removeObject(forKey: Keys.absProgressInt)
            } else if(muscleString == "Obliques"){
                defaults.removeObject(forKey: Keys.obliquesProgress)
                defaults.removeObject(forKey: Keys.obliquesProgressInt)
            } else if(muscleString == "Serratus"){
                defaults.removeObject(forKey: Keys.serratusProgress)
                defaults.removeObject(forKey: Keys.serratusProgressInt)
            } else if(muscleString == "Transverse Ab"){
                defaults.removeObject(forKey: Keys.transverseAbProgress)
                defaults.removeObject(forKey: Keys.transverseAbProgressInt)
            } else if(muscleString == "Calves"){
                defaults.removeObject(forKey: Keys.calvesProgress)
                defaults.removeObject(forKey: Keys.calvesProgressInt)
            } else if(muscleString == "Neck"){
                defaults.removeObject(forKey: Keys.neckProgress)
                defaults.removeObject(forKey: Keys.neckProgressInt)
            } else if(muscleString == "Forearm Extensors"){
                defaults.removeObject(forKey: Keys.forearmExtensorsProgress)
                defaults.removeObject(forKey: Keys.forearmExtensorsProgressInt)
            } else if(muscleString == "Ulnar Forearm"){
                defaults.removeObject(forKey: Keys.ulnarForearmProgress)
                defaults.removeObject(forKey: Keys.ulnarForearmProgressInt)
            } else if(muscleString == "Forearm Flexors"){
                defaults.removeObject(forKey: Keys.forearmFlexorsProgress)
                defaults.removeObject(forKey: Keys.forearmFlexorsProgressInt)
            } else if(muscleString == "Radial Forearm"){
                defaults.removeObject(forKey: Keys.radialForearmProgress)
                defaults.removeObject(forKey: Keys.radialForearmProgressInt)
            } else if(muscleString == "Spinal Erectors"){
                defaults.removeObject(forKey: Keys.spinalErectorsProgress)
                defaults.removeObject(forKey: Keys.spinalErectorsProgressInt)
            } else if(muscleString == "Upper Traps"){
                defaults.removeObject(forKey: Keys.upperTrapsProgress)
                defaults.removeObject(forKey: Keys.upperTrapsProgressInt)
            } else if(muscleString == "Lower Traps"){
                defaults.removeObject(forKey: Keys.lowerTrapsProgress)
                defaults.removeObject(forKey: Keys.lowerTrapsProgressInt)
            }
        
        
    }
    @IBAction func resetMaxPressed(_ sender: Any) {
        
        let muscleString = defaults.string(forKey: Keys.muscleString)
        if(muscleString == "Chest"){
            //Reset Max
            let chestMax = 12
            defaults.set(chestMax, forKey: Keys.chestMax)
            } else if(muscleString == "Biceps"){
            //Reset Max
            let bicepsMax = 14
            defaults.set(bicepsMax, forKey: Keys.bicepsMax)
            } else if(muscleString == "Lats"){
            let latsMax = 12
            defaults.set(latsMax, forKey: Keys.latsMax)
            } else if(muscleString == "Glutes"){
            let glutesMax = 4
            defaults.set(glutesMax, forKey: Keys.glutesMax)
            } else if(muscleString == "Glute Medius"){
            let gluteMediusMax = 12
            defaults.set(gluteMediusMax, forKey: Keys.gluteMediusMax)
            } else if(muscleString == "Hamstrings"){
            let hamstringsMax = 10
            defaults.set(hamstringsMax, forKey: Keys.hamstringsMax)
            } else if(muscleString == "Front Shoulder"){
            let frontShoulderMax = 16
            defaults.set(frontShoulderMax, forKey: Keys.frontShoulderMax)
            }  else if(muscleString == "Lateral Shoulder"){
            let lateralShoulderMax = 16
            defaults.set(lateralShoulderMax, forKey: Keys.lateralShoulderMax)
            } else if(muscleString == "Back Shoulder"){
            let backShoulderMax = 16
            defaults.set(backShoulderMax, forKey: Keys.backShoulderMax)
            } else if(muscleString == "Rotator Cuff"){
             let rotatorCuffMax = 12
            defaults.set(rotatorCuffMax, forKey: Keys.rotatorCuffMax)
            } else if(muscleString == "Triceps"){
            let tricepsMax = 10
            defaults.set(tricepsMax, forKey: Keys.tricepsMax)
            } else if(muscleString == "Quads"){
             let quadsMax = 12
            defaults.set(quadsMax, forKey: Keys.quadsMax)
            } else if(muscleString == "Abs"){
             let absMax = 16
            defaults.set(absMax, forKey: Keys.absMax)
            } else if(muscleString == "Obliques"){
            let chestMax = 12
            defaults.set(chestMax, forKey: Keys.chestMax)
            } else if(muscleString == "Serratus"){
            let serratusMax = 16
            defaults.set(serratusMax, forKey: Keys.serratusMax)
            } else if(muscleString == "Transverse Ab"){
            let transverseAbMax = 16
            defaults.set(transverseAbMax, forKey: Keys.transverseAbMax)
            } else if(muscleString == "Calves"){
            let calvesMax = 12
            defaults.set(calvesMax, forKey: Keys.calvesMax)
            } else if(muscleString == "Neck"){
            let neckMax = 10
            defaults.set(neckMax, forKey: Keys.neckMax)
            } else if(muscleString == "Forearm Extensors"){
            let neckMax = 10
            defaults.set(neckMax, forKey: Keys.neckMax)
            } else if(muscleString == "Ulnar Forearm"){
            let ulnarForearmMax = 10
            defaults.set(ulnarForearmMax, forKey: Keys.ulnarForearmMax)
            } else if(muscleString == "Forearm Flexors"){
            let forearmFlexorsMax = 10
            defaults.set(forearmFlexorsMax, forKey: Keys.forearmFlexorsMax)
            } else if(muscleString == "Radial Forearm"){
            let radialForearmMax = 12
            defaults.set(radialForearmMax, forKey: Keys.radialForearmMax)
            } else if(muscleString == "Spinal Erectors"){
            let spinalErectorsMax = 10
            defaults.set(spinalErectorsMax, forKey: Keys.spinalErectorsMax)
            } else if(muscleString == "Upper Traps"){
            let upperTrapsMax = 10
            defaults.set(upperTrapsMax, forKey: Keys.upperTrapsMax)
            } else if(muscleString == "Lower Traps"){
            let lowerTrapsMax = 12
            defaults.set(lowerTrapsMax, forKey: Keys.lowerTrapsMax)
            }
    }
    
    @IBAction func setMRVPressed(_ sender: Any) {
    
    let muscleString = defaults.string(forKey: Keys.muscleString)
           if(muscleString == "Chest"){
            //Set MRV
            let chestMax = Double(MRVTextField.text!)
            defaults.set(chestMax, forKey: Keys.chestMax)
               } else if(muscleString == "Biceps"){
                   let bicepsMax = Double(MRVTextField.text!)
                   defaults.set(bicepsMax, forKey: Keys.bicepsMax)
               } else if(muscleString == "Lats"){
                   let latsMax = Double(MRVTextField.text!)
                   defaults.set(latsMax, forKey: Keys.latsMax)
               } else if(muscleString == "Glutes"){
                   let glutesMax = Double(MRVTextField.text!)
                   defaults.set(glutesMax, forKey: Keys.glutesMax)
               } else if(muscleString == "Glute Medius"){
                   let gluteMediusMax = Double(MRVTextField.text!)
                   defaults.set(gluteMediusMax, forKey: Keys.gluteMediusMax)
               } else if(muscleString == "Hamstrings"){
                   let hamstringsMax = Double(MRVTextField.text!)
                   defaults.set(hamstringsMax, forKey: Keys.hamstringsMax)
               } else if(muscleString == "Front Shoulder"){
                   let frontShoulderMax = Double(MRVTextField.text!)
                   defaults.set(frontShoulderMax, forKey: Keys.frontShoulderMax)
               }  else if(muscleString == "Lateral Shoulder"){
                   let lateralShoulderMax = Double(MRVTextField.text!)
                   defaults.set(lateralShoulderMax, forKey: Keys.lateralShoulderMax)
               } else if(muscleString == "Back Shoulder"){
                   let backShoulderMax = Double(MRVTextField.text!)
                   defaults.set(backShoulderMax, forKey: Keys.backShoulderMax)
               } else if(muscleString == "Rotator Cuff"){
                   let rotatorCuffMax = Double(MRVTextField.text!)
                   defaults.set(rotatorCuffMax, forKey: Keys.rotatorCuffMax)
               } else if(muscleString == "Triceps"){
                   let tricepsMax = Double(MRVTextField.text!)
                   defaults.set(tricepsMax, forKey: Keys.tricepsMax)
               } else if(muscleString == "Quads"){
                   let quadsMax = Double(MRVTextField.text!)
                   defaults.set(quadsMax, forKey: Keys.quadsMax)
               } else if(muscleString == "Abs"){
                   let absMax = Double(MRVTextField.text!)
                   defaults.set(absMax, forKey: Keys.absMax)
               } else if(muscleString == "Obliques"){
                   let obliquesMax = Double(MRVTextField.text!)
                   defaults.set(obliquesMax, forKey: Keys.obliquesMax)
               } else if(muscleString == "Serratus"){
                   let serratusMax = Double(MRVTextField.text!)
                   defaults.set(serratusMax, forKey: Keys.serratusMax)
               } else if(muscleString == "Transverse Ab"){
                   let transverseAbMax = Double(MRVTextField.text!)
                   defaults.set(transverseAbMax, forKey: Keys.transverseAbMax)
               } else if(muscleString == "Calves"){
                   let calvesMax = Double(MRVTextField.text!)
                   defaults.set(calvesMax, forKey: Keys.calvesMax)
               } else if(muscleString == "Neck"){
                   let neckMax = Double(MRVTextField.text!)
                   defaults.set(neckMax, forKey: Keys.neckMax)
               } else if(muscleString == "Forearm Extensors"){
                   let forearmExtensorsMax = Double(MRVTextField.text!)
                   defaults.set(forearmExtensorsMax, forKey: Keys.forearmExtensorsMax)
               } else if(muscleString == "Ulnar Forearm"){
                   let ulnarForearmMax = Double(MRVTextField.text!)
                   defaults.set(ulnarForearmMax, forKey: Keys.ulnarForearmMax)
               } else if(muscleString == "Forearm Flexors"){
                   let forearmFlexorsMax = Double(MRVTextField.text!)
                   defaults.set(forearmFlexorsMax, forKey: Keys.forearmFlexorsMax)
               } else if(muscleString == "Radial Forearm"){
                   let radialForearmMax = Double(MRVTextField.text!)
                   defaults.set(radialForearmMax, forKey: Keys.radialForearmMax)
               } else if(muscleString == "Spinal Erectors"){
                   let spinalErectorsMax = Double(MRVTextField.text!)
                   defaults.set(spinalErectorsMax, forKey: Keys.spinalErectorsMax)
               } else if(muscleString == "Upper Traps"){
                   let upperTrapsMax = Double(MRVTextField.text!)
                   defaults.set(upperTrapsMax, forKey: Keys.upperTrapsMax)
               } else if(muscleString == "Lower Traps"){
                   let lowerTrapsMax = Double(MRVTextField.text!)
                   defaults.set(lowerTrapsMax, forKey: Keys.lowerTrapsMax)
               }
    
    }
}
