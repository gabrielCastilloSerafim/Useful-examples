//
//  ViewController.swift
//  Coordinators
//
//  Created by Gabriel Castillo Serafim on 9/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    weak var coordinator: MainCoordinator?
    
    let buyButton = UIButton()
    let createAccountButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
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
        
        createAccountButton.backgroundColor = .black
        createAccountButton.setTitle("CREATE ACCOUNT", for: .normal)
        createAccountButton.titleLabel?.textColor = .white
        view.addSubview(createAccountButton)
        createAccountButton.translatesAutoresizingMaskIntoConstraints = false
        createAccountButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
        createAccountButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        createAccountButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
        createAccountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        createAccountButton.addTarget(self, action: #selector(CreateAccountButtonPressed), for: .touchUpInside)
    }
    
    @objc func buyButtonPressed() {
        coordinator?.buySubscription()
    }
    
    @objc func CreateAccountButtonPressed() {
        coordinator?.createAccount()
    }

}

