//
//  ViewController.swift
//  JogoDaMemoria
//
//  Created by Luis Alberto Zagonel Pozenato on 25/05/2019.
//  Copyright © 2019 LuisPozenato. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Game(numberOfPairOfCards: buttonsArray.count / 2)
    
    @IBOutlet weak var restart: UIButton!
    
    var flipCount: Int = 0 {
        // Observable
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    var emojisOptions: Array<String> = ["🐱", "🐧", "🕷", "🐢", "🦂", "🐏", "🐉", "🌚", "🍜", "🥓", "🍓", "🚣‍♀️"]

    @IBOutlet var buttonsArray: [UIButton]!
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber: Int = buttonsArray.firstIndex(of: sender) {
            self.game.chooseCard(at: cardNumber)
            self.updateViewFromModel()
            self.flipCount += 1
        }
    }
    
    @IBAction func restartGame(_ sender: Any) {
    }
    
    func updateViewFromModel() {
        if self.game.win {
            self.view.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
            restart.isHidden = false
            restart.isEnabled = true
        }
        for index in game.cards.indices {
            let button = self.buttonsArray[index]
            let card = self.game.cards[index]
            
//            switch card.cardState {
//                case .front {
//                    button.backgroundColor = card.isMatched ? .clear : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//                    button.setTitle(emoji(for: card), for: UIControl.State.normal)
//                }
//                default {
//                    button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
//                    button.setTitle("", for: UIControl.State.normal)
//                }
//            }
            
//            if card.cardState == .front {
            
            
            if card.isFaceUp {
                button.backgroundColor = card.isMatched ? .clear : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
            }
            else {
                button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
                button.setTitle("", for: UIControl.State.normal)
            }
        }
    }
    
    // Dictionary
    var emojis: [Int: String] = [:]
    
    func emoji(for card: Card) -> String {
        // se o emoji ja existir no dicionario
        if let emoji = emojis[card.identifier] {
            return emoji
        }
        
        // use extensions
        let emoji = emojisOptions.removeRandom()
        emojis[card.identifier] = emoji
        return emoji
        
    }

}

