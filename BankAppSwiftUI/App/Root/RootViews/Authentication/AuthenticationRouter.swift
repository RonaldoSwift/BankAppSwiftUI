//
//  Router.swift
//  BankAppSwiftUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 25/12/23.
//

import Foundation
import SwiftUI

final class AuthenticationRouter: ObservableObject {
    
    public enum Destination: Codable, Hashable {
        case register(owner: String)
        case login
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
