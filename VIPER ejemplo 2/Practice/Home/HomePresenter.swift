//
//  HomePresenter.swift
//  Practice
//
//  Created by Gabriel Castillo Serafim on 15/12/22.
//  
//

import Foundation

class HomePresenter  {
    
    // MARK: Properties
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var wireFrame: HomeWireFrameProtocol?
    
}

extension HomePresenter: HomePresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        
    }
    
    func pickColorSelected(view: HomeView) {
        wireFrame?.pushColorView(view: view)
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
