//
//  UbicanosYLlamanosComponent.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 27/12/23.
//

import Foundation
import SwiftUI

func ubicanosYLlamanos(imageTab: String, texto:String, imageNext: String) -> some View {
    HStack {
        Button(action: {}, label: {
            Image(systemName: imageTab)
            Text(texto)
            Image(systemName: imageNext)
            
        })
        .font(Fonts.Inter.bold.swiftUIFont(size: 15))
        .foregroundColor(Color("Metallic"))
    }
}
