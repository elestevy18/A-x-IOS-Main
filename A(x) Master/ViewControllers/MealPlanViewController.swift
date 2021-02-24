//
//  MealPlanViewController.swift
//  AofX
//
//  Created by Kevin Jimenez on 7/17/20.
//  Copyright © 2020 Aesthet(X). All rights reserved.
//

import UIKit
import Charts
import GoogleMobileAds
import MaterialShowcase


class MealPlanViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    

    
    private var interstitialAd: GADInterstitial?
    
  

    @IBOutlet weak var inputInfoutton: UIButton!
    @IBOutlet weak var pieView: PieChartView!
    @IBOutlet weak var boltImage: UIImageView!
    @IBOutlet weak var calorieNumber: UILabel!
    @IBOutlet weak var dCILAbel: UILabel!
    @IBOutlet weak var caloricIntakeLabel: UILabel!
    @IBOutlet weak var weightLossSpeedLabel: UILabel!
    @IBOutlet weak var weightLossSpeedSeekBar: UISlider!
    @IBOutlet weak var slowLabel: UILabel!
    @IBOutlet weak var fastLabel: UILabel!
    @IBOutlet weak var energySourceLabel: UILabel!
    @IBOutlet weak var carbsLabel: UILabel!
    @IBOutlet weak var fatLabel: UILabel!
    @IBOutlet weak var energySourceSeekBar: UISlider!
    @IBOutlet weak var proteinLabel: UILabel!
    @IBOutlet weak var lowLabel: UILabel!
    @IBOutlet weak var highLabel: UILabel!
    @IBOutlet weak var proteinSeekBar: UISlider!
    @IBOutlet weak var trackWith: UILabel!
    @IBOutlet weak var learnNutritionButton: UIButton!
    @IBOutlet weak var cronometerImage: UIImageView!
    
    
    override func viewDidLoad() {}
    
    override func viewWillAppear(_ animated: Bool){
        super.viewDidLoad()
        //Add borders and round button
        inputInfoutton.layer.borderWidth = 1
        inputInfoutton.layer.borderColor = UIColor.red.cgColor
        inputInfoutton.layer.cornerRadius = 10
        
        
        //Set logo in navigation bar and make it clickable
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "aesthetx30times100")
        imageView.image = image
        navigationItem.titleView = imageView
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(MealPlanViewController.titleWasTapped))
        navigationItem.titleView?.isUserInteractionEnabled = true
        navigationItem.titleView?.addGestureRecognizer(recognizer)
        
        //Place views dynamically
        let screenHeight = UIScreen.main.bounds.size.height
        let screenWidth = UIScreen.main.bounds.size.width
        boltImage.frame = CGRect(x: 12, y: screenHeight/5, width: screenWidth * 0.3, height: screenWidth * 0.3)
        calorieNumber.frame = CGRect(x: screenWidth/13 , y: screenHeight/2.7, width: 85, height: 21)
        dCILAbel.frame = CGRect(x: 8 , y: screenHeight/8, width: 135, height: 62)
        caloricIntakeLabel.frame = CGRect(x: 0 , y: ((screenHeight/10) + 0.7 * screenWidth ), width: screenWidth, height: 21)
        weightLossSpeedLabel.frame = CGRect(x: 0 , y: ((screenHeight/10) + 0.7 * screenWidth ) + 25, width: screenWidth, height: 21)
        slowLabel.frame = CGRect(x: 20 , y: ((screenHeight/10) + 0.7 * screenWidth ) + 42, width: 43, height: 18)
        fastLabel.frame = CGRect(x: screenWidth - 54, y: ((screenHeight/10) + 0.7 * screenWidth ) + 42, width: 39, height: 18)
        weightLossSpeedSeekBar.frame = CGRect(x: 20 , y: ((screenHeight/10) + 0.7 * screenWidth ) + 58, width: screenWidth - 40, height: 30)
        carbsLabel.frame = CGRect(x: 20 , y: ((screenHeight/10) + 0.7 * screenWidth ) + 109, width: 51, height: 18)
        fatLabel.frame = CGRect(x: screenWidth - 47, y: ((screenHeight/10) + 0.7 * screenWidth ) + 109, width: 32, height: 18)
        energySourceSeekBar.frame = CGRect(x: 20 , y: ((screenHeight/10) + 0.7 * screenWidth ) + 125, width: screenWidth - 40, height: 30)
        energySourceLabel.frame = CGRect(x: 0 , y: ((screenHeight/10) + 0.7 * screenWidth ) + 92, width: screenWidth, height: 21)
        proteinLabel.frame = CGRect(x: 0 , y: ((screenHeight/10) + 0.7 * screenWidth ) + 159, width: screenWidth, height: 21)
        lowLabel.frame = CGRect(x: 20 , y: ((screenHeight/10) + 0.7 * screenWidth ) + 176, width: 41, height: 18)
        highLabel.frame = CGRect(x: screenWidth - 57, y: ((screenHeight/10) + 0.7 * screenWidth ) + 176, width: 42, height: 20)
        proteinSeekBar.frame = CGRect(x: 20 , y: ((screenHeight/10) + 0.7 * screenWidth ) + 198, width: screenWidth - 40, height: 30)
        
        trackWith.frame = CGRect(x: 20 , y: ((screenHeight/10) + 0.7 * screenWidth ) + 230, width: 200, height: 18)
        
        cronometerImage.frame = CGRect(x: 5 , y: ((screenHeight/10) + 0.7 * screenWidth ) + 244, width: 204, height: 40)
        
        learnNutritionButton.frame = CGRect(x: screenWidth - 143 , y: ((screenHeight/10) + 0.7 * screenWidth ) + 235, width: 138, height: 40)
        
        
        learnNutritionButton.layer.borderWidth = 1
        learnNutritionButton.layer.borderColor = Colors.aXGreen.cgColor
        learnNutritionButton.layer.cornerRadius = 10
        
        //Set seekBar Position
        let calPosition = defaults.double(forKey: Save.calPosition)
        weightLossSpeedSeekBar.setValue(Float(calPosition), animated: true)
        let energyPosition = defaults.double(forKey: Save.energySeekBarPosition)
        energySourceSeekBar.setValue(Float(energyPosition), animated: true)
        let proteinPosition = defaults.double(forKey: Save.proteinSeekBarPosition)
        proteinSeekBar.setValue(Float(proteinPosition), animated: true)
        
        //cronometer link
        // create tap gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(MealPlanViewController.imageTapped(gesture:)))
        
        // add it to the image view;
        cronometerImage.addGestureRecognizer(tapGesture)
        // make sure imageView can be interacted with by user
        cronometerImage.isUserInteractionEnabled = true
        
        let composition = defaults.double(forKey: Save.composition)
        let activityMultiplier = defaults.string(forKey: Save.activityLevel)
        let bodyWeight  = defaults.double(forKey: Save.bodyWeight)
        var activityMultiplierNum = 1.20
        if (activityMultiplier == "Sedentary"){
            activityMultiplierNum =  1.20
        } else if (activityMultiplier == "Light: 1-2x weekly"){
            activityMultiplierNum = 1.375
        } else if (activityMultiplier == "Moderate: 3-5x weekly"){
            activityMultiplierNum = 1.55
        } else if (activityMultiplier == "Heavy: 6-7x weekly"){
            activityMultiplierNum = 1.725
        } else if (activityMultiplier == "Athletic: 2x daily"){
            activityMultiplierNum = 1.9
        }
        
        
        var protein = defaults.double(forKey: Save.protein)
        if (protein == 0.00){
            protein = bodyWeight;
        }
        let mass = bodyWeight / 2.20462
        
        
        let lbm = mass - (((composition * mass) / 100));
        let bmr = (370 + (21.6 * lbm));
        defaults.set(lbm, forKey: Save.lbm)
        let tdee = bmr * activityMultiplierNum;
        print("tdee", tdee, "bmr", bmr, "activity multiplier", activityMultiplierNum, lbm, "lbm")
        
        var minRateLossCals = defaults.double(forKey: Save.minlossrate)
        
        if (minRateLossCals > 10000000 || minRateLossCals < -10000000) {
            minRateLossCals = 0;
        }
        defaults.set(minRateLossCals, forKey: Save.minlossrate)
        
        let intake = tdee + minRateLossCals;
        
        //intake = defaults.set(forKey: Save.intake)
        defaults.set(intake, forKey: Save.intake)
        
        
        
        var fat = defaults.double(forKey: Save.fat)
        
        if (fat == 0.00){
            fat = (lbm * 2.20462) * 0.33
        }
        
        var carbs = defaults.double(forKey: Save.carbs)
        if (carbs == 0.00){
            carbs = (tdee - ((protein * 4) + (fat * 9))) / 4
        }
        let maxFatIntake = (tdee - 200 - (protein * 4)) / 9;
        defaults.set(maxFatIntake, forKey: Save.maxFatIntake)
        let fatDistance = maxFatIntake - fat;
        defaults.set(fatDistance, forKey: Save.fatDistance)
        defaults.set(fat, forKey: Save.fat)
        defaults.set(tdee, forKey: Save.tdee)
        
        
        setupPieChart(protein: protein, carbs: carbs, fat: fat)
        calorieNumber.text = String(format: "%.2f", intake)
        caloricIntakeLabel.text = "Estimate Daily Caloric Expenditure: " + String(format: "%.2f", tdee)
        
        print("bodyWeight", bodyWeight, "protein", protein, "carbs", carbs, "fat",  fat, "tdee", tdee, "intake", intake)
        
        //Click cronometer to affiliate link
        
        cronometerImage.isUserInteractionEnabled = true
        cronometerImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.imageTap)))
        
        //Hide pie chart
        let bodyweight = defaults.double(forKey: Save.bodyWeight)
        if (bodyweight == 0.00){
            pieView.isHidden = true
        } else { inputInfoutton.isHidden = true}
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let showCase = defaults.bool(forKey: Save.firstTimeShowcaseMealPlan)
        let showcaseSliders = defaults.bool(forKey: Save.FirstTimeShowCaseSliders)
        
        if showCase == false {
            
                
                let showcase0 = MaterialShowcase()
                showcase0.setTargetView(button: inputInfoutton, tapThrough: true)
              //  showcase0.setTargetView(view: )
                showcase0.primaryText = "Start Here"
                showcase0.secondaryText = "Get your custom meal plan and goals."
                showcase0.primaryTextColor = UIColor.black
                showcase0.secondaryTextColor = UIColor.black
                showcase0.backgroundViewType = .full
                showcase0.backgroundPromptColor = Colors.aXGreen
               showcase0.targetHolderColor = UIColor.black
                showcase0.targetHolderRadius = 100
                showcase0.aniComeInDuration = 1 // unit: second
                showcase0.show(completion: {
                    self.defaults.setValue(true, forKey: Save.firstTimeShowcaseMealPlan)
                })
        } else {
            if (showcaseSliders == false) {
                let showcase0 = MaterialShowcase()
                //showcase0.setTargetView(button: inputInfoutton, tapThrough: true)
                showcase0.setTargetView(view: weightLossSpeedSeekBar)
                showcase0.primaryText = "Adjust to your meal plan"
                showcase0.secondaryText = "Use these sliders to adjust your macro split to your liking.\n\n*Tap on the other sliders if the chart looks off. Sorry for the bug, we're working on it."
                showcase0.primaryTextColor = UIColor.black
                showcase0.secondaryTextColor = UIColor.black
                showcase0.backgroundViewType = .full
                showcase0.backgroundPromptColor = Colors.aXGreen
                showcase0.targetHolderColor = UIColor.black
                //showcase0.targetHolderRadius = 100
                showcase0.aniComeInDuration = 1 // unit: second
                showcase0.show(completion: {
                    self.defaults.setValue(true, forKey: Save.FirstTimeShowCaseSliders)
                })
            }
        }
    }
    
    
    
    

    func setupPieChart(protein: Double, carbs:Double, fat: Double) {
        
        //Chart placement
        let screenHeight = UIScreen.main.bounds.size.height
        let screenWidth = UIScreen.main.bounds.size.width
        pieView.frame = CGRect(x: screenWidth/3.3, y: screenHeight/10, width: screenWidth * 0.7, height: screenWidth * 0.7)
        
        
        
        //Chart features
        pieView.chartDescription?.enabled = false
        pieView.drawHoleEnabled = false
        //pieView.rotationAngle = 0
        //pieView.rotationEnabled = false
        pieView.isUserInteractionEnabled = true
        pieView.entryLabelColor = UIColor.black
        pieView.legend.enabled = false
        let c1 = Colors.aXOrange
        let c2 = UIColor.systemBlue
        let c3 = Colors.aXGreen
        
        
        
        //Chart info
        var entries: [PieChartDataEntry] = Array()
        let carbsString = String(format: "%.2f", carbs)
        let proteinString = String(format: "%.2f", protein)
        let fatString = String(format: "%.2f", fat)
        entries.append(PieChartDataEntry(value: carbs, label: "Fat\n" + fatString))
        entries.append(PieChartDataEntry(value: carbs, label: "Carbs\n" + carbsString))
        entries.append(PieChartDataEntry(value: protein, label: "Protein\n" + proteinString))
        let dataSet = PieChartDataSet(entries: entries, label: "")
        dataSet.colors = [c1, c2, c3]
        dataSet.drawValuesEnabled = false
        pieView.data = PieChartData(dataSet: dataSet)
    }
    
    @objc func imageTapped(gesture: UIGestureRecognizer) {
              // if the tapped view is a UIImageView then set it to imageview
              if (gesture.view as? UIImageView) != nil {
                  print("Image Tapped")
                UIApplication.shared.open(URL(string: "https://cronometer.com")!)

              }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func imageTap() {
       guard let url = URL(string: "https://cronometer.com/") else {
                 return //be safe
               }

               if #available(iOS 10.0, *) {
                   UIApplication.shared.open(url, options: [:], completionHandler: nil)
               } else {
                   UIApplication.shared.openURL(url)
               }
    }

    
    @IBAction func toInfoTapped(_ sender: Any) {
        defaults.setValue(true, forKey: Save.CameFromMealPlan)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let infoCollection = storyboard.instantiateViewController(identifier: "infoCollection")
        self.show(infoCollection, sender: self)
        
        
        //Retrieve info for premium And SHOWADS
        
        let premiumstore = defaults.bool(forKey: Save.premium)
        let premium = premiumstore
        if interstitialAd?.isReady ==  true && !premium {
            interstitialAd?.present(fromRootViewController: self)
        }
    }
    @IBAction func calSeekBar(_ sender: UISlider) {
        
       
        let currentPosition = weightLossSpeedSeekBar.value
        defaults.set(currentPosition, forKey: Save.calPosition)
        let sex = defaults.bool(forKey: Save.sex)
        let composition = defaults.double(forKey: Save.composition)
        
        if (sex && composition <= 12.00 || !(sex) && composition <= 20.00) {
            weightLossSpeedSeekBar.isHidden = true
            slowLabel.isHidden              = true
            fastLabel.isHidden              = true
            weightLossSpeedLabel.textColor  = UIColor.white
            weightLossSpeedLabel.text       = "You don't need to lose weight. Happy bulking."
        } else{
            let bodyweight = defaults.double(forKey: Save.bodyWeight)
            let maxLossRateCals = ((bodyweight * 0.01) * 3500) / 7
            let minRateLossCals = defaults.double(forKey: Save.minlossrate)
            defaults.set(maxLossRateCals, forKey: Save.maxlossrate)
            //defaults.set(minRateLossCals)
            let deficitRange = maxLossRateCals - minRateLossCals
            let deficitScale = deficitRange / 1 //OG100
            let deficit = (Double(currentPosition) * deficitScale)
            let deficit7 = deficit / 7
            var protein = defaults.double(forKey: Save.protein)
            if (protein == 0.00){
                protein = bodyweight
            }
            let fat = defaults.double(forKey: Save.fat)
            defaults.set(deficit7, forKey: Save.deficit)
            let tdee = defaults.double(forKey: Save.tdee)
            let intake = tdee - deficit
            let maxFatIntake = (intake - 200 - (protein * 4)) / 9
            let fatDistance = maxFatIntake - fat
            let fatscale = fatDistance / 10;
            let carbs = (intake - (fat * 9)) / 4;
            let proSeekBarPosition = currentPosition
            defaults.set(proSeekBarPosition, forKey: Save.calsbprogress)
            defaults.set(fat, forKey: Save.fat)
            defaults.set(carbs, forKey: Save.carbs)
            defaults.set(intake, forKey: Save.intake)
            setupPieChart(protein: protein, carbs: carbs, fat: fat)
            
            calorieNumber.text = String(format: "%.2f", intake)
                        

            print("protein", protein, "carbs", carbs, "fat",  fat, "intake",
            intake, "fat distance", fatDistance )
        }
    }
    
    
    
    
    @IBAction func energySeekBar(sender: UISlider) {
        
        let currentPosition = energySourceSeekBar.value
        defaults.set(currentPosition, forKey: Save.energySeekBarPosition)
        let intake = defaults.double(forKey: Save.intake)
        let tdee = defaults.double(forKey: Save.tdee)
        let protein = defaults.double(forKey: Save.protein)
        var fat = defaults.double(forKey: Save.fat)
        let lbm = defaults.double(forKey: Save.lbm)
        var seekBarPosition = energySourceSeekBar.value * 100
        let minfat =  (lbm * 2.20462) * 0.33
        let maxFatIntake = (intake - 200 - (protein * 4)) / 9;
        let fatDistance = maxFatIntake - minfat;
        let fatscale = fatDistance / 100
        fat = minfat + (Double(seekBarPosition) * fatscale);
        let carbs = (intake - (fat * 9) - (protein * 4)) / 4;
        seekBarPosition =  energySourceSeekBar.value;
        defaults.set(seekBarPosition, forKey: Save.fatSBPosition)
        defaults.set(fat, forKey: Save.fat)
        defaults.set(carbs, forKey: Save.carbs)
        setupPieChart(protein: protein, carbs: carbs, fat: fat)
        print("protein", protein, "carbs", carbs, "fat",  fat, "intake",
                   intake, "fat distance", fatDistance )
    }
    
    //TODO verify seekbar logic with a fresh mind
    
    
    @IBAction func proteinSeekBar(_sender:UISlider){
       
        let currentPosition = proteinSeekBar.value
        defaults.set(currentPosition, forKey: Save.proteinSeekBarPosition)
        let bodyWeight = defaults.double(forKey: Save.bodyWeight)
        let minProtein = bodyWeight
        let maxProtein = bodyWeight * 1.15
        let proetinDistance = maxProtein - minProtein
        let proteinScale = proetinDistance / 100
        let seekBarPosition = proteinSeekBar.value * 100
        let protein = (proteinScale * Double(seekBarPosition)) + bodyWeight
        let intake = defaults.double(forKey: Save.intake)
        let fat = defaults.double(forKey: Save.fat)
        let carbs = (intake - (fat * 9) - (protein * 4)) / 4;
        let proSeekBarPosition = Double(seekBarPosition)
        defaults.set(proSeekBarPosition, forKey: Save.proSeekBarPostion)
        defaults.set(fat, forKey: Save.fat)
        defaults.set(carbs, forKey: Save.carbs)
        defaults.set(protein, forKey: Save.protein)
        setupPieChart(protein: protein, carbs: carbs, fat: fat)
        
    }
    
    @IBAction func nutritionPlaylist(_ sender: Any) {
        
        guard let url = URL(string: "https://www.youtube.com/watch?v=wxzc_2c6GMg&list=PLdsCUIkYpuc6mPZwCQv-AaNjEg3YXCxL7") else {
                  return //be safe
                }

                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                } else {
                    UIApplication.shared.openURL(url)
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
}
