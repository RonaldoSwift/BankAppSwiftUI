//
//  TicketAhorro.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 29/12/23.
//

import Foundation
import SwiftUI

internal func ticketAhorro() -> some View {
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
                .frame(width: 390, height: 150)
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 0)
            
            HStack(alignment: .center) {
                VStack(alignment: .leading) {
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Full Ahorro Plus")
                            Text("(Soles)")
                        }
                        .font(Fonts.Inter.bold.swiftUIFont(size: 25))
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }, label: {
                            HStack {
                                Image(systemName: "pencil.line")
                                Text("Editar")
                            }
                            .frame(width: 80,height: 30)
                            .foregroundColor(Asset.Colores.greenbutton.swiftUIColor)
                            .overlay(
                                Capsule().stroke(lineWidth: 2)
                                    .foregroundColor(Color("Greenbutton"))
                            )
                            .onTapGesture {
                            }
                        })
                    }
                    
                    HStack {
                        Text("Saldo disponible")
                        Spacer()
                        Text("S/32.,863.11")
                    }
                    .foregroundColor(Asset.Colores.greenbutton.swiftUIColor)
                    .font(Fonts.Inter.bold.swiftUIFont(size: 18))
                    
                    HStack {
                        Text("Saldo contable")
                        Spacer()
                        Text("S/32.,863.11")
                    }
                    .font(Fonts.Inter.medium.swiftUIFont(size: 12))
                    
                }
            }
            .frame(width: 340, height: 130)
            .background(Color.clear)
            .foregroundColor(Color.black)
            .cornerRadius(12)
        }
    }
}
