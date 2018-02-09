//
//  Bouton.swift
//  Demineur
//
//  Created by Fabien Rodet on 30/01/2018.
//  Copyright © 2018 Fabien Rodet. All rights reserved.
//

import Foundation
import UIKit

class Bouton{

    var num : Int
    var isBonus: Bool
    var color: UIColor
    
    init( unNumero: Int, unType: Bool)
    {
        self.isBonus = unType;
        self.num = unNumero;
        self.color = UIColor.gray;
        
    }
    func getIsBonus()->Bool {
        let random = arc4random_uniform(2)
        
        if random == 0 {
            isBonus = true //si = 0 , bonus
        } else {
            isBonus = false
        }
        
        return isBonus;
    }
}
