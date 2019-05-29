//
//  WinViewController.swift
//  JogoDaMemoria
//
//  Created by Luis Alberto Zagonel Pozenato on 29/05/2019.
//  Copyright © 2019 LuisPozenato. All rights reserved.
//

import UIKit

class WinViewController: UIViewController {
    
    @IBAction func restartGame(_ sender: Any) {
        // Ao usar popToRoute nao eh necessario acessar a instancia de game, porque
        // o mesmo eh destriuido e instanciado novamente pelo navador
        // Do contrario Game teria que ser um singleton para poder set acessado
        // De mais de um ViewController
        self.navigationController?.popToRootViewController(animated: true)
    }

}
