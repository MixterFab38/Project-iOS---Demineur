//
//  ViewController.swift
//  Demineur
//
//  Created by Fabien Rodet on 30/01/2018.
//  Copyright © 2018 Fabien Rodet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /***    INITIALISATION DES VARIABLES    ***/
    
    var jeu = Jeu()
   
    
    private var chrono = Timer() // Initialisation d'un chronomètre
    private var time = 0 // secondes
    
    /* Connexion des labels */
    @IBOutlet weak var nbtouchesLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var nbMineLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel! // Indiquera si la partie est Gagné ou Perdu
    
    @IBOutlet weak var newGameButton: UIButton!

    /* Connexion des boutons */
    @IBOutlet var Cases: [CaseView]! // Collection
  
    
    /***    LANCEMENT DE L'APPLICATION   ***/
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame() // On lance une partie tout de suite
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func didtrapNewGameButton() {
        startNewGame() // A chaque pression sur le bouton "Nouvelle partie"
    }
    
    @IBAction func didPressButton(_ sender: CaseView) {
        sender.isEnabled = false
        ButtonPressed(uneCase: sender)
    }

    
    /**********************/
    /***    CLASSES     ***/
    
    private func ButtonPressed(uneCase: CaseView) // fonction permettant de gerer les boutons et les labels dès qu'un bouton est pressé
    {
        if uneCase.isBonus == true {
            uneCase.setStyle(.bonus) // case verte
            jeu.nbCasesTouchees = jeu.nbCasesTouchees + 1; // nb de cases touchées mis à jour
        } else {
            uneCase.setStyle(.malus) // case rouge
            simulClick()
            jeu.gagner = false
            endGame(with: jeu.gagner) // appel de la fonction pour stopper la partie si la case rouge touchée
        }
        // mise à jour des labels :
        nbtouchesLabel.text = "Cases touchées : \(jeu.nbCasesTouchees)"
        nbMineLabel.text = "nombre de mines : \(jeu.nbMine)"
        
        if (jeu.nbCases - jeu.nbCasesTouchees) == jeu.nbMine{
            endGame(with: jeu.gagner) // Jeu gagné si trouvé toutes les cases vertes
        }
    }
    private func simulClick() // appelée pour mettre à jour la case cochée
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
    
    
    private func startNewGame() // (Ré)initialisation de la partie
    {
        jeu.gagner = true;
        jeu.nbMine = 0;
        for uneCase in Cases
        {
            uneCase.style = .standard
            uneCase.isEnabled = true
            let random = arc4random_uniform(2) // Fonction aléatoire entre 0 et 1
            /* Définitions des cases bonus et malus */
            if(jeu.nbMine >= 8)
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
        
        jeu.refresh() // reset des boutons
        
        nbtouchesLabel.text = "Cases touchées : 0"
        nbMineLabel.text = "nombre de mines : \(jeu.nbMine)"
        timerLabel.text = "Temps : 0"+"\""
        resultLabel.text = ""
        
        startTimer() // lance le chronomètre
    }
    
    private func startTimer() // fonction gérant le chronomètre
    {
        chrono.invalidate() // Arrêt du chronomètre (si besoin) pour le ré-initialisser ensuite
        time = 0 // remise à 0
        chrono = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateChrono), userInfo: nil, repeats: true) // Manipulation de l'objet timer qui appelle la fonction updateChrono a chaque 1000ms
    }
    
    @objc func updateChrono() // mise à jour du label temps
    {
        time += 1
        timerLabel.text = "Temps : \(time)\""
    }
    
    func endGame(with gagner: Bool){
        chrono.invalidate() // arrêt du chronomètre
        
        for uneCase in Cases
        {
            uneCase.isEnabled = false // désactive toutes les boutons
        }
        
        if(gagner == true)
        {
            resultLabel.text = "Partie terminée ! Vous avez gagné !"
        }
        else{
            resultLabel.text = "Partie terminée ! Vous avez perdu !"
        }
    }
}



