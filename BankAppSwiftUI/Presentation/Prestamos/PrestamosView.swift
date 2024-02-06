//
//  PrestamosView.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 20/12/23.
//

import SwiftUI

struct PrestamosView: View {
    
    @EnvironmentObject var prestamosRouter: PrestamosRouter
    @State var showSheet = false
    
    var body: some View {
        VStack(spacing: 10) {
            VStack {
                Text("¿Necesitas un")
                    .font(Fonts.Inter.extraBold.swiftUIFont(size: 25))
                    .foregroundColor(Asset.Colores.greenbutton.swiftUIColor)
                    .multilineTextAlignment(.center)
                
                Text("prestamo?")
                    .font(Fonts.Inter.extraBold.swiftUIFont(size: 25))
                    .foregroundColor(Asset.Colores.greenbutton.swiftUIColor)
                    .multilineTextAlignment(.center)
            }
            
            Text("Solicitalo facilmente llamando a tu asesor de negocios, o acercandote a una agencia de Mibanco.")
                .font(Fonts.Inter.medium.swiftUIFont(size: 14))
                .foregroundColor(Asset.Colores.metallic.swiftUIColor)
                .multilineTextAlignment(.center)

            agenciaSercana {
                prestamosRouter.navigate(to: PrestamosRouter.Destination.agenciaMasSercana)
            }
             
            tipoDePrestamo {
                prestamosRouter.navigate(to: PrestamosRouter.Destination.tiposDePrestamo)
            }
        }
        .padding()
        .toolbar(content: {
            TextToolbarContent(title: "Prestamos")
        })
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    PrestamosView()
}
