//
//  TomaFotoView.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 21/12/23.
//

import Foundation
import SwiftUI

internal func tomaFoto(titulo: String, subtitulo:String, primerIcono: String) -> some View{
    Button(action: {
        // Acción al presionar el botón (tarjeta)
        print("Botón presionado")
    }) {
        ZStack {
            // Gradiente como fondo del botón (tarjeta)
            LinearGradient(gradient: Gradient(colors: [Color.white, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .mask(RoundedRectangle(cornerRadius: 12))
                .frame(width: 380, height: 100)
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 0)
            
            HStack(alignment: .center) {
                VStack(alignment: .leading){
                    Text(titulo)
                    Text(subtitulo)
                }
                Spacer()
                HStack(spacing: 20){
                    Image(systemName: primerIcono)
                    Image(systemName: "play.fill")
                }
                // TextField eliminado
            }
            .frame(width: 360, height: 80)
            .background(Color.clear)
            .foregroundColor(Color.black)
            .cornerRadius(12)
        }
    }
}
