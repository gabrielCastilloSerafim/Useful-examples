//
//  ViewController.swift
//  CoordinatorPattern
//
//  Created by Gabriel Castillo Serafim on 7/12/22.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    var finishedOnboarding: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .cyan
        
        let button = UIButton()
        button.setTitle("Finish Onboarding", for: .normal)
        button.backgroundColor = .black
        button.titleLabel?.textColor = .white
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 52).isActive = true
        button.widthAnchor.constraint(equalToConstant: 250).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.addTarget(self, action: #selector(goToNextPage), for: .touchUpInside)
    }
    
    @objc func goToNextPage() {
        finishedOnboarding?()
    }

}
