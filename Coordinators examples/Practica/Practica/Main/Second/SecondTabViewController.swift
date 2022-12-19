//
//  SecondTabViewController.swift
//  Practica
//
//  Created by Gabriel Castillo Serafim on 8/12/22.
//

import UIKit
import Combine

class SecondTabViewController: UIViewController {
    
    weak var coordinator: SecondTabCoordinator?
    
    let buyButton = UIButton()
    let userButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemCyan
        
        buyButton.backgroundColor = .black
        buyButton.setTitle("BUY", for: .normal)
        buyButton.titleLabel?.textColor = .white
        view.addSubview(buyButton)
        buyButton.translatesAutoresizingMaskIntoConstraints = false
        buyButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
        buyButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        buyButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        buyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buyButton.addTarget(self, action: #selector(buyButtonPressed), for: .touchUpInside)
        
        userButton.backgroundColor = .black
        userButton.setTitle("USER", for: .normal)
        userButton.titleLabel?.textColor = .white
        view.addSubview(userButton)
        userButton.translatesAutoresizingMaskIntoConstraints = false
        userButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
        userButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        userButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
        userButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        userButton.addTarget(self, action: #selector(userButtonPressed), for: .touchUpInside)
    }
    
    @objc func buyButtonPressed() {
        coordinator?.eventOccurred(with: .buyButtonPressed(product: "Guitar"))
    }
    
    @objc func userButtonPressed() {
        coordinator?.eventOccurred(with: .userButtonPressed)
    }

}
