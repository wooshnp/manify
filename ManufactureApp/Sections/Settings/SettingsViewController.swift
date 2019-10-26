//
//  SettingsViewController.swift
//  ManufactureApp
//
//  Created by Nuno Pinho on 22/10/2019.
//  Copyright © 2019 Nuno Pinho. All rights reserved.
//

import UIKit

class SettingsViewController: BaseViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.setNavigationBarHidden(false, animated: true)

        // Do any additional setup after loading the view.
    }

        
    @IBAction func logoutButton(_ sender: Any) {
        
        let vc = LoginViewController()
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
        self.present(vc, animated: true)
        
    }
    
    
    
    
}
