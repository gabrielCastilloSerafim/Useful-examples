//
//  SettingsView.swift
//  Practice
//
//  Created by Gabriel Castillo Serafim on 15/12/22.
//  
//

import Foundation
import UIKit

class SettingsView: UIViewController {

    // MARK: Properties
    var presenter: SettingsPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPink
        title = "Settings"
    }
}

extension SettingsView: SettingsViewProtocol {
    // TODO: implement view output methods
}
