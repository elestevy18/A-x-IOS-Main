//
//  TimerVM.swift
//  AofX
//
//  Created by Kevin Jimenez on 8/29/21.
//  Copyright © 2021 Aesthet(X). All rights reserved.
//

import Foundation

@objc protocol setTimerDelagate : NSObjectProtocol {
    func updateTimer1()
}


class SetTimerVM: NSObject {
    
    static let sharedTimer: SetTimerVM = SetTimerVM()
    var delegate : setTimerDelagate? = nil
    //var sets = 0
    var isStarted = false
    var TotalRestTime = 120
    var setTime = 0
    var setCount = 0
    var setIsActive = false
    var timer = Timer()
    var totalDateInitiated : Date? = nil
    var restDateInitiated : Date? = nil
    var setDateInitiated : Date? = nil
    let defaults        = UserDefaults.standard
    var newRestTime = 0
   
    
    func resetAllVars() {
        totalDateInitiated  = nil
        restDateInitiated  = nil
        setDateInitiated  = nil
        timer.invalidate()
        TotalRestTime = 0
        setTime = 0
        setCount = 0
        isStarted = false
        setIsActive = false
    }
    
    
    func startTimer() {
        if timer.isValid { timer.invalidate() }
        totalDateInitiated = Date()
        toggleSetIsActive()
        if setIsActive{
            setTime = 0
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(SetTimerVM.addSetTime), userInfo: nil, repeats: true)
        } else {
            TotalRestTime = 120
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(SetTimerVM.addSetTime), userInfo: nil, repeats: true)
        }
    }
    
    @objc func addSetTime() {
        //TODO
        setTime += 1
        if setIsActive != true {
          //  TotalRestTime -= 1
        }
        guard delegate == nil else {
            delegate?.updateTimer1()
            return
        }
    }
    
    @objc func addWorkTime() {
        setTime += 1
        if setIsActive != true {
            //TotalRestTime -= 1
        }
        guard delegate == nil else {
            delegate?.updateTimer1()
            return
        }
    }
    
    func toggleSetIsActive() { setIsActive.toggle() }
    
    func restTimeLeft() -> String {
        let minutes = String(Int(floor(Double(Int(TotalRestTime ?? 0 / 60)))))
        let seconds = String(Int(floor(Double(Int(TotalRestTime ?? 0 % 60)))))
        let restString = minutes + ":" + seconds
        return restString
    }
    
    func initRestLeft (primeMuscles: Int) -> Int {
        if primeMuscles == 1 {
            return 120
        } else if primeMuscles == 2 {
            return 180
        } else {
            return 240
        }
    }
    
    func getTotalTimestamp() -> String {
        let totalStr = "Total time:\n" + getTimeText(from: totalDateInitiated ?? Date())
        return totalStr
    }
    
    func getTimerTimestamp() -> String {
        if setIsActive == true {
            return "Set Time:\n" + String(setTime)
        } else {
            return getRestText()
           //return "Rest:\n" + String(restTime)
        }
    }
    
    
    
    func getTimeText(from: Date) -> String {
        let dateComponents = Calendar.current.dateComponents([.minute, .second], from: from, to: Date())
        if dateComponents.second! <= 9 {
            return "\(dateComponents.minute!):0\(dateComponents.second!)"
        }
        return "\(dateComponents.minute!):\(dateComponents.second!)"
    }
    
    func isTimeLessThanZero() -> Bool {
        if newRestTime < 0  {
            newRestTime = 0
            return true}
        return false
    }
    
    func getRestText() -> String {
        if TotalRestTime < 0 { return String(TotalRestTime)}
        //let the time be rest time - the time from restDateInitiated
        let timelapsed = Date().timeIntervalSince(restDateInitiated!)
        newRestTime = TotalRestTime - Int(timelapsed)
        var string = String(newRestTime/60)
        var secs = String(abs(newRestTime%60))
        if newRestTime%60 <= 9 {
            secs = "0" + secs
        }
        string = "Rest\n" + string + ":" + secs
        return string
    }
    
    //ManageActiveScreen
    func  startActiveScreen() {
        setDateInitiated = Date()
    }
    
    
    func add30secs() {
        TotalRestTime = TotalRestTime + 30
    }
    
    func sub30secs() {
        TotalRestTime = TotalRestTime - 30
    }
    
    func getSetsText(totalSets: Int) -> String {
            return  String(setCount) + "/" + String(totalSets)
       
    }
    }

