//
//  SettingsPresenter.swift
//  Practice
//
//  Created by Gabriel Castillo Serafim on 15/12/22.
//  
//

import Foundation

class SettingsPresenter  {
    
    // MARK: Properties
    weak var view: SettingsViewProtocol?
    var interactor: SettingsInteractorInputProtocol?
    var wireFrame: SettingsWireFrameProtocol?
    
}

extension SettingsPresenter: SettingsPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
}

extension SettingsPresenter: SettingsInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
