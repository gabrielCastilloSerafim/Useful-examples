//
//  ViewController.swift
//  Practica
//
//  Created by Gabriel Castillo Serafim on 8/12/22.
//

import UIKit

class FirstTabViewController: UIViewController {
    
    weak var coordinator: FirstTabCoordinator?
    
    let settingsButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemOrange
        
        settingsButton.backgroundColor = .black
        settingsButton.setTitle("SETTINGS", for: .normal)
        settingsButton.titleLabel?.textColor = .white
        view.addSubview(settingsButton)
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        settingsButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
        settingsButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        settingsButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        settingsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        settingsButton.addTarget(self, action: #selector(settingsButtonPressed), for: .touchUpInside)
    }

    @objc func settingsButtonPressed() {
        coordinator?.actionOccurred(with: .settingsButtonPressed)
    }
    
}

