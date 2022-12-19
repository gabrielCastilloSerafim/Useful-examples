//
//  ViewController.swift
//  TabBarController
//
//  Created by Gabriel Castillo Serafim on 2/12/22.
//

import UIKit

class MainViewController: UIViewController {
    
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        button.backgroundColor = .black
        button.setTitle("Go To TabBarController", for: .normal)
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 52)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc func didTapButton() {
        //Create and present tab bar controller
        let tabBarVC = UITabBarController()
        
        //ViewControllers
        let vc1 = UINavigationController(rootViewController: FirstViewController())
        vc1.title = "First"
        vc1.tabBarItem.image = UIImage.init(systemName: "house")
        
        let vc2 = UINavigationController(rootViewController: SecondViewController())
        vc2.title = "Second"
        vc2.tabBarItem.image = UIImage.init(systemName: "bell")
        
        let vc3 = UINavigationController(rootViewController: ThirdViewController())
        vc3.title = "Third"
        vc3.tabBarItem.image = UIImage.init(systemName: "person.circle")
        
        let vc4 = UINavigationController(rootViewController: FourthViewController())
        vc4.title = "Fourth"
        vc4.tabBarItem.image = UIImage.init(systemName: "star")
        
        let vc5 = UINavigationController(rootViewController: FifthViewController())
        vc5.title = "Fifth"
        vc5.tabBarItem.image = UIImage.init(systemName: "gear")
        
        //Set the tabBarController's view controller
        tabBarVC.setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: false)
        tabBarVC.tabBar.backgroundColor = .white
        tabBarVC.modalPresentationStyle = .fullScreen
        
        present(tabBarVC, animated: true)
    }

}

class FirstViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "First"
    }
}

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Second"
    }
}

class ThirdViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Third"
    }
}

class FourthViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Fourth"
    }
}

class FifthViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .purple
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Fifth"
    }
}
