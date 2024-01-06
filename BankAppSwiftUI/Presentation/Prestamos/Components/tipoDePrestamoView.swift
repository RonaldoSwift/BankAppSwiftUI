//
//  tipoDePrestamoView.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 4/01/24.
//

import Foundation
import SwiftUI

internal func tipoDePrestamo(onLoginClick: @escaping () -> Void) -> some View {
    Text("Conoce nuestros tipos de prestamo")
        .font(.custom("Inter-ExtraBold", size: 15))
        .padding()
        .foregroundColor(Asset.Colores.greenbutton.swiftUIColor)
        .overlay(
            Capsule().stroke(lineWidth: 2)
                .foregroundColor(Asset.Colores.greenbutton.swiftUIColor)
        )
        .onTapGesture {
            onLoginClick()
        }
}
