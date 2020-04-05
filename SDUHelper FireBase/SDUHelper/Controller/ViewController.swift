//
//  ViewController.swift
//  SDUHelper
//
//  Created by Nurbek on 11/9/19.
//  Copyright © 2019 Nurbek. All rights reserved.
//

import UIKit
import SwiftSoup
import Alamofire
import FirebaseAuth
import FirebaseDatabase

class ViewController: UIViewController {
    var resp:String!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    var ref: DatabaseReference!
    var linkPhoto: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentControl.layer.cornerRadius=5
        //segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
        backView.layer.cornerRadius = 25
            
        loginButton.layer.cornerRadius = 8
            
        ref = Database.database().reference()
            
            
            // Do any additional setup after loading the view.
        }
    
    
    
    @IBAction func SegmentController(_ sender: UISegmentedControl) {
        switch segmentControl.selectedSegmentIndex {
        case 1:
            let vc =  storyboard?.instantiateViewController(withIdentifier: "registration")
            present(vc!, animated: false, completion: nil)
        default:
            break
        }
    }
    
    
    @IBAction func LogIn(_ sender: UIButton) {
        let email = loginInput.text!
        let password = passwordInput.text!
        print(email,password,"nrorigin")
        let myParameters = [
            "username": email,
            "password": password,
            "LogIn": " Log in "
        ]
        
        Alamofire.request("https://my.sdu.edu.kz/loginAuth.php", method: .post, parameters: myParameters).responseString { (response) in
            if response.result.isSuccess {
                self.resp = response.description
                print(response)
                
                
                let doc: Document = try! SwiftSoup.parse(response.description)
                let linkPhotos: Elements = try! (doc.select("img"))
                for i in linkPhotos{
                    if (try! i.attr("src")).contains("stud_photo.php?ses"){
                        self.linkPhoto = "https://my.sdu.edu.kz/" + (try! i.attr("src"))
                    }
                }
                let infs: Elements =  try! doc.getElementsByClass("clsTd")
                var z=0
                var userData = [String]()
                for i in infs{
                    if z%2==1 && z < 22{
                        print(try! i.text())
                        userData.append(try! i.text())
                    }
                    z=z+1
                }
                if(z>1){
                    print("Success")
                    Auth.auth().signIn(withEmail: email+"@stu.sdu.edu.kz", password: password) { result, error in
                        guard let error = error else {
                            //self.showSuccess(body: "Success")
                            return
                        }
                        self.showError(body: error.localizedDescription)
                        Auth.auth().createUser(
                            withEmail: email+"@stu.sdu.edu.kz",
                            password: password
                        ) { result, error in
                            if let error = error {
                                self.showError(body: error.localizedDescription)
                            } else {
                                guard let id = result?.user.uid else { return }
                                let userInfo = [
                                    "studentID": userData[0],
                                    "fullName": userData[1],
                                    "birthDay": userData[3],
                                    "speciality": userData[4],
                                    "advisor": userData[5],
                                    "email": userData[10],
                                    "linkOfPhoto": self.linkPhoto
                                ]
                                self.ref.child("users").child(id).setValue(userInfo)
                                self.showSuccess(body: "User account created successfully.", shouldPopViewController: false)
                            }
                        }
                    }
                    self.dismiss(animated: true)
                }
                else{
                    print("errorOccured2")
                }
                
                
            }
            else {
                print("errorOccured1")
            }
            
        }
        
    }
    
    
    

}

