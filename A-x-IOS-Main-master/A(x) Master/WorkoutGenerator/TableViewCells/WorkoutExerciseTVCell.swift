//
//  WorkoutExerciseTVCell.swift
//  AofX
//
//  Created by Kevin Jimenez on 6/10/21.
//  Copyright © 2021 Aesthet(X). All rights reserved.
//

import UIKit

class WorkoutExerciseTVCell: UITableViewCell {
    @IBOutlet weak var exerciseTitleLabel: UILabel!
    @IBOutlet weak var setsLabel: UILabel!
    @IBOutlet weak var swapBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        styleButton(buttons: [swapBtn])
    }

    fileprivate func styleButton(buttons: [UIButton]) {
        for button in buttons{
            button.backgroundColor = .clear
            button.layer.borderWidth = 1
            button.layer.cornerRadius = 8
            button.layer.borderColor = Colors.aXGreen.cgColor
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @IBAction func swapButton(_ sender: Any) {
        //vm.swapExercise
    }
    
}

