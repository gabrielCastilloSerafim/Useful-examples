//
//  ColorPresenter.swift
//  Practice
//
//  Created by Gabriel Castillo Serafim on 15/12/22.
//  
//

import Foundation

class ColorPresenter  {
    
    // MARK: Properties
    weak var view: ColorViewProtocol?
    var interactor: ColorInteractorInputProtocol?
    var wireFrame: ColorWireFrameProtocol?
    
}

extension ColorPresenter: ColorPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
    
    func viewWillDisapear(view: ColorView) {
        
        if view.isMovingFromParent == true {
            
            let color = view.colorPicker.selectedColor
            
            guard let color = color else { print("User did not select color"); return }
            
            wireFrame?.navigateBackWithColor(color: color)
        }
    }
}

extension ColorPresenter: ColorInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
