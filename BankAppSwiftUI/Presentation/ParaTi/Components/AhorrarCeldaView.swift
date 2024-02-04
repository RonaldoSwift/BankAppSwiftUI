//
//  AhorrarCeldaView.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 30/01/24.
//

import Foundation
import SwiftUI

internal func ahorrarCeldaView() -> some View {
    VStack {
        HStack {
            Asset.Imagenes.ahorroPlazoFijo.swiftUIImage
                .resizable()
                .frame(width: 60,height: 60)
            
            VStack(alignment: .leading) {
                Text("Abre un Plazo Fijo")
                    .font(Fonts.Inter.extraBold.swiftUIFont(size: 25))
                    .foregroundColor(Asset.Colores.black900.swiftUIColor)
                Text("Deposita tu plata por un tiempo determinado y, al final de ese periodo, !retira mas dinero!")
                    .font(Fonts.Inter.medium.swiftUIFont(size: 14))
                    .foregroundColor(Asset.Colores.metallic.swiftUIColor)
            }
            Spacer()
            Button {
                print("next!!!")
            } label: {
                Image(systemName: "play.fill")
                    .resizable()
                    .frame(width: 10,height: 10)
                    .foregroundColor(Asset.Colores.metallic.swiftUIColor)
            }
        }
        
        HStack {
            Asset.Imagenes.ahorroNegocios.swiftUIImage
                .resizable()
                .frame(width: 60,height: 60)
            
            VStack(alignment: .leading) {
                Text("Abre una cuenta Ahorro Negocios")
                    .font(Fonts.Inter.extraBold.swiftUIFont(size: 25))
                    .foregroundColor(Asset.Colores.black900.swiftUIColor)
                Text("En solo un minuto, abre aqui tu cuenta Ahorro Negocios cero costos.")
                    .font(Fonts.Inter.medium.swiftUIFont(size: 14))
                    .foregroundColor(Asset.Colores.metallic.swiftUIColor)
            }
            Spacer()
            Button {
                print("next!!!")
            } label: {
                Image(systemName: "play.fill")
                    .resizable()
                    .frame(width: 10,height: 10)
                    .foregroundColor(Asset.Colores.metallic.swiftUIColor)

            }
        }
    }
    .padding()
}
