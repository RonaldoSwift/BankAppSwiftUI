//
//  TransferenciaAOtraCuentaRouter.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 4/01/24.
//

import Foundation
import SwiftUI

final class TransferenciaAOtraCuentaRouter: ObservableObject {
    
    public enum Destination: Codable, Hashable {
        case transferenciaAOtraCuenta
    }
    
    @Published var navPath = NavigationPath()
    
    func navigate(to destination: Destination) {
        navPath.append(destination)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
