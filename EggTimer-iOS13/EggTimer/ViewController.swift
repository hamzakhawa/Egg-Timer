//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()
    
    
    
    @IBOutlet weak var progBar: UIProgressView!
    @IBOutlet weak var eggLabel: UILabel!
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        progBar.progress = 0.0
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        progBar.progress = 0.0
        secondsPassed = 0
        eggLabel.text = hardness
        
        
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        }
   
    @objc func updateCounter() {
        //example functionality
        if secondsPassed < totalTime {
            secondsPassed += 1
            progBar.progress = Float(secondsPassed) / Float(totalTime)
        } else{
            timer.invalidate()
            eggLabel.text = "Egg Completed"
        }
    }
    
}

