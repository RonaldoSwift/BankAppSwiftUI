//
//  agenciaSercanaView.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 4/01/24.
//

import Foundation
import SwiftUI

internal func agenciaSercana(onClick: @escaping () -> Void) -> some View {
    Button(action: {
        onClick()
    }, label: {
        Text("Ubica tu agencia mas sercana                ")
            .font(Fonts.Inter.bold.swiftUIFont(size: 15))
                   .padding()
                   .foregroundColor(Color.white)
                   .background(Asset.Colores.greenbutton.swiftUIColor)
                   .cornerRadius(20)
    })
    .frame(maxWidth: .infinity)
}
