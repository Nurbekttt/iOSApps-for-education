//
//  Card.swift
//  Concentration
//
//  Created by Nurbek on 6/8/19.
//  Copyright © 2019 Nurbek. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMachedUp = false
    var identifier: Int
    
    static var identifierFactory=0
    static func getUniqueIdentifier()-> Int{
        identifierFactory+=1
        return identifierFactory
    }
    init() {
        self.identifier=Card.getUniqueIdentifier()
    }
}
