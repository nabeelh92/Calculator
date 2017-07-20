//
//  ViewController.swift
//  RetroCalculator
//
//  Created by Nabeel Huq on 2017-07-18.
//  Copyright © 2017 nhuq. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var btnSound : AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "btn", ofType: "wav")
        let soundURL = URL(fileURLWithPath: path!)
    
        do{
            try btnSound = AVAudioPlayer(contentsOf: soundURL)
            btnSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    @IBAction func numberPressed(sender: UIButton) {
        
        // stop if currently playing
        if btnSound.isPlaying{
            btnSound.play()
        }
        
        btnSound.play()
    }
    
    func playSound() {
        
    }

    


}

