//
//  PagosDeServicioView.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 9/01/24.
//

import Foundation
import SwiftUI

internal func pagosDeServicioView(onClickInSitioWeb: @escaping () -> Void) -> some View {
    Button(
        action: {
            onClickInSitioWeb()
        }
    ) {
        ZStack {
            // Gradiente como fondo del botón (tarjeta)
            LinearGradient(gradient: Gradient(colors: [Color.white, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .mask(RoundedRectangle(cornerRadius: 12))
                .frame(width: 360, height: 60)
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 0)
            
            HStack(alignment: .center) {
                Text("Pagar servicios")
                    .font(Fonts.Inter.medium.swiftUIFont(size: 14))
                    .foregroundColor(Asset.Colores.metallic.swiftUIColor)
                
                Spacer()
                Image(systemName: "play.fill")
                    .foregroundColor(Asset.Colores.metallic.swiftUIColor)
            }
            .frame(width: 320, height: 40)
            .background(Color.clear)
            .foregroundColor(Color.black)
            .cornerRadius(12)
        }
    }
}
