//
//  RecommendationViewController.swift
//  iRecommend
//
//  Created by David Hortsman on 7/19/18.
//  Copyright © 2018 David Hortsman. All rights reserved.
//

import UIKit
import Foundation

class RecommendationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getRecommendation()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        getRecommendation()
    }
    var i: (Int) = 0
let recommendations = ["Spanish", "French","Hebrew","Arabic","American Sign Language","German","Swahili","Japanese"]
    
    @IBOutlet weak var recommendationImage: UIImageView!
    @IBOutlet weak var recommendationLabel: UILabel!

    
    func getRecommendation(){
        let numRecommends: (UInt32)
        numRecommends = UInt32(recommendations.count)
        let i_prev = i
        while(i==i_prev){
            i = Int(arc4random_uniform(numRecommends))
        }
        let suggestion = recommendations[i]
        //print(suggestion)
        recommendationLabel.text = "\(suggestion)!"
        recommendationImage.image = UIImage(named: suggestion)
 
    }
    
    @IBAction func reRecommend(_ sender: UIButton) {
       getRecommendation()

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

