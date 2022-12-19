//
//  SecondTabViewController.swift
//  CoordinatorPattern
//
//  Created by Gabriel Castillo Serafim on 7/12/22.
//

import UIKit

class SecondTabViewController: UIViewController {
    
    let nameLabel = UILabel()
    let emailLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemRed
        
        nameLabel.text = "Name label"
        nameLabel.font = UIFont.systemFont(ofSize: 25, weight: .black)
        nameLabel.textAlignment = .center
        view.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30).isActive = true
        
        emailLabel.text = "Email label"
        emailLabel.font = UIFont.systemFont(ofSize: 25, weight: .black)
        emailLabel.textAlignment = .center
        view.addSubview(emailLabel)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 30).isActive = true
    }
    
    

}
