//
//  Malus.swift
//  Demineur
//
//  Created by Fabien Rodet on 30/01/2018.
//  Copyright © 2018 Fabien Rodet. All rights reserved.
//

import Foundation
class Jeu {
    var score: Int
    var nbCoup: Int
    var nbCases: Int
    
    init( nbCoup: Int, nbCase: Int)
    {
        self.nbCoup = nbCoup;
        self.score = 0;
        self.nbCases = 12;
    }
    func getTScore() -> Int
    {
        return score;
    }
    func getNbCoup() -> Int
    {
        return nbCoup;
    }
    
}
