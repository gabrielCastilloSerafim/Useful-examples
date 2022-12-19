//
//  BuyCoordinator.swift
//  Coordinators
//
//  Created by Gabriel Castillo Serafim on 11/12/22.
//

import UIKit

class BuyCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    
    weak var parentCoordinator: MainCoordinator?
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = BuyViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
}
