//
//  FAQTVVC.swift
//  AofX
//
//  Created by Kevin Jimenez on 7/16/21.
//  Copyright © 2021 Aesthet(X). All rights reserved.
//

import UIKit

class FAQTVVC: UIViewController {

    @IBOutlet weak var FAQTV: UITableView!
    let vm = FAQVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension FAQTVVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vm.QAs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "questionCell") as! QuestionCell
        let texts = Array(vm.QAs.keys)
        cell.questionText.text = texts[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Click row for answer"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let infoVc = storyboard.instantiateViewController(identifier: "answersVC") as AnswersVC
        let texts = Array(vm.QAs.keys)
        infoVc.key = texts[indexPath.row]
        infoVc.index = indexPath.row
      
        
        self.present(infoVc, animated: true, completion: nil)
    }
    
    
}
