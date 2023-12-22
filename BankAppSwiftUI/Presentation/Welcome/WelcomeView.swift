//
//  WelcomeView.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 18/12/23.
//

import SwiftUI

struct WelcomeView: View {
    
    var body: some View {
        NavigationView{
            VStack(spacing: 35){
                Asset.Imagenes.logoWelcom.swiftUIImage
                
                nextButtton()
                nextButtton2()
                
                HStack(spacing: 113){
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
        }
    }
}

#Preview {
    WelcomeView()
}
