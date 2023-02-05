//
//  Interactor.swift
//  Manual Viper
//
//  Created by Gabriel Castillo Serafim on 22/1/23.
//

import Foundation

//MARK: - INTERACTOR --> NETWORKLAYER
//MARK: - INTERACTOR --> PRESENTER
class Interactor: PresenterToInteractor {
    
    weak var presenter: Presenter?
    var netWorkLayer: NetworkLayer?
    
    
}

//MARK: - INTERACTOR <-- NETWORKLAYER
extension Interactor: NetworkLayerToInteractor {
    
    
}
