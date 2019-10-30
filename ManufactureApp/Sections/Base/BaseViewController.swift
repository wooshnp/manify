//
//  BaseViewController.swift
//  ManufactureApp
//
//  Created by Nuno Pinho on 17/10/2019.
//  Copyright © 2019 Nuno Pinho. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        
        self.view.backgroundColor = UIColor(named: "backgroundColor")!
    
    }
    
    deinit {
        print("DEINIT \(self)")
    }
    
    
}
