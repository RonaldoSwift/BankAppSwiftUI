//
//  LoginView.swift
//  BankAppSwiftUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 25/12/23.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject private var appRootManager: AppRootManager
    
    var body: some View {
        Button("Ir a la pantalla principal") {
            appRootManager.currentRoot = .home
        }
    }
}

#Preview {
    LoginView()
}
