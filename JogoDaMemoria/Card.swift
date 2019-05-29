//
//  Card.swift
//  JogoDaMemoria
//
//  Created by Luis Alberto Zagonel Pozenato on 29/05/2019.
//  Copyright © 2019 LuisPozenato. All rights reserved.
//

import Foundation

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
