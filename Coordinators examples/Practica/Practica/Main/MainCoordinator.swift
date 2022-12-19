//
//  MainCoordinator.swift
//  Practica
//
//  Created by Gabriel Castillo Serafim on 8/12/22.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    
    var tabBarController: UITabBarController
    
    init(tabBarController: UITabBarController) {
        self.tabBarController = tabBarController
        tabBarController.tabBar.isTranslucent = true
        tabBarController.tabBar.backgroundColor = .white
    }
    
    func start() {
        
        let firstTabCoordinator = FirstTabCoordinator(navigationController: UINavigationController())
        firstTabCoordinator.start()
        childCoordinators.append(firstTabCoordinator)
        let firstTabViewController = firstTabCoordinator.navigationController
        firstTabViewController.tabBarItem = UITabBarItem(title: "First", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        
        let secondTabCoordinator = SecondTabCoordinator(navigationController: UINavigationController())
        secondTabCoordinator.start()
        childCoordinators.append(secondTabCoordinator)
        let secondViewController = secondTabCoordinator.navigationController
        secondViewController.tabBarItem = UITabBarItem(title: "Second", image: UIImage(systemName: "paperplane"), selectedImage: UIImage(systemName: "paperplane.fill"))
        
        tabBarController.viewControllers = [firstTabCoordinator.navigationController, secondTabCoordinator.navigationController]
    }
    
}
