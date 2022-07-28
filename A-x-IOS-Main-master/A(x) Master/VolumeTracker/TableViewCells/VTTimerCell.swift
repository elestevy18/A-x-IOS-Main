//
//  VTTimerCell.swift
//  AofX
//
//  Created by Kevin Jimenez on 9/30/21.
//  Copyright © 2021 Aesthet(X). All rights reserved.
//

import UIKit

class VTTimerCell: UITableViewCell, VTTimerDelagate {
    func updateVTTimer() {
        DispatchQueue.main.async { [self] in
            
//              /  self.timerText.text =  self.vm.getTotalTimestamp()
            
        }
    }
    
    
    
    @IBOutlet weak var timerText: UILabel!
    
    var internalTimer: Timer?
    var vm = VTTrackerVM.sharedVTVM
    var counter = 0
    var timer: Timer?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
         timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
    }
    
    @objc func update() {
        DispatchQueue.main.async { [self] in
            //print ("s")
            self.timerText.text = "Total time: " + getTimeText(from: self.vm.timerBaseDate ?? Date())
        }
    }
    
    func resetTimer() {
        //??????timer?.invalidate()
        self.vm.timerBaseDate = Date()
    }
    

    func getTimeText(from: Date) -> String {
        let dateComponents = Calendar.current.dateComponents([.hour, .minute, .second], from: from, to: Date())

        if dateComponents.hour ?? 0 >= 2 {  return "GO HOME" }
        if dateComponents.hour ?? 0 >= 3 {
            resetTimer()
             }
        
        if dateComponents.hour! >= 1 {
            if  dateComponents.minute! <= 9 && dateComponents.second! <= 9 {
                return "0\(dateComponents.hour!):0\(dateComponents.minute!):0\(dateComponents.second!)"
            }
            
            if dateComponents.second! <= 9 {
                return "\(dateComponents.hour!):\(dateComponents.minute!):0\(dateComponents.second!)"
            }
            
            return "0\(dateComponents.hour!)\(dateComponents.minute!):\(dateComponents.second!)"
            
        } else {
            if  dateComponents.minute! <= 9 && dateComponents.second! <= 9 {
                return "0\(dateComponents.minute!):0\(dateComponents.second!)"
            }
            
            if dateComponents.second! <= 9 {
                return "\(dateComponents.minute!):0\(dateComponents.second!)"
            }
            
            return "\(dateComponents.minute!):\(dateComponents.second!)"
        }
        
        //return "\(dateComponents.hour!):\(dateComponents.minute!):\(dateComponents.second!)"
        
        
        
        
        
        
        //let dateComponents = Calendar.current.dateComponents([.hour, .minute, .second], from: from, to: Date())
        
        if dateComponents.hour ?? 0 >= 2 {
            timer?.invalidate()
            return "Go home and train <90 minutes."
        }
        
        
        var seconds = "00"
        var minutes = "00"
        var hours = ""
        if dateComponents.second! <= 9 {
            seconds = ":0\(dateComponents.second!)"
        }
        if dateComponents.minute! <= 9 && dateComponents.minute! > 0 {
            minutes = "0\(dateComponents.minute!)"
        }
        if dateComponents.hour! <= 9 && dateComponents.minute! > 0 {
            hours = "0\(dateComponents.hour!)"
        }
        
        return hours + minutes + seconds
    }
    
    fileprivate func startTotalTimer() {
            //CHECKS IF WE NEED TO START THE TOTAL TIMER AND START IT IF IT IS A DIEFFERENT DAY
        if self.vm.timerBaseDate == nil {
            self.vm.timerBaseDate = Date()
        } else {// if the days are different
            let day = Calendar.current.dateComponents([.weekday], from: Date(), to: Date())
            if !(day == Calendar.current.dateComponents([.weekday], from: self.vm.timerBaseDate ?? Date(), to: Date())){
                self.vm.timerBaseDate = Date()
            }
        }
    }

    
}
