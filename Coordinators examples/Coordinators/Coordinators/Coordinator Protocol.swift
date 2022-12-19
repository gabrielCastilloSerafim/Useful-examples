//
//  Coordinator Protocol.swift
//  Coordinators
//
//  Created by Gabriel Castillo Serafim on 9/12/22.
//

import UIKit

protocol Coordinator: AnyObject {
    
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
