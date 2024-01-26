//
//  PrestamosRouter.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 5/01/24.
//

import Foundation
import SwiftUI

final class PrestamosRouter: ObservableObject {
    
    public enum Destination: Codable, Hashable {
        case agenciaMasSercana
        case tiposDePrestamo
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
