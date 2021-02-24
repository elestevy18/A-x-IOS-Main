//
//  MuscleInfoViewController.swift
//  AofX
//
//  Created by Kevin Jimenez on 7/20/20.
//  Copyright © 2020 Aesthet(X). All rights reserved.
//

import UIKit
import MaterialShowcase

class MuscleInfoViewController: UIViewController {
    
    

    @IBOutlet weak var anatomyImage: UIImageView!
    @IBOutlet weak var resetMaxButton: UIButton!
    @IBOutlet weak var resetVolumeButton: UIButton!
    @IBOutlet weak var setMRVButton: UIButton!
    @IBOutlet weak var currentMaxLabel: UILabel!
    @IBOutlet weak var currentVolumeLabel: UILabel!
    @IBOutlet weak var MRVTextField: UITextField!
    
    var imageList:[String] = []
    var maxImages: Int = 0
    static var imageIndex: NSInteger = 0
    
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Swiping through images. set images according to muscle group
        
        
        var maxString = "Vanilla"
        var currentVolumeString = "Vanilla"
        let muscleString = defaults.string(forKey: Save.muscleString)
        
        if(muscleString == "Chest"){
            anatomyImage.image = UIImage(named:"pecs")
            currentMaxLabel.text = maxString
            currentVolumeLabel.text = currentVolumeString
            //Assign volume and max text
            let chestMax = defaults.integer(forKey: Save.chestMax)
            maxString = "Current Max: " + String(chestMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Save.chestProgressInt))
        } else if(muscleString == "Biceps"){
            setGestures()
           anatomyImage.image = UIImage(named:"bicepsthreedee")
            maxImages = 1
            imageList = ["bicepsthreedee", "biceps"]
            
            let bicepsMax = defaults.integer(forKey: Save.bicepsMax)
            maxString = "Current Max: " + String(bicepsMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Save.bicepsProgressInt))
        } else if(muscleString == "Lats"){
            
            anatomyImage.image = UIImage(named:"latissimusdorsi")
            
            let latsMax = defaults.integer(forKey: Save.latsMax)
            maxString = "Current Max: " + String(latsMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Save.latsProgressInt))
        } else if(muscleString == "Glutes"){
            setGestures()
            anatomyImage.image = UIImage(named:"glutemax")
         
            
            let glutesMax = defaults.integer(forKey: Save.glutesMax)
            maxString = "Current Max: " + String(glutesMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Save.glutesProgressInt))
        } else if(muscleString == "Glute Medius"){
         
            setGestures()
            anatomyImage.image = UIImage(named:"glutemedius")
           
            
            let gluteMediusMax = defaults.integer(forKey: Save.gluteMediusMax)
            maxString = "Current Max: " + String(gluteMediusMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Save.gluteMediusProgressInt))
        } else if(muscleString == "Hamstrings"){
            setGestures()
            anatomyImage.image = UIImage(named:"hamstringbicepfemoris")
            maxImages = 2
            imageList = ["hamstringbicepfemoris", "hamstringsemimembranosus", "hamstringsemitendinosus"]
            
            let hamstringsMax = defaults.integer(forKey: Save.hamstringsMax)
            maxString = "Current Max: " + String(hamstringsMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Save.hamstringsProgressInt))
        } else if(muscleString == "Front Shoulder"){
            anatomyImage.image = UIImage(named:"anteriordeltoid")
            
            let frontShoulderMax = defaults.integer(forKey: Save.frontShoulderMax)
            maxString = "Current Max: " + String(frontShoulderMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Save.frontShoulderProgressInt))
        }  else if(muscleString == "Lateral Shoulder"){
            anatomyImage.image = UIImage(named:"medialdeltoidlateralview")
            
            let lateralShoulderMax = defaults.integer(forKey: Save.lateralShoulderMax)
            maxString = "Current Max: " + String(lateralShoulderMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Save.lateralShoulderProgressInt))
        } else if(muscleString == "Back Shoulder"){
            setGestures()
           anatomyImage.image = UIImage(named:"posteriordeltoidsuperior")
            maxImages = 1
            imageList = ["posteriordeltoidsuperior", "posteriordeltoidposteriorview"]
            
            let backShoulderMax = defaults.integer(forKey: Save.backShoulderMax)
            maxString = "Current Max: " + String(backShoulderMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Save.backShoulderProgressInt))
        } else if(muscleString == "Rotator Cuff"){
            setGestures()
            anatomyImage.image = UIImage(named:"rotatorcuff")
            maxImages = 1
            imageList = ["rotatorcuff", "infraspinatusthreedee"]
            
            let rotatorCuffMax = defaults.integer(forKey: Save.rotatorCuffMax)
            maxString = "Current Max: " + String(rotatorCuffMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Save.rotatorCuffProgressInt))
        } else if(muscleString == "Triceps"){
            setGestures()
            anatomyImage.image = UIImage(named:"triceps")
            maxImages = 1
            imageList = ["triceps", "tricepswhole"]
            
            let tricepsMax = defaults.integer(forKey: Save.tricepsMax)
            maxString = "Current Max: " + String(tricepsMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Save.tricepsProgressInt))
        } else if(muscleString == "Quads"){
            anatomyImage.image = UIImage(named:"quadriceps")
            
            let quadsMax = defaults.integer(forKey: Save.quadsMax)
            maxString = "Current Max: " + String(quadsMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Save.quadsProgressInt))
        } else if(muscleString == "Abs"){
            anatomyImage.image = UIImage(named:"rectusabdominis")
            
            let absMax = defaults.integer(forKey: Save.absMax)
            maxString = "Current Max: " + String(absMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Save.absProgressInt))
        } else if(muscleString == "Obliques"){
            anatomyImage.image = UIImage(named:"obliques")
            
            let obliquesMax = defaults.integer(forKey: Save.obliquesMax)
            maxString = "Current Max: " + String(obliquesMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Save.obliquesProgressInt))
        } else if(muscleString == "Serratus"){
            anatomyImage.image = UIImage(named:"serratus")
            maxImages = 1
            imageList = ["serratus", "serratusanterior"]
            
            let serratusMax = defaults.integer(forKey: Save.serratusMax)
            maxString = "Current Max: " + String(serratusMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Save.serratusProgressInt))
        } else if(muscleString == "Transverse Ab"){
            anatomyImage.image = UIImage(named:"transversusabdominis")
            
            let transverseAbMax = defaults.integer(forKey: Save.transverseAbMax)
            maxString = "Current Max: " + String(transverseAbMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Save.transverseAbProgressInt))
        } else if(muscleString == "Calves"){
            setGestures()
            anatomyImage.image = UIImage(named:"calfgastroc")
            maxImages = 1
            imageList = ["calfgastroc", "calfsoleus"]
            
            let calvesMax = defaults.integer(forKey: Save.calvesMax)
            maxString = "Current Max: " + String(calvesMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Save.calvesProgressInt))
        } else if(muscleString == "Neck"){
            setGestures()
            anatomyImage.image = UIImage(named:"neckanteriorview")
            maxImages = 2
            imageList = ["neckanteriorview", "necklateralview", "neckposteriorview"]
            
            let neckMax = defaults.integer(forKey: Save.neckMax)
            maxString = "Current Max: " + String(neckMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Save.neckProgressInt))
        } else if(muscleString == "Forearm Extensors"){
            setGestures()
            anatomyImage.image = UIImage(named:"extensors")
            maxImages = 1
            imageList = ["extensors", "forearmcorsssection"]
            
            let forearmExtensorsMax = defaults.integer(forKey: Save.forearmExtensorsMax)
            maxString = "Current Max: " + String(forearmExtensorsMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Save.forearmExtensorsProgressInt))
        } else if(muscleString == "Ulnar Forearm"){
            setGestures()
            anatomyImage.image = UIImage(named:"ulnarforearm")
            maxImages = 1
            imageList = ["ulnarforearm", "forearmcorsssection"]
            
            let ulnarForearmMax = defaults.integer(forKey: Save.ulnarForearmMax)
            maxString = "Current Max: " + String(ulnarForearmMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Save.ulnarForearmProgressInt))
        } else if(muscleString == "Forearm Flexors"){
            setGestures()
            anatomyImage.image = UIImage(named:"superficialforearmflexor")
            maxImages = 2
            imageList = ["superficialforearmflexor", "deepforearmflexors", "forearmcorsssection"]
            
            let forearmFlexorsMax = defaults.integer(forKey: Save.forearmFlexorsMax)
            maxString = "Current Max: " + String(forearmFlexorsMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Save.forearmFlexorsProgressInt))
        } else if(muscleString == "Forearm Flexors"){
            setGestures()
            anatomyImage.image = UIImage(named:"superficialforearmflexor")
            maxImages = 2
            imageList = ["superficialforearmflexor", "deepforearmflexors", "forearmcorsssection"]
            
            let forearmFlexorsMax = defaults.integer(forKey: Save.forearmFlexorsMax)
            maxString = "Current Max: " + String(forearmFlexorsMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Save.forearmFlexorsProgressInt))
        } else if(muscleString == "Radial Forearm"){
            setGestures()
            anatomyImage.image = UIImage(named:"brachioradialis")
            maxImages = 1
            imageList = ["brachioradialis", "forearmcorsssection"]
            
            let radialForearmMax = defaults.integer(forKey: Save.radialForearmMax)
            maxString = "Current Max: " + String(radialForearmMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Save.radialForearmProgressInt))
        } else if(muscleString == "Spinal Erectors"){
            anatomyImage.image = UIImage(named:"erectors")
            
            let spinalErectorsMax = defaults.integer(forKey: Save.spinalErectorsMax)
            maxString = "Current Max: " + String(spinalErectorsMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Save.spinalErectorsProgressInt))
        } else if(muscleString == "Upper Traps"){
            anatomyImage.image = UIImage(named:"uppertrapszoom")
            
            let upperTrapsMax = defaults.integer(forKey: Save.upperTrapsMax)
            maxString = "Current Max: " + String(upperTrapsMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Save.upperTrapsProgressInt))
        } else if(muscleString == "Lower Traps"){
            anatomyImage.image = UIImage(named:"lowertraps")
            
            let lowerTrapsMax = defaults.integer(forKey: Save.lowerTrapsMax)
            maxString = "Current Max: " + String(lowerTrapsMax)
            currentVolumeString = "Current Volume: " + String(defaults.double(forKey: Save.lowerTrapsProgressInt))
        }
        
        currentMaxLabel.text = maxString
        currentVolumeLabel.text = currentVolumeString
        
        if(muscleString == "Chest"){
      
              } else if(muscleString == "Biceps"){
                  setGestures()
                 anatomyImage.image = UIImage(named:"bicepsthreedee")
                  maxImages = 1
                  imageList = ["bicepsthreedee", "biceps"]
              } else if(muscleString == "Lats"){

                  anatomyImage.image = UIImage(named:"latissimusdorsi")
              } else if(muscleString == "Glutes"){
                  setGestures()
                  anatomyImage.image = UIImage(named:"glutemax")
                  maxImages = 1
                  imageList = ["glutemax", "glutescutmajor"]
              } else if(muscleString == "Glute Medius"){
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
                  anatomyImage.image = UIImage(named:"anteriordeltoid")
              }  else if(muscleString == "Lateral Shoulder"){
                  anatomyImage.image = UIImage(named:"medialdeltoidlateralview")
              } else if(muscleString == "Back Shoulder"){
                  setGestures()
                 anatomyImage.image = UIImage(named:"posteriordeltoidsuperior")
                  maxImages = 1
                  imageList = ["posteriordeltoidsuperior", "posteriordeltoidposteriorview"]
              } else if(muscleString == "Rotator Cuff"){
                  setGestures()
                  anatomyImage.image = UIImage(named:"rotatorcuff")
                  maxImages = 1
                  imageList = ["rotatorcuff", "infraspinatusthreedee"]
              } else if(muscleString == "Triceps"){
                  setGestures()
                  anatomyImage.image = UIImage(named:"triceps")
                  maxImages = 1
                  imageList = ["triceps", "tricepswhole"]
              } else if(muscleString == "Quads"){
                  anatomyImage.image = UIImage(named:"quadriceps")
              } else if(muscleString == "Abs"){
                  anatomyImage.image = UIImage(named:"rectusabdominis")
              } else if(muscleString == "Obliques"){
                  anatomyImage.image = UIImage(named:"obliques")
              } else if(muscleString == "Serratus"){
                  anatomyImage.image = UIImage(named:"serratus")
                  maxImages = 1
                  imageList = ["serratus", "serratusanterior"]
              } else if(muscleString == "Transverse Ab"){
                  anatomyImage.image = UIImage(named:"transversusabdominis")
              } else if(muscleString == "Calves"){
                  setGestures()
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
                  anatomyImage.image = UIImage(named:"extensors")
                  maxImages = 1
                  imageList = ["extensors", "forearmcorsssection"]
              } else if(muscleString == "Ulnar Forearm"){
                  setGestures()
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
                  anatomyImage.image = UIImage(named:"brachioradialis")
                  maxImages = 1
                  imageList = ["brachioradialis", "forearmcorsssection"]
              } else if(muscleString == "Spinal Erectors"){
                  anatomyImage.image = UIImage(named:"erectors")
              } else if(muscleString == "Upper Traps"){
                  anatomyImage.image = UIImage(named:"uppertrapszoom")
              } else if(muscleString == "Lower Traps"){
                  anatomyImage.image = UIImage(named:"lowertraps")
              }
        


        
        styleButton(button: resetMaxButton)
        resetMaxButton.layer.cornerRadius = 15
        styleButton(button: resetVolumeButton)
        resetVolumeButton.layer.cornerRadius = 15
        styleButton(button: setMRVButton)
        setMRVButton.layer.cornerRadius = 15
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let showCase = defaults.bool(forKey: Save.firstTimeShowcaseAnatomy)
        
        
        if showCase == false {
            
            
            let showcase1 = MaterialShowcase()
            showcase1.setTargetView(view: resetMaxButton)
            showcase1.primaryText = "Reset MAV"
            showcase1.secondaryText = "This will reset the weekly volume to the default below."
            showcase1.primaryTextColor = UIColor.black
            showcase1.secondaryTextColor = UIColor.black
            showcase1.backgroundViewType = .full
            showcase1.backgroundPromptColor = Colors.aXGreen
            showcase1.targetHolderColor = UIColor.black
            showcase1.targetHolderRadius = 70
            
            showcase1.show(completion: {
                self.defaults.setValue(true, forKey: Save.firstTimeShowcaseAnatomy)
            })
            
            let showcase2 = MaterialShowcase()
            showcase2.setTargetView(view: resetVolumeButton)
            showcase2.primaryText = "Reset Weekly Sets"
            showcase2.secondaryText = "This resets your weekly sets to 0 for the selected muscle."
            showcase2.primaryTextColor = UIColor.black
            showcase2.secondaryTextColor = UIColor.black
            showcase2.backgroundViewType = .full
            showcase2.backgroundPromptColor = Colors.aXGreen
            showcase2.targetHolderColor = UIColor.black
            showcase2.targetHolderRadius = 70
            
            showcase2.show(completion: {
                self.defaults.setValue(true, forKey: Save.firstTimeShowcaseAnatomy)
            })
            
            let showcase3 = MaterialShowcase()
            showcase3.setTargetView(view: setMRVButton)
            showcase3.primaryText = "Custom Volume"
            showcase3.secondaryText = "Customize your weekly volume by inputing your desired volume on the left."
            showcase3.primaryTextColor = UIColor.black
            showcase3.secondaryTextColor = UIColor.black
            showcase3.backgroundViewType = .full
            showcase3.backgroundPromptColor = Colors.aXGreen
            showcase3.targetHolderColor = UIColor.black
            showcase3.targetHolderRadius = 70
            showcase3.show(completion: {
                self.defaults.setValue(true, forKey: Save.firstTimeShowcaseAnatomy)
            })
            
            let showcase0 = MaterialShowcase()
            showcase0.setTargetView(view: anatomyImage)
            showcase0.primaryText = "Swipe to View More"
            showcase0.secondaryText = "Not all muscle support multiple views."
            showcase0.primaryTextColor = UIColor.black
            showcase0.secondaryTextColor = UIColor.black
            showcase0.backgroundViewType = .full
            showcase0.backgroundPromptColor = Colors.aXGreen
            showcase0.targetHolderColor = UIColor.black
            showcase0.targetHolderRadius = 100
            
            showcase0.show(completion: {
                self.defaults.setValue(true, forKey: Save.firstTimeShowcaseAnatomy)
            })
             
        }
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
            // decrease index first
            MuscleInfoViewController.imageIndex-=1
            // check if index is in range
            if MuscleInfoViewController.imageIndex < 0 {
                MuscleInfoViewController.imageIndex = maxImages
            }
            anatomyImage.image = UIImage(named: imageList[MuscleInfoViewController.imageIndex])

        case UISwipeGestureRecognizer.Direction.left:
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
         let muscleString = defaults.string(forKey: Save.muscleString)
       if(muscleString == "Chest"){
                defaults.removeObject(forKey: Save.chestProgress)
                defaults.removeObject(forKey: Save.chestProgressInt)
            } else if(muscleString == "Biceps"){
                defaults.removeObject(forKey: Save.bicepsProgress)
                defaults.removeObject(forKey: Save.bicepsProgressInt)
            } else if(muscleString == "Lats"){
                defaults.removeObject(forKey: Save.latsProgress)
                defaults.removeObject(forKey: Save.latsProgressInt)
            } else if(muscleString == "Glutes"){
                defaults.removeObject(forKey: Save.glutesProgress)
                defaults.removeObject(forKey: Save.glutesProgressInt)
            } else if(muscleString == "Glute Medius"){
                defaults.removeObject(forKey: Save.gluteMediusProgress)
                defaults.removeObject(forKey: Save.gluteMediusProgressInt)
            } else if(muscleString == "Hamstrings"){
                defaults.removeObject(forKey: Save.hamstringsProgress)
                defaults.removeObject(forKey: Save.hamstringsProgressInt)
            } else if(muscleString == "Front Shoulder"){
                defaults.removeObject(forKey: Save.frontShoulderProgress)
                defaults.removeObject(forKey: Save.frontShoulderProgressInt)
            }  else if(muscleString == "Lateral Shoulder"){
                defaults.removeObject(forKey: Save.lateralShoulderProgress)
                defaults.removeObject(forKey: Save.lateralShoulderProgressInt)
            } else if(muscleString == "Back Shoulder"){
                defaults.removeObject(forKey: Save.backShoulderProgress)
                defaults.removeObject(forKey: Save.backShoulderProgressInt)
            } else if(muscleString == "Rotator Cuff"){
                defaults.removeObject(forKey: Save.rotatorCuffProgress)
                defaults.removeObject(forKey: Save.rotatorCuffProgressInt)
            } else if(muscleString == "Triceps"){
                defaults.removeObject(forKey: Save.tricepsProgress)
                defaults.removeObject(forKey: Save.tricepsProgressInt)
            } else if(muscleString == "Quads"){
                defaults.removeObject(forKey: Save.quadsProgress)
                defaults.removeObject(forKey: Save.quadsProgressInt)
            } else if(muscleString == "Abs"){
                defaults.removeObject(forKey: Save.absProgress)
                defaults.removeObject(forKey: Save.absProgressInt)
            } else if(muscleString == "Obliques"){
                defaults.removeObject(forKey: Save.obliquesProgress)
                defaults.removeObject(forKey: Save.obliquesProgressInt)
            } else if(muscleString == "Serratus"){
                defaults.removeObject(forKey: Save.serratusProgress)
                defaults.removeObject(forKey: Save.serratusProgressInt)
            } else if(muscleString == "Transverse Ab"){
                defaults.removeObject(forKey: Save.transverseAbProgress)
                defaults.removeObject(forKey: Save.transverseAbProgressInt)
            } else if(muscleString == "Calves"){
                defaults.removeObject(forKey: Save.calvesProgress)
                defaults.removeObject(forKey: Save.calvesProgressInt)
            } else if(muscleString == "Neck"){
                defaults.removeObject(forKey: Save.neckProgress)
                defaults.removeObject(forKey: Save.neckProgressInt)
            } else if(muscleString == "Forearm Extensors"){
                defaults.removeObject(forKey: Save.forearmExtensorsProgress)
                defaults.removeObject(forKey: Save.forearmExtensorsProgressInt)
            } else if(muscleString == "Ulnar Forearm"){
                defaults.removeObject(forKey: Save.ulnarForearmProgress)
                defaults.removeObject(forKey: Save.ulnarForearmProgressInt)
            } else if(muscleString == "Forearm Flexors"){
                defaults.removeObject(forKey: Save.forearmFlexorsProgress)
                defaults.removeObject(forKey: Save.forearmFlexorsProgressInt)
            } else if(muscleString == "Radial Forearm"){
                defaults.removeObject(forKey: Save.radialForearmProgress)
                defaults.removeObject(forKey: Save.radialForearmProgressInt)
            } else if(muscleString == "Spinal Erectors"){
                defaults.removeObject(forKey: Save.spinalErectorsProgress)
                defaults.removeObject(forKey: Save.spinalErectorsProgressInt)
            } else if(muscleString == "Upper Traps"){
                defaults.removeObject(forKey: Save.upperTrapsProgress)
                defaults.removeObject(forKey: Save.upperTrapsProgressInt)
            } else if(muscleString == "Lower Traps"){
                defaults.removeObject(forKey: Save.lowerTrapsProgress)
                defaults.removeObject(forKey: Save.lowerTrapsProgressInt)
            }
        
        
    }
    @IBAction func resetMaxPressed(_ sender: Any) {
        
        let muscleString = defaults.string(forKey: Save.muscleString)
        if(muscleString == "Chest"){
            //Reset Max
            let chestMax = 12
            defaults.set(chestMax, forKey: Save.chestMax)
            } else if(muscleString == "Biceps"){
            //Reset Max
            let bicepsMax = 14
            defaults.set(bicepsMax, forKey: Save.bicepsMax)
            } else if(muscleString == "Lats"){
            let latsMax = 12
            defaults.set(latsMax, forKey: Save.latsMax)
            } else if(muscleString == "Glutes"){
            let glutesMax = 4
            defaults.set(glutesMax, forKey: Save.glutesMax)
            } else if(muscleString == "Glute Medius"){
            let gluteMediusMax = 12
            defaults.set(gluteMediusMax, forKey: Save.gluteMediusMax)
            } else if(muscleString == "Hamstrings"){
            let hamstringsMax = 10
            defaults.set(hamstringsMax, forKey: Save.hamstringsMax)
            } else if(muscleString == "Front Shoulder"){
            let frontShoulderMax = 16
            defaults.set(frontShoulderMax, forKey: Save.frontShoulderMax)
            }  else if(muscleString == "Lateral Shoulder"){
            let lateralShoulderMax = 16
            defaults.set(lateralShoulderMax, forKey: Save.lateralShoulderMax)
            } else if(muscleString == "Back Shoulder"){
            let backShoulderMax = 16
            defaults.set(backShoulderMax, forKey: Save.backShoulderMax)
            } else if(muscleString == "Rotator Cuff"){
             let rotatorCuffMax = 12
            defaults.set(rotatorCuffMax, forKey: Save.rotatorCuffMax)
            } else if(muscleString == "Triceps"){
            let tricepsMax = 10
            defaults.set(tricepsMax, forKey: Save.tricepsMax)
            } else if(muscleString == "Quads"){
             let quadsMax = 12
            defaults.set(quadsMax, forKey: Save.quadsMax)
            } else if(muscleString == "Abs"){
             let absMax = 16
            defaults.set(absMax, forKey: Save.absMax)
            } else if(muscleString == "Obliques"){
            let chestMax = 12
            defaults.set(chestMax, forKey: Save.chestMax)
            } else if(muscleString == "Serratus"){
            let serratusMax = 16
            defaults.set(serratusMax, forKey: Save.serratusMax)
            } else if(muscleString == "Transverse Ab"){
            let transverseAbMax = 16
            defaults.set(transverseAbMax, forKey: Save.transverseAbMax)
            } else if(muscleString == "Calves"){
            let calvesMax = 12
            defaults.set(calvesMax, forKey: Save.calvesMax)
            } else if(muscleString == "Neck"){
            let neckMax = 10
            defaults.set(neckMax, forKey: Save.neckMax)
            } else if(muscleString == "Forearm Extensors"){
            let neckMax = 10
            defaults.set(neckMax, forKey: Save.neckMax)
            } else if(muscleString == "Ulnar Forearm"){
            let ulnarForearmMax = 10
            defaults.set(ulnarForearmMax, forKey: Save.ulnarForearmMax)
            } else if(muscleString == "Forearm Flexors"){
            let forearmFlexorsMax = 10
            defaults.set(forearmFlexorsMax, forKey: Save.forearmFlexorsMax)
            } else if(muscleString == "Radial Forearm"){
            let radialForearmMax = 12
            defaults.set(radialForearmMax, forKey: Save.radialForearmMax)
            } else if(muscleString == "Spinal Erectors"){
            let spinalErectorsMax = 10
            defaults.set(spinalErectorsMax, forKey: Save.spinalErectorsMax)
            } else if(muscleString == "Upper Traps"){
            let upperTrapsMax = 10
            defaults.set(upperTrapsMax, forKey: Save.upperTrapsMax)
            } else if(muscleString == "Lower Traps"){
            let lowerTrapsMax = 12
            defaults.set(lowerTrapsMax, forKey: Save.lowerTrapsMax)
            }
    }
    
    @IBAction func setMRVPressed(_ sender: Any) {
    
    let muscleString = defaults.string(forKey: Save.muscleString)
           if(muscleString == "Chest"){
            //Set MRV
            let chestMax = Double(MRVTextField.text!)
            defaults.set(chestMax, forKey: Save.chestMax)
               } else if(muscleString == "Biceps"){
                   let bicepsMax = Double(MRVTextField.text!)
                   defaults.set(bicepsMax, forKey: Save.bicepsMax)
               } else if(muscleString == "Lats"){
                   let latsMax = Double(MRVTextField.text!)
                   defaults.set(latsMax, forKey: Save.latsMax)
               } else if(muscleString == "Glutes"){
                   let glutesMax = Double(MRVTextField.text!)
                   defaults.set(glutesMax, forKey: Save.glutesMax)
               } else if(muscleString == "Glute Medius"){
                   let gluteMediusMax = Double(MRVTextField.text!)
                   defaults.set(gluteMediusMax, forKey: Save.gluteMediusMax)
               } else if(muscleString == "Hamstrings"){
                   let hamstringsMax = Double(MRVTextField.text!)
                   defaults.set(hamstringsMax, forKey: Save.hamstringsMax)
               } else if(muscleString == "Front Shoulder"){
                   let frontShoulderMax = Double(MRVTextField.text!)
                   defaults.set(frontShoulderMax, forKey: Save.frontShoulderMax)
               }  else if(muscleString == "Lateral Shoulder"){
                   let lateralShoulderMax = Double(MRVTextField.text!)
                   defaults.set(lateralShoulderMax, forKey: Save.lateralShoulderMax)
               } else if(muscleString == "Back Shoulder"){
                   let backShoulderMax = Double(MRVTextField.text!)
                   defaults.set(backShoulderMax, forKey: Save.backShoulderMax)
               } else if(muscleString == "Rotator Cuff"){
                   let rotatorCuffMax = Double(MRVTextField.text!)
                   defaults.set(rotatorCuffMax, forKey: Save.rotatorCuffMax)
               } else if(muscleString == "Triceps"){
                   let tricepsMax = Double(MRVTextField.text!)
                   defaults.set(tricepsMax, forKey: Save.tricepsMax)
               } else if(muscleString == "Quads"){
                   let quadsMax = Double(MRVTextField.text!)
                   defaults.set(quadsMax, forKey: Save.quadsMax)
               } else if(muscleString == "Abs"){
                   let absMax = Double(MRVTextField.text!)
                   defaults.set(absMax, forKey: Save.absMax)
               } else if(muscleString == "Obliques"){
                   let obliquesMax = Double(MRVTextField.text!)
                   defaults.set(obliquesMax, forKey: Save.obliquesMax)
               } else if(muscleString == "Serratus"){
                   let serratusMax = Double(MRVTextField.text!)
                   defaults.set(serratusMax, forKey: Save.serratusMax)
               } else if(muscleString == "Transverse Ab"){
                   let transverseAbMax = Double(MRVTextField.text!)
                   defaults.set(transverseAbMax, forKey: Save.transverseAbMax)
               } else if(muscleString == "Calves"){
                   let calvesMax = Double(MRVTextField.text!)
                   defaults.set(calvesMax, forKey: Save.calvesMax)
               } else if(muscleString == "Neck"){
                   let neckMax = Double(MRVTextField.text!)
                   defaults.set(neckMax, forKey: Save.neckMax)
               } else if(muscleString == "Forearm Extensors"){
                   let forearmExtensorsMax = Double(MRVTextField.text!)
                   defaults.set(forearmExtensorsMax, forKey: Save.forearmExtensorsMax)
               } else if(muscleString == "Ulnar Forearm"){
                   let ulnarForearmMax = Double(MRVTextField.text!)
                   defaults.set(ulnarForearmMax, forKey: Save.ulnarForearmMax)
               } else if(muscleString == "Forearm Flexors"){
                   let forearmFlexorsMax = Double(MRVTextField.text!)
                   defaults.set(forearmFlexorsMax, forKey: Save.forearmFlexorsMax)
               } else if(muscleString == "Radial Forearm"){
                   let radialForearmMax = Double(MRVTextField.text!)
                   defaults.set(radialForearmMax, forKey: Save.radialForearmMax)
               } else if(muscleString == "Spinal Erectors"){
                   let spinalErectorsMax = Double(MRVTextField.text!)
                   defaults.set(spinalErectorsMax, forKey: Save.spinalErectorsMax)
               } else if(muscleString == "Upper Traps"){
                   let upperTrapsMax = Double(MRVTextField.text!)
                   defaults.set(upperTrapsMax, forKey: Save.upperTrapsMax)
               } else if(muscleString == "Lower Traps"){
                   let lowerTrapsMax = Double(MRVTextField.text!)
                   defaults.set(lowerTrapsMax, forKey: Save.lowerTrapsMax)
               }
    
    }
}
