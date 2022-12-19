//
//  SettingsInteractor.swift
//  Practice
//
//  Created by Gabriel Castillo Serafim on 15/12/22.
//  
//

import Foundation

class SettingsInteractor: SettingsInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: SettingsInteractorOutputProtocol?
    var localDatamanager: SettingsLocalDataManagerInputProtocol?
    var remoteDatamanager: SettingsRemoteDataManagerInputProtocol?

}

extension SettingsInteractor: SettingsRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
