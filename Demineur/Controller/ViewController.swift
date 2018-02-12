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
    
    var jeu = Jeu()     //Instanciation de la classe Jeu
    //var jeu = Jeu(nbCoup: 2 ,  nbCase: 4)
    
    private var chrono = Timer() //Initialisation d'un chronomètre
    private var time = 0 //secondes
    
    /* Connexion des labels */
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var nbtouchesLabel: UILabel!
    @IBOutlet weak var nbRest: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var resultLabel: UILabel! // Indiquera si la partie est Gagné ou Perdu
    
    
    /* Connexion des boutons */
    @IBOutlet weak var newGameButton: UIButton!
    
    /*@IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!*/
    
    @IBOutlet var buttons: [UIButton]! //Collection des boutons
    
    
    
    /***    LANCEMENT DE L'APPLICATION   ***/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        startNewGame() // On lance une partie tout de suite
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didtrapNewGameButton() {
        startNewGame() // A chaque pression sur le bouton "Nouvelle partie"
    }
    
    
    /***    CLASSES     ***/
    
    @IBAction func didPressButton(_ sender: UIButton) {
        sender.isEnabled = false // On désactive le bouton dès l'instant qu'il est pressé par l'utilisateur
        ButtonPressed(unNom: sender) // Appel de la fonction Button Pressed
    }
    /* @IBAction func didPressButton1() {
        //PressButton1()
        //button1.backgroundColor = UIColor.blue
        button1.isEnabled = false
        //self.
        ButtonPressed(unNom: self.button1)
    }
    @IBAction func didPressButton2() {
        //PressButton2()
        //button2.backgroundColor = UIColor.green
        button2.isEnabled = false
        ButtonPressed(unNom: self.button2)
    }
    @IBAction func didPressButton3() {
        //PressButton3()
        //button3.backgroundColor = UIColor.yellow
        button3.isEnabled = false
        ButtonPressed(unNom: self.button3)
    }
    @IBAction func didPressButton4() {
        //PressButton4()
        //button4.backgroundColor = UIColor.red
        button4.isEnabled = false
        ButtonPressed(unNom: self.button4)
    }
    
    private func PressButton1() {
        
    }
    private func PressButton2() {
        
    }
    private func PressButton3() {
        
    }
    private func PressButton4() {
        
    }*/
    
    private func ButtonPressed(unNom: UIButton) // fonction permettant de gerer les boutons et les labels dès qu'un bouton est pressé
    {
        jeu.getIsBonus()
        if jeu.isBonus == true // si la case est un bonus
        {
            unNom.backgroundColor = UIColor.green // la case deviendra vert
        } else {
            unNom.backgroundColor = UIColor.red // sinon, elle deviendra rouge (malus)
            //simulClick()

            /*for UIButton in buttons
            {
                didPressButton(UIButton)
            }*/
            
            endGame() // appel de la fonction pour stopper la partie si la case rouge touchée
        }
        
        jeu.NextCase() // appel de la fonction pour mettre a jour le score et checker s'il reste des coups possibles
        
        /* Mise à jour des labels Score, Nbr de cases touchées, et le nbr de coups restants : */
        scoreLabel.text = "Score : \(jeu.score)"
        nbtouchesLabel.text = "Cases touchées : \(jeu.nbCasesTouchees)"
        nbRest.text = "Coups restants : \(jeu.nbCoup)"
        
        if jeu.nbCoup < 1 { // si il ne reste plus de coup
            endGame() // appel de la fonction permettant de stopper le jeu
        }
    }
    
    /*private func simulClick()
    {
        for bouton in buttons
        {
            if jeu.getIsBonus() == true {
                bouton.backgroundColor = UIColor.green
            } else {
                bouton.backgroundColor = UIColor.red
            }
        }
    }*/
    
    private func startNewGame() // lancement d'une nouvelle partie
    {
        /*button1.backgroundColor = UIColor.gray
        button2.backgroundColor = UIColor.gray
        button3.backgroundColor = UIColor.gray
        button4.backgroundColor = UIColor.gray
        
        button1.isEnabled = true
        button2.isEnabled = true
        button3.isEnabled = true
        button4.isEnabled = true*/
        
        /* RESET DES BOUTONS activables et en gris */
        for bouton in buttons
        {
            bouton.backgroundColor = UIColor.gray
            bouton.isEnabled = true
        }
        
        jeu.reset() //reset des boutons
        
        /* Remise à zero des labels : */
        scoreLabel.text = "Score : 0"
        nbtouchesLabel.text = "Cases touchées : 0"
        nbRest.text = "Coups restants : \(jeu.nbCoup)"
        timerLabel.text = "Temps : 0"+"\""
        resultLabel.text = ""
        
        startTimer() // lance le chronomètre
    }
    
    private func startTimer() // fonction gérant le chronomètre
    {
        chrono.invalidate() // Arrêt du chronomètre (si besoin) pour le ré-initialisser ensuite
        time = 0 //remise à 0
        chrono = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateChrono), userInfo: nil, repeats: true) // Manipulation de l'objet timer qui appelle la fonction updateChrono a chaque 1000ms
    }
    
    @objc func updateChrono() // met à jour le chrono
    {
        time += 1
        timerLabel.text = "Temps : \(time)\"" // mise à jour du label temps
    }
    
    func endGame()
    {
        chrono.invalidate() //arrêt du chronomètre
        
        /*button1.isEnabled = false
        button2.isEnabled = false
        button3.isEnabled = false
        button4.isEnabled = false*/
        
        for bouton in buttons
        {
             bouton.isEnabled = false //désactiver toutes les boutons
        }
        
        
        resultLabel.text = "Partie terminée !"
        
        //Possibilité aussi de faire comme ci-dessous ; mais ne print pas toujours correctement...
        /*resultLabel.text = "Partie terminée en \(time) secondes. Score : \(jeu.score) pts."*/
        
        
        
        /*switch Jeu.State.self {
            case .ongoing:
                <#code#>
            default:
                <#code#>*/
        
        
    }
    
    
    
        
        /*switch gameView.playTable!.result {
        case .Loose:
            performSegue(withIdentifier: "popUpSegue", sender: nil)
            //resultLabel.text = "Vous avez perdu ! Temps : \(time) secondes"
        case .Win:
            performSegue(withIdentifier: "popUpSegue", sender: nil)
            //resultLabel.text = "Vous avez gagné ! Temps : \(time) secondes"
        case .notEnded:
            chrono = 0
            startTimer()
        }*/
        
    }




