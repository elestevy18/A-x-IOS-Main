//
//  MaleButton.swift
//  A(x) Master
//
//  Created by El Kevin on 6/13/20.
//  Copyright © 2020 Aesthet(X). All rights reserved.
//

import UIKit

class FemaleButton: UIButton {

var isOn = false
    override init(frame:CGRect){
        super.init(frame: frame)
        initButton()
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        initButton()
    }
    
    func initButton() {
        layer.borderWidth = 2.0
        layer.borderColor = Colors.aXGreen.cgColor
        layer.cornerRadius = frame.size.height/2
        
        setTitleColor(Colors.aXGreen, for: .normal)
        addTarget(self, action: #selector(FemaleButton.buttonPRessed), for: .touchUpInside)
    
    }
    
    @objc func buttonPRessed(){
        activateButton(bool: !isOn)
        
        
    }
    
    func activateButton(bool: Bool) {
        isOn = bool
        
        let color = bool ? Colors.aXGreen: .clear
        let title = bool ? "Female": "Female"
        let titleColor = bool ? . black : Colors.aXGreen
        
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        backgroundColor = color
        
    }

}
