//
//  RegistrationViewController.swift
//  twitter
//
//  Created by Nurbek on 12/2/19.
//  Copyright © 2019 Nurbek. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class RegistrationViewController: UIViewController {
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var repeatPassField: UITextField!
    
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
    
    @IBAction func registrate(_ sender: UIButton) {
        
        let email = emailField.text!
        let password = passwordField.text!
        
        if  email != "" && password != "" && repeatPassField.text == password {
            Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
                
                Auth.auth().currentUser?.sendEmailVerification(completion: nil)
                if error == nil{
                    self?.showMessage(title: "Success", message: "Please verify your email!")
                }
                else{
                    self?.showMessage(title: "Error", message: "Some problem occured")
                }
            }
        }
     }
    func showMessage(title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default)
        { (UIAlertAction) in
            if title != "Error"{
                self.dismiss(animated: true, completion: nil)
            }
            
        }
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
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
