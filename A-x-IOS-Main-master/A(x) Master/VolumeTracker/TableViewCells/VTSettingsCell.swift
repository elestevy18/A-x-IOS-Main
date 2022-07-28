//
//  VTSettingsCell.swift
//  AofX
//
//  Created by Kevin Jimenez on 6/24/21.
//  Copyright © 2021 Aesthet(X). All rights reserved.
//

import UIKit


class VTSettingsCell: UITableViewCell {
    var vm = VTTrackerVM.sharedVTVM
    @IBOutlet weak var settingsBtn: UIButton!
    @IBOutlet weak var FAQBtn: UIButton!
    @IBOutlet weak var resetAllBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        styleButton(buttons: [settingsBtn, FAQBtn, resetAllBtn])
    }
    
    fileprivate func styleButton(buttons: [UIButton]) {
        for button in buttons{
            button.backgroundColor = .clear
            button.layer.borderWidth = 1
            button.layer.cornerRadius = 8
            button.layer.borderColor = Colors.aXGreen.cgColor
        }
    }
    
    @IBAction func resetAllPressed(_ sender: Any) {
        vm.createVTCellsArray()
    }
    
    @IBAction func faqPressed(_ sender: Any) {
        //show faq modally
    }
    
    @IBAction func settingsPressed(_ sender: Any) {
    }
}
