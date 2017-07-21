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

    @IBOutlet weak var outpulLbl: UILabel!
    
    var btnSound : AVAudioPlayer!
    
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Add = "+"
        case Subtract = "-"
        case Empty = "Empty"
    }
    
    var currentOperation = Operation.Empty
    var runningNumber = ""
    var leftValStr = ""
    var rightValStr = ""
    var result = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSound()
        
    }
    
    func setupSound() {
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
        playSound()
        
        runningNumber += "\(sender.tag)"
        
        outpulLbl.text = runningNumber
    }
    
    func playSound() {
        // stop if currently playing
        if btnSound.isPlaying{
            btnSound.stop()
        }
        
        btnSound.play()
    }
    
    func processOperation(operation: Operation) {
        if currentOperation != Operation.Empty {
            
            //if an operation was selected but was followed by another operator
            if runningNumber != "" {
                rightValStr = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Multiply {
                    result = "\(Double(leftValStr)! * Double(rightValStr)!)"
                } else if currentOperation == Operation.Divide {
                    result = "\(Double(leftValStr)! / Double(rightValStr)!)"
                } else if currentOperation == Operation.Subtract {
                    result = "\(Double(leftValStr)! - Double(rightValStr)!)"
                } else if currentOperation == Operation.Add {
                    result = "\(Double(leftValStr)! + Double(rightValStr)!)"
                }
                
                leftValStr = result
                outpulLbl.text = result
            }
            
            currentOperation = operation
        }
    }

}







