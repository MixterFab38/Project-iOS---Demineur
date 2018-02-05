//
//  Malus.swift
//  Demineur
//
//  Created by Fabien Rodet on 30/01/2018.
//  Copyright © 2018 Fabien Rodet. All rights reserved.
//

import Foundation
class Jeu {
    var score = 0
    private var nbCoup: Int
    private var nbCases: Int
    
    var state: State = .ongoing
    
    enum State {
        case ongoing, over
    }
    
    func refresh() {
        score = 0
        nbCoup = 2
        nbCases = 4
        state = .over
    }
    
    //Utile pour plus tard :

    /*func answerCurrentQuestion(with answer: Bool) {
        if (currentQuestion.isCorrect && answer) || (!currentQuestion.isCorrect && !answer) {
            score += 1
        }
        goToNextQuestion()
    }*/
    
    private func goToNextCase() { //Nom classe a changer
        if nbCases < nbCoup {
            finishGame()
        }
    }
    
    private func finishGame() {
        state = .over
    }
    
    init( nbCoup: Int, nbCase: Int)
    {
        self.nbCoup = nbCoup;
        self.score = 0;
        self.nbCases = 4;
    }
    func getTScore() -> Int
    {
        return score;
    }
    /*func getNbCoup() -> Int
    {
        return nbCoup;
    }*/
    
}
