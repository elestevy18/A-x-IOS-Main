//
//  ViewController.swift
//  picker
//
//  Created by El Kevin on 6/12/20.
//  Copyright © 2020 Aesthet(X). All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift


class ViewController: UIViewController{
    
   // change body fat image with button programmatically jUSTINO 6/30/20 9:02 PM
    
    @IBOutlet weak var  maleChartImage: UIImageView!

    
    
    
    //Outlet for picker textfields
    
    @IBOutlet weak var activityLevelTextField: UITextField!
   
    
     // KEVIN JIMENEZ 06/19/2020  Outlets for controller to move text cursor to next textfield and for textfields to show numberpad vs keyboard
    @IBOutlet var textField1: UITextField! // Bodyweight
    @IBOutlet var textField2: UITextField! // Height Feet
    @IBOutlet var textField3: UITextField! // Height Inches
    @IBOutlet var textField4: UITextField! // Experience
    @IBOutlet var textField5: UITextField! // Composition
    @IBOutlet var textField6: UITextField! // Age
  
    // KEVIN JIMENEZ 06/21/2020 METRIC OR IMPOERIAL OUTLET
    
    @IBOutlet var impOrMetric: UISegmentedControl!
    
    @IBOutlet weak var NextButton: UIButton!
    
    // JUSTINO 6/28/19 12:49:59 PM 
    

    
    // test buttons
    
    @IBOutlet weak var testFemaleButton: UIButton!
    @IBOutlet weak var testMaleButton: UIButton!
    
    //userinfo
    let defaults = UserDefaults.standard
    
    var maleBool = Bool(true)
    var unitsBool = Bool(false)
    
    struct Keys {
            static let bodyWeight    = "bodyweight"
            static let heightBig     = "heightbig"
            static let heightSmall   = "heightsmall"
            static let experience    = "experience"
            static let composition   = "composition"
            static let age           = "age"
            static let activityLevel = "activitylevel"
            static let sex           = "sex"
            static let unitsBool     = "unitsBool"
    }
    
    //Array for actiovity level picker
    let activityLevel  = ["Sedentary",
    "Light: 1-2x weekly",
    "Moderate: 3-5x weekly",
    "Heavy: 6-7x weekly",
    "Athletic: 2x daily"]
    var selectedActivityLevel: String?

    override func viewDidLoad() {
        super.viewDidLoad()
       
        //STYLE buttons
    
        styleButton(button: NextButton)
        NextButton.layer.cornerRadius = 15
        
        // checkForSavedtextField()
        textField1.delegate = self
        textField2.delegate = self
        textField3.delegate = self
        textField4.delegate = self
        textField5.delegate = self
        textField6.delegate = self
        
        textField1.tag = 1
        textField2.tag = 2
        textField3.tag = 3
        textField4.tag = 4
        textField5.tag = 5
        textField6.tag = 6
        // Do any additional setup after loading the view.
        
        textField1.keyboardType = UIKeyboardType.numberPad
        textField2.keyboardType = UIKeyboardType.numberPad
        textField3.keyboardType = UIKeyboardType.numberPad
        textField4.keyboardType = UIKeyboardType.numberPad
        textField5.keyboardType = UIKeyboardType.numberPad
        textField6.keyboardType = UIKeyboardType.numberPad
        
        // BUTTON COLORS AND NUMBERS 12:50:59 AM PST JUSTINO
    
        
        createALPicker()
        createToolbar()
        
        //KEVIN JIMENEZ 06/21/2020 Set textfield to imperial by default
        
       textField1.attributedPlaceholder = NSAttributedString(string: "Pounds",
    attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
         textField2.attributedPlaceholder = NSAttributedString(string: "Feet",
           attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
         textField3.attributedPlaceholder = NSAttributedString(string: "Inches",
           attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])

        
        
        // For textfield bool
        
      
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        if(checkTextfield()){
                  //SAVE DAT AND NAVIGATE TO NEXT VIEW
            let bodyWeight = Double(textField1.text!)
            defaults.set(bodyWeight, forKey: Keys.bodyWeight)
            let heightBig = Double(textField2.text!)
            defaults.set(heightBig, forKey: Keys.heightBig)
            let heightSmall = Double(textField3.text!)
            defaults.set(heightSmall, forKey: Keys.heightSmall)
            let experience = Double(textField4.text!)
            defaults.set(experience, forKey: Keys.experience)
            let composition = Double(textField5.text!)
            defaults.set(composition, forKey: Keys.composition)
            let age = Double(textField6.text!)
            defaults.set(age, forKey: Keys.age)
            let activityLevel = String(activityLevelTextField.text!)
            defaults.set(activityLevel, forKey: Keys.activityLevel)
            let thereAreTwoGenders = Bool(maleBool)
            defaults.set(thereAreTwoGenders, forKey: Keys.sex)
            let units = Bool(unitsBool)
            defaults.set(units, forKey: Keys.unitsBool)
     
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let calculatingPerfection = storyboard.instantiateViewController(identifier: "calculatingPerfection")
            //self.present(calculatingPerfection, animated: true, completion: nil)
               self.show(calculatingPerfection, sender: self)

            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.dismiss(animated: true, completion: nil)
            }
              } else {
                 //SHOW ERROR MESSAGE
            let alert = UIAlertController(title: "Missing Information", message: "Please input all information. Notice \"activity level\" is a picker", preferredStyle: UIAlertController.Style.alert)
                          alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                          self.present(alert, animated: true, completion: nil)
              }
        
    }
    

    
    //test male button tapped
    
