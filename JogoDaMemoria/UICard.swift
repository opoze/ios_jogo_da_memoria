//
//  UICard.swift
//  JogoDaMemoria
//
//  Created by Luis Alberto Zagonel Pozenato on 30/05/2019.
//  Copyright © 2019 LuisPozenato. All rights reserved.
//

import UIKit

class UICard: UIButton {
    var animator: UIViewPropertyAnimator? = nil
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.animator = UIViewPropertyAnimator(duration: 0.5, curve: .easeOut){
            self.alpha = 0.0
        }
    }
}
