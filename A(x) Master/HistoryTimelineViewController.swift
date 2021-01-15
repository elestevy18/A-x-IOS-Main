//
//  HistoryTimelineViewController.swift
//  AofX
//
//  Created by Kevin Jimenez on 10/22/20.
//  Copyright © 2020 Aesthet(X). All rights reserved.
//


import UIKit
import GoogleMobileAds
import StoreKit

class HistoryTimelineViewController: UIViewController  {

    
    
     
     struct Keys {
     //   static let muscle                      = "muscle"

        static let volumeTxts                  = "volumeTxts"
        static let repsTxts                      = "repstxts"
        static let weightTxts                  = "weighttxts"
        static let dateHist                      = "datehist"
        static let exTitleHist                = "extitlehist"
        static let setsTxts                         = "setstxts"
     }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sortByExerciseButton: UIButton!
    

      
      var histories: [History] = []
      var weightTxts: [Float] = []
      var repsTxts: [Float] = []
      var volumeTxts: [Float] = []
      let defaults        = UserDefaults.standard
      var chestProgress   = Float()
      var installDate = Date()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //sortByExerciseButton.isHidden = true
        
              //Set logo in navigation bar and make it clickable
                let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
                imageView.contentMode = .scaleAspectFit
                let image = UIImage(named: "aesthetx30times100")
                imageView.image = image
                navigationItem.titleView = imageView
                let recognizer = UITapGestureRecognizer(target: self, action: #selector(HistoryTimelineViewController.titleWasTapped))
                navigationItem.titleView?.isUserInteractionEnabled = true
                navigationItem.titleView?.addGestureRecognizer(recognizer)
        
        //RETIRIEVE ARRAY OF EXERCISES,
        //when retrieved the newest exercises are at the last postion
        let exTitleHist          = defaults.object(forKey: Save.exTitleHist) as? [String]
        let dateHist       = defaults.object(forKey: Save.dateHist) as? [String]
        let weightTxts   = defaults.object(forKey: Save.weightTxts) as? [String]
        let repsTxts       = defaults.object(forKey: Save.repsTxts) as? [String]
        let volumeTxts = defaults.object(forKey: Save.volumeTxts) as? [String]
        let setsTxts = defaults.object(forKey: Save.setsTxts) as? [String]
        let RPETxts = defaults.object(forKey: Save.RPETxts) as? [String]
        let notesTxts = defaults.object(forKey: Save.noteTxts) as? [String]
        //set count at 50 to display 50 at a time and prevent unnecesarry processing. If less than 50 exercises are registered then we start at the size of the array to account for this.
        //TODO CHECK IF THE ARRAY IS EMPTY AND DIPLAY TEXT THAT THERE ISNO HISTORY IF SO\
        var count = exTitleHist!.count - 1
        var floor = 0
        if exTitleHist != nil{
            if exTitleHist!.count > 100 {
                floor = exTitleHist!.count - 100
            }
            
            //Testing
            //            for String in exTitleHist! as [String] {
            //                print("Exercise title: " + String)
            //            }
            //            print("Titles array size: " + String(exTitleHist!.count)  +  "   | Count: " + String(count))
            while (count >= floor && exTitleHist != nil){
                //Print statements for testing only
                //                print("got to loop")
                //                print("title: "  + (exTitleHist?[count] ?? "title default") )
                //                print("date: "  + (dateHist?[count] ?? "date default") )
                //                print("weight: "  + (weightTxts?[count] ?? "weight default") )
                //                print("reps: "  + (repsTxts?[count] ?? "weight default") )
                //                print("volume: "  + (volumeTxts?[count] ?? "volume default") )
                let exercise  = History(title: exTitleHist?[count] ?? "title default", dateText: dateHist?[count] ?? "date default", weightText: weightTxts?[count] ?? "weight default", repsText: repsTxts?[count] ?? "weight default", volumeText: volumeTxts?[count] ?? "volume default", setText: setsTxts?[count] ?? "set default", RPEText: RPETxts?[count] ?? "RPE default", noteText: notesTxts?[count] ?? "note default")
                histories.append(exercise)
                count -= 1
                
            }
        } else {
            tableView.isHidden = true
        }

        
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

    @IBAction func sortByExerciseClicked(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let Exercises = storyboard.instantiateViewController(identifier: "HistoryViewController")
        self.show(Exercises, sender: self)
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension HistoryTimelineViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (histories.count == 0){return 0}
                return histories.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let history = histories[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cronoHistoryCell") as! HistoryCell
        cell.setHistory(history: history)
        return cell

    }
    //Uncomment for any code to run when user clicks on a cell
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let index = [indexPath.row]
//  NAVIGATE TO VIEW NOTES
//       }

    

 @objc private func titleWasTapped() {
        guard let url = URL(string: "http://aesthet-x.com/about/") else {
            return //be safe
          }
    }
}








