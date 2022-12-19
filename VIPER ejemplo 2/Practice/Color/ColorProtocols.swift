//
//  ColorProtocols.swift
//  Practice
//
//  Created by Gabriel Castillo Serafim on 15/12/22.
//  
//

import Foundation
import UIKit

protocol ColorViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: ColorPresenterProtocol? { get set }
}

protocol ColorWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createColorModule() -> UIViewController
    
    func navigateBackWithColor(color: UIColor)
}

protocol ColorPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: ColorViewProtocol? { get set }
    var interactor: ColorInteractorInputProtocol? { get set }
    var wireFrame: ColorWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func viewWillDisapear(view: ColorView)
}

protocol ColorInteractorOutputProtocol: AnyObject {
    // INTERACTOR -> PRESENTER
}

protocol ColorInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: ColorInteractorOutputProtocol? { get set }
    var localDatamanager: ColorLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: ColorRemoteDataManagerInputProtocol? { get set }
}

protocol ColorDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol ColorRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: ColorRemoteDataManagerOutputProtocol? { get set }
}

protocol ColorRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol ColorLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
