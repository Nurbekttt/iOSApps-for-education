//
//  MenuOption.swift
//  professionalMenu
//
//  Created by Nurbek on 1/22/20.
//  Copyright © 2020 Nurbek. All rights reserved.
//
import UIKit

enum MenuOption: Int, CustomStringConvertible {
    case Profile
    case Posts
    case MyPosts
    case LogOut
    var description: String{
        switch  self {
            case .Profile:
                return "Profile"
            case .Posts:
                return "Posts"
            case .MyPosts:
                return "My Posts"
            case .LogOut:
                return "Log Out"
        }
    }
    var image: UIImage{
        switch  self {
            case .Profile:
                return UIImage(named: "menu") ?? UIImage()
            case .Posts:
                return UIImage(named: "menu") ?? UIImage()
            case .MyPosts:
                return UIImage(named: "menu") ?? UIImage()
            case .LogOut:
                return UIImage(named: "menu") ?? UIImage()
        }
    }
    
}
