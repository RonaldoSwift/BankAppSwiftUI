//
//  VenderMasCeldaView.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 1/02/24.
//

import Foundation
import SwiftUI

internal func bankAppSwiftUI() -> some View {
    VStack {
        HStack {
            Asset.Imagenes.qulqi.swiftUIImage
                .resizable()
                .frame(width: 60,height: 60)
            
            VStack(alignment: .leading) {
                Text("Qulqi")
                    .font(Fonts.Inter.extraBold.swiftUIFont(size: 25))
                    .foregroundColor(Asset.Colores.black900.swiftUIColor)
                Text("No pierdas mas ventas y empieza a recivir pago scon tarjeta con el CulqiPOS")
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
            Asset.Imagenes.yape.swiftUIImage
                .resizable()
                .frame(width: 60,height: 60)
            
            VStack(alignment: .leading) {
                Text("Yape")
                    .font(Fonts.Inter.extraBold.swiftUIFont(size: 25))
                    .foregroundColor(Asset.Colores.black900.swiftUIColor)
                Text("Envia y recive pagos con yape usando solo tu celular. Sin efectivo!")
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
            Asset.Imagenes.yevo.swiftUIImage
                .resizable()
                .frame(width: 60,height: 60)
            
            VStack(alignment: .leading) {
                Text("Yevo")
                    .font(Fonts.Inter.extraBold.swiftUIFont(size: 25))
                    .foregroundColor(Asset.Colores.black900.swiftUIColor)
                Text("Digitaliza tu negocio Descubre las herramientas que Yevo tiene para ayudarte.")
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
