//
//  User.swift
//  SDUHelper
//
//  Created by Nurbek on 12/21/19.
//  Copyright © 2019 Nurbek. All rights reserved.
//

import Foundation

struct User {
    let dbID: String
    let studentID: String
    let fullName: String
    let birthDay: String
    let speciality: String
    let email: String
    let advisor: String
    let linkOfPhoto: String
    let uID: String
    
    init(dbID: String, studentID: String, fullName: String, birthDay: String, speciality: String, email: String, advisor: String, linkOfPhoto: String, uID: String) {
        self.dbID = dbID
        self.studentID = studentID
        self.fullName = fullName
        self.birthDay = birthDay
        self.speciality = speciality
        self.email = email
        self.advisor = advisor
        self.linkOfPhoto = linkOfPhoto
        self.uID = uID
    }
    
}
    
