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
    
    var tabBarViewController = RAMAnimatedTabBarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabBarItem = RAMAnimatedTabBarItem(title: "Home", image: UIImage(named: "baseline_house_white_18dp-1")!, tag: 0)
        tabBarItem.animation = RAMFlipBottomTransitionItemAnimations()
        tabBarItem.textFontSize = 12
        tabBarItem.textColor = .black
        tabBarItem.iconColor = .black
        
        let tabBarItem2 = RAMAnimatedTabBarItem(title: "Services", image: UIImage(named: "baseline_dashboard_black_18dp")!, tag: 1)
        tabBarItem2.animation = RAMFlipBottomTransitionItemAnimations()
        tabBarItem2.textFontSize = 12
        tabBarItem2.textColor = .black
        tabBarItem2.iconColor = .black
        
        let tabBarItem3 = RAMAnimatedTabBarItem(title: "Chat", image: UIImage(named: "baseline_chat_white_18dp")!, tag: 2)
        tabBarItem3.animation = RAMFlipBottomTransitionItemAnimations()
        tabBarItem3.textFontSize = 12
        tabBarItem3.textColor = .black
        tabBarItem3.iconColor = .black
        
        let tabBarItem4 = RAMAnimatedTabBarItem(title: "Maps", image: UIImage(named: "baseline_navigation_black_18dp")!, tag: 3)
        tabBarItem4.animation = RAMFlipBottomTransitionItemAnimations()
        tabBarItem4.textFontSize = 12
        tabBarItem4.textColor = .black
        tabBarItem4.iconColor = .black
        
        let tabBarItem5 = RAMAnimatedTabBarItem(title: "Settings", image: UIImage(named: "baseline_settings_applications_white_18dp")!, tag: 4)
        tabBarItem5.animation = RAMFlipBottomTransitionItemAnimations()
        tabBarItem5.textFontSize = 12
        tabBarItem5.textColor = .black
        tabBarItem5.iconColor = .black
        
        
        let viewController1 = MainMenuViewController()
        viewController1.tabBarItem = tabBarItem
        
        let viewController2 = EditMenuViewController()
        viewController2.tabBarItem = tabBarItem2
        
        let viewController3 = ChatBotViewController()
        viewController3.tabBarItem = tabBarItem3
        
        let viewController4 = MapsViewController()
        viewController4.tabBarItem = tabBarItem4
        
        let viewController5 = SettingsViewController()
        viewController5.tabBarItem = tabBarItem5
        
        let viewControllers = [viewController1,viewController2,viewController3, viewController4, viewController5]
        // Do any additional setup after loading the view.
        
    
        tabBarViewController.viewControllers = viewControllers
        tabBarViewController.changeSelectedColor(.white, iconSelectedColor: .white)
        
        tabBarViewController.tabBar.barTintColor = UIColor(named: "darkBlueColor")
        tabBarViewController.tabBar.alpha = 10
        tabBarViewController.tabBar.alpha = 1
        tabBarViewController.tabBar.isTranslucent = false
        
        
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
