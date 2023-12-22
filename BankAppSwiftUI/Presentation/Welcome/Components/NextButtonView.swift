//
//  NextButtonView.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 21/12/23.
//

import Foundation
import SwiftUI

internal func nextButtton() -> some View{
    VStack{
        Text("¿Primera vez que ingresas?")
            .font(.custom("Inter-ExtraBold", size: 18))
        
        NavigationLink(destination: ModalOptionView()){
            HStack{
                Image(systemName: "iphone.gen1")
                Text("Registrate aqui")
                    .font(.custom("Inter-ExtraBold", size: 15))
                Image(systemName: "arrowtriangle.right.fill")
            }
            .padding()
            .foregroundColor(Color.white)
            .background(Color.orange)
            .cornerRadius(20)
        }
    }
}

internal func nextButtton2() -> some View{
    VStack{
        Text("¿Ya te has registrado?")
            .font(.custom("Inter-ExtraBold", size: 18))
        
        NavigationLink(destination: ModalOptionView()){
            HStack{
                Text("Ingresa Aqui")
                    .font(.custom("Inter-ExtraBold", size: 15))
                Image(systemName: "arrowtriangle.right.fill")
                
            }
            .padding()
            .foregroundColor(Color("Greenbutton"))
            .overlay(
                Capsule().stroke(lineWidth: 2)
                    .foregroundColor(Color("Greenbutton"))
            )
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

