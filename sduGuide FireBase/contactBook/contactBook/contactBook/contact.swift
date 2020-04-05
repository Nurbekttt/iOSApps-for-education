//
//  contact.swift
//  contactBook
//
//  Created by Nurbek on 9/23/19.
//  Copyright © 2019 Nurbek. All rights reserved.
//

import Foundation
import UIKit
class Contact{
    var name:String?
    var surname:String?
    var phoneNumber:String?
    var image:UIImage?
    init(_ name:String, _ surname:String, _ phoneNumber:String, _ image : UIImage ) {
        self.name = name
        self.surname = surname
        self.phoneNumber = phoneNumber
        self.image = image
        
    }
}
