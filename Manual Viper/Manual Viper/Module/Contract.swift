//
//  Contract.swift
//  Manual Viper
//
//  Created by Gabriel Castillo Serafim on 22/1/23.
//

import UIKit

//MARK: - Base generic VIPER protocols

// VIEW
protocol BaseViperView: AnyObject {
    
    associatedtype P: BaseViperPresenter
    
    var presenter: P? { get }
}

// INTERACTOR
protocol BaseViperInteractor: AnyObject {
    
    associatedtype P: BaseViperPresenter
    associatedtype N: BaseViperNetworkLayer
    
    var presenter: P? { get }
    var netWorkLayer: N? { get }
}

// PRESENTER
protocol BaseViperPresenter: AnyObject {
    
    associatedtype V: BaseViperView
    associatedtype I: BaseViperInteractor
    associatedtype R: BaseViperRouter
    
    var view: V? { get }
    var interactor: I? { get }
    var router: R? { get }
}

// ROUTER
protocol BaseViperRouter: AnyObject {}

// NETWORKLAYER
protocol BaseViperNetworkLayer: AnyObject {
    
    associatedtype I: BaseViperInteractor
    
    var interactor: I? { get }
}

//MARK: - "My" module VIPER protocols

// VIEW --> PRESENTER
protocol ViewToPresenter: BaseViperPresenter {}

// PRESENTER --> VIEW
protocol PresenterToView: BaseViperView {}

// PRESENTER --> INTERACTOR
protocol PresenterToInteractor: BaseViperInteractor {}

// PRESENTER --> ROUTER
protocol PresenterToRouter: BaseViperRouter {}

// INTERACTOR --> NETWORKLAYER
protocol InteractorToNetWorkLayer: BaseViperNetworkLayer {}

// INTERACTOR --> PRESENTER
protocol InteractorToPresenter: BaseViperPresenter {}

// NETWORKLAYER --> INTERACTOR
protocol NetworkLayerToInteractor: BaseViperInteractor {}
