//
//  FirstTabCoordinator.swift
//  CoordinatorPattern
//
//  Created by Gabriel Castillo Serafim on 7/12/22.
//

import UIKit

class FirstTabCoordinator: Coordinator {
    
    var rootViewController = UINavigationController()
    let viewModel = TextFieldsViewModel()
    
    init() {
        self.rootViewController = UINavigationController()
        rootViewController.navigationBar.prefersLargeTitles = true
    }
    
    lazy var firstViewController: FirstTabViewController = {
       
        let vc = FirstTabViewController()
        vc.title = "First title"
        vc.viewModel = viewModel
        vc.goToNextVC = { [weak self] in
            self?.goToNextVC()
        }
        return vc
    }()
    
    func start() {
        rootViewController.setViewControllers([firstViewController], animated: false)
    }
    
    func goToNextVC() {
        let textfieldsViewController = TextFieldsViewController(viewModel: viewModel)
        rootViewController.pushViewController(textfieldsViewController, animated: true)
    }
    
}
