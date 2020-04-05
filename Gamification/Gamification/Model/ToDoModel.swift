//
//  toDoModel.swift
//  Gamification
//
//  Created by Nurbek on 3/13/20.
//  Copyright © 2020 Nurbek. All rights reserved.
//

import Foundation

struct ToDoModel {
    var toDo: String?
    var isDone: Bool?
    var hasLink: Bool?
    var link: String?
    init(toDo: String, isDone: Bool, hasLink: Bool, link: String) {
        self.toDo = toDo
        self.isDone = isDone
        self.hasLink = hasLink
        self.link = link
    }
}
