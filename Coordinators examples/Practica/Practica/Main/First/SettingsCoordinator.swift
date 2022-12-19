//
//  SettingsCoordinator.swift
//  Practica
//
//  Created by Gabriel Castillo Serafim on 9/12/22.
//

import UIKit

class SettingsCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    weak var parentCoordinator: FirstTabCoordinator?
    
    init(navigationController: UINavigationController, parentCoordinator: FirstTabCoordinator) {
        
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
        
        navigationController.navigationBar.prefersLargeTitles = true
    }
    
    func start() {
        
        let settingsVC = SettingsViewController()
        settingsVC.title = "Settings"
        
        navigationController.viewControllers = [settingsVC]
    }
    
    
}
