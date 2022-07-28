//
//  TimerVC.swift
//  AofX
//
//  Created by Kevin Jimenez on 8/29/21.
//  Copyright © 2021 Aesthet(X). All rights reserved.
//

import UIKit
import SRCountdownTimer
import GoogleMobileAds

class TimerVC: UIViewController, setTimerDelagate {
    
    @IBOutlet weak var timerCircle: SRCountdownTimer!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var setsLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sub30s: UIButton!
    @IBOutlet weak var Add30s: UIButton!
    @IBOutlet weak var startBtn: UIButton!
    
    var time, sets: Int?
    var exerciseName: String?
    var vm = SetTimerVM.sharedTimer
    var uniTime = VTTimerVM.sharedVTTimerVM
    var setstxt = ""
   // var interstitial: GADInterstitialAd?

    //Data creation here
    override func viewDidLoad() {
        //Start state observers to sync countdown circle
            // Resume game when application becomes active.
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(TimerVC.syncTimer),
            name: UIApplication.didBecomeActiveNotification, object: nil)
        
        self.isModalInPresentation = true //prevents dismissing unintentionally
        super.viewDidLoad()
        setstxt = String(sets ?? 0 )
        vm.delegate = self
        makeLabelDynamic(labels: [setsLabel, timerLabel,titleLabel])
        titleLabel.text = exerciseName
    }
    
    //Styling here
    override func viewWillAppear(_ animated: Bool) {
        titleLabel.text = exerciseName
        setsLabel.text = "0/" + setstxt + " Sets"
        styleButton(buttons: [startBtn])
        styleOrangeButton(buttons: [Add30s, sub30s])
        titleLabel.text = exerciseName
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.vm.resetAllVars()
        }
    }
    
    override func viewWillLayoutSubviews() {
        titleLabel.text = exerciseName
    }
    
    fileprivate func makeLabelDynamic(labels: [UILabel]) {
        for label in labels{
            label.minimumScaleFactor = 0.1    //or whatever suits your need
            label.adjustsFontSizeToFitWidth = true
            label.lineBreakMode = .byClipping
            label.numberOfLines = 0
        }
    }
    
    fileprivate func styleButton(buttons: [UIButton]) {
        for button in buttons{
            button.layer.cornerRadius = 8
        }
        
    }
    
    fileprivate func styleOrangeButton(buttons: [UIButton]) {
        for button in buttons {
            button.layer.cornerRadius = 8
        }
        
    }
    
    @IBAction func sub30pressed(_ sender: Any) {
        DispatchQueue.main.async {
            self.vm.sub30secs()
            self.timerCircle.start(beginingValue: self.timerCircle.currentValue() - 30)
        }
        
    }
    
    @IBAction func add30pressed(_ sender: Any) {
        DispatchQueue.main.async {
            self.vm.add30secs()
            self.timerCircle.start(beginingValue: self.timerCircle.currentValue() + 30)
        }
    }
    
    @IBAction func start(_ sender: Any) {
        uniTime.toggleIsOn()
        vm.isStarted = true
        
        DispatchQueue.main.async {
            self.vm.TotalRestTime = 120
            self.vm.startTimer()
        }
        
        if self.vm.setIsActive == false {
            self.vm.setCount += 1
            self.startBtn.setTitle("End Set", for: .normal)
            self.timerCircle.reset()
        } else {
            vm.restDateInitiated = Date()
            self.timerCircle.start(beginingValue: 120)
            self.startBtn.setTitle("Start Set", for: .normal)
        }
        
        if sets == vm.setCount && vm.setIsActive {
            DispatchQueue.main.async {
                self.vm.resetAllVars()
            }
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @objc func syncTimer() {
        timerCircle.start(beginingValue: vm.newRestTime)
    }
    
    func updateTimer1() {
        DispatchQueue.main.async { [self] in
            self.timerLabel.text =  self.vm.getTimerTimestamp()
            self.setsLabel.text = self.vm.getSetsText(totalSets: self.sets ?? 0)
            
            if self.vm.isTimeLessThanZero() {
                if vm.isStarted{
                    DispatchQueue.main.async {
                        self.timerCircle.start(beginingValue: 120)
                        self.vm.TotalRestTime = 120
                        self.vm.startTimer()
                    }
                    
                    if self.vm.setIsActive == false {
                        self.startBtn.setTitle("End Set", for: .normal)
                        self.vm.setCount += 1
                    }
                }
            }
        }
    }
    
    
    deinit {
        NotificationCenter.default.removeObserver(
            self,
            name: UIApplication.didBecomeActiveNotification, object: nil)
    }
}

extension TimerVC: GADFullScreenContentDelegate {
        //ADMOB Methods
        /// Tells the delegate that the ad failed to present full screen content.
    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
            //print("Ad did fail to present full screen content.")
    }
    
        /// Tells the delegate that the ad presented full screen content.
    func adDidPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
            //print("Ad did present full screen content.")
    }
    
        /// Tells the delegate that the ad dismissed full screen content.
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
            //print("Ad did dismiss full screen content.")
    }
}
