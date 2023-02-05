//
//  Router.swift
//  Manual Viper
//
//  Created by Gabriel Castillo Serafim on 22/1/23.
//

import UIKit

class Router: PresenterToRouter {
    
    static func createModule() -> UIViewController {
        
        let view = View()
        let interactor = Interactor()
        let presenter = Presenter()
        let router = Router()
        let nerworkLayer = NetworkLayer()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.netWorkLayer = nerworkLayer
        nerworkLayer.interactor = interactor
        
        return view
    }
    
}
