//
//  AppCoordinator.swift
//  Practica
//
//  Created by Gabriel Castillo Serafim on 8/12/22.
//

import UIKit

class AppCoordinator: Coordinator {
    
    
    var childCoordinators = [Coordinator]()
    
    var widow: UIWindow
    
    init(widow: UIWindow) {
        self.widow = widow
    }
    
    func start() {
        
        let mainCoordinator = MainCoordinator(tabBarController: UITabBarController())
        mainCoordinator.start()
        childCoordinators.append(mainCoordinator)
        
        self.widow.rootViewController = mainCoordinator.tabBarController
    }
    
}
