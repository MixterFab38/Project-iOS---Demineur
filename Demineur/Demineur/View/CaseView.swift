//
//  CaseView.swift
//  Demineur
//
//  Created by Vincent Vionnet on 12/02/2018.
//  Copyright © 2018 Fabien Rodet. All rights reserved.
//

import UIKit

class CaseView: UIButton {
    
    var isBonus : Bool!
    enum Style {
        case bonus, malus, standard
    }
    var style: Style = .standard {
        didSet {
               setStyle(style)
        }
    }
    
    func setStyle(_ style: Style)
    {
        switch style{
        case .bonus:
            backgroundColor = UIColor.green
        case .malus:
            backgroundColor = UIColor.red
        case .standard:
            backgroundColor = UIColor.gray
        }
    }
  
}
