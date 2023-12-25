//
//  RegisterSheetView.swift
//  BankAppSwiftUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 24/12/23.
//

import Foundation
import SwiftUI

@ViewBuilder
func registerSheetView(
    onClickRegisterDNI: @escaping () -> Void,
    onClickRegisterCard: @escaping () -> Void
) -> some View {
    VStack(spacing: 20) {
        registerSheetOption(
            imageName: Asset.Imagenes.identityCard.name,
            name: L10n.Register.Modal.Dni.text,
            onClickOption: onClickRegisterDNI
        )
        registerSheetOption(
            imageName: Asset.Imagenes.creditCard.name,
            name: L10n.Register.Modal.Debit.text,
            onClickOption: onClickRegisterCard
        )
    }
    .padding(20)
}

@ViewBuilder
private func registerSheetOption(
    imageName: String,
    name: String,
    onClickOption: @escaping () -> Void
) -> some View {
    HStack(spacing: 10) {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(width: 32)
        
        Text(name)
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 140))
        
        Spacer()
        
        Asset.Imagenes.rightArrow.swiftUIImage
    }.onTapGesture {
        onClickOption()
    }
}
