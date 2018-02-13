//
//  ViewController.swift
//  Demineur
//
//  Created by Fabien Rodet on 30/01/2018.
//  Copyright © 2018 Fabien Rodet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var jeu = Jeu()
   
    
    private var chrono = Timer()
    private var time = 0 //secondes
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var nbtouchesLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var nbMineLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var newGameButton: UIButton!

    
    @IBOutlet var Cases: [CaseView]!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func didtrapNewGameButton() {
        startNewGame()
    }
    
    @IBAction func didPressButton(_ sender: CaseView) {
        sender.isEnabled = false
        ButtonPressed(uneCase: sender)
    }

    private func ButtonPressed(uneCase: CaseView) {
    
        if uneCase.isBonus == true {
            uneCase.setStyle(.bonus)
        } else {
            uneCase.setStyle(.malus)
            simulClick()
            jeu.gagner = false
            endGame(with: jeu.gagner)
        }

        jeu.updateScore(with: uneCase)
        scoreLabel.text = "Score : \(jeu.score)"
        nbtouchesLabel.text = "Cases touchées : \(jeu.nbCasesTouchees)"
        nbMineLabel.text = "nombre de mines : \(jeu.nbMine)"
        
        if (jeu.nbCases - jeu.nbCasesTouchees) == jeu.nbMine{
            endGame(with: jeu.gagner)
        }
    }
    private func simulClick()
    {
        for uneCase in Cases
        {
            if uneCase.isBonus == true {
                uneCase.setStyle(.bonus)
            } else {
                uneCase.setStyle(.malus)
            }
        }
    }
    
    
    private func startNewGame() {
 
        jeu.nbMine = 0;
        for uneCase in Cases
        {
            uneCase.style = .standard
            uneCase.isEnabled = true
            let random = arc4random_uniform(2)
            if(jeu.nbMine >= 1)
            {
                uneCase.isBonus = true
            }
            else
            {
                if random == 0 {
                
                    uneCase.isBonus = true
                }
                else
                {
                    uneCase.isBonus = false
                    jeu.nbMine = jeu.nbMine + 1 ;
                }
            }
         }
        
        jeu.refresh()
        
        scoreLabel.text = "Score : 0"
        nbtouchesLabel.text = "Cases touchées : 0"
        nbMineLabel.text = "nombre de mines : \(jeu.nbMine)"
        timerLabel.text = "Temps : 0"+"\""
        resultLabel.text = ""
        
        startTimer()
    }
    
    private func startTimer(){
        chrono.invalidate()
        time = 0
        chrono = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateChrono), userInfo: nil, repeats: true)
    }
    
    @objc func updateChrono(){
        time += 1
        timerLabel.text = "Temps : \(time)\""
    }
    
    func endGame(with gagner: Bool){
        chrono.invalidate()
        
        for uneCase in Cases
        {
            uneCase.isEnabled = false
        }
        
        if(gagner == true)
        {
            resultLabel.text = "Partie terminée ! vous avez gagner !"
        }
        else{
            resultLabel.text = "Partie terminée ! vous avez perdu !"
        }
    }
}



