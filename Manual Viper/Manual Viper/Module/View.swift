//
//  ViewController.swift
//  Manual Viper
//
//  Created by Gabriel Castillo Serafim on 22/1/23.
//

import UIKit

//MARK: - VIEW --> PRESENTER
class View: UIViewController {
    
    var presenter: Presenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
    }

}

//MARK: - VIEW <-- PRESENTER
extension View: PresenterToView {
    
    
}
