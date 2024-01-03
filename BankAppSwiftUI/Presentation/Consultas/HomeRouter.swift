//
//  HomeRouter.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 29/12/23.
//

import Foundation
import SwiftUI

final class ConsultasRouter: ObservableObject {
    
    public enum Destination: Codable, Hashable {
        case detalleCuenta
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
