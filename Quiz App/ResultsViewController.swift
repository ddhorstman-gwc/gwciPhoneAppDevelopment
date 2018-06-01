//
//  ResultsViewController.swift
//  Quiz App
//
//  Created by David Hortsman on 6/1/18.
//  Copyright © 2018 David Hortsman. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    var numberCorrect: Int = 0
    var total: Int = 0
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var resultsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultsLabel.text = "You got \(numberCorrect) out of \(total) questions correct!"
        let percentCorrect = (Double(numberCorrect) / Double(total))*100
        determineTitleMessage(percentCorrect: percentCorrect)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    func determineTitleMessage(percentCorrect: Double){
        var titleLabelText: String = ""
        if(percentCorrect>=90){
            titleLabelText = "Great Job!"
        } else if(percentCorrect>=75){
          titleLabelText="Not too shabby."
        } else if (percentCorrect>=50){
            titleLabelText="Well, you got more than half, that's something."
        } else if (percentCorrect>0){
            titleLabelText="At least you got \(numberCorrect) right!"
        } else{
            titleLabelText="Thanks for playing, better luck next time."
        }
        titleLabel.text = titleLabelText
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    
}
