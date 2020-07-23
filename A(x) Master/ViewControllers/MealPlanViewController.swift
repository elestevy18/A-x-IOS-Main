//
//  MealPlanViewController.swift
//  A(x) Master
//
//  Created by Kevin Jimenez on 7/17/20.
//  Copyright © 2020 Aesthet(X). All rights reserved.
//

import UIKit
import Charts


class MealPlanViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    
    struct Keys {
        static let bodyWeight            = "bodyweight"
        static let sex                   = "sex"
        static let composition           = "composition"
        static let activityLevel         = "activitylevel"
        static let fat                   = "fat"
        static let carbs                 = "carbs"
        static let protein               = "protein"
        static let sbprogress            = "sbprogress"
        static let probprogress          = "probprogress"
        static let calsbprogress         = "calsbprogress"
        static let deficit               = "deficit"
        static let calories              = "calories"
        static let intake                = "intake"
        static let tdee                  = "tdee"
        static let maxlossrate           = "maxlossrate"
        static let minlossrate           = "minlossrate"
        static let maxFatIntake          = "maxfatintake"
        static let calSeekBarPosition    = "calSeekBarPosition"
        static let fatDistance           = "fatDistance"
        static let lbm                   = "lbm"
        static let cseekBarPosition      = "seekbarposition"
        static let fatSB                 = "fatSB"
        static let calPosition           = "calposition"
        static let proSBProgress         = "proSBProgress"
        static let proSeekBarPostion     = "proSeekBarPostion"
        static let fatSBPosition         = "fatSBPosition"
        static let energySeekBarPosition = "energySeekBarPosition"
        static let proteinSeekBarPosition = "proteinSeekBarPosition"
        
        
     
        
    }

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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Place views dynamically
        let screenHeight = UIScreen.main.bounds.size.height
        let screenWidth = UIScreen.main.bounds.size.width
        boltImage.frame = CGRect(x: 12, y: screenHeight/5, width: screenWidth * 0.3, height: screenWidth * 0.3)
        calorieNumber.frame = CGRect(x: screenWidth/13 , y: screenHeight/2.7, width: 85, height: 21)
        dCILAbel.frame = CGRect(x: screenWidth/13 , y: screenHeight/8, width: 95, height: 42)
        caloricIntakeLabel.frame = CGRect(x: 0 , y: ((screenHeight/10) + 0.7 * screenWidth ), width: screenWidth, height: 21)
        weightLossSpeedLabel.frame = CGRect(x: 0 , y: ((screenHeight/10) + 0.7 * screenWidth ) + 25, width: screenWidth, height: 21)
         slowLabel.frame = CGRect(x: 20 , y: ((screenHeight/10) + 0.7 * screenWidth ) + 42, width: 33, height: 18)
        fastLabel.frame = CGRect(x: screenWidth - 54, y: ((screenHeight/10) + 0.7 * screenWidth ) + 42, width: 29, height: 18)
        weightLossSpeedSeekBar.frame = CGRect(x: 20 , y: ((screenHeight/10) + 0.7 * screenWidth ) + 58, width: screenWidth - 40, height: 30)
        carbsLabel.frame = CGRect(x: 20 , y: ((screenHeight/10) + 0.7 * screenWidth ) + 109, width: 41, height: 18)
        fatLabel.frame = CGRect(x: screenWidth - 47, y: ((screenHeight/10) + 0.7 * screenWidth ) + 109, width: 22, height: 18)
        energySourceSeekBar.frame = CGRect(x: 20 , y: ((screenHeight/10) + 0.7 * screenWidth ) + 125, width: screenWidth - 40, height: 30)
        energySourceLabel.frame = CGRect(x: 0 , y: ((screenHeight/10) + 0.7 * screenWidth ) + 92, width: screenWidth, height: 21)
        proteinLabel.frame = CGRect(x: 0 , y: ((screenHeight/10) + 0.7 * screenWidth ) + 159, width: screenWidth, height: 21)
        lowLabel.frame = CGRect(x: 20 , y: ((screenHeight/10) + 0.7 * screenWidth ) + 176, width: 41, height: 18)
        highLabel.frame = CGRect(x: screenWidth - 47, y: ((screenHeight/10) + 0.7 * screenWidth ) + 176, width: 32, height: 18)
        proteinSeekBar.frame = CGRect(x: 20 , y: ((screenHeight/10) + 0.7 * screenWidth ) + 198, width: screenWidth - 40, height: 30)
        
        trackWith.frame = CGRect(x: 20 , y: ((screenHeight/10) + 0.7 * screenWidth ) + 230, width: 147, height: 18)
        
        cronometerImage.frame = CGRect(x: 5 , y: ((screenHeight/10) + 0.7 * screenWidth ) + 244, width: 204, height: 40)
        
        learnNutritionButton.frame = CGRect(x: screenWidth - 128 , y: ((screenHeight/10) + 0.7 * screenWidth ) + 235, width: 108, height: 40)
        
        //Set seekBar Position
        let calPosition = defaults.double(forKey: Keys.calPosition)
        weightLossSpeedSeekBar.setValue(Float(calPosition), animated: true)
        let energyPosition = defaults.double(forKey: Keys.energySeekBarPosition)
        energySourceSeekBar.setValue(Float(energyPosition), animated: true)
        let proteinPosition = defaults.double(forKey: Keys.proteinSeekBarPosition)
        proteinSeekBar.setValue(Float(proteinPosition), animated: true)
        
        //cronometer link
        // create tap gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(MealPlanViewController.imageTapped(gesture:)))

        // add it to the image view;
        cronometerImage.addGestureRecognizer(tapGesture)
        // make sure imageView can be interacted with by user
        cronometerImage.isUserInteractionEnabled = true

        let composition = defaults.double(forKey: Keys.composition)
        var activityMultiplier = defaults.string(forKey: Keys.activityLevel)
        let bodyWeight  = defaults.double(forKey: Keys.bodyWeight)
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
        
        
        var protein = defaults.double(forKey: Keys.protein)
        if (protein == 0.00){
             protein = bodyWeight;
        }
        let mass = bodyWeight / 2.20462
        
        
        let lbm = mass - (((composition * mass) / 100));
        let bmr = (370 + (21.6 * lbm));
        defaults.set(lbm, forKey: Keys.lbm)
        let tdee = bmr * activityMultiplierNum;
        print("tdee", tdee, "bmr", bmr, "activity multiplier", activityMultiplierNum, lbm, "lbm")
       
        var minRateLossCals = defaults.double(forKey: Keys.minlossrate)
    
        if (minRateLossCals > 10000000 || minRateLossCals < -10000000) {
            minRateLossCals = 0;
        }
        defaults.set(minRateLossCals, forKey: Keys.minlossrate)
        
        var intake = tdee + minRateLossCals;
        
        //intake = defaults.set(forKey: Keys.intake)
        defaults.set(intake, forKey: Keys.intake)
        
        
        //TODO final TextView intaketxt = v.findViewById(R.id.calorieintake);
        //TODO intaketxt.setText(Float.toString(intake));
        
        
        
        var fat = defaults.double(forKey: Keys.fat)
        
        if (fat == 0.00){
            fat = (lbm * 2.20462) * 0.33
        }
        
        var carbs = defaults.double(forKey: Keys.carbs)
        if (carbs == 0.00){
            carbs = (tdee - ((protein * 4) + (fat * 9))) / 4
        }
        var maxFatIntake = (tdee - 200 - (protein * 4)) / 9;
        defaults.set(maxFatIntake, forKey: Keys.maxFatIntake)
        var fatDistance = maxFatIntake - fat;
        defaults.set(fatDistance, forKey: Keys.fatDistance)
        defaults.set(fat, forKey: Keys.fat)
        defaults.set(tdee, forKey: Keys.tdee)
        
        
        setupPieChart(protein: protein, carbs: carbs, fat: fat)
         calorieNumber.text = String(format: "%.2f", intake)
        caloricIntakeLabel.text = "Estimate Daily Caloric Expenditure: " + String(format: "%.2f", tdee)

        print("bodyWeight", bodyWeight, "protein", protein, "carbs", carbs, "fat",  fat, "tdee", tdee, "intake", intake)
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

    
    @IBAction func calSeekBar(_ sender: UISlider) {
        
       
        let currentPosition = weightLossSpeedSeekBar.value
        defaults.set(currentPosition, forKey: Keys.calPosition)
        let sex = defaults.bool(forKey: Keys.sex)
        let composition = defaults.double(forKey: Keys.composition)
        
        if (sex && composition <= 12.00 || !(sex) && composition <= 20.00) {
            weightLossSpeedSeekBar.isHidden = true
            slowLabel.isHidden              = true
            fastLabel.isHidden              = true
            weightLossSpeedLabel.textColor  = UIColor.white
            weightLossSpeedLabel.text       = "You don't need to lose weight. Happy bulking."
        } else{
            let bodyweight = defaults.double(forKey: Keys.bodyWeight)
            let maxLossRateCals = ((bodyweight * 0.01) * 3500) / 7
            let minRateLossCals = defaults.double(forKey: Keys.minlossrate)
            defaults.set(maxLossRateCals, forKey: Keys.maxlossrate)
            //defaults.set(minRateLossCals)
            let deficitRange = maxLossRateCals - minRateLossCals
            let deficitScale = deficitRange / 1 //OG100
            let deficit = (Double(currentPosition) * deficitScale)
            let deficit7 = deficit / 7
            var protein = defaults.double(forKey: Keys.protein)
            if (protein == 0.00){
                protein = bodyweight
            }
            let fat = defaults.double(forKey: Keys.fat)
            defaults.set(deficit7, forKey: Keys.deficit)
            let tdee = defaults.double(forKey: Keys.tdee)
            let intake = tdee - deficit
            let maxFatIntake = (intake - 200 - (protein * 4)) / 9
            let fatDistance = maxFatIntake - fat
            let fatscale = fatDistance / 10;
            let carbs = (intake - (fat * 9)) / 4;
            let proSeekBarPosition = currentPosition
            defaults.set(proSeekBarPosition, forKey: Keys.calsbprogress)
            defaults.set(fat, forKey: Keys.fat)
            defaults.set(carbs, forKey: Keys.carbs)
            defaults.set(intake, forKey: Keys.intake)
            setupPieChart(protein: protein, carbs: carbs, fat: fat)
            
            calorieNumber.text = String(format: "%.2f", intake)
                        

            print("protein", protein, "carbs", carbs, "fat",  fat, "intake",
            intake, "fat distance", fatDistance )
        }
    }
    
    
    
    
    @IBAction func energySeekBar(sender: UISlider) {
        
        let currentPosition = energySourceSeekBar.value
        defaults.set(currentPosition, forKey: Keys.energySeekBarPosition)
        let intake = defaults.double(forKey: Keys.intake)
        let tdee = defaults.double(forKey: Keys.tdee)
        let protein = defaults.double(forKey: Keys.protein)
        var fat = defaults.double(forKey: Keys.fat)
        let lbm = defaults.double(forKey: Keys.lbm)
        var seekBarPosition = energySourceSeekBar.value * 100
        let minfat =  (lbm * 2.20462) * 0.33
        let maxFatIntake = (intake - 200 - (protein * 4)) / 9;
        let fatDistance = maxFatIntake - minfat;
        let fatscale = fatDistance / 100
        fat = minfat + (Double(seekBarPosition) * fatscale);
        let carbs = (intake - (fat * 9) - (protein * 4)) / 4;
        seekBarPosition =  energySourceSeekBar.value;
        defaults.set(seekBarPosition, forKey: Keys.fatSBPosition)
        defaults.set(fat, forKey: Keys.fat)
        defaults.set(carbs, forKey: Keys.carbs)
        setupPieChart(protein: protein, carbs: carbs, fat: fat)
        print("protein", protein, "carbs", carbs, "fat",  fat, "intake",
                   intake, "fat distance", fatDistance )
    }
    
    //TODO verify seekbar logic with a fresh mind
    
    
    @IBAction func proteinSeekBar(_sender:UISlider){
       
        let currentPosition = proteinSeekBar.value
        defaults.set(currentPosition, forKey: Keys.proteinSeekBarPosition)
        let bodyWeight = defaults.double(forKey: Keys.bodyWeight)
        let minProtein = bodyWeight
        let maxProtein = bodyWeight * 1.15
        let proetinDistance = maxProtein - minProtein
        let proteinScale = proetinDistance / 100
        let seekBarPosition = proteinSeekBar.value * 100
        let protein = (proteinScale * Double(seekBarPosition)) + bodyWeight
        let intake = defaults.double(forKey: Keys.intake)
        let fat = defaults.double(forKey: Keys.fat)
        let carbs = (intake - (fat * 9) - (protein * 4)) / 4;
        let proSeekBarPosition = Double(seekBarPosition)
        defaults.set(proSeekBarPosition, forKey: Keys.proSeekBarPostion)
        defaults.set(fat, forKey: Keys.fat)
        defaults.set(carbs, forKey: Keys.carbs)
        defaults.set(protein, forKey: Keys.protein)
        setupPieChart(protein: protein, carbs: carbs, fat: fat)
        
    }
    
    
}