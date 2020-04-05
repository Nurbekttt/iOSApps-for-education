//
//  ViewController.swift
//  drawing
//
//  Created by Nurbek on 9/27/19.
//  Copyright © 2019 Nurbek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var circle: UIButton!
    
    @IBOutlet weak var rectangle: UIButton!
    
    @IBOutlet weak var line: UIButton!
    
    @IBOutlet weak var triangle: UIButton!
    
    @IBOutlet weak var pencil: UIButton!
    
    @IBOutlet weak var back: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        circle.setBackgroundImage(UIImage.init(named: "circle"), for: .normal)
        rectangle.setBackgroundImage(UIImage.init(named: "rectangle"), for: .normal)
        line.setBackgroundImage(UIImage.init(named: "line"), for: .normal)
        triangle.setBackgroundImage(UIImage.init(named: "triangle"), for: .normal)
        pencil.setBackgroundImage(UIImage.init(named: "pen"), for: .normal)
        back.setBackgroundImage(UIImage.init(named: "undo"), for: .normal)
        
    }
    

}

