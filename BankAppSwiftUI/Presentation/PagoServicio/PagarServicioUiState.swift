//
//  PagarServicioUiState.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 18/01/24.
//

import Foundation

enum PagarServicioUiState {
    
    case inicial
    case cargando
    case error(String)
    case success([Supplier])
    
}
