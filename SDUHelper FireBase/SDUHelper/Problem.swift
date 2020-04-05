//
//  Problem.swift
//  SDUHelper
//
//  Created by Nurbek on 12/16/19.
//  Copyright © 2019 Nurbek. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct Problem{
    var title: String?
    var description: String?
    var likes: String?
    var comments: String?
    var solved: String?
    var date: Date?
    var user: String?
    var problemID: String?
    var dict: [String: String] {
        return [
            "title": title!,
            "description": description!,
            "likes": likes!,
            "comments": comments!,
            "solved": solved!,
            "user": user!
            
        ]
    }
    init(title: String, description: String, likes: String, comments: String, solved: String, date: Date, user: String, problemID:String) {
        self.title = title
        self.description = description
        self.likes = likes
        self.comments = comments
        self.solved = solved
        self.date = date
        self.user = user
        self.problemID = problemID
    }
    
    init(snapshot: DataSnapshot) {
        if let value = snapshot.value as? [String: String]{
            title = value["title"]
            description = value["description"]
            likes = value["likes"]
            comments = value["comments"]
            solved = value["solved"]
            user = value["user"]
        }
    }

}
