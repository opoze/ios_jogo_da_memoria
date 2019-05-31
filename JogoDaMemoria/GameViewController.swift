//
//  ViewController.swift
//  JogoDaMemoria
//
//  Created by Luis Alberto Zagonel Pozenato on 25/05/2019.
//  Copyright © 2019 LuisPozenato. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    lazy var game = Game(numberOfPairOfCards: self.buttonsArray.count / 2)
    var cardTextProvider: CardTextProvider!
    var flipCount: Int = 0 {
        // Observable
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }

    @IBOutlet var buttonsArray: [UICard]!
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UICard) {
        if let cardNumber: Int = buttonsArray.firstIndex(of: sender) {
            // Only if card is in back state
            if game.cards[cardNumber].cardState == .back {
                
                self.game.chooseCard(at: cardNumber)
                self.updateViewFromModel()
                self.flipCount += 1
            
                // Wen "wimps" perform segue to winner screen
                if self.game.win {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
                        self.performSegue(withIdentifier: "win-segue", sender: nil)
                    })
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // To set card corner radius
        for btn in buttonsArray {
            btn.layer.cornerRadius = 20
        }
    }
    
    func updateViewFromModel() {
        for index in game.cards.indices {
            let button = self.buttonsArray[index]
            let card = self.game.cards[index]
            let text = self.cardTextProvider.text(for: card.identifier)
            
            if(self.game.win){
                button.show()
                button.toFront(text: text)
            }
            else {
                if card.isFaceUp {
                    if card.isMatched {
                        button.fadeOut()
                    }
                    button.toFront(text: text)
                }
                else {
                    button.toBack(text: "")
                }
            }
        }
    }

}
