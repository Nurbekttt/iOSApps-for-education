//
//  MyPostsViewController.swift
//  SDUHelper
//
//  Created by Nurbek on 12/23/19.
//  Copyright © 2019 Nurbek. All rights reserved.
//

import UIKit
import FirebaseDatabase

class MyPostsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var allMyPosts:[Problem]!
    var ref:DatabaseReference!
    let transiton = SlideInTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        getAllPosts()
        // Do any additional setup after loading the view.
    }
    @IBAction func didMenuPressed(_ sender: Any) {
        guard let menuViewController = storyboard?.instantiateViewController(withIdentifier: "menuTableViewController") else {return}
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
        present(menuViewController, animated: true)
    
    }
    func getAllPosts() {
        self.allMyPosts = []
        //SVProgressHUD.show()
        self.ref.child("problems").observeSingleEvent(of: .value, with: { snapshot in
            //SVProgressHUD.dismiss()
            
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
                    if (user == currentUser?.uID){
                        let formatterGet = DateFormatter()
                        formatterGet.dateFormat = "dd.MM.yyyy HH:mm:ss"
                        if let date = formatterGet.date(from: date){
                            let p = Problem(title: title, description: description, likes: likes, comments: "0", solved: "0", date: date, user: user, problemID: id as! String)
                            self.allMyPosts.append(p)
                        }
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


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension MyPostsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
extension MyPostsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return allMyPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell( withIdentifier: "cell", for: indexPath) as? problemTableViewCell else { return UITableViewCell() }
        let model = allMyPosts[indexPath.row]
        print(model,"nurba")
        cell.configureCell(with: model)
        return cell
    }
}
extension MyPostsViewController: UIViewControllerTransitioningDelegate {
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
