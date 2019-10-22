//
//  MainViewController.swift
//  ManufactureApp
//
//  Created by Nuno Pinho on 21/10/2019.
//  Copyright © 2019 Nuno Pinho. All rights reserved.
//

import UIKit
import RAMAnimatedTabBarController

class MainViewController: UIViewController {

    @IBOutlet var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tabBarItem = RAMAnimatedTabBarItem(title: "stuff 1", image: UIImage(named: "icons8-lock-50")!, tag: 0)
        tabBarItem.animation = RAMFlipBottomTransitionItemAnimations()
        
        let tabBarItem2 = RAMAnimatedTabBarItem(title: "stuff 2", image: UIImage(named: "icons8-lock-50")!, tag: 1)
        tabBarItem2.animation = RAMFlipBottomTransitionItemAnimations()

        let tabBarItem3 = RAMAnimatedTabBarItem(title: "stuff 3", image: UIImage(named: "icons8-lock-50")!, tag: 2)
        tabBarItem3.animation = RAMFlipBottomTransitionItemAnimations()

        
        let viewController1 = MainMenuViewController()
        viewController1.tabBarItem = tabBarItem
        
        let viewController2 = MainMenuViewController()
        viewController2.tabBarItem = tabBarItem2
        
        let viewController3 = MainMenuViewController()
        viewController3.tabBarItem = tabBarItem3
        
        
        
        let viewControllers = [viewController1,viewController2,viewController3]
        // Do any additional setup after loading the view.
        let tabBarViewController = RAMAnimatedTabBarController()

    
        tabBarViewController.viewControllers = viewControllers
        
        
        self.addChild(tabBarViewController)
        tabBarViewController.didMove(toParent: self)
        tabBarViewController.view.translatesAutoresizingMaskIntoConstraints = false
        self.containerView.addSubview(tabBarViewController.view)
        
        tabBarViewController.view.topAnchor.constraint(equalTo: self.containerView.topAnchor).isActive = true

        tabBarViewController.view.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor).isActive = true
        
        tabBarViewController.view.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor).isActive = true
        
        tabBarViewController.view.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor).isActive = true
    }



    

}
