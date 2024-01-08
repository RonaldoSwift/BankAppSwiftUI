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
    
    let recetasGRDBDataSource = BankGRDB()

    var body: some Scene {
        WindowGroup {
            Group {
                switch appRootManager.currentRoot {
                case .splash:
                    PrincipalRootView()
                    
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
        initGRDB()
        enableVisualNetworkRequests()
        enableVisualTouchesOnDebug()
    }
}

extension BankAppSwiftUIApp {

    private func initGRDB() {
        // llamas ala funcion iOS16 y iOS14
        if #available(iOS 16, *) {
            recetasGRDBDataSource.inicializadorBaseDeDatosiOS16()
        } else {
            recetasGRDBDataSource.inicializadorBaseDeDatosiOS14()
        }
        recetasGRDBDataSource.crearTableDeReceta()
    }
    
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
