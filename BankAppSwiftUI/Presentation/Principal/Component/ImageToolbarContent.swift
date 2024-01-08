//
//  BankToolbarContent.swift
//  BankAppSwiftUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 7/01/24.
//

import Foundation
import SwiftUI

struct ImageToolbarContent: ToolbarContent {
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .principal) {
            Asset.Imagenes.logoPrincipal.swiftUIImage
                .resizable()
                .scaledToFit()
                .frame(width: 30)
        }
        ToolbarItem(placement: .navigationBarTrailing) {
            Menu {
                Button(action: {print("option A")}, label: {Label("My option A", systemImage: "folder.badge.plus")})
                Button(action: {print("option B")}, label: {Label("My option B", systemImage: "doc.badge.plus")})
            } label: {
                Asset.Imagenes.threeDots.swiftUIImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                    .foregroundColor(Asset.Colores.metallic.swiftUIColor)
            }
        }
    }
}
