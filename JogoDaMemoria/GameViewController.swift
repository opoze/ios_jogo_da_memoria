//
//  ViewController.swift
//  JogoDaMemoria
//
//  Created by Luis Alberto Zagonel Pozenato on 25/05/2019.
//  Copyright © 2019 LuisPozenato. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    //@TODO:luis.pozenato: Ao clicar nas cartas. flip count só conta quando necessário
    //@TODO:luis.pozenato: Cartas com cantos arredondados
    //@TODO:luis.pozenato: Constraint Layout
    //@TODO:luis.pozenato: Separar Game de Struct Card em arquivos... DONE
    //@TODO:luis.pozenato: Code rafactory
    
    lazy var game = Game(numberOfPairOfCards: self.buttonsArray.count / 2)
    var cardTextProvider: CardTextProvider!
    var flipCount: Int = 0 {
        // Observable
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }

    @IBOutlet var buttonsArray: [UIButton]!
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber: Int = buttonsArray.firstIndex(of: sender) {
            self.game.chooseCard(at: cardNumber)
            self.updateViewFromModel()
            self.flipCount += 1
        }
    }
    
    func updateViewFromModel() {
        if self.game.win {
            // ao ganhar, muda a cor de fundo
            // e em um segundo redireciona para tela win
            self.view.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
                self.performSegue(withIdentifier: "win-segue", sender: nil)
            })
        }
        for index in game.cards.indices {
            let button = self.buttonsArray[index]
            let card = self.game.cards[index]
            if card.isFaceUp {
                button.backgroundColor = card.isMatched ? .clear : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                button.setTitle(self.cardTextProvider.text(for: card.identifier), for: UIControl.State.normal)
            }
            else {
                button.backgroundColor = #colorLiteral(red: 0.4352941215, green: 0.4431372583, blue: 0.4745098054, alpha: 1)
                button.setTitle("", for: UIControl.State.normal)
            }
        }
    }

}
