//
//  ConsultaSheetView.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 30/12/23.
//

import Foundation
import SwiftUI

@ViewBuilder
func consultaSheetView(onClickEntendido: @escaping () -> Void) -> some View {
    VStack {
        Asset.Imagenes.sugerencia.swiftUIImage
            .resizable()
            .frame(width: 60,height: 60)
        
        Text("Hola Ca**** Le****** Ca****")
            .foregroundColor(Asset.Colores.greenbutton.swiftUIColor)
            .font(Fonts.Inter.bold.swiftUIFont(size: 21))
        Text("Tu numero de cel es?")
            .foregroundColor(Asset.Colores.metallic.swiftUIColor)
        
        Text("******89")
            .font(Fonts.Inter.medium.swiftUIFont(size: 15))
            .foregroundColor(Color.black)
        
        Text("Si ya no es tu numero, acercate a una de nuestras agencias y actualizalo de lo contrario no podras realizar algunas operaciones de la App.")
            .font(Fonts.Inter.medium.swiftUIFont(size: 15))
            .foregroundColor(Asset.Colores.metallic.swiftUIColor)
        
        Button {
            onClickEntendido()
        } label: {
            Text("Entendido")
                .padding(.horizontal, 50) // Aumenta el padding horizontal
                .padding(.vertical, 15)
                .foregroundColor(Color.white)
                .background(Asset.Colores.greenbutton.swiftUIColor)
                .cornerRadius(30)
                .frame(width: 240)
        }
    }
}
