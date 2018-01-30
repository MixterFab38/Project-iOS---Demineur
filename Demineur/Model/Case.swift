//
//  Case.swift
//  Demineur
//
//  Created by Fabien Rodet on 30/01/2018.
//  Copyright © 2018 Fabien Rodet. All rights reserved.
//

import Foundation

class Case {
    var type: Bool
    var numero: Int = 0
    
    init( numero: Int, type: Bool)
    {
        self.type = type;
        self.numero = numero;
    }
    func getTNumero() -> Int
    {
        return numero;
    }
    func getType() -> Bool
    {
        return type;
    }
    func AttribueType(unType: Bool)
   {
    self.type = unType
   }
    
}
