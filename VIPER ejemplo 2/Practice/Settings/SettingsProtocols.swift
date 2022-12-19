//
//  SettingsProtocols.swift
//  Practice
//
//  Created by Gabriel Castillo Serafim on 15/12/22.
//  
//

import Foundation
import UIKit

protocol SettingsViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: SettingsPresenterProtocol? { get set }
}

protocol SettingsWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createSettingsModule() -> UIViewController
}

protocol SettingsPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: SettingsViewProtocol? { get set }
    var interactor: SettingsInteractorInputProtocol? { get set }
    var wireFrame: SettingsWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol SettingsInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
}

protocol SettingsInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: SettingsInteractorOutputProtocol? { get set }
    var localDatamanager: SettingsLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: SettingsRemoteDataManagerInputProtocol? { get set }
}

protocol SettingsDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol SettingsRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: SettingsRemoteDataManagerOutputProtocol? { get set }
}

protocol SettingsRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol SettingsLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
