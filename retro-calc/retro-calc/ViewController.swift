//
//  ViewController.swift
//  retro-calc
//
//  Created by Yuen Hsi Chang on 1/5/17.
//  Copyright © 2017 Yuen Hsi Chang. All rights reserved.
//

import UIKit
import AVFoundation

enum Operator {
    case multiply, divide, add, subtract, equal, noOp
}

class ViewController: UIViewController {
    
    @IBOutlet weak var counter: UILabel!
    var btnSound: AVAudioPlayer!
    var leftOperand = ""
    var rightOperand = ""
    var currentOperand: Operator!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        counter.text = ""
        currentOperand = Operator.noOp
        let path = Bundle.main.path(forResource: "btn", ofType: "wav")
        let soundURL = URL(fileURLWithPath: path!)
        
        do {
            try btnSound = AVAudioPlayer(contentsOf: soundURL)
            btnSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }

    @IBAction func numberPressed(sender: UIButton) {
        playSound()
        if (currentOperand == Operator.noOp) {
            leftOperand += String(sender.tag)
            counter.text = leftOperand
        } else {
            rightOperand += String(sender.tag)
            counter.text = rightOperand
        }
    }
    
    @IBAction func divide(sender: UIButton) {
        playSound()
        if currentOperand != Operator.divide {
            getResult()
        }
        currentOperand = Operator.divide
    }
    
    @IBAction func multiply(sender: UIButton) {
        playSound()
        if currentOperand != Operator.multiply {
            getResult()
        }
        currentOperand = Operator.multiply
    }
    
    @IBAction func subtract(sender: UIButton) {
        playSound()
        if currentOperand != Operator.subtract {
            getResult()
        }
        currentOperand = Operator.subtract
    }
    
    @IBAction func add(sender: UIButton) {
        playSound()
        if currentOperand != Operator.add {
            getResult()
        }
        currentOperand = Operator.add
    }
    
    @IBAction func equal(sender: UIButton) {
        playSound()
        getResult()
    }
    
    func getResult() {
        if leftOperand != "" && rightOperand != "" {
            switch currentOperand! {
            case .multiply:
                counter.text = "\(Int(leftOperand)! * Int(rightOperand)!)"
            case .divide:
                counter.text = "\(Int(leftOperand)! / Int(rightOperand)!)"
            case .add:
                counter.text = "\(Int(leftOperand)! + Int(rightOperand)!)"
            case .subtract:
                counter.text = "\(Int(leftOperand)! - Int(rightOperand)!)"
            default:
                break
            }
            leftOperand = counter.text!
            rightOperand = ""
            currentOperand = Operator.noOp
        }
    }
    
    func playSound() {
        if btnSound.isPlaying {
            btnSound.stop()
        }
        btnSound.play()
    }
}

