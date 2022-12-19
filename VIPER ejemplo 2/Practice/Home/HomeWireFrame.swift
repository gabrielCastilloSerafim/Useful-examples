//
//  HomeWireFrame.swift
//  Practice
//
//  Created by Gabriel Castillo Serafim on 15/12/22.
//  
//

import Foundation
import UIKit

class HomeWireFrame: HomeWireFrameProtocol {
    
    class func createHomeModule() -> UIViewController {
        
        let view = HomeView()
        
        let navController = UINavigationController()
        navController.viewControllers = [view]
        navController.navigationBar.prefersLargeTitles = true
        
        let presenter: HomePresenterProtocol & HomeInteractorOutputProtocol = HomePresenter()
        let interactor: HomeInteractorInputProtocol & HomeRemoteDataManagerOutputProtocol = HomeInteractor()
        let localDataManager: HomeLocalDataManagerInputProtocol = HomeLocalDataManager()
        let remoteDataManager: HomeRemoteDataManagerInputProtocol = HomeRemoteDataManager()
        let wireFrame: HomeWireFrameProtocol = HomeWireFrame()
        
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
    
    func pushColorView(view: HomeView) {
        
        let colorVC = ColorWireFrame.createColorModule()
        ColorWireFrame.homeViewDelegate = view
        
        view.navigationController?.pushViewController(colorVC, animated: true)
    }
    
}
