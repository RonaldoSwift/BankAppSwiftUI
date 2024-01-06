//
//  AlertAceptView.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 4/01/24.
//

import Foundation
import SwiftUI

@ViewBuilder
func alertAceptView(onClickEntendido: @escaping () -> Void) -> some View {
    VStack {
        Text("Transefrencia a otra bancos")
            .foregroundColor(Asset.Colores.mostaza.swiftUIColor)
            .font(Fonts.Inter.bold.swiftUIFont(size: 21))
        Text("Esta operacion esta disponible por la App, de lunes a viernes de 6:00 am a 8:30 pm, excepto los sabados, domingos y feriados.")
            .foregroundColor(Asset.Colores.metallic.swiftUIColor)

        Button(action: {
            onClickEntendido()
        }, label: {
            Text("Entendido")
                .padding(.horizontal, 50) // Aumenta el padding horizontal
                .padding(.vertical, 15)
                .foregroundColor(Color.white)
                .background(Asset.Colores.mostaza.swiftUIColor)
                .cornerRadius(30)
                .frame(width: 240)
        })
    }
    .padding()
}
