//
//  NextButtonView.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 21/12/23.
//

import Foundation
import SwiftUI

internal func nextButtton(onClick: @escaping () -> Void) -> some View {
    
    VStack {
        Text("¿Primera vez que ingresas?")
            .font(.custom("Inter-ExtraBold", size: 18))
        
        Button(action: {
            onClick()
        }, label: {
            HStack {
                Image(systemName: "iphone.gen1")
                Text("Registrate aqui")
                    .font(Fonts.Inter.extraBold.swiftUIFont(size: 32))
                Image(systemName: "arrowtriangle.right.fill")
            }
            .padding()
            .foregroundColor(Color.white)
            .background(Color.orange)
            .cornerRadius(20)
        })
    }
}

internal func nextButtton2(onLoginClick: @escaping () -> Void) -> some View{
    VStack{
        Text("¿Ya te has registrado?")
            .font(.custom("Inter-ExtraBold", size: 18))
        
        
        HStack{
            Text("Ingresa Aqui")
                .font(.custom("Inter-ExtraBold", size: 15))
            Image(systemName: "arrowtriangle.right.fill")
            
        }
        .padding()
        .foregroundColor(Asset.Colores.greenbutton.swiftUIColor)
        .overlay(
            Capsule().stroke(lineWidth: 2)
                .foregroundColor(Color("Greenbutton"))
        )
        .onTapGesture {
            onLoginClick()
        }
    }
}


internal func nextServicio(imageTab: String, texto:String, imageNext: String) -> some View{
    HStack{
        Button(action: {}, label: {
            Image(systemName: imageTab)
            Text(texto)
            Image(systemName: imageNext)
            
        })
        .font(.custom("Inter-ExtraBold", size: 15))
        .foregroundColor(Color("Metallic"))
    }
}

