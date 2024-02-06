//
//  SeguroCeldaView.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 1/02/24.
//

import Foundation
import SwiftUI

internal func seguroCeldaView() -> some View {
    VStack {
        HStack {
            Asset.Imagenes.seguroVenta.swiftUIImage
                .resizable()
                .frame(width: 60,height: 60)
            
            VStack(alignment: .leading) {
                Text("Seguro de venta del dia protegida")
                    .font(Fonts.Inter.extraBold.swiftUIFont(size: 25))
                    .foregroundColor(Asset.Colores.black900.swiftUIColor)
                    
                Text("Asegura tu negocio contra robos por asalto desde S/3.00 (inc IGV) al mes.")
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
            Asset.Imagenes.seguroSoat.swiftUIImage
                .resizable()
                .frame(width: 60,height: 60)
            
            VStack(alignment: .leading) {
                Text("Seguro SOAT")
                    .font(Fonts.Inter.extraBold.swiftUIFont(size: 25))
                    .foregroundColor(Asset.Colores.black900.swiftUIColor)
                Text("Segura tu auto particular, carga o taxi desdde S/52.00 (inc IGV)")
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
            Asset.Imagenes.seguroFlex.swiftUIImage
                .resizable()
                .frame(width: 60,height: 60)
            
            VStack(alignment: .leading) {
                Text("Seguro Hogar Flex")
                    .font(Fonts.Inter.extraBold.swiftUIFont(size: 25))
                    .foregroundColor(Asset.Colores.black900.swiftUIColor)
                Text("Asegura tu departamento, casa o cosas desde S/ 15.20 (inc IGV) al mes")
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
            Asset.Imagenes.seguroVidaDevolucion.swiftUIImage
                .resizable()
                .frame(width: 60,height: 60)
            
            VStack(alignment: .leading) {
                Text("Seguro Vida Devolucion")
                    .font(Fonts.Inter.extraBold.swiftUIFont(size: 25))
                    .foregroundColor(Asset.Colores.black900.swiftUIColor)
                Text("Asegura tu vida y tu familia desde S/ 39.00 (inc IGV) al mes.")
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
