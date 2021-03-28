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
import MaterialShowcase

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
        var exTitleHist          = defaults.object(forKey: Save.exTitleHist) as? [String]
        var dateHist       = defaults.object(forKey: Save.dateHist) as? [String]
        var weightTxts   = defaults.object(forKey: Save.weightTxts) as? [String]
        let repsTxts       = defaults.object(forKey: Save.repsTxts) as? [String]
        var volumeTxts = defaults.object(forKey: Save.volumeTxts) as? [String]
        var setsTxts = defaults.object(forKey: Save.setsTxts) as? [String]
        var RPETxts = defaults.object(forKey: Save.RPETxts) as? [String]
        var notesTxts = defaults.object(forKey: Save.noteTxts) as? [String]
        print("At download title: "  + (String(exTitleHist?.count ?? 0)) )
        print("date: "  + (String(dateHist?.count ?? 0)) )
        //set count at 50 to display 50 at a time and prevent unnecesarry processing. If less than 50 exercises are registered then we start at the size of the array to account for this.
        
        let titleSize = exTitleHist?.count  ?? 0
        var count = titleSize - 1
        var floor = 0
        if exTitleHist != nil{
            if exTitleHist!.count > 100 {
                floor = exTitleHist!.count - 100
            }
            //  COMBINE REPEATING ENTRIES
            if exTitleHist?.count ?? 0 > 1 {
            if ((exTitleHist?[count] == exTitleHist?[count-1]) &&
                    (dateHist?[count] == dateHist?[count-1]) &&
                    (volumeTxts?[count] == volumeTxts?[count-1]) &&
                (RPETxts?[count] == RPETxts?[count-1])
            ){
                //ADD ONE TO SET[VALUE] POP THE REST
                let setSum = setsTxts?[count]
                let setSum2 = setsTxts?[count-1]
                let setSumInt =  Int(setSum ?? "0") ?? 0
                print(setSumInt)
                let setSumInt2 = Int(setSum2 ?? "0") ?? 0
                print(String(setSumInt2))
                let totalSetSum = setSumInt + setSumInt2
                print(totalSetSum)
                setsTxts?[count - 1] =  String(totalSetSum)
                //TODO find out why all value but title are being removed twice
                setsTxts?.removeLast()
                exTitleHist?.removeLast()
                dateHist?.removeLast()
                weightTxts?.removeLast()
                volumeTxts?.removeLast()
                RPETxts?.removeLast()
                notesTxts?.removeLast()
                print("title after pop "  + (String(exTitleHist?.count ?? 0)) )
                print("date: "  + (String(dateHist?.count ?? 0)) )
                defaults.set(setsTxts, forKey: Save.setsTxts)
                defaults.set(exTitleHist, forKey: Save.exTitleHist)
                defaults.set(dateHist, forKey: Save.dateHist)
                defaults.set(weightTxts, forKey: Save.weightTxts)
                defaults.set(dateHist, forKey: Save.dateHist)
                defaults.set(volumeTxts, forKey: Save.volumeTxts)
                defaults.set(RPETxts, forKey: Save.RPETxts)
                defaults.set(notesTxts, forKey: Save.noteTxts)
                    //  floor = floor-1
             count = count-1
                print("repeating entries")
            } else {
                //                guard let a = exTitleHist?[count] else { return "nil last" }
                //                let b = exTitleHist?[count-1]
                //                print("last entry:" + a + "second to last entry: " + b)
                }
            }

            //  ATTACHES DATA TO TABLE VIEW FOR EVERY ELEMENT IN HISTORY ARRAYS
            while (count >= floor && exTitleHist != nil){
                //Print statements for testing only
                //                print("got to loop")
                print("title: "  + (String(count)) )
                //                print("weight: "  + (weightTxts?[count] ?? "weight default") )
                //                print("reps: "  + (repsTxts?[count] ?? "weight default") )
                //                print("volume: "  + (volumeTxts?[count] ?? "volume default") )
                let exercise  = History(title: exTitleHist?[count] ?? "title default", dateText: dateHist?[count] ?? "date default", weightText: weightTxts?[count] ?? "weight default", repsText: repsTxts?[count] ?? "weight default", volumeText: volumeTxts?[count] ?? "volume default", setText: setsTxts?[count] ?? "set default", RPEText: RPETxts?[count] ?? "RPE default", noteText: notesTxts?[count] ?? "note default")
                histories.append(exercise)
                count -= 1
                
            }
        } else {
            let exercise  = History(title: "No history yet", dateText: "", weightText: weightTxts?[count] ?? "--", repsText: repsTxts?[count] ?? "--", volumeText: volumeTxts?[count] ?? "--", setText: setsTxts?[count] ?? "--", RPEText: RPETxts?[count] ?? "--", noteText: notesTxts?[count] ?? "--")
            histories.append(exercise)
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
                                         action: #selector(UpdateInformation.dismissKeyboard))
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
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        let showCase = defaults.bool(forKey: Save.firstTimeShowcaseHistory)
        
        if showCase == false {
            if let cell = tableView.visibleCells.first as? HistoryCell{
                
                let showcase0 = MaterialShowcase()
                showcase0.setTargetView(view: cell.titleLabel)
                showcase0.primaryText = "View your exercises history"
                showcase0.secondaryText = "Click here to view your last 100 exercises in cronological order. \n\n*Don't get stuck in the past that's all you need ;)  "
                showcase0.primaryTextColor = UIColor.black
                showcase0.secondaryTextColor = UIColor.black
                showcase0.backgroundViewType = .full
                showcase0.backgroundPromptColor = Colors.aXGreen
                showcase0.targetHolderColor = UIColor.black
                showcase0.show(completion: {
                    self.defaults.setValue(true, forKey: Save.firstTimeShowcaseHistory)
                })
            }
        }
    }
}

extension HistoryTimelineViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (histories.count == 0){return 1}
        return histories.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let history = histories[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cronoHistoryCell") as! HistoryCell
        cell.setHistory(history: history)
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        defaults.set(indexPath.row, forKey: Save.notePosition)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let dashBoard = storyboard.instantiateViewController(identifier: "notes")
        self.show(dashBoard, sender: self)
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    
    @objc private func titleWasTapped() {
        guard URL(string: "http://aesthet-x.com/about/") != nil else {
            return //be safe
        }
    }
}








