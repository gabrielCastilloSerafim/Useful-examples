//
//  SettingsWireFrame.swift
//  Practice
//
//  Created by Gabriel Castillo Serafim on 15/12/22.
//  
//

import Foundation
import UIKit

class SettingsWireFrame: SettingsWireFrameProtocol {

    class func createSettingsModule() -> UIViewController {
        
        let view = SettingsView()
        
        let navController = UINavigationController()
        navController.viewControllers = [view]
        navController.navigationBar.prefersLargeTitles = true
        
        let presenter: SettingsPresenterProtocol & SettingsInteractorOutputProtocol = SettingsPresenter()
        let interactor: SettingsInteractorInputProtocol & SettingsRemoteDataManagerOutputProtocol = SettingsInteractor()
        let localDataManager: SettingsLocalDataManagerInputProtocol = SettingsLocalDataManager()
        let remoteDataManager: SettingsRemoteDataManagerInputProtocol = SettingsRemoteDataManager()
        let wireFrame: SettingsWireFrameProtocol = SettingsWireFrame()
        
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.localDatamanager = localDataManager
        interactor.remoteDatamanager = remoteDataManager
        remoteDataManager.remoteRequestHandler = interactor
        
        return navController
    }
    
}
