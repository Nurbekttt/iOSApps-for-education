//
//  Concentration.swift
//  Concentration
//
//  Created by Nurbek on 6/8/19.
//  Copyright © 2019 Nurbek. All rights reserved.
//

import Foundation

class Concentratoin{
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at Index: Int) {
        if let matchedIndex = indexOfOneAndOnlyFaceUpCard,matchedIndex != Index{
            if(cards[matchedIndex].identifier == cards[Index].identifier){
                cards[matchedIndex].isMachedUp=true
                cards[Index].isMachedUp=true
            }
            cards[Index].isFaceUp=true
            indexOfOneAndOnlyFaceUpCard=nil
            
        }
        else{
            for flipDownIndex in cards.indices{
                cards[flipDownIndex].isFaceUp=false
            }
            cards[Index].isFaceUp=true
            indexOfOneAndOnlyFaceUpCard=Index
        }
    }
    init(numberOfPairs: Int) {
        for _ in 1...numberOfPairs {
            let card = Card()
            cards += [card,card]
        }
        cards.shuffle()
        
    }
    //TODO: ShuffleCard fix it
//    func ShuffleCard(for array:Array<Card>){
//
//        array.shuffle()
//    }
}
