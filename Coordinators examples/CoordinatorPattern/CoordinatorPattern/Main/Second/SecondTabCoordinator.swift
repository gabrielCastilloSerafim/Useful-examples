//
//  SecondTabCoordinator.swift
//  CoordinatorPattern
//
//  Created by Gabriel Castillo Serafim on 7/12/22.
//

import UIKit

class SecondTabCoordinator: Coordinator {
    
    var rootViewController = UINavigationController()
    
    init() {
        self.rootViewController = UINavigationController()
        rootViewController.navigationBar.prefersLargeTitles = true
    }

    
    lazy var secondViewController: SecondTabViewController = {
        let vc = SecondTabViewController()
        vc.title = "Second title"
        return vc
    }()
    
    func start() {
        rootViewController.setViewControllers([secondViewController], animated: false)
    }
    
}
