//
//  ViewController.swift
//  Demineur
//
//  Created by Fabien Rodet on 30/01/2018.
//  Copyright © 2018 Fabien Rodet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var nbtouchesLabel: UILabel!
    @IBOutlet weak var nbRest: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    @IBOutlet var buttons: [UIButton]!
    
    @IBAction func didPressButton1() {
        PressButton1()
    }
    @IBAction func didPressButton2() {
        PressButton2()
    }
    @IBAction func didPressButton3() {
        PressButton3()
    }
    @IBAction func didPressButton4() {
        PressButton4()
    }
    
    private func PressButton1() {
        button1.backgroundColor = UIColor.blue
    }
    private func PressButton2() {
        button2.backgroundColor = UIColor.green
    }
    private func PressButton3() {
        button3.backgroundColor = UIColor.yellow
    }
    private func PressButton4() {
        button4.backgroundColor = UIColor.red
    }

    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

