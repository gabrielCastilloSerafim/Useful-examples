//
//  ViewController.swift
//  Practice
//
//  Created by Gabriel Castillo Serafim on 15/12/22.
//

import UIKit

class EntryCoordinator {

    var tabBarController: UITabBarController?
    
    func start(tabBarController: UITabBarController) {
        
        self.tabBarController = tabBarController
        tabBarController.tabBar.backgroundColor = .white
        
        let homeViewController = HomeWireFrame.createHomeModule()
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        
        let settingsViewController = SettingsWireFrame.createSettingsModule()
        settingsViewController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), selectedImage: UIImage(systemName: "gear.fill"))
        
        tabBarController.viewControllers = [homeViewController, settingsViewController]
    }

}

