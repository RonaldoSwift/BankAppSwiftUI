//
//  PagosRouter.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 16/01/24.
//

import Foundation
import SwiftUI

final class PagosRouter: ObservableObject {
    
    public enum Destination: Codable, Hashable {
        case web
        case serviciosView
        case pagarServicio
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
