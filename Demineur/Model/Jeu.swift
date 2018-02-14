//
//  Jeu.swift
//  Demineur
//
//  Created by Fabien Rodet on 30/01/2018.
//  Copyright © 2018 Fabien Rodet. All rights reserved.
//

import Foundation

class Jeu {
    var nbCasesTouchees = 0
    var nbMine: Int
    var nbCases: Int;
    var gagner: Bool ;
    
    init()
     {
     self.nbCases = 12;
     self.nbMine = 0;
     self.nbCases = 12;
     self.gagner = true;
     }
    
    /*struct Case {
        var isBonus: Bool = false
    }*/
    
    var state: State = .ongoing
    
    enum State {
        case ongoing, over
    }
    
    /*init( nbCoup: Int, nbCase: Int)
    {
        self.nbCoup = nbCoup;
        self.score = 0;
        self.nbCases = nbCase;
    }*/
    
    func refresh() {
        nbCases = 12
        nbCasesTouchees = 0
        state = .over
    }
}
  
    

