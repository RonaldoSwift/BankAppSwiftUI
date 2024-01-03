//
//  TicketMonto.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 28/12/23.
//

import Foundation
import SwiftUI

internal func ticketMonto(titulo: String, 
                          montoDeDinero:String,
                          saldoDisponible: String,
                          onClickInDetalle: @escaping () -> Void) -> some View {
    Button(
        action: {
            onClickInDetalle()
        }
    ) {
        ZStack {
            // Gradiente como fondo del botón (tarjeta)
            LinearGradient(gradient: Gradient(colors: [Color.white, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .mask(RoundedRectangle(cornerRadius: 12))
                .frame(width: 360, height: 100)
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 0)
            
            HStack(alignment: .center) {
                VStack(alignment: .leading) {
                    Text(titulo)
                        .font(Fonts.Inter.light.swiftUIFont(size: 15))
                    HStack {
                        Text("$")
                        Text(montoDeDinero)
                            .font(Fonts.Inter.medium.swiftUIFont(size: 20))

                    }
                    Text(saldoDisponible)
                        .font(Fonts.Inter.light.swiftUIFont(size: 15))

                }
                Spacer()
                
                Image(systemName: "play.fill")
                    .foregroundColor(Asset.Colores.metallic.swiftUIColor)

            }
            .frame(width: 320, height: 80)
            .background(Color.clear)
            .foregroundColor(Color.black)
            .cornerRadius(12)
        }
    }
}
