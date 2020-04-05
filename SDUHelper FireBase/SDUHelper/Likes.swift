//
//  Likes.swift
//  SDUHelper
//
//  Created by Nurbek on 12/23/19.
//  Copyright © 2019 Nurbek. All rights reserved.
//

import Foundation

struct Likes {
    let problemID: String
    let likes: String
    
    init(problemID: String, likes: String) {
        self.problemID = problemID
        self.likes = likes
    }

}
