//
//  AnswersVC.swift
//  AofX
//
//  Created by Kevin Jimenez on 7/16/21.
//  Copyright © 2021 Aesthet(X). All rights reserved.
//

import UIKit

class AnswersVC: UIViewController {

    @IBOutlet weak var answerText: UILabel!
    var index: Int?
    var key: String?
    let vm = FAQVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerText.text = vm.QAs[key ?? ""]  //answers()[index ?? 0]
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
