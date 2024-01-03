//
//  TicketCuentaYInterbancaria.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 29/12/23.
//

import Foundation
import SwiftUI

internal func ticketCuentaYInterbancaria() -> some View {
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
                .frame(width: 360, height: 120)
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 0)
            
            HStack(alignment: .center) {
                VStack(alignment: .leading) {
                    Text("N de cuenta:")
                        .font(Fonts.Inter.light.swiftUIFont(size: 15))
                    
                    Text("6029811600")
                        .foregroundColor(Asset.Colores.metallic.swiftUIColor)
                        .font(Fonts.Inter.bold.swiftUIFont(size: 15))
                    
                    Text("N de cuenta interbancario (CCI):")
                        .font(Fonts.Inter.light.swiftUIFont(size: 15))

                    Text("04900100602981160019")
                        .foregroundColor(Asset.Colores.metallic.swiftUIColor)
                        .font(Fonts.Inter.bold.swiftUIFont(size: 15))
                    
                }
                Spacer()
                
                Image(systemName: "bonjour")
                    .foregroundColor(Asset.Colores.greenbutton.swiftUIColor)
                
                // TextField eliminado
            }
            .frame(width: 340, height: 100)
            .background(Color.clear)
            .foregroundColor(Color.black)
            .cornerRadius(12)
        }
    }
}
