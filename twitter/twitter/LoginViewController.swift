//  LoginViewController.swift
//  twitter
//
//  Created by Nurbek on 12/2/19.
//  Copyright © 2019 Nurbek. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {
    
    var currentUser: User!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func SegmentController(_ sender: UISegmentedControl) {
        switch segmentControl.selectedSegmentIndex {
        case 1:
            let vc =  storyboard?.instantiateViewController(withIdentifier: "registration")
            present(vc!, animated: false, completion: nil)
        default:
            break
        }
    }
    @IBAction func logIn(_ sender: UIButton) {
        activityIndicator.startAnimating()
        let email = emailField.text!
        let password = passwordField.text!
        if email != "" && password != ""{
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                self?.activityIndicator.stopAnimating()
                if error != nil{
                    if Auth.auth().currentUser!.isEmailVerified {
                        self?.gotoMainPage()
                    }
                    else{
                        self?.showMessage(title: "Warning", message: "Your email is not verified")
                    }
                }
                else{
                    self?.showMessage(title: "Error", message: "email or password is incorrect")
                }
                // ...
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (segmentControl != nil){
            segmentControl.selectedSegmentIndex=0
        }
        currentUser = Auth.auth().currentUser
        
        if currentUser.isEmailVerified {
            //gotoMainPage()
        }
        
    }
    
    func gotoMainPage(){
        
        if let mainPage = storyboard!.instantiateViewController(withIdentifier: "MainPageViewController") as? MainPageViewController{
            mainPage.modalPresentationStyle = .fullScreen
            
            present(mainPage, animated: true, completion: nil)
        }
    }
    
    
    func showMessage(title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default)
        { (UIAlertAction) in
            
            
        }
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
    

}
