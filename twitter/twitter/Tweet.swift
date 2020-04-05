//
//  Tweet.swift
//  twitter
//
//  Created by Nurbek on 12/2/19.
//  Copyright © 2019 Nurbek. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

struct Tweet {
    var content: String?
    var author: String?
    var time: String?
    var tag: String?
    var dict: [String: String] {
        return [
            "content": content!,
            "author": author!,
            "time": time!,
            "tag": tag!
        ]
    }
    
    init(_ content:String, _ author:String, _ time:String, _ tag:String) {
        self.content = content
        self.author = author
        self.time = time
        self.tag = tag
    }
    init(snapshot: DataSnapshot) {
        if let value = snapshot.value as? [String: String]{
            content = value["content"]
            author = value["author"]
            time = value["time"]
            tag = value["tag"]
        }
    }
}
