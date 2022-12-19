//
//  TextFieldsViewModel.swift
//  CoordinatorPattern
//
//  Created by Gabriel Castillo Serafim on 7/12/22.
//

import Foundation
import Combine

class TextFieldsViewModel {
    
    static let shared = TextFieldsViewModel()
    
    @Published var name = ""
    @Published var email = ""
    
    
}
