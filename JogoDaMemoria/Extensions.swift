//
//  Extensions.swift
//  JogoDaMemoria
//
//  Created by Luis Alberto Zagonel Pozenato on 25/05/2019.
//  Copyright © 2019 LuisPozenato. All rights reserved.
//

import Foundation

extension Bool {
    mutating func toggle() {
        self = !self
    }
}

extension Array {
    mutating func removeRandom() -> Element{
        let index = Int.random(in: self.indices)
        return self.remove(at: index)
    }
}
