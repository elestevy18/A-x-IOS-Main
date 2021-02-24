//
//  DashBoardViewController.swift
//  AofX
//
//  Created by Kevin Jimenez on 7/10/20.
//  Copyright © 2020 Aesthet(X). All rights reserved.
//

import UIKit
import GoogleMobileAds
import MaterialShowcase

class DashBoardViewController: UIViewController {
    
    //Outlets for buttons
    @IBOutlet weak var IBWButton: UIButton!
    @IBOutlet weak var GrowthRateButton: UIButton!
    @IBOutlet weak var PotentialFatloss: UIButton!
    @IBOutlet weak var CurrentMuscleGrowth: UIButton!
    
   //Outlets for labels
    @IBOutlet weak var IBWLabel: UILabel!
    @IBOutlet weak var MonthlyPotentialMuscleGrowthLabel: UILabel!
    @IBOutlet weak var FAQButton: UIButton!
    @IBOutlet weak var FatlossLabel: UILabel!
    @IBOutlet weak var ToInfobutton: UIButton!
    @IBOutlet weak var RookieLabel: UILabel!
    @IBOutlet weak var CircleText: UILabel!
    var installDate = Date()
    var expired = Bool()
    
    let defaults = UserDefaults.standard
    let shapeLayer = CAShapeLayer()
    
    private var interstitialAd: GADInterstitial?
       
       struct Constants{
           static let volumeAD = "ca-app-pub-3950672419252348/8930486777"
       }

