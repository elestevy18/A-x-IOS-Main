//
//  TimerSettingsVC.swift
//  AofX
//
//  Created by Kevin Jimenez on 1/9/22.
//  Copyright © 2022 Aesthet(X). All rights reserved.
//

import UIKit

class TimerSettingsVC: UIViewController {
    var vm = VTTrackerVM.sharedVTVM
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func restartTimer(_ sender: Any) {
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
