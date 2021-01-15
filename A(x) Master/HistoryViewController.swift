//
//  HistoryViewController.swift
//  AofX
//
//  Created by Kevin Jimenez on 10/13/20.
//  Copyright © 2020 Aesthet(X). All rights reserved.
//

import UIKit
import GoogleMobileAds
import StoreKit

class HistoryViewController: UIViewController  {

    
    
     
     struct Keys {
        static let muscle                      = "muscle"
     
        static let muscleHistoryString             = "musclehistorystring"
      static let muscleString                     = "musclestring"
        static let showFab                     = "showFab"
        static let run                         = "run"
        static let annualPurchased             = "annual"
        static let monthlyPurchased            = "monthly"
        static let biannualPurchased           = "biannual"
        static let HSPromo                      = "hspromo"
        static let promoLength                      = "promolength"
        static let installDate                     = "installdate"
        static let firstTime                   = "firsttime"
     }
    

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addHistoryButton: UIButton!

      
      var histMuscs: [HistMusc] = []
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

        
        //ADS
        self.interstitialAd = createAd()
              print("line below creating ad")
              
              //Set logo in navigation bar and make it clickable
                
                let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
                imageView.contentMode = .scaleAspectFit
                let image = UIImage(named: "aesthetx30times100")
                imageView.image = image
                navigationItem.titleView = imageView
                let recognizer = UITapGestureRecognizer(target: self, action: #selector(HistoryViewController.titleWasTapped))
                navigationItem.titleView?.isUserInteractionEnabled = true
                navigationItem.titleView?.addGestureRecognizer(recognizer)
              //GIVE TABLE VIEW EXTRA SPACE FOR THE FABS
              let insets = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
              self.tableView.contentInset = insets
              
              //Style FABS
              
             
            
              
//Call function to populate table view
        
        histMuscs =  createArray()
    }
    
     func createArray() -> [HistMusc] {
            
        let exercise1  = HistMusc(image: #imageLiteral(resourceName: "Dumbell Icon.jpg"), title: "Chest")
            let exercise2  = HistMusc(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Biceps" )
            let exercise3  = HistMusc(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Lats")
            let exercise4  = HistMusc(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Glutes")
            let exercise5  = HistMusc(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Glute Medius")
            let exercise6  = HistMusc(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Hamstrings")
            let exercise7  = HistMusc(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Front Shoulder")
            let exercise8  = HistMusc(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Lateral Shoulder")
            let exercise9  = HistMusc(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Back Shoulder")
            let exercise10 = HistMusc(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Rotator Cuff")
            let exercise11 = HistMusc(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Triceps")
            let exercise12 = HistMusc(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Quads")
            let exercise13 = HistMusc(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Abs")
            let exercise14 = HistMusc(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Obliques" )
            let exercise15 = HistMusc(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Serratus")
            let exercise16 = HistMusc(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Transverse Ab")
            let exercise17 = HistMusc(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Calves")
            let exercise18 = HistMusc(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Neck")
        let exercise19 = HistMusc(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Forearm Extensors")
            let exercise20 = HistMusc(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Ulnar Forearm")
            let exercise21 = HistMusc(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Forearm Flexors")
            let exercise22 = HistMusc(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Radial Forearm")
            let exercise23 = HistMusc(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Spinal Erectors")
            let exercise24 = HistMusc(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Upper Traps")
            let exercise25 = HistMusc(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Lower Traps")
 //         let exercise26 = HistMusc(image:#imageLiteral(resourceName: "Dumbell Icon"), title:"Reset All",      progressText:" ", mavText: " ",  progressFloat: 0.0, hideButton: true)
          
            
            
            //Premium
    //        let exercise26 = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Brachialis", progressText: "00.0/00", mavText: "MAV: 16-22 FREQ: 2-6", progressFloat: progressFloat: vtData[0])
    //        let exercise27 = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Neck Extension", progressText: "00.0/00", mavText: "MAV: 16-22 FREQ: 2-6", progressFloat: progressFloat: vtData[0])
    //        let exercise28 = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Neck Felxion", progressText: "00.0/00", mavText: "MAV: 16-22 FREQ: 2-6", progressFloat: progressFloat: vtData[0])
    //        let exercise29 = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Neck Lateral Felxion", progressText: "00.0/00", mavText: "MAV: 16-22 FREQ: 2-6", progressFloat: progressFloat: vtData[0])
    //        let exercise30 = Video(image: #imageLiteral(resourceName: "Dumbell Icon"), title: "Anterior Tibialis", progressText: "00.0/00", mavText: "MAV: 16-22 FREQ: 2-6", progressFloat: progressFloat: vtData[0])
    //
               
            return [exercise1, exercise2, exercise3, exercise4, exercise5, exercise6, exercise7, exercise8,
                    exercise9, exercise10, exercise11, exercise12, exercise13, exercise14, exercise15, exercise16,
                    exercise17, exercise18, exercise19, exercise20, exercise21, exercise22, exercise23, exercise24, exercise25]//, exercise27]
        }
    
    func createToolbar(){
        //KEVIN JIMENEZ 06/19/2020 MAKE THE TOOLBAR FOR THE PICKER VIEW
        let activityPickerToolBar = UIToolbar()
        activityPickerToolBar.sizeToFit()
        //Toolbar Color
        activityPickerToolBar.barTintColor = .black
        activityPickerToolBar.tintColor = Colors.aXGreen
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self,
                                         action: #selector(ViewController.dismissKeyboard))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        activityPickerToolBar.setItems([flexibleSpace, doneButton], animated: false)
        activityPickerToolBar.isUserInteractionEnabled =  true
    }

 
    func styleButton(button: UIButton){
        button.layer.borderWidth = 1
       
    }

    @IBAction func viewCronologicallyClicked(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let Exercises = storyboard.instantiateViewController(identifier: "specificExerciseHistory")
        self.show(Exercises, sender: self)
        self.dismiss(animated: true, completion: nil)
    }
}

extension HistoryViewController: MuscleHistoryCellDelegate {
  
    
    func didTapViewExercises(title: String) {
        
        let muscleGroup = String(title)
              defaults.set(muscleGroup, forKey: Save.muscleHistoryString)
              let storyboard = UIStoryboard(name: "Main", bundle: nil)
              let Exercises = storyboard.instantiateViewController(identifier: "ExercisesHistoryList")
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


extension HistoryViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return histMuscs.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

            let histMusc = histMuscs[indexPath.row]
                    let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryMuscleCell") as! MuscleHistoryCell
        cell.setHistMusc(histMusc: histMusc)
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

extension HistoryViewController: GADInterstitialDelegate{
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        interstitialAd = createAd()
    }
}







