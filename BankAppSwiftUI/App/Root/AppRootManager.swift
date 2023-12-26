//
//  AppRootManager.swift
//  BankAppSwiftUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 25/12/23.
//

import Foundation

final class AppRootManager: ObservableObject {
    
    @Published var currentRoot: AppRoots = .splash
    
    enum AppRoots {
        case splash
        case authentication
        case home
    }
}
