//
//  ParaTiRouter.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 26/01/24.
//

import Foundation
import SwiftUI

final class ParaTiRouter: ObservableObject {
    
    public enum Destination: Codable, Hashable {
        case ahorrar
        case seguros
        case venderMas
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
