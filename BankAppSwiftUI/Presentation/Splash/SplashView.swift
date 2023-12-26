//
//  SplashView.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 15/12/23.
//

import SwiftUI

struct SplashView: View {
    
    @EnvironmentObject private var appRootManager: AppRootManager
    @EnvironmentObject var router: AuthenticationRouter
    
    var body: some View {
        ZStack{
            Color.green.edgesIgnoringSafeArea(.all)
            Image("LogoPrincipal")
                .resizable()
                .scaledToFill()
                .frame(width: 100,height: 100)
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation(.spring) {
                    appRootManager.currentRoot = .authentication
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