    @IBAction func testMaleButtonTapped(_ sender: Any) {
        maleBool = Bool(true)
        testMaleButton.isSelected = !testMaleButton.isSelected;
        if(testFemaleButton.isSelected){
            testFemaleButton.sendActions(for: .touchUpInside)
        }
    
    }
    @IBAction func femaleButtonTapped(_ sender: Any) {
        maleBool = Bool(false)
        testFemaleButton.isSelected = !testFemaleButton.isSelected;
        if(testMaleButton.isSelected){
            testMaleButton.sendActions(for: .touchUpInside)
        }
    }
 
    @IBAction func unitSelection(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            unitsBool = false
            

            textField1.attributedPlaceholder = NSAttributedString(string: "Pounds",
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
                
            textField2.attributedPlaceholder = NSAttributedString(string: "Feet",
                   attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
                
            textField3.attributedPlaceholder = NSAttributedString(string: "Inches",
                   attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            break
        case 1:
            unitsBool = true
            textField1.attributedPlaceholder = NSAttributedString(string: "Kilos",
                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
                           
            textField2.attributedPlaceholder = NSAttributedString(string: "Meters",
                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
                           
            textField3.attributedPlaceholder = NSAttributedString(string: "Centimeters",
                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        default:
            unitsBool = false
        }
        
    }
    
    
    
    // KEVIN JIMENEZ 06/19/2020 Place functions below here.
    
    
    //CONDITIONAL TO TEST IF TEXTFIELD INPUT IS VALID
  //   func isBvalidBW (test:String) ->Bool{
   //        // your email validation here...
    //       return true
    //   }
    
    
    func createALPicker(){
        let ALPicker = UIPickerView()
        ALPicker.delegate = self
        activityLevelTextField.inputView = ALPicker
        //MAKE IT BLACK
        ALPicker.backgroundColor = .black
    }
    
    //KEVIN JIMENEZ 06/22/2020 CHECK THAT TEXTFIELDS ARE FILLED
    func checkTextfield()->Bool{
        if (!(textField1.text?.isEmpty ?? false) && !(textField2.text?.isEmpty ?? false) &&
            !(textField3.text?.isEmpty ?? false) &&
            !(textField4.text?.isEmpty ?? false) &&
            !(textField5.text?.isEmpty ?? false) &&
            !(textField6.text?.isEmpty ?? false)){
        return true
        } else {
            return false
        }
    }
     
  func styleButton(button: UIButton){
         button.backgroundColor = .clear
         button.layer.borderWidth = 1
         button.layer.borderColor = Colors.aXGreen.cgColor
     }
    
    func createToolbar(){
        
        //KEVIN JIMENEZ 06/19/2020 MAKE THE TOOLBAR FOR THE PICKER VIEW
        let activityPickerToolBar = UIToolbar()
        activityPickerToolBar.sizeToFit()
        //Toolbar Color
        activityPickerToolBar.barTintColor = .black
        activityPickerToolBar.tintColor = Colors.aXGreen
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self,
                                         action: #selector(ViewController.dismissKeyboard))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        activityPickerToolBar.setItems([flexibleSpace, doneButton], animated: false)
        activityPickerToolBar.isUserInteractionEnabled =  true
        
        
        
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }

}

// KEVIN JIMENEZ 06/19/2020 PickerView functions read eat fucking bum

    extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource{
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
           
            return activityLevel.count
          
        }
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
                       return activityLevel[row]
                       
           
        }
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            
   
                                 selectedActivityLevel =  activityLevel[row]
                                 activityLevelTextField.text = selectedActivityLevel
                               
        }
        
        func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
            var label: UILabel
            if let view = view as? UILabel{
                label = view
            } else {
                label = UILabel()
            }
            
            label.textColor = .white
            label.textAlignment = .center
            label.text = activityLevel[row]
            
            return label
        }
        
     
    }

extension ViewController : UITextFieldDelegate {
 func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return textField.shouldChangeCustomOtp(textField: textField, string: string)
    }
}

extension UITextField {
    func shouldChangeCustomOtp(textField:UITextField, string: String) ->Bool {
        return true
    }

}

