//
//  ParaTiView.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 20/12/23.
//

import SwiftUI

struct ParaTiView: View {
    
    @EnvironmentObject var paraTiRouter: ParaTiRouter
    @State private var aparecer1: Bool = true
    @State private var aparecer2: Bool = false
    @State private var estadoNuevo3: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Ca****")
                        .font(Fonts.Inter.extraBold.swiftUIFont(size: 25))
                        .foregroundColor(Asset.Colores.greenbutton.swiftUIColor)
                    Text("Pensando en ti hemos creado estas opciones")
                        .font(Fonts.Inter.medium.swiftUIFont(size: 14))
                        .foregroundColor(Asset.Colores.metallic.swiftUIColor)
                }
                Spacer()
                Asset.Imagenes.vendedor.swiftUIImage
                    .resizable()
                    .frame(width: 70,height: 80)
            }
            
            HStack(spacing: 40) {
                Button(action: {
                    aparecer1 = true
                    aparecer2 = false
                    estadoNuevo3 = false
                }, label: {
                    VStack {
                        Asset.Imagenes.ahorroDinero.swiftUIImage
                            .resizable()
                            .frame(width: 50,height: 40)
                            .foregroundColor(Asset.Colores.metallic.swiftUIColor)
                        Text("Ahorrar")
                            .font(Fonts.Inter.medium.swiftUIFont(size: 16))
                            .foregroundColor(Asset.Colores.metallic.swiftUIColor)
                    }
                })
                
                Button(action: {
                    aparecer2 = true
                    aparecer1 = false
                    estadoNuevo3 = false
                }, label: {
                    VStack {
                        Asset.Imagenes.seguro.swiftUIImage
                            .resizable()
                            .frame(width: 50,height: 40)
                            .foregroundColor(Asset.Colores.metallic.swiftUIColor)
                        Text("Seguros")
                            .font(Fonts.Inter.medium.swiftUIFont(size: 16))
                            .foregroundColor(Asset.Colores.metallic.swiftUIColor)
                    }
                })
                
                Button(action: {
                    estadoNuevo3 = true
                    aparecer1 = false
                    aparecer2 = false
                }, label: {
                    VStack {
                        Asset.Imagenes.venderMas.swiftUIImage
                            .resizable()
                            .frame(width: 50,height: 40)
                            .foregroundColor(Asset.Colores.metallic.swiftUIColor)
                        Text("Vender mas")
                            .font(Fonts.Inter.medium.swiftUIFont(size: 16))
                            .foregroundColor(Asset.Colores.metallic.swiftUIColor)
                    }
                })
            }
            
            if(aparecer1 == true) {
                ahorrarCeldaView()
            }
            
            if(aparecer2 == true) {
                ScrollView {
                    seguroCeldaView()
                }
            }
            
            if(estadoNuevo3 == true) {
                bankAppSwiftUI()
            }
            
            Spacer()
        }
        .padding()
        .toolbar(content: {
            TextToolbarContent(title: "Para ti")
        })
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ParaTiView()
}
