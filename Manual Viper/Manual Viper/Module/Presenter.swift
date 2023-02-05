//
//  Presenter.swift
//  Manual Viper
//
//  Created by Gabriel Castillo Serafim on 22/1/23.
//

import UIKit

//MARK: - PRESENTER --> VIEW
//MARK: - PRESENTER --> INTERACTOR
//MARK: - PRESENTER --> ROUTER
class Presenter: ViewToPresenter {
    
    weak var view: View?
    var interactor: Interactor?
    var router: Router?
    
    func viewDidLoad() {
        
    }
    
}

//MARK: - PRESENTER <-- INTERACOTOR
extension Presenter: InteractorToPresenter {
    
    
}
