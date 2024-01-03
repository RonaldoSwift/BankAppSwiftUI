//
//  PrimaryButtonStyle.swift
//  BankAppSwiftUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 31/12/23.
//

import Foundation
import SwiftUI

public struct PrimaryButtonStyle: ButtonStyle {
    
    private static let backgroundColor = Asset.Colores.greenbutton.swiftUIColor
    private static let selectedBackgroundColor = Asset.Colores.metallic.swiftUIColor.opacity(0.5)
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .font(Fonts.Inter.medium.swiftUIFont(size: 18))
            .padding(.horizontal, 50)
            .padding(.vertical, 15)
            .background(
                configuration.isPressed ? Self.selectedBackgroundColor : Self.backgroundColor
            )
            .cornerRadius(30)
            .foregroundColor(Color.white)
    }
}
