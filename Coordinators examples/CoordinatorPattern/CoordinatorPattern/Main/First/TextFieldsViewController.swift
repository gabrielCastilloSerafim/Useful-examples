//
//  TextFieldsViewController.swift
//  CoordinatorPattern
//
//  Created by Gabriel Castillo Serafim on 7/12/22.
//

import UIKit
import Combine

class TextFieldsViewController: UIViewController {
    
    let nameTextField = UITextField()
    let emailTextField = UITextField()
    let button = UIButton()
    
    var viewModel: TextFieldsViewModel
    
    init(viewModel: TextFieldsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemOrange
        
        nameTextField.placeholder = "Name"
        nameTextField.backgroundColor = .white
        view.addSubview(nameTextField)
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30).isActive = true
        
        emailTextField.placeholder = "Email"
        emailTextField.backgroundColor = .white
        view.addSubview(emailTextField)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 30).isActive = true
        
        button.setTitle("Done", for: .normal)
        button.backgroundColor = .black
        button.titleLabel?.textColor = .white
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 52).isActive = true
        button.widthAnchor.constraint(equalToConstant: 250).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200).isActive = true
        button.addTarget(self, action: #selector(donePressed), for: .touchUpInside)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameTextField.endEditing(true)
        emailTextField.endEditing(true)
    }
    
    @objc func donePressed() {
        viewModel.name = nameTextField.text!
        viewModel.email = emailTextField.text!
        
    }
    
    
}
