//
//  ComposeViewController.swift
//  SDUHelper
//
//  Created by Nurbek on 12/21/19.
//  Copyright © 2019 Nurbek. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class ComposeViewController: UIViewController {

    //@IBOutlet weak var section: UITextField!
    @IBOutlet weak var content: UITextView!
    @IBOutlet weak var titleOfProblem: UITextField!
    
    var ref: DatabaseReference!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        // Do any additional setup after loading the view.
        
        

                content.layer.cornerRadius = 5
                content.layer.borderWidth = 1
                content.layer.borderColor = UIColor.gray.cgColor
    }
    @IBAction func sendButtonTapped(_ sender: UIButton) {
        guard let id = Auth.auth().currentUser?.uid,
            //let text = section.text, !text.isEmpty,
            let title = titleOfProblem.text, !title.isEmpty,
            let content = content.text, !content.isEmpty,
            let currentUser = currentUser
            else {
                showError(body: "Please fill out all required fields.")
                return
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        let date = dateFormatter.string(from: Date())
        
        let problemInfo = [
            "description": content,
            "title": title,
            "date": date,
            "user": id,
            "comments": "0",
            "likes": "0"
        ]
        let z = self.ref.child("problems").child("zzz").childByAutoId()
        z.setValue(problemInfo)
        self.ref.child("likes").child(String(z.description().split(separator: "/").last!)).setValue(["userID":""])
        print("autoID",String(z.description()).split(separator: "/").last!)
        self.showSuccess(body: "Tweet has been posted.")
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
