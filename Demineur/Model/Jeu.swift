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
    var score = 0
    var nbCasesTouchees = 0
    var nbCoup: Int // Nbr de coups restant
    private var nbCases: Int
    
    init()
     {
     self.nbCoup = 6;
     self.score = 0;
     self.nbCases = 12;
     }
    
    var isBonus: Bool = false
    
    var state: State = .ongoing
    
    enum State {
        case ongoing, over
    }
    
    func reset() // reinitialisation des variables (appelé si on presse sur "Nouvelle partie" par exemple
    {
        score = 0
        nbCoup = 6
        nbCases = 12
        nbCasesTouchees = 0
        state = .over
    }
    
    func updateScore(with isBonus:Bool) // mise à jour du score et des compteurs en fonction de la case touchée (bonus ou malus)
    {
        //score+=1
        nbCoup-=1
        nbCasesTouchees+=1
        if isBonus==true {
            score+=2 // Bonus
        } else {
            score-=1 // Malus
        }
    }
    
    func NextCase() //appelé après chaque pression sur une case
    {
        updateScore(with: isBonus)
    }
    
    func getIsBonus()->Bool // fonction qui permet de récupérer un entier aléatoire entre 0 et 1 et qui retourne le résultat
    {
        let random = arc4random_uniform(2)
        
        if random == 0 {
            isBonus = true // si = 0 , bonus
        } else {
            isBonus = false // si = 1 , malus
        }
        
        return isBonus;
    }
    
}
