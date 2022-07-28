//
//  FAQVM.swift
//  AofX
//
//  Created by Kevin Jimenez on 7/16/21.
//  Copyright © 2021 Aesthet(X). All rights reserved.
//

import Foundation

class FAQVM {
    let QAs = ["How much weight should I use? Go heavy go light?":"It depends on the exercise. You’re not going to Lateral Raise your Squat or Bench your Deadlift weight. Every exercise should be performed to an intensity of ~8/10 consistently. COSISTENTLY.\nLifting too heavy will hinder your recovery and performance in the next session, if you are lifting as frequently as is ideal.\nLifting too light won’t stimulate growth.",
               
               "How often should I train?": "Ideally three days on, one day off with a rest week every 5 to 11 weeks. If you fall short of the ideal, don’t worry doing something is better than nothing. Get back to tracking and you can pick up right where you left off.",
               
               "I don’t want to train XYZ muscle?": "Lol. Train evenly. Don’t be lazy, muscle imbalances can lead to injuries down the road and weird looking physiques.\nNow if you already have a muscle imbalance from your bro phase, set that muscles weekly volume to zero by clicking on that muscle row and entering “0” under Maximum Adaptive Volume."//,
               
              // "":""
               
               
    ]
    
    func questions() -> [String] {
        let questions = Array(QAs.keys)
        return questions
    }
    
    func answers() -> [String] {
        let answers = Array(QAs.values)
        return answers
    }
    
}
