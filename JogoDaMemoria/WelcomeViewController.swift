//
//  WelcomeViewController.swift
//  JogoDaMemoria
//
//  Created by Luis Alberto Zagonel Pozenato on 29/05/2019.
//  Copyright © 2019 LuisPozenato. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private let gameSegue = "show-game"
    
    var cardTextProvider: CardTextProvider?
    
    @IBAction func touchEmojis(_ sender: Any){
        self.cardTextProvider = CuteAnimalEmojiProvider()
        self.performSegue(withIdentifier: gameSegue, sender: nil)
        
    }
    @IBAction func touchSymbols(_ sender: Any){
        self.cardTextProvider = SimbolEmojiProvider()
        self.performSegue(withIdentifier: gameSegue, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? GameViewController {
            destination.cardTextProvider = self.cardTextProvider
        }
    }
}
