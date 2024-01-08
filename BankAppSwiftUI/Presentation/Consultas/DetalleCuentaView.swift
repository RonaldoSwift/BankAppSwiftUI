//
//  DetalleCuentaView.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 28/12/23.
//

import SwiftUI

struct DetalleCuentaView: View {
    var body: some View {
        VStack {
                        
            ticketAhorro()
            
            ticketCuentaYInterbancaria()
            
            HStack {
                Text("Mis ultimos movimientos")
                    .font(Fonts.Inter.bold.swiftUIFont(size: 20))
                    .foregroundColor(Asset.Colores.greenbutton.swiftUIColor)
                    .multilineTextAlignment(.center)
                Spacer()
            }
            
            ticketSinMovimiento()
            
            Spacer()
        }
        .padding()
        .toolbar(content: {
            TextToolbarContent(title: "Detalle de cuenta")
        })
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    DetalleCuentaView()
}
