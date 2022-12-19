//
//  ColorView.swift
//  Practice
//
//  Created by Gabriel Castillo Serafim on 15/12/22.
//  
//

import Foundation
import UIKit

class ColorView: UIViewController {

    // MARK: Properties
    var presenter: ColorPresenterProtocol?
    let colorPicker = UIColorWell()

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        title = "Color Selector"
        
        view.addSubview(colorPicker)
        colorPicker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            colorPicker.heightAnchor.constraint(equalToConstant: 500),
            colorPicker.widthAnchor.constraint(equalToConstant: 500),
            colorPicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            colorPicker.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        presenter?.viewWillDisapear(view: self)
    }
}

extension ColorView: ColorViewProtocol {
    // TODO: implement view output methods
}
