//
//  FirstTabViewController.swift
//  CoordinatorPattern
//
//  Created by Gabriel Castillo Serafim on 7/12/22.
//

import UIKit
import Combine

class FirstTabViewController: UIViewController {
    
    let nameLabel = UILabel()
    let emailLabel = UILabel()
    let button = UIButton()
    
    var viewModel: TextFieldsViewModel?
    var subscribers = Set<AnyCancellable>()
    var goToNextVC: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemMint
        
        nameLabel.text = "Name label"
        nameLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        nameLabel.textAlignment = .center
        view.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30).isActive = true

        emailLabel.text = "Email label"
        emailLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        emailLabel.textAlignment = .center
        view.addSubview(emailLabel)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 30).isActive = true

        button.setTitle("Push next", for: .normal)
        button.backgroundColor = .black
        button.titleLabel?.textColor = .white
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 52).isActive = true
        button.widthAnchor.constraint(equalToConstant: 250).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200).isActive = true
        button.addTarget(self, action: #selector(goToNextPage), for: .touchUpInside)
        
        setupBindings()
    }
    
    @objc func goToNextPage() {
        goToNextVC?()
    }
    
    func setupBindings() {
        
        viewModel?.$name.sink { [weak self] value in
            self?.nameLabel.text = value
        }.store(in: &subscribers)
        
        
        viewModel?.$email.sink { [weak self] value in
            self?.emailLabel.text = value
        }.store(in: &subscribers)
    }

}
