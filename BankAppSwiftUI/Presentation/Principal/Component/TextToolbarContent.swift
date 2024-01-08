//
//  TextToolbarContent.swift
//  BankAppSwiftUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 7/01/24.
//

import Foundation
import SwiftUI

struct TextToolbarContent: ToolbarContent {
    
    let title: String
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Asset.Imagenes.arrowBack.swiftUIImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25)
                    .foregroundColor(Asset.Colores.metallic.swiftUIColor)
            }
        }
        ToolbarItem(placement: .principal) {
            Text(title)
        }
        ToolbarItem(placement: .navigationBarTrailing) {
            Asset.Imagenes.threeDots.swiftUIImage
                .resizable()
                .scaledToFit()
                .frame(width: 30)
                .foregroundColor(Asset.Colores.metallic.swiftUIColor)
        }
    }
}
