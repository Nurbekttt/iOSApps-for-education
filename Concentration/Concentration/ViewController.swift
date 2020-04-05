//
//  ViewController.swift
//  Concentration
//
//  Created by Nurbek on 6/1/19.
//  Copyright © 2019 Nurbek. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var FlipLabel: UILabel!

    @IBOutlet var ButtonsArray: [UIButton]!
    
    var Emoji:Array<String>=["🇰🇿","🇷🇺","🇰🇿","🇷🇺"]
    
    lazy var game=Concentratoin(numberOfPairs: (ButtonsArray.count+1)/2)
    
    var flipCount=0{
        didSet{
            FlipLabel.text="Flips: \(flipCount)"
        }
    }
    
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount+=1
        if let n = ButtonsArray.index(of:sender){
            print("\(n) index")
            //flipCard(withEmoji: Emoji[n], on: sender)
            game.chooseCard(at: n)
            updateViewFromModel()
        }
        
    }
    func updateViewFromModel() {
        for index in ButtonsArray.indices{
            let button = ButtonsArray[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for:card), for: UIControl.State.normal)
                button.backgroundColor=#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            else{
                button.setTitle("",for: UIControl.State.normal)
                if(card.isMachedUp){
                    button.isEnabled=false
                }
                button.backgroundColor = card.isMachedUp ? #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
            }
        }
    }
    
    var emojiChoices = ["🇲🇰","🇲🇬","🇹🇷","🇰🇿","🇧🇮","🇫🇮","🇦🇲","🇦🇷","🇧🇪"]
    
    var emoji = Dictionary<Int,String>()
    
    func emoji(for card:Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count>0{
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier]=emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ??  "?"
    }
    
    

}

