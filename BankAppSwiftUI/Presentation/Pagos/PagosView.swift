//
//  PagosView.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 20/12/23.
//

import SwiftUI

struct PagosView: View {
    
    @EnvironmentObject var pagosRouter: PagosRouter
    @Environment(\.openURL) var openURL
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Prestamos")
                .font(Fonts.Inter.extraBold.swiftUIFont(size: 22))
                .foregroundColor(Asset.Colores.greenbutton.swiftUIColor)
            
            pagosWebView {
                openURL(URL(string: "https://www.mibanco.com.pe")!)
            }
            
            Text("Otros Pagos")
                .font(Fonts.Inter.extraBold.swiftUIFont(size: 22))
                .foregroundColor(Asset.Colores.greenbutton.swiftUIColor)
            
            pagosDeServicioView {
                pagosRouter.navigate(to: PagosRouter.Destination.serviciosView)
            }
            
            Spacer()
        }
        .padding()
        .toolbar(content: {
            TextToolbarContent(title: "Pagos")
        })
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    PagosView()
}
