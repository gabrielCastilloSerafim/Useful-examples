//
//  Protocols.swift
//  Practica
//
//  Created by Gabriel Castillo Serafim on 8/12/22.
//

import Foundation


protocol Coordinator: AnyObject {
    
    var childCoordinators: [Coordinator] { get set }
    
    func start()
}
