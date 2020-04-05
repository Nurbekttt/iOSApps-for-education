//
//  ProblemsViewController.swift
//  SDUHelper
//
//  Created by Nurbek on 12/15/19.
//  Copyright © 2019 Nurbek. All rights reserved.
//

import UIKit
import SVProgressHUD
import FirebaseAuth
import FirebaseDatabase


var currentUser: User?

class ProblemsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var allProblems: [Problem] = []
    var users: [User] = []
    var isDescTime = false
    var isDescLikes = false
    
    
    var ref:DatabaseReference!
    let transiton = SlideInTransition()
    
    
    override func viewDidLoad() {
        
        SVProgressHUD.show()
        super.viewDidLoad()
        
        checkUserSession()
        
        ref = Database.database().reference()
        
        
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        getAllProblems()
        getAllUsers()
        print(self.allProblems,"zzzz")
        
        
        tableView.estimatedRowHeight = 90.0 // Adjust Primary table height
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    @IBAction func didMenuPressed(_ sender: Any) {
        guard let menuViewController = storyboard?.instantiateViewController(withIdentifier: "menuTableViewController") else {return}
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
        present(menuViewController, animated: true)
    
    }
    
    @IBAction func sortingByTime(_ sender: Any) {
        if (isDescTime){
            isDescTime = false
            self.allProblems.sort { $0.date! .compare($1.date!) == .orderedAscending }
        } else{
            isDescTime = true
            self.allProblems.sort { $0.date! .compare($1.date!) == .orderedDescending }
        }
        self.tableView.reloadData()
    }
    @IBAction func sortingByLikes(_ sender: Any) {
        if (isDescLikes){
            isDescLikes = false
            self.allProblems.sort { $0.likes! .compare($1.likes!) == .orderedAscending }
        } else{
            isDescLikes = true
            self.allProblems.sort { $0.likes! .compare($1.likes!) == .orderedDescending }
        }
        self.tableView.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "detail"){
            let index = (tableView.indexPathForSelectedRow?.row)!
            print(self.allProblems)
            let vc = segue.destination as! DetailOfProblemViewController
            vc.currentTitle = self.allProblems[index].title
            vc.currentDescription = self.allProblems[index].description
            vc.problemCreatorsInfo = users
            vc.problemCreatorID = self.allProblems[index].user
            vc.problemID = self.allProblems[index].problemID
            vc.problem = self.allProblems[index]
        }
    }
    
    func getAllUsers(){
        
        self.ref.child("users").observeSingleEvent(of: .value, with: { snapshot in
            //SVProgressHUD.dismiss()
            
            guard let dict = snapshot.value as? NSDictionary else { return }
            
            for (id, value) in dict {
                guard let value = value as? NSDictionary ,
                    let advisor = value.value(forKey: "advisor") as? String,
                    let birthDay = value.value(forKey: "birthDay") as? String,
                    let email = value.value(forKey: "email") as? String,
                    let fullName = value.value(forKey: "fullName") as? String,
                    let speciality = value.value(forKey: "speciality") as? String,
                    let studentID = value.value(forKey: "studentID") as? String,
                    let linkOfPhoto = value.value(forKey: "linkOfPhoto") as? String
                else { return }
                
                self.users.append(User(dbID: id as! String, studentID: studentID, fullName: fullName, birthDay: birthDay, speciality: speciality, email: email, advisor: advisor, linkOfPhoto: linkOfPhoto, uID: (id as? String)!))
                
            }
            
            // ...
        }) { error in
            self.showError(body: error.localizedDescription)
        }
        print(self.users,"in getter")
    }
    
    
    func getAllProblems() {
        self.allProblems = []
        //SVProgressHUD.show()
        self.ref.child("problems").observeSingleEvent(of: .value, with: { snapshot in
            SVProgressHUD.dismiss()
            
            guard let dict = snapshot.value as? NSDictionary else { return }
            
            for (_, value) in dict {
                guard let value = value as? NSDictionary else { return }
                for (id, item) in value {
                    guard let item = item as? NSDictionary,
                        let title = item.value(forKey: "title") as? String,
                        let description = item.value(forKey: "description") as? String,
                        let user = item.value(forKey: "user") as? String,
                        let date = item.value(forKey: "date") as? String,
                        let likes = item.value(forKey: "likes") as? String
                         else { return }
                    //print("start",item,"item")
                    
                    let formatterGet = DateFormatter()
                    formatterGet.dateFormat = "dd.MM.yyyy HH:mm:ss"
                    if let date = formatterGet.date(from: date){
                        let p = Problem(title: title, description: description, likes: likes, comments: "0", solved: "0", date: date, user: user, problemID: id as! String)
                        self.allProblems.append(p)
                    }
                    
                        
                }
            }
            //self.allProblems.sort { $0.date.compare($1.date) == .orderedDescending }
            //self.filteredTweets = self.allTweets
            //print(self.allProblems,"zzzz")
            self.tableView.reloadData()
            // ...
        }) { error in
            self.showError(body: error.localizedDescription)
        }
    }
    
    
    private func checkUserSession() {
        
//        let firebaseAuth = Auth.auth()
//        do {
//          try firebaseAuth.signOut()
//        } catch let signOutError as NSError {
//          print ("Error signing out: %@", signOutError)
//        }

        
        
        Auth.auth().addStateDidChangeListener { auth, user in
            guard let user = user else {
                // No user is signed in.
                
                self.presentLoginVC(animated: false)
                
                return
            }
            // User is signed in.
            
            let userID = user.uid
            self.ref.child("users").child(userID).observeSingleEvent(
                of: .value,
                with: { snapshot in
                    // Get user value
                    let value = snapshot.value as? NSDictionary
                    
                    guard let studentID = value?["studentID"] as? String,
                        let fullName = value?["fullName"] as? String,
                        let birthDay = value?["birthDay"] as? String,
                        let speciality = value?["speciality"] as? String,
                        let email = value?["email"] as? String,
                        let advisor = value?["advisor"] as? String,
                        let linkOfPhoto = value?["linkOfPhoto"] as? String else {
                            return
                    }
                   //print(email)
                    let user = User(
                        dbID: user.uid,
                        studentID: studentID,
                        fullName: fullName,
                        birthDay: birthDay,
                        speciality: speciality,
                        email: email,
                        advisor: advisor,
                        linkOfPhoto: linkOfPhoto,
                        uID: userID
                    );
                    currentUser = user
                    // ...
            }) { error in
                self.showError(body: error.localizedDescription)
            }
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

extension ProblemsViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if(transiton.isPresenting){
            transiton.isPresenting = false
        }
        else{
            transiton.isPresenting = true
        }
        return transiton
    }
    
    
}
extension ProblemsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
extension ProblemsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return allProblems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell( withIdentifier: "cell", for: indexPath) as? problemTableViewCell else { return UITableViewCell() }
        let model = allProblems[indexPath.row]
        print(model,"nurba")
        cell.configureCell(with: model)
        return cell
    }
}
