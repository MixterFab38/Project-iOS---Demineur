//
//  Jeu.swift
//  Demineur
//
//  Created by Fabien Rodet on 30/01/2018.
//  Copyright © 2018 Fabien Rodet. All rights reserved.
//

import Foundation

class Jeu {
    
    /*** INITIALISATION DES VARIABLES ***/
    var nbCasesTouchees = 0
    var nbMine: Int // Mines sur le jeu
    var nbCases: Int; // Cases touchées
    var gagner: Bool ;
    
    init()
     {
     self.nbCases = 12;
     self.nbMine = 0;
     self.nbCases = 12;
     self.gagner = true;
     }
    
    var state: State = .ongoing
    
    enum State {
        case ongoing, over
    }
    
    func refresh() {
        nbCases = 12
        nbCasesTouchees = 0
        state = .over
    }
}
  
    

