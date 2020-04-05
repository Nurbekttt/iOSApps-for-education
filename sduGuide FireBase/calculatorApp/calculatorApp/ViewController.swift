//
//  ViewController.swift
//  calculatorApp
//
//  Created by Nurbek on 9/19/19.
//  Copyright © 2019 Nurbek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var FrontView: UIView!
    @IBOutlet var BackView: UIView!
    @IBOutlet var delete: UIButton!
    @IBOutlet var mult: UIButton!
    @IBOutlet var minus: UIButton!
    @IBOutlet var plus: UIButton!
    @IBOutlet weak var AC: UIButton!
    @IBOutlet weak var plOrMn: UIButton!
    @IBOutlet weak var percent: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var nine: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var dot: UIButton!
    @IBOutlet weak var equal: UIButton!
    
    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        FrontView.layer.cornerRadius=40
        FrontView.layer.masksToBounds=true
        FrontView.setGradientBackground(colorOne: Colors.forBottom, colorTwo: Colors.forMiddle)
        BackView.backgroundColor=Colors.forTop
        delete.backgroundColor=Colors.forButton
        mult.backgroundColor=Colors.forButton
        minus.backgroundColor=Colors.forButton
        plus.backgroundColor=Colors.forButton
        
        delete.layer.cornerRadius=15
        mult.layer.cornerRadius=15
        minus.layer.cornerRadius=15
        plus.layer.cornerRadius=15
        AC.layer.cornerRadius=15
        plOrMn.layer.cornerRadius=15
        percent.layer.cornerRadius=15
        seven.layer.cornerRadius=15
        eight.layer.cornerRadius=15
        nine.layer.cornerRadius=15
        four.layer.cornerRadius=15
        five.layer.cornerRadius=15
        six.layer.cornerRadius=15
        one.layer.cornerRadius=15
        two.layer.cornerRadius=15
        three.layer.cornerRadius=15
        zero.layer.cornerRadius=15
        dot.layer.cornerRadius=15
        equal.layer.cornerRadius=15
    }
    
    var pressed:Bool=false
    @IBAction func digitPressed(_ sender: UIButton) {
        if (!pressed) {
            label.text = sender.currentTitle!
            pressed = true
        }
        else{
            let text = label.text!
            label.text = text + sender.currentTitle!
            
        }
        
    }
    private var calcModel = calculatorModel()
    @IBAction func operationPressed(_ sender: UIButton) {
        calcModel.setOperand(3)
    }
    
    
    
}

