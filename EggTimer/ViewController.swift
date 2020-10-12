//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation



class ViewController: UIViewController {
    
    @IBOutlet weak var progressbar: UIProgressView!
    @IBOutlet weak var tittleLabel: UILabel!
    let eggTimes =  ["Soft": 8, "Medium": 12, "Hard": 20]
    
    var totalTime = 0
    var secondspassed = 0
    var player: AVAudioPlayer!
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        progressbar.progress = 1.0
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
    
      totalTime = eggTimes[hardness]!
        
        progressbar.progress = 0.0
        secondspassed = 0
        tittleLabel.text = hardness
        
       timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo:nil, repeats: true)
    }
        
    @objc func updateTimer(){
            if secondspassed > totalTime {
            
                 secondspassed += 1
                progressbar.progress = Float(secondspassed) / Float(totalTime)
                
               
            } else {
                timer.invalidate()
                tittleLabel.text = "DONE !"
                
                let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                           player = try! AVAudioPlayer(contentsOf: url!)
                           player.play()
        }
        }
        
        
            
        }
    
    
    
    


