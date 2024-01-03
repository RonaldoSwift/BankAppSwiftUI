//
//  LoginButton.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 27/12/23.
//

import Foundation
import SwiftUI

@ViewBuilder
func loginButton(clickbutton: @escaping () -> Void, titulo: String, colorButton: Color,mostrarLoading: Bool) -> some View {
    ZStack {
        Button(action: {
            clickbutton()
        }, label: {
            Text(titulo)
                .padding(.horizontal, 50) // Agrega un padding horizontal mayor
                .padding(.vertical, 15)
                .foregroundColor(Color.white)
                .background(colorButton)
                .cornerRadius(30)
                .frame(width: 200)
        })
        if(mostrarLoading == true) {
            ProgressView()
        }
    }
    .frame(maxWidth: .infinity,maxHeight: 64)
}
