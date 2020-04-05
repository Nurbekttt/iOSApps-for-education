//
//  DetailOfProblemViewController.swift
//  SDUHelper
//
//  Created by Nurbek on 12/22/19.
//  Copyright © 2019 Nurbek. All rights reserved.
//

import UIKit
import FirebaseDatabase

class DetailOfProblemViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UITextView!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var specialityLabel: UILabel!
    @IBOutlet weak var numberOfLikes: UILabel!
    @IBOutlet weak var numberOfComments: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    var currentTitle: String!
    var currentDescription: String!
    var problemCreatorsInfo: [User]!
    var problemCreatorID: String!
    var urlOfPhoto: String!
    var problemID: String!
    var allLikes: [Likes]!
    var isLiked: Bool = false
    var problem: Problem!
    
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        
        
        
        for i in problemCreatorsInfo{
            if problemCreatorID == i.dbID{
                userLabel.text = i.fullName
                urlOfPhoto = i.linkOfPhoto
                specialityLabel.text = i.speciality
            }
        }
        
        
        let url = URL(string: urlOfPhoto)
        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        userPhoto.image = UIImage(data: data!)
        titleLabel.text = currentTitle
        descriptionLabel.text = currentDescription
        getAllLikes()
//        descriptionLabel.layer.cornerRadius = 5
//        descriptionLabel.layer.borderWidth = 1
//        descriptionLabel.layer.borderColor = UIColor.gray.cgColor
//        
//        likeButton.layer.cornerRadius = 15
//        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func likeTapped(_ sender: Any) {
        if(isLiked){
            
            var content: String = ""
            
            for i in self.allLikes[0].likes.split(separator: ","){
                if ( i != (self.problemCreatorID!)){
                    content += i
                    content += ","
                }
            }
            content = String(content.dropLast())
            let problemInfo = [
                "userID": content
            ]
            
            self.ref.child("likes").child(self.problemID).setValue(problemInfo)
            
            getAllLikes()
        }
        else{
            var content: String = ""
            
            for i in self.allLikes[0].likes.split(separator: ","){
                
                content += i
                content += ","
                
            }
            content += self.problemCreatorID
            
            let problemInfo = [
                "userID": content
            ]
            
            self.ref.child("likes").child(self.problemID).setValue(problemInfo)
            getAllLikes()
        }
    }
    

    func getAllLikes(){
        allLikes = []
        //SVProgressHUD.show()
        self.ref.child("likes").observeSingleEvent(of: .value, with: { snapshot in
            //SVProgressHUD.dismiss()
            
            guard let dict = snapshot.value as? NSDictionary else { return }
            
            for (id, value) in dict {
                
                if (id as? String == self.problemID){
                    print("liked",id)
                    guard let value = value as? NSDictionary,
                        let userIDs = value.value(forKey: "userID") as? String
                        
                         else { return }
                    //print("start",item,"item")
                    
                    self.allLikes.append(Likes(problemID: id as! String, likes: userIDs))
                    
                    
                    self.isLiked = false
                    var sum = 0
                    for i in self.allLikes[0].likes.split(separator: ","){
                        if ( i == (self.problemCreatorID!)){
                            self.isLiked = true
                            print("liked ggg")
                            let image = UIImage(named: "liked")!
                            self.likeButton.setImage(image, for: .normal)
                        }
                        sum+=1
                    }
                    if (!self.isLiked){
                        
                        print("liked ggg")
                        let image = UIImage(named: "unliked")!
                        self.likeButton.setImage(image, for: .normal)
                    }
                    
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = self.dateFormat
                    let date = dateFormatter.string(from: self.problem.date!)
                    self.numberOfLikes.text = String(sum)
                    let problemInfo = [
                        "description": String(self.problem.description!),
                        "title": String(self.problem.title!),
                        "date": String(date),
                        "user": String(self.problem.user!),
                        "comments": "0",
                        "likes": String(sum)
                    ]
                    
                self.ref.child("problems").child("zzz").child(self.problemID).setValue(problemInfo)
                    
                    
                    
                    
                    print(self.allLikes[0].likes,userIDs,"there")
                }

                }
            //self.allProblems.sort { $0.date.compare($1.date) == .orderedDescending }
            //self.filteredTweets = self.allTweets
            //print(self.allProblems,"zzzz")
            
            // ...
            }) { error in
            self.showError(body: error.localizedDescription)
        }
       
    }

}
