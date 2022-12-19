//
//  SecondViewController.swift
//  Image Cache example
//
//  Created by Gabriel Castillo Serafim on 16/12/22.
//

import UIKit

class SecondViewController: UIViewController {

    let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -250),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100)
        ])
        
        getImage()
    }
    
    func getImage() {
        
        ImageProvider.shared.fetchImage { image in
            
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
        
    }
    

}
