//
//  FirstTabCoordinator.swift
//  Practica
//
//  Created by Gabriel Castillo Serafim on 8/12/22.
//

import UIKit

class FirstTabCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.navigationBar.prefersLargeTitles = true
    }
    
    func start() {
        
        navigationController.delegate = self
        let firstTabViewController = FirstTabViewController()
        firstTabViewController.coordinator = self
        firstTabViewController.title = "First"
        
        navigationController.viewControllers = [firstTabViewController]
    }
    
    enum SettingsAction {
        case settingsButtonPressed
    }
    
    func actionOccurred(with action:SettingsAction) {
        
        switch action {
            
        case .settingsButtonPressed:
            let child = SettingsCoordinator(navigationController: UINavigationController(), parentCoordinator: self)
            childCoordinators.append(child)
            child.start()
            
            navigationController.viewControllers = [child.navigationController]
        }
    }
    
    //Removes a given coordinator from the childCoordinators stack
    func childDidFinish(_ child: Coordinator?) {
        
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    
    //This delegate method identifies what view controller is being removed from the stack and calls the childDidFinish method to properly remove the coordinator from the child coordinator stack
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else { return }
        
        if navigationController.viewControllers.contains(fromViewController) { return }
        
        if let settingsViewController = fromViewController as? BuyViewController {
            childDidFinish(settingsViewController.coordinator)
        }
        
    }
    
}

