//
//  Extensions.swift
//  JogoDaMemoria
//
//  Created by Luis Alberto Zagonel Pozenato on 25/05/2019.
//  Copyright © 2019 LuisPozenato. All rights reserved.
//

import Foundation
import UIKit

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

extension UICard {
    func fadeOut() {
//        self.animator?.startAnimation()
        self.isHidden = true
    }

    func toFront(text txt: String) {
        self.backgroundColor = UIColor(named: "cardFrontColor")
        self.setTitle(txt, for: UIControl.State.normal)
        self.isEnabled = false
    }
    
    func toBack(text txt: String) {
        self.backgroundColor = UIColor(named: "cardBackColor")
        self.setTitle(txt, for: UIControl.State.normal)
        self.isEnabled = true
    }
    
    func show() {
        self.animator?.stopAnimation(false)
        self.animator?.pauseAnimation()

        self.isHidden = false
        self.alpha = 1.0
    }
}
