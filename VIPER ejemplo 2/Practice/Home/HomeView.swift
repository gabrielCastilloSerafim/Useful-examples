//
//  HomeView.swift
//  Practice
//
//  Created by Gabriel Castillo Serafim on 15/12/22.
//  
//

import Foundation
import UIKit

protocol RespondToSelectedColor {
    
    func didSelectColor(color: UIColor)
}

class HomeView: UIViewController {

    // MARK: Properties
    var presenter: HomePresenterProtocol?
    let button = UIButton()

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cyan
        title = "Home"
        
        view.addSubview(button)
        button.setTitle("Choose Color", for: .normal)
        button.backgroundColor = .black
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        button.addTarget(self, action: #selector(chooseColorTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 52),
            button.widthAnchor.constraint(equalToConstant: 300),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func chooseColorTapped() {
        presenter?.pickColorSelected(view: self)
    }
    
}

extension HomeView: HomeViewProtocol {
    // TODO: implement view output methods
}

extension HomeView: RespondToSelectedColor {
    
    func didSelectColor(color: UIColor) {
        
        view.backgroundColor = color
    }
}
