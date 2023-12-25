//
//  WelcomeView.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 18/12/23.
//

import SwiftUI

struct WelcomeView: View {
        
    @Environment(\.presentationMode) var presentationMode // se usa para cerrar el view donde nos encontramos, no para modales
    @EnvironmentObject var router: AuthenticationRouter
    
    @State var showSheet = false
    
    var body: some View {
        VStack(spacing: 35) {
            Asset.Imagenes.logoWelcom.swiftUIImage
            
            nextButtton {
                showSheet.toggle()
            }
            nextButtton2(
                onLoginClick: {
                    router.navigate(to: AuthenticationRouter.Destination.login)
                }
            )
            
            HStack(spacing: 113) {
                nextServicio(
                    imageTab: "mappin",
                    texto: "Ubicanos",
                    imageNext: "arrowtriangle.right.fill"
                )
                
                nextServicio(
                    imageTab: "phone",
                    texto: "Llamanos",
                    imageNext: "arrowtriangle.right.fill"
                )
            }
            .padding()
        }
        .sheet(isPresented: $showSheet, content: {
            registerSheetView(
                onClickRegisterDNI: {
                    showSheet = false
                    router.navigate(to: AuthenticationRouter.Destination.register(owner: ""))
                }, onClickRegisterCard: {
                    
                }
            )
            .presentationDetents([.height(200), .large])
        })
    }
}

#Preview {
    WelcomeView()
}
