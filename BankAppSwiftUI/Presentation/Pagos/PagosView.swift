//
//  PagosView.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 20/12/23.
//

import SwiftUI

struct PagosView: View {
    
    @EnvironmentObject var pagosRouter: PagosRouter
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Prestamos")
                .font(Fonts.Inter.extraBold.swiftUIFont(size: 22))
                .foregroundColor(Asset.Colores.greenbutton.swiftUIColor)
            
            pagosWebView {
                pagosRouter.navigate(to: PagosRouter.Destination.web)
            }
            
            Text("Otros Pagos")
                .font(Fonts.Inter.extraBold.swiftUIFont(size: 22))
                .foregroundColor(Asset.Colores.greenbutton.swiftUIColor)
            
            pagosDeServicioView {
                pagosRouter.navigate(to: PagosRouter.Destination.pagarServicio)
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    PagosView()
}
