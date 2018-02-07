//
//  Jeu.swift
//  Demineur
//
//  Created by Fabien Rodet on 30/01/2018.
//  Copyright © 2018 Fabien Rodet. All rights reserved.
//

import Foundation

class Jeu {
    var score = 0
    var nbCasesTouchees = 0
    var nbCoup: Int
    private var nbCases: Int
    
    init()
     {
     self.nbCoup = 3;
     self.score = 0;
     self.nbCases = 4;
     }
    
    /*struct Case {
        var isBonus: Bool = false
    }*/
    
    var isBonus: Bool = false
    
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
        score = 0
        nbCoup = 3
        nbCases = 4
        nbCasesTouchees = 0
        state = .over
    }
    
    func updateScore(with isBonus:Bool) {
        //score+=1
        nbCoup-=1
        nbCasesTouchees+=1
        if isBonus==true {
            score+=2
        } else {
            score-=1 //Malus
        }
    }
    
    //Utile pour plus tard :

    /*func answerCurrentQuestion(with answer: Bool) {
        if (currentQuestion.isCorrect && answer) || (!currentQuestion.isCorrect && !answer) {
            score += 1
        }
        goToNextQuestion()
    }*/
    
    func goToNextCase() { //Nom classe a changer
        if nbCoup < 1 {
            //getIsBonus()
            updateScore(with: isBonus)
            finishGame()
        } else {
            //getIsBonus()
            updateScore(with: isBonus)
        }
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
    
    private func finishGame() {
        
        //state = .over
    }
    /*func getTScore() -> Int
    {
        return score;
    }*/
    /*func getNbCoup() -> Int
    {
        return nbCoup;
    }*/
    
}
