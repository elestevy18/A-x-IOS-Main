//
//  BodyfatViewController.swift
//  A(x) Master
//
//  Created by El Kevin on 6/21/20.
//  Copyright © 2020 Aesthet(X). All rights reserved.
//

import UIKit

class BodyfatViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    textField.delegate = self        // Do any additional setup after loading the view.
        
        textField.attributedPlaceholder = NSAttributedString(string: "Pounds",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

