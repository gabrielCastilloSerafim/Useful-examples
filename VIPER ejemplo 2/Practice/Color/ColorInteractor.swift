//
//  ColorInteractor.swift
//  Practice
//
//  Created by Gabriel Castillo Serafim on 15/12/22.
//  
//

import Foundation

class ColorInteractor: ColorInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: ColorInteractorOutputProtocol?
    var localDatamanager: ColorLocalDataManagerInputProtocol?
    var remoteDatamanager: ColorRemoteDataManagerInputProtocol?

}

extension ColorInteractor: ColorRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
