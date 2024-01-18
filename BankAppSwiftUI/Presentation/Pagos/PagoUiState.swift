//
//  PagoUiState.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 8/01/24.
//

import Foundation

enum PagoUiState {
    
    case inicial
    case cargando
    case error(String)
    case success([Servicio])
    
}
