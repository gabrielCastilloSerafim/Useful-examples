//
//  SecondTabCoordinator.swift
//  Practica
//
//  Created by Gabriel Castillo Serafim on 8/12/22.
//

import UIKit

class SecondTabCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
        navigationController.navigationBar.prefersLargeTitles = true
    }
    
    func start() {
        
        let secondTabViewController = SecondTabViewController()
        secondTabViewController.coordinator = self
        secondTabViewController.title = "Second TabVC"
        
        navigationController.viewControllers = [secondTabViewController]
    }
    
    func eventOccurred(with type: Event) {
        
        switch type {
            
        case .buyButtonPressed(let product):
            let buyVC = BuyViewController()
            buyVC.coordinator = self
            print(product)
            navigationController.pushViewController(buyVC, animated: true)
            
        case .userButtonPressed:
            let userVC = UserViewController()
            userVC.coordinator = self
            navigationController.pushViewController(userVC, animated: true)
            
        
        }
    }
    
    enum Event {
        
        case buyButtonPressed(product: String)
        case userButtonPressed
    }
    
}
