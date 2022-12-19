//
//  ViewController.swift
//  Image Cache example
//
//  Created by Gabriel Castillo Serafim on 16/12/22.
//

import UIKit

class FirstViewController: UIViewController {
    
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(button)
        button.setTitle("Present Image", for: .normal)
        button.backgroundColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(presentImagePressed), for: .touchUpInside)
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func presentImagePressed() {
        let nextVC = SecondViewController()
        
        self.present(nextVC, animated: true)
    }

}

