//
//  MainExerciseTimerTVCell.swift
//  AofX
//
//  Created by Kevin Jimenez on 6/10/21.
//  Copyright © 2021 Aesthet(X). All rights reserved.
//

import UIKit
import SRCountdownTimer

class MainExerciseTimerTVCell: UITableViewCell, TimerDelagate {
    func updateTimer() {
        DispatchQueue.main.async { [self] in
            self.WOTimeLabel.text =  self.vm.getTotalTimestamp()
            self.timerText.text =  self.vm.getTimerTimestamp()
            self.setsText.text = self.vm.getSetsText()
            if self.vm.isTimeLessThanZero() {
                self.startStopBtn.setTitle(self.vm.startOrStartText(), for: UIControl.State.normal)
                if vm.setIsActive == false {
                    self.countDownTimer.start(beginingValue: self.vm.providedRestTime(), interval: 1)
                } else {
                    countDownTimer.reset()
                }
            }
        }
    }
    

    @IBOutlet weak var WOTimeLabel: UILabel!
    @IBOutlet weak var exerciseTitleLabel: UILabel!
    @IBOutlet weak var swapBtn: UIButton!
    @IBOutlet weak var countDownTimer: SRCountdownTimer!
    @IBOutlet weak var timerText: UILabel!
    @IBOutlet weak var setsText: UILabel!
    @IBOutlet weak var startStopBtn: UIButton!
    @IBOutlet weak var Add30s: UIButton!
    @IBOutlet weak var sub30s: UIButton!
    var internalTimer: Timer?
    var timeLeft: Int?
    var vm = WorkoutGeneratorVM.sharedWOGenerator
    var counter = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        startStopBtn.setTitle("    Start\n Workout  ", for: UIControl.State.normal)
        self.setsText.text = self.vm.getSetsText()
        styleButton(buttons: [swapBtn, startStopBtn])
        styleOrangeButton(buttons: [Add30s, sub30s])
        makeLabelDynamic(labels: [exerciseTitleLabel])
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    fileprivate func styleButton(buttons: [UIButton]) {
        for button in buttons{
            button.backgroundColor = .clear
            button.layer.borderWidth = 1
            button.layer.cornerRadius = 8
            button.layer.borderColor = Colors.aXGreen.cgColor
        }
    }
    
    fileprivate func styleOrangeButton(buttons: [UIButton]) {
        for button in buttons{
            button.backgroundColor = .clear
            button.layer.borderWidth = 1
            button.layer.cornerRadius = 8
            button.layer.borderColor = UIColor.systemRed.cgColor
        }
    }
    
    fileprivate func makeLabelDynamic(labels: [UILabel]) {
        for label in labels{
            label.minimumScaleFactor = 0.1    //or whatever suits your need
            label.adjustsFontSizeToFitWidth = true
            label.lineBreakMode = .byClipping
            label.numberOfLines = 0
        }
    }
    
    @IBAction func startStopSetBtn(_ sender: Any) {
        vm.resting.toggle()
        startStopBtn.setTitle(vm.startOrStartText(), for: UIControl.State.normal)
        if vm.setIsActive == false {
            countDownTimer.start(beginingValue: vm.providedRestTime(), interval: 1)
        } else {
            countDownTimer.reset()
        }
    }
    
    
    @IBAction func plus30s(_ sender: Any) {
        vm.add30secs()
        countDownTimer.start(beginingValue: countDownTimer.currentValue() + 30)
    }
    
    @IBAction func minus30s(_ sender: Any) {
        vm.sub30secs()
        countDownTimer.start(beginingValue: countDownTimer.currentValue() - 30)
    }
}
