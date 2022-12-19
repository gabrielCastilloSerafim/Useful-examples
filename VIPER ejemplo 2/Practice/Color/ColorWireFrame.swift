//
//  ColorWireFrame.swift
//  Practice
//
//  Created by Gabriel Castillo Serafim on 15/12/22.
//  
//

import Foundation
import UIKit

class ColorWireFrame: ColorWireFrameProtocol {
    
    static var homeViewDelegate: RespondToSelectedColor?
    
    class func createColorModule() -> UIViewController {
        
        let view = ColorView()
        
        let presenter: ColorPresenterProtocol & ColorInteractorOutputProtocol = ColorPresenter()
        let interactor: ColorInteractorInputProtocol & ColorRemoteDataManagerOutputProtocol = ColorInteractor()
        let localDataManager: ColorLocalDataManagerInputProtocol = ColorLocalDataManager()
        let remoteDataManager: ColorRemoteDataManagerInputProtocol = ColorRemoteDataManager()
        let wireFrame: ColorWireFrameProtocol = ColorWireFrame()
        
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.localDatamanager = localDataManager
        interactor.remoteDatamanager = remoteDataManager
        remoteDataManager.remoteRequestHandler = interactor
        
        return view
    }
    
    func navigateBackWithColor(color: UIColor) {
        ColorWireFrame.homeViewDelegate?.didSelectColor(color: color)
    }
}
