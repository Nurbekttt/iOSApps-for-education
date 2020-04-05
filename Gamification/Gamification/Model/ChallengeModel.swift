//
//  ChallengeModel.swift
//  Gamification
//
//  Created by Nurbek on 3/27/20.
//  Copyright © 2020 Nurbek. All rights reserved.
//

import Foundation

struct ChallengeModel {
    var name: String?
    var state: String?
    var ratingForStars: String?
    var rating: String?
    var price: String?
    
    init(name: String, state: String, ratingForStars: String, rating: String, price: String) {
        self.name = name
        self.state = state
        self.ratingForStars = ratingForStars
        self.rating = rating
        self.price = price
    }
}
