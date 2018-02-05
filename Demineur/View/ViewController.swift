//
//  ViewController.swift
//  Demineur
//
//  Created by Fabien Rodet on 30/01/2018.
//  Copyright © 2018 Fabien Rodet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /*var game = Jeu();*/
    
    private var chrono = Timer()
    private var time = 0 //secondes
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var nbtouchesLabel: UILabel!
    @IBOutlet weak var nbRest: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var resultLabel: UILabel! //Gagné ou perdu
    
    @IBOutlet weak var newGameButton: UIButton!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    @IBOutlet var buttons: [UIButton]!
    
    @IBAction func didtrapNewGameButton() {
        startNewGame()
    }
    
    
    @IBAction func didPressButton1() {
        //PressButton1()
        button1.backgroundColor = UIColor.blue
    }
    @IBAction func didPressButton2() {
        //PressButton2()
        button2.backgroundColor = UIColor.green
    }
    @IBAction func didPressButton3() {
        button3.backgroundColor = UIColor.yellow
        //PressButton3()
    }
    @IBAction func didPressButton4() {
        button4.backgroundColor = UIColor.red
        //PressButton4()
    }
    
    private func PressButton1() {
        
    }
    private func PressButton2() {
        
    }
    private func PressButton3() {
        
    }
    private func PressButton4() {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        startNewGame() //On lance une partie tout de suite
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func startNewGame() {
        button1.backgroundColor = UIColor.gray
        button2.backgroundColor = UIColor.gray
        button3.backgroundColor = UIColor.gray
        button4.backgroundColor = UIColor.gray
        
        scoreLabel.text = "Score : 0"
        nbtouchesLabel.text = "Cases touchées : 0"
        nbRest.text = "Coups restants : "
        timerLabel.text = "Temps : 0"+"\""
        resultLabel.text = ""
        
        startTimer()
        
        //game.refresh()
    }
    
    private func startTimer(){
        chrono = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateChrono), userInfo: nil, repeats: true)
    }
    
    @objc func updateChrono(){
        time += 1
        timerLabel.text = "Temps : \(time)\""
    }
    
    func endGame(){
        chrono.invalidate()
        /*switch gameView.playTable!.result {
        case .Loose:
            performSegue(withIdentifier: "popUpSegue", sender: nil)
        case .Win:
            performSegue(withIdentifier: "popUpSegue", sender: nil)
        case .notEnded:
            chrono = 0
            startTimer()
        }*/
        
    }


}

