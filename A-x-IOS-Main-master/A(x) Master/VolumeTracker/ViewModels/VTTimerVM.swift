//
//  VTTimerVM.swift
//  AofX
//
//  Created by Kevin Jimenez on 9/30/21.
//  Copyright © 2021 Aesthet(X). All rights reserved.
//

import Foundation

@objc protocol VTTimerDelagate : NSObjectProtocol {
    func updateVTTimer()
}

//@objc protocol VolumeTrackerUpdateDelegate : NSObjectProtocol {
//    func updateVolumeTracker()
//}


//TODO make sure that this resets once a day
//add func to start when the first timer of the day is started


class VTTimerVM: NSObject {
    
    static let sharedVTTimerVM: VTTimerVM = VTTimerVM()
    var delegate : VTTimerDelagate? = nil
    var totalDateInitiated : Date? = nil
    var isOn = false
    var timer = Timer()
    
    
    func getTotalTimestamp() -> String {
        let totalStr = "Total time:\n" + getTimeText(from: totalDateInitiated ?? Date())
        return totalStr
    }
    
func getTimeText(from: Date) -> String {
    let dateComponents = Calendar.current.dateComponents([.hour, .minute, .second], from: from, to: Date())
    if dateComponents.second! <= 9 {
        return "\(dateComponents.hour!)\(dateComponents.minute!):0\(dateComponents.second!)"
    }
    return "\(dateComponents.hour!)\(dateComponents.minute!):\(dateComponents.second!)"
    }
    
    func toggleIsOn() {isOn.toggle()
        if isOn == true {
            startTimer()
        } else {
            stopTimer()
        }
    }
    
    func startTimer() {
        if timer.isValid { timer.invalidate() }
        totalDateInitiated = Date()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(VTTimerVM.addWorkTime), userInfo: nil, repeats: true)
    }
    
    func stopTimer() {
        timer.invalidate()
    }
    
    @objc func addWorkTime() {
//print("secnds")
    guard delegate == nil else {
        delegate?.updateVTTimer()
        return
    }
    }
    
}