    @IBOutlet weak var goToInfoCollection: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(DashBoardViewController.titleWasTapped))
        navigationItem.titleView?.isUserInteractionEnabled = true
        navigationItem.titleView?.addGestureRecognizer(recognizer)
        
        
        //RETRIEVE DATA TO DISPLAY
        let totalMuscleGrowth           = defaults.double(forKey: Save.totalMuscleGrowth)
        let totalMuscleGrowthString     = String(format: "%.2f", totalMuscleGrowth)
        let idealBodyWeight             = defaults.double(forKey: Save.idealBodyWeight)
        let idealBodyWeightString       = String(format: "%.2f", idealBodyWeight)
        let fatLoss                     = round(defaults.double(forKey: Save.fatLoss))
        let fatLossString               = String(format: "%.2f", fatLoss)
        let currentMuscleGrowth         = defaults.double(forKey: Save.currentMuscleGrowth)
        let currentMuscleGrowthString   = String(format: "%.2f", currentMuscleGrowth)
        _                               = defaults.double(forKey: Save.potentialMuscleGrowth)
        let muscleGrowthRate            = defaults.double(forKey: Save.muscleGrowthRate)
        let muscleGrowthRateString      = String(format: "%.2f", muscleGrowthRate)
        _                               = defaults.data(forKey: Save.dailyCaloricDeviance)
        _                               = defaults.bool(forKey: Save.unitsBool)
        
        
        if (!(idealBodyWeight == 0.00)){
            RookieLabel.isHidden = true
        }
        //String for circle progress bar
        let circleString =  currentMuscleGrowthString + "/\n" + totalMuscleGrowthString
        CircleTextPlacement(label: CircleText)
        CircleText.text = circleString
       
        
        //Ideal Bodyweight Display
        styleButton(button: IBWButton)
        setIBWPosition(button: IBWButton)
        IBWButton.contentHorizontalAlignment = .left
        IBWButton.layer.cornerRadius = IBWButton.frame.height / 6
        
        
    
        
        //Growth rate dispaly button
          styleButton(button: GrowthRateButton)
          setGrowthRatePosition(button: GrowthRateButton)
          GrowthRateButton.layer.cornerRadius = GrowthRateButton.frame.height / 6
        
        
        // POTENTIAL FATLOSS BUTTON
        styleButton(button: PotentialFatloss)
        PotentialFatloss.layer.cornerRadius = PotentialFatloss.frame.height / 6
        setFatLossPosition(button: PotentialFatloss)
       
        
        // CURRENT MUSCLE GROWTH
        styleButton(button: CurrentMuscleGrowth)
        setCurrentGrowthPosition(button: CurrentMuscleGrowth)
        CurrentMuscleGrowth.layer.cornerRadius = CurrentMuscleGrowth.frame.height / 6
        CurrentMuscleGrowth.contentHorizontalAlignment = .left
        
        //INPUT INFORMATION BUTTON
        updateInfoButton(button: ToInfobutton)
        //FAQBUTTON
        FAQButtonPlacement(button: FAQButton)
        RookiePlacement(label: RookieLabel)
        
        //LABELS
        //style
        setIBWNumberLabel(label: IBWLabel)
        setGrowthRateLabel(label: MonthlyPotentialMuscleGrowthLabel)
        setFatLossLabel(label: FatlossLabel)
        
        //set text
        let unitsBool = defaults.bool(forKey: Save.unitsBool)
        var units = " lbs"
        if (unitsBool){ units = " Kg"}
        
        IBWLabel.text = idealBodyWeightString + units
        MonthlyPotentialMuscleGrowthLabel.text = muscleGrowthRateString + units
        FatlossLabel.text = fatLossString + units
        
        //CODE FOR CIRCULAR PROGRESS BAR
        
        //Math to ilustrate progress
        let growthPercentage = Double((2 * CGFloat.pi))
        let  endPoint = (((currentMuscleGrowth * 100) / totalMuscleGrowth) * 0.01) * growthPercentage
   
                // let's start by drawing a circle somehow
                let screenHeight = UIScreen.main.bounds.size.height
                let screenWidth = UIScreen.main.bounds.size.width
                let center = CGPoint(x: screenWidth/1.5, y: screenHeight/1.42)
            
                // create my track layer
                let trackLayer = CAShapeLayer()
                let circularPath = UIBezierPath(arcCenter: center, radius: screenHeight/12, startAngle: 0, endAngle: CGFloat(endPoint), clockwise: true)
                trackLayer.path = UIBezierPath(arcCenter: center, radius: screenHeight/12, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true).cgPath
                trackLayer.strokeColor = UIColor.darkGray.cgColor
                trackLayer.lineWidth = 5
                trackLayer.fillColor = UIColor.clear.cgColor
                trackLayer.lineCap = CAShapeLayerLineCap.round
                view.layer.addSublayer(trackLayer)
                shapeLayer.path = circularPath.cgPath
                let percentage =  ((currentMuscleGrowth * 100) / totalMuscleGrowth) * 0.01
        
        if(percentage <= 0.33){
                shapeLayer.strokeColor = Colors.aXOrange.cgColor
        } else if (percentage > 0.33 && percentage <= 0.66) {
                shapeLayer.strokeColor = UIColor.yellow.cgColor
        } else {
                shapeLayer.strokeColor = Colors.aXPink.cgColor
        }
                shapeLayer.lineWidth = 5
                shapeLayer.fillColor = UIColor.clear.cgColor
                shapeLayer.lineCap = CAShapeLayerLineCap.round
                shapeLayer.strokeEnd = 0
                view.layer.addSublayer(shapeLayer)
                handleTap()
        
                FAQButton.backgroundColor = .clear
                FAQButton.layer.borderWidth = 1
                FAQButton.layer.borderColor = UIColor.systemRed.cgColor
                FAQButton.layer.cornerRadius = 15
        
                ToInfobutton.backgroundColor = .clear
                ToInfobutton.layer.borderWidth = 1
                ToInfobutton.layer.borderColor = UIColor.systemRed.cgColor
                ToInfobutton.layer.cornerRadius = 15
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
      
        let showCase = defaults.bool(forKey: Save.showcaseDashboard)
        let showCaseMP = defaults.bool(forKey: Save.firstTimeShowcaseMealPlan)
        let showCaseInputAsUpdate = defaults.bool(forKey: Save.showCaseInputAsUpdate)
        
        if showCase == false && showCaseMP == false {
            let showcase0 = MaterialShowcase()
            showcase0.setTargetView(button: ToInfobutton, tapThrough: true)
            //  showcase0.setTargetView(view: )
            showcase0.primaryText = "Input and Update Your Info!"
            showcase0.secondaryText = "Get your custom meal plan and goals. \nYou can also update your info as you progress. Remember that your meal plan and muscle growth rate will change over time."
            showcase0.primaryTextColor = UIColor.black
            showcase0.secondaryTextColor = UIColor.black
            showcase0.backgroundViewType = .full
            showcase0.backgroundPromptColor = Colors.aXGreen
            showcase0.targetHolderColor = UIColor.black
            showcase0.targetHolderRadius = 60
            showcase0.aniComeInDuration = 1 // unit: second
            showcase0.show(completion: {
                self.defaults.setValue(true, forKey: Save.showCaseInputAsUpdate)
              
            })
            
            let showcase2 = MaterialShowcase()
            showcase2.setTargetView(button: FAQButton, tapThrough: false)
            //  showcase0.setTargetView(view: )
            showcase2.primaryText = "Frequently Asked Questions"
            showcase2.secondaryText = "Get up to speed on how to train properly.There's a lot to learn, especially if you're new to weight training."
            showcase2.primaryTextColor = UIColor.black
            showcase2.secondaryTextColor = UIColor.black
            showcase2.backgroundViewType = .full
            showcase2.backgroundPromptColor = Colors.aXGreen
            showcase2.targetHolderColor = UIColor.black
            showcase2.targetHolderRadius = 60
            showcase2.aniComeInDuration = 1 // unit: second
            showcase2.show(completion: {
                self.defaults.setValue(true, forKey: Save.showCaseInputAsUpdate)
                self.defaults.setValue(true, forKey: Save.showcaseDashboard)
              
            })
            
            let showcase1 = MaterialShowcase()
            showcase1.setTargetView(button: IBWButton, tapThrough: false)
            //  showcase0.setTargetView(view: )
            showcase1.primaryText = "Learn More"
            showcase1.secondaryText = "Click on any title to learn more about it."
            showcase1.primaryTextColor = UIColor.black
            showcase1.secondaryTextColor = UIColor.black
            showcase1.backgroundViewType = .full
            showcase1.backgroundPromptColor = Colors.aXGreen
            showcase1.targetHolderColor = UIColor.black
            showcase1.targetHolderRadius = 200
            showcase1.aniComeInDuration = 1 // unit: second
            showcase1.show(completion: {
                self.defaults.setValue(true, forKey: Save.showCaseInputAsUpdate)
              
            })

        } else {
            
       
            
            if showCaseInputAsUpdate == false {
                let showcase0 = MaterialShowcase()
                showcase0.setTargetView(button: ToInfobutton, tapThrough: true)
                //  showcase0.setTargetView(view: )
                showcase0.primaryText = "Remember to Update Your Info!"
                showcase0.secondaryText = "Your meal plan and muscle growth rate will change over time.\n\nClick on any title to learn more."
                showcase0.primaryTextColor = UIColor.black
                showcase0.secondaryTextColor = UIColor.black
                showcase0.backgroundViewType = .full
                showcase0.backgroundPromptColor = Colors.aXGreen
                showcase0.targetHolderColor = UIColor.black
                showcase0.targetHolderRadius = 60
                showcase0.aniComeInDuration = 1 // unit: second
                showcase0.show(completion: {
                    self.defaults.setValue(true, forKey: Save.showCaseInputAsUpdate)
                    
                })
                
                let showcase2 = MaterialShowcase()
                showcase2.setTargetView(button: FAQButton, tapThrough: false)
                //  showcase0.setTargetView(view: )
                showcase2.primaryText = "Frequently Asked Questions"
                showcase2.secondaryText = "Get up to speed on how to train properly.There's a lot to learn, especially if you're new to fitness."
                showcase2.primaryTextColor = UIColor.black
                showcase2.secondaryTextColor = UIColor.black
                showcase2.backgroundViewType = .full
                showcase2.backgroundPromptColor = Colors.aXGreen
                showcase2.targetHolderColor = UIColor.black
                showcase2.targetHolderRadius = 60
                showcase2.aniComeInDuration = 1 // unit: second
                showcase2.show(completion: {
                    self.defaults.setValue(true, forKey: Save.showCaseInputAsUpdate)
                    
                })
                
                let showcase1 = MaterialShowcase()
                showcase1.setTargetView(button: IBWButton, tapThrough: false)
                //  showcase0.setTargetView(view: )
                showcase1.primaryText = "Learn More"
                showcase1.secondaryText = "Click on any title to learn more about it."
                showcase1.primaryTextColor = UIColor.black
                showcase1.secondaryTextColor = UIColor.black
                showcase1.backgroundViewType = .full
                showcase1.backgroundPromptColor = Colors.aXGreen
                showcase1.targetHolderColor = UIColor.black
                showcase1.targetHolderRadius = 200
                showcase1.aniComeInDuration = 1 // unit: second
                showcase1.show(completion: {
                    self.defaults.setValue(true, forKey: Save.showCaseInputAsUpdate)
                    self.defaults.setValue(true, forKey: Save.showcaseDashboard)
                })
                
               
        }
    }
    }
    
    
    //Functions to place view programatically
    
    func styleButton(button: UIButton){
        button.backgroundColor = .clear
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func setIBWPosition(button: UIButton) {
        let screenHeight = UIScreen.main.bounds.size.height
        let screenWidth = UIScreen.main.bounds.size.width
        button.frame = CGRect(x: 20, y: screenHeight/8, width: screenWidth * 0.9, height: screenHeight * 0.15)
    }
    
    func setGrowthRatePosition(button: UIButton) {
        let screenHeight = UIScreen.main.bounds.size.height
        let screenWidth = UIScreen.main.bounds.size.width
        button.frame = CGRect(x: 20, y: screenHeight/3.5, width: screenWidth * 0.9, height: screenHeight * 0.15)
     }
    
    func setFatLossPosition(button: UIButton) {
        let screenHeight = UIScreen.main.bounds.size.height
        let screenWidth = UIScreen.main.bounds.size.width
        button.frame = CGRect(x: 20, y: screenHeight/2.24, width: screenWidth * 0.9, height: screenHeight * 0.15)
      }
    
    func setCurrentGrowthPosition(button: UIButton) {
        let screenHeight = UIScreen.main.bounds.size.height
        let screenWidth = UIScreen.main.bounds.size.width
        button.frame = CGRect(x: 20, y: screenHeight/1.649, width: screenWidth * 0.9, height: screenHeight * 0.2)
       }
    
    func updateInfoButton(button: UIButton) {
        let screenHeight = UIScreen.main.bounds.size.height
        let screenWidth = UIScreen.main.bounds.size.width
        button.frame = CGRect(x: (screenWidth/1.35)-12, y: screenHeight/1.21, width: 100, height: 50)
    }
    
    func FAQButtonPlacement(button: UIButton) {
         let screenHeight = UIScreen.main.bounds.size.height
        button.frame = CGRect(x: 8, y: screenHeight/1.21, width: 80, height: 50)
    }
    //Functions to place Labels
    
      func setIBWNumberLabel(label: UILabel) {
            
        let screenHeight = UIScreen.main.bounds.size.height
        label.frame = CGRect(x: 220, y: screenHeight/5.55, width: 120, height: 30)
            
        }
    
    func setGrowthRateLabel(label: UILabel) {
               
        let screenHeight = UIScreen.main.bounds.size.height
        let screenWidth = UIScreen.main.bounds.size.width
        label.frame = CGRect(x: (screenWidth/2)-32, y: screenHeight/2.7, width: 87, height: 30)
               
           }
    
           func setFatLossLabel(label: UILabel) {
                        
            let screenHeight = UIScreen.main.bounds.size.height
            let screenWidth = UIScreen.main.bounds.size.width
            label.frame = CGRect(x: (screenWidth/2)-32, y: screenHeight/1.92, width: 80, height: 30)
                        
                    }
    
    func RookiePlacement(label: UILabel) {
            let screenHeight = UIScreen.main.bounds.size.height
            let screenWidth = UIScreen.main.bounds.size.width
            label.frame = CGRect(x: (screenWidth/2) - 107, y: screenHeight/1.23, width: 193, height: 70)
       }
    
    func CircleTextPlacement(label: UILabel) {
            let screenHeight = UIScreen.main.bounds.size.height
            let screenWidth = UIScreen.main.bounds.size.width
            label.frame = CGRect(x: screenWidth/1.71, y: screenHeight/1.489, width: 63, height: 50)
          }
    
    @IBAction func ToInfoTapped(_ sender: Any) {
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                   let infoCollection = storyboard.instantiateViewController(identifier: "infoCollection")
                   self.show(infoCollection, sender: self)
        
                    //Retrieve info for premium And SHOWADS
                    let annual = defaults.bool(forKey: Save.annualPurchased)
                    let biannual = defaults.bool(forKey: Save.biannualPurchased)
                    let monthly = defaults.bool(forKey: Save.monthlyPurchased)
                    let hsPromo = defaults.bool(forKey: Save.HSPromo)
                    let premium = annual || biannual || monthly || hsPromo
                    
                    if (hsPromo && !(premium)){
                        var promoLength = defaults.double(forKey: Save.promoLength)
                        // print("CALCULATING HS PROMO LENGTH" + String(promoLength))
                        promoLength = promoLength * 31536000
                        installDate = defaults.object(forKey: Save.installDate) as! Date
                        let expDate = installDate.addingTimeInterval(promoLength)
                        if( Date() > expDate){
                            //print("hspromo is flase now due to expiration. Date is:" )
                            defaults.set(false, forKey: Save.HSPromo)
                        }
                    }
                    
                    let x = Int.random(in: 0..<10)
                    //print(" ADS CALCULATED VALUES: " + String(annual) + String(biannual) + String(monthly) + String(hsPromo))
                    if interstitialAd?.isReady ==  true && !premium && (x % 3 == 0 ){
                        interstitialAd?.present(fromRootViewController: self)
                    }
                   
    }
    @IBAction func didTapFAQ(sender: AnyObject) {
      //  UIApplication.shared.openURL(NSURL(string: "")! as URL)
        guard let url = URL(string: "http://aesthet-x.com/faqs/") else {
          return //be safe
        }

        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    @IBAction func IBWTapped(_ sender: Any) {
        let infoString = "ibw"
        defaults.set(infoString, forKey: Save.infoTapped)
    }
    @IBAction func growthRateTapped(_ sender: Any) {
        let infoString = "growthrate"
        defaults.set(infoString, forKey: Save.infoTapped)
    }
    @IBAction func fatlossTapped(_ sender: Any) {
        let infoString = "fatloss"
        defaults.set(infoString, forKey: Save.infoTapped)
    }
    @IBAction func currentGrowthTapped(_ sender: Any) {
        let infoString = "currentgrowth"
        defaults.set(infoString, forKey: Save.infoTapped)
    }
    
    @objc private func handleTap() {
           print("Attempting to animate stroke")
           let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
           basicAnimation.toValue = 1
           basicAnimation.duration = 2
           basicAnimation.fillMode = CAMediaTimingFillMode.forwards
           basicAnimation.isRemovedOnCompletion = false
           shapeLayer.add(basicAnimation, forKey: "urSoBasic")
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

    extension DashBoardViewController: GADInterstitialDelegate{
        func interstitialDidDismissScreen(_ ad: GADInterstitial) {
            interstitialAd = createAd()
        }
    }

