//
//  BoutonController.swift
//  Demineur
//
//  Created by Fabien Rodet on 09/02/2018.
//  Copyright © 2018 Fabien Rodet. All rights reserved.
//
import UIKit

class BoutonView: UIView {
    
    var bouton = Bouton()
    
    func getIsBonus()->Bool {
        let random = arc4random_uniform(2)
        
        if random == 0 {
            bouton.isBonus = true //si = 0 , bonus
        } else {
            bouton.isBonus = false
        }
        
        return isBonus;
    }
}
