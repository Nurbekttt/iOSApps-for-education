//
//  MainPageViewController.swift
//  twitter
//
//  Created by Nurbek on 12/2/19.
//  Copyright © 2019 Nurbek. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class MainPageViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var tweets:[Tweet] = []
    var current_user:User?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tweetCell", for: indexPath)
        return cell
    }
    
    @IBAction func compose(_ sender: UIBarButtonItem) {
        //1. Create the alert controller.
        let alert = UIAlertController(title: "New Tweet", message: "Enter a text", preferredStyle: .alert)
        
        //2. Add the text field. You can configure it however you need.
        alert.addTextField(configurationHandler: { (textField) -> Void in
            textField.text = "What's up?"
        })
        
        //3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "Tweet", style: .default, handler: { [weak alert] (action) -> Void in
            let textField = alert!.textFields![0]
            var tweet = Tweet(textField.text!,(self.current_user?.email)! , "20.02.20 12:00", "demo")
            
            
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { [weak alert] (action) -> Void in
        }))
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        current_user = Auth.auth().currentUser
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
