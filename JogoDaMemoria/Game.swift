//
//  Game.swift
//  JogoDaMemoria
//
//  Created by Luis Alberto Zagonel Pozenato on 25/05/2019.
//  Copyright © 2019 LuisPozenato. All rights reserved.
//

import Foundation

class Game {
    
    var cards: [Card] = []
    var indexOfSelectedCard: Int?
    var countMatches: Int = 0
    var pairCount: Int = 0
    var win: Bool = false
    
    init(numberOfPairOfCards: Int){
        self.pairCount = numberOfPairOfCards
        // struct passa por valor, classe por referencia
        for index in 0..<numberOfPairOfCards {
            let card = Card(identifier: index)
            self.cards += [card, card]
        }
        self.cards.shuffle()
    }
    
    func chooseCard(at index: Int){
        if cards.indices.contains(index), !cards[index].isMatched {
            if let matachedIndex = self.indexOfSelectedCard, index != matachedIndex {
                if cards[matachedIndex].identifier == cards[index].identifier {
                    cards[matachedIndex].isMatched = true
                    countMatches += 1
                    cards[index].isMatched = true
                    if self.countMatches == self.pairCount {
                        self.win = true
                    }
                }
                cards[index].isFaceUp = true
                self.indexOfSelectedCard = nil
            }
            else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = cards[flipDownIndex].isMatched
                }
                cards[index].isFaceUp = true
                self.indexOfSelectedCard = index
            }
        }
    }
    
    func restart(){
        self.indexOfSelectedCard = nil
        self.countMatches = 0
        self.pairCount = 0
        self.win = false
    }
}

struct Card {
    var identifier: Int
    var isFaceUp: Bool = false
    var isMatched: Bool = false
    
    // Variavel computada
    var cardState: CardState {
        if isMatched {
            return .matched
        }
        else if isFaceUp {
            return .front
        }
        else {
            return .back
        }
    }
    
    init(identifier: Int){
        self.identifier = identifier
    }
}

enum CardState {
    case back
    case front
    case matched
}
