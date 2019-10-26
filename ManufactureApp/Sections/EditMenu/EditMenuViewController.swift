//
//  EditMenuViewController.swift
//  ManufactureApp
//
//  Created by Nuno Pinho on 22/10/2019.
//  Copyright © 2019 Nuno Pinho. All rights reserved.
//

import UIKit
import FanMenu
import Macaw

class EditMenuViewController: UIViewController {
    
    
  
    @IBOutlet weak var fanMenu: FanMenu!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fanMenu.backgroundColor = UIColor.init(named: "backgroundColor")
        
      fanMenu.button = FanMenuButton(
          id: "main",
          image: "addSignal",
          color: Color(val: 0x273C75)
        )
        
        fanMenu.items = [
          FanMenuButton(
            id: "tech",
            image: "tech",
            color: Color(val: 0x273C75)
          ),
          FanMenuButton(
            id: "orders",
            image: "technical",
            color: Color(val: 0x273C75)
          ),
          FanMenuButton(
            id: "sells",
            image: "technical",
            color: Color(val: 0x273C75)
            )
        ]
        
        
        
        
        // call before animation
        fanMenu.onItemDidClick = { button in
          print("ItemDidClick: \(button.id)")
        }
        // call after animation
        fanMenu.onItemWillClick = { button in
          print("ItemWillClick: \(button.id)")
        }
        
        // distance between button and items
        fanMenu.menuRadius = 75

        // animation duration
        fanMenu.duration = 0.35

        // menu opening delay
        fanMenu.delay = 0.05

        // interval for buttons in radians
        fanMenu.interval = (0, 3.0 * Double.pi)

        // menu background color
        fanMenu.menuBackground = Color.clear
      
        
    }

}
