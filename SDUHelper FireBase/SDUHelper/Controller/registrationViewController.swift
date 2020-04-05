//
//  registrationViewController.swift
//  SDUHelper
//
//  Created by Nurbek on 11/9/19.
//  Copyright © 2019 Nurbek. All rights reserved.
//

import UIKit

class registrationViewController: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (segmentControl != nil){
            segmentControl.selectedSegmentIndex=1
        }
        // Do any additional setup after loading the view.
    }
    

    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        
        switch segmentControl.selectedSegmentIndex {
        case 0:
            let vc =  storyboard?.instantiateViewController(withIdentifier: "login")
            present(vc!, animated: false, completion: nil)
        default:
            break
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
