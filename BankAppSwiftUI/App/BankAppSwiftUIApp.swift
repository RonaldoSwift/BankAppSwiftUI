//
//  BankAppSwiftUIApp.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 15/12/23.
//

import SwiftUI
import netfox
import ShowTime

@main
struct BankAppSwiftUIApp: App {

    @StateObject private var appRootManager = AppRootManager()
    
    var body: some Scene {
        WindowGroup {
            Group {
                switch appRootManager.currentRoot {
                case .splash:
                    SplashRootView()
                    
                case .authentication:
                    AuthenticationRootView()
                    
                case .home:
                    PrincipalRootView()
                }
            }
            .environmentObject(appRootManager)
        }
    }
    
    init() {
        enableVisualNetworkRequests()
        enableVisualTouchesOnDebug()
    }
}

extension BankAppSwiftUIApp {
    
    private func enableVisualNetworkRequests() {
        #if DEBUG
        NFX.sharedInstance().start()
        #endif
    }
    
    private func enableVisualTouchesOnDebug() {
        #if DEBUG
        ShowTime.enabled = .debugOnly
        ShowTime.fillColor = .lightGray.withAlphaComponent(0.7)
        ShowTime.strokeColor = .lightGray
        ShowTime.strokeWidth = 1
        ShowTime.disappearDelay = 0.1
        #endif
    }
    
}
