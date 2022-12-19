//
//  MainCoordinator.swift
//  CoordinatorPattern
//
//  Created by Gabriel Castillo Serafim on 7/12/22.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var rootViewController = UITabBarController()
    
    var childCoordinators = [Coordinator]()
    
    //Use the initialiser to setup the tabBarController
    init() {
        self.rootViewController = UITabBarController()
        rootViewController.tabBar.isTranslucent = true
        rootViewController.tabBar.backgroundColor = .white
    }
    
    //Start function is called on the parent coordinator and is responsible for initialising its child coordinators, storing references to them in this class by appending them to the childCoordinators variable, setting up the viewControllers tabBar items and setting the root view controller to this class as the array of the two view controllers, since the root view controller for this class is a UITabBarController it can take an array of multiple view controllers to display as it's tabs.
    func start() {
        
        let firstCoordinator = FirstTabCoordinator()
        firstCoordinator.start()
        self.childCoordinators.append(firstCoordinator)
        let firstViewController = firstCoordinator.rootViewController
        firstViewController.tabBarItem = UITabBarItem(title: "First", image: UIImage(systemName: "paperplane"), selectedImage: UIImage(systemName: "paperplane.fill"))
        
        let secondCoordinator = SecondTabCoordinator()
        secondCoordinator.start()
        self.childCoordinators.append(secondCoordinator)
        let secondViewController = secondCoordinator.rootViewController
        secondViewController.tabBarItem = UITabBarItem(title: "Second", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        
        self.rootViewController.viewControllers = [firstCoordinator.rootViewController, secondCoordinator.rootViewController]
    }
}
