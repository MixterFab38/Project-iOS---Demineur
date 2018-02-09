//
//  ViewController.swift
//  Demineur
//
//  Created by Fabien Rodet on 30/01/2018.
//  Copyright © 2018 Fabien Rodet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var compteur = 0
    var jeu = Jeu()
    
    private var chrono = Timer()
    private var time = 0 //secondes
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var nbtouchesLabel: UILabel!
    @IBOutlet weak var nbRest: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var resultLabel: UILabel! // Indiquera si la partie est Gagné ou Perdu
    
    @IBOutlet weak var newGameButton: UIButton!
    
    /*@IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!*/
    
    @IBOutlet var buttons: [UIButton]!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        startNewGame() //On lance une partie tout de suite
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didtrapNewGameButton() {
        startNewGame() // A chaque pression sur le bouton "Nouvelle partie"
    }
    
    @IBAction func didPressButton(_ sender: UIButton) {
        sender.isEnabled = false
        ButtonPressed(unNom: sender)
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
    
    private func ButtonPressed(unNom: UIButton) {
        unNom.getIsBonus()
        if unNom.getIsBonus == true {
            unNom.backgroundColor = UIColor.green
        } else {
           unNom.backgroundColor = UIColor.red
           simulClick()
        
            endGame()
        }
        jeu.goToNextCase()
        scoreLabel.text = "Score : \(jeu.score)"
        nbtouchesLabel.text = "Cases touchées : \(jeu.nbCasesTouchees)"
        nbRest.text = "Coups restants : \(jeu.nbCoup)"
        
        if jeu.nbCoup < 1 {
            endGame()
        }
    }
    private func simulClick()
    {
        for bouton in buttons
        {
            if bouton.getIsBonus() == true {
                bouton.backgroundColor = UIColor.green
            } else {
                bouton.backgroundColor = UIColor.red
            }
        }
    }
    
    
    private func startNewGame() {
        /*button1.backgroundColor = UIColor.gray
        button2.backgroundColor = UIColor.gray
        button3.backgroundColor = UIColor.gray
        button4.backgroundColor = UIColor.gray
        
        button1.isEnabled = true
        button2.isEnabled = true
        button3.isEnabled = true
        button4.isEnabled = true*/
        
        for bouton in buttons
        {
            bouton.backgroundColor = UIColor.gray
            bouton.isEnabled = true
        }
        
        jeu.refresh()
        
        scoreLabel.text = "Score : 0"
        nbtouchesLabel.text = "Cases touchées : 0"
        nbRest.text = "Coups restants : \(jeu.nbCoup)"
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
    
    func endGame(){
        chrono.invalidate()
        
        /*button1.isEnabled = false
        button2.isEnabled = false
        button3.isEnabled = false
        button4.isEnabled = false*/
        
        for bouton in buttons
        {
             bouton.isEnabled = false
        }
        
        
        resultLabel.text = "Partie terminée !"
        
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




