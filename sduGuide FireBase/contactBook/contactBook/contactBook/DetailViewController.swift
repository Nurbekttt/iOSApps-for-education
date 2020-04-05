//
//  DetailViewController.swift
//  contactBook
//
//  Created by Nurbek on 9/24/19.
//  Copyright © 2019 Nurbek. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var ImageView: UIImageView!
    
    @IBOutlet weak var PhoneLabel: UILabel!
    
    var nameSurname:String!
    var phoneNumber:String!
    var image:UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NameLabel.text = nameSurname
        ImageView.image = image
        PhoneLabel.text = phoneNumber
        // Do any additional setup after loading the view.
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
