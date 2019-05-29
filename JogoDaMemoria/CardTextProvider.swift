//
//  CardTextProvider.swift
//  JogoDaMemoria
//
//  Created by Luis Alberto Zagonel Pozenato on 29/05/2019.
//  Copyright © 2019 LuisPozenato. All rights reserved.
//

import Foundation

// Protocolo é o que é a inteface de outras linguagens
// AnyObject indica que este protocolo só pode ser implementado por classes
// Não exigindo mutating na assinatura e implementação de func text
protocol CardTextProvider: AnyObject {
    func text(for identifier: Int) -> String
    var emojis: [Int: String] { get set }
    var emojisOptions: [String] { get set }
}

// Extension no protocolo para ter implementacao default
extension CardTextProvider {
    func text(for identifier: Int) -> String {
        // se o emoji ja existir no dicionario
        if let emoji = emojis[identifier] {
            return emoji
        }
        // use extensions
        let emoji = emojisOptions.removeRandom()
        emojis[identifier] = emoji
        return emoji
    }
}

class CuteAnimalEmojiProvider : CardTextProvider {
    var emojis = [Int : String]()
    var emojisOptions: Array<String> = ["🐱", "🐧", "🕷", "🐢", "🦂", "🐏", "🐉", "🌚", "🍜", "🥓", "🍓", "🚣‍♀️"]
}


class SimbolEmojiProvider : CardTextProvider {
    var emojis = [Int : String]()
    var emojisOptions: Array<String> = ["¬", "≠", "æ", "º", "•", "¡", "™", "£", "©", "∞", "ß", "…"]
}
