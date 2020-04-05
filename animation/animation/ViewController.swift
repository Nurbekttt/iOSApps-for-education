//
//  ViewController.swift
//  animation
//
//  Created by Nurbek on 11/17/19.
//  Copyright © 2019 Nurbek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.button.layer.cornerRadius = 10
        self.button.layer.borderWidth = 1
        self.button.layer.borderColor = UIColor.white.cgColor
        self.button.layer.backgroundColor = UIColor.orange.cgColor
        self.button.alpha = 0
        
        UIView.animate(withDuration: 1){
            self.view.backgroundColor = .orange
            self.email.center.x = self.view.frame.maxX
            self.password.center.x = self.view.frame.minX
        }
       
        UIView.animate(withDuration: 1, delay: 1, animations: {
            self.button.alpha = 1
            }, completion: nil)
        // Do any additional setup after loading the view.
    }

    @IBAction func nextAction(_ sender: UIButton) {
        guard let ViewController = storyboard?.instantiateViewController(withIdentifier: "tableVC") else {return}
        present(ViewController, animated: true)
    }
    
}

