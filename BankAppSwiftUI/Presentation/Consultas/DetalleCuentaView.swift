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
            
            Text("Detalle de la cuenta")
            
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
    }
}

#Preview {
    DetalleCuentaView()
}
