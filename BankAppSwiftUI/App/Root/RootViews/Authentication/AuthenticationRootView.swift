//
//  AppView.swift
//  BankAppSwiftUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 24/12/23.
//

import SwiftUI

struct AuthenticationRootView: View {
    
    @ObservedObject var router: AuthenticationRouter = AuthenticationRouter()
    
    var body: some View {
        NavigationStack(path: $router.navPath) {
            ZStack(content: {
                WelcomeView()
                    .navigationDestination(for: AuthenticationRouter.Destination.self, destination: { destination in
                        switch (destination) {
                        case .register(let owner):
                            RegisterView()
                        case .login:
                            LoginView()
                        }
                    })
            })
        }
        .environmentObject(router)
    }
}

#Preview {
    AuthenticationRootView()
}
