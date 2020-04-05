//
//  ViewController.swift
//  calculator
//
//  Created by Nurbek on 12/30/18.
//  Copyright © 2018 Nurbek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var number:Double = 0;
    var a:Double = 0;
    var b:Double = 0;
    var press:Bool=false;
    var operation:String="";
    @IBOutlet weak var result: UILabel!
    @IBAction func digits(_ sender: UIButton) {
        
        if(press){
            if(result.text == "/" || result.text == "+" || result.text == "-" || result.text == "x"){
                result.text = ""
            }
            if(sender.tag==10){
                if(!(result.text?.contains(","))! && result.text != "" && result.text != "/" && result.text != "+" && result.text != "-" && result.text != "x"){
                    
                    result.text = result.text!+"."
                    number = Double(result.text!)!
                }
            }else{
                result.text = result.text! + String(sender.tag)
                number = Double(result.text!)!
            }
            b=number
        }
        else{
            if(sender.tag==10){
                if(!(result.text?.contains("."))! && result.text != ""){
                    
                    result.text = result.text!+"."
                    number = Double(result.text!)!
                }
            }else{
                result.text = result.text! + String(sender.tag)
                number = Double(result.text!)!
            }
        }
    }
    
    @IBAction func actions(_ sender: UIButton) {
        if (result.text != ""){
            if (sender.tag == 11){
                result.text = ""
            }
            else if (sender.tag == 12){
                if(!(result.text?.contains("-"))! && result.text != "-"){
                    
                    result.text = "-"+result.text!
                    number = Double(result.text!)!
                }
                else{
                    number = Double(result.text!)!*(-1)
                    result.text=String(number
)
                }
            }
            
            else if (sender.tag == 14){
                result.text = String((Double(result.text!)!)/100)
            }
            else if (sender.tag == 15){
                press=true;
                a=Double(result.text!)!
                result.text="/";
    
            }
            else if (sender.tag == 16){
                press=true;
                a=Double(result.text!)!
                result.text="x";

            }
            else if (sender.tag == 17){
                press=true;
                a=Double(result.text!)!
                result.text="-";

            }
            else if (sender.tag == 18){
                press=true;
                a=Double(result.text!)!
                result.text="+";

            }
            else if (sender.tag == 19){
                if(press){
                    if(operation=="/"){
                        result.text=String(a/b)
                    }
                    else if(operation=="x"){
                        result.text=String(a*b)
                    }
                    else if(operation=="-"){
                        result.text=String(a-b)
                    }
                    else if(operation=="+"){
                        result.text=String(a+b)
                    }
                    a=Double(result.text!)!
                    press=false
                }
                
            }
            if(14<sender.tag && sender.tag<19){
                operation=result.text!
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

