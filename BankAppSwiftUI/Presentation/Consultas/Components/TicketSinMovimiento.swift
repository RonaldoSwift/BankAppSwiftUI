//
//  TicketSinMovimiento.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 30/12/23.
//

import Foundation
import SwiftUI

internal func ticketSinMovimiento() -> some View {
    Button(
        action: {
            // Acción al presionar el botón (tarjeta)
            print("Botón presionado")
        }
    ) {
        ZStack {
            // Gradiente como fondo del botón (tarjeta)
            LinearGradient(gradient: Gradient(colors: [Color.white, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .mask(RoundedRectangle(cornerRadius: 12))
                .frame(width: 360, height: 90)
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 0)
            
            Text("No tienes movimientos aun: ")
                .font(Fonts.Inter.light.swiftUIFont(size: 15))
            
                .frame(width: 340, height: 100)
                .background(Color.clear)
                .foregroundColor(Color.black)
                .cornerRadius(12)
        }
    }
}
