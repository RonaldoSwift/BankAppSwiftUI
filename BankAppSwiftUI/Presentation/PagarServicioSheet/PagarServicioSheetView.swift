//
//  PagarServicioSheetView.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 19/01/24.
//

import Foundation
import SwiftUI

@MainActor
struct PagarServicioSheetView: View {
    
    var pagarServicioViewModel:PagarServicioViewModel
    @State private var suppliers: [String] = []
    @State private var isButtonCargando: Bool = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 40) {
                ForEach(suppliers, id: \.self) { supplier in
                    pagarServicioSheetOption(
                        name: supplier,
                        onClickOption: {
                            
                        })
                }
            }
            if(isButtonCargando) {
                ProgressView()
            }
        }
        .onAppear {
            pagarServicioViewModel.starService()
        }
        .onReceive(pagarServicioViewModel.$pagarServicioUiState, perform: { pagoDeServicioState in
            switch (pagoDeServicioState) {
            case .inicial:
                break
            case .cargando:
                isButtonCargando = true
                
            case .error(let error):
                print("Error \(error)")
            case .success(let suppliersSucces):
                suppliers = suppliersSucces.map({ supplier in
                    supplier.name
                })
                isButtonCargando = false
                
            }
            
        })
    }
}

@ViewBuilder
private func pagarServicioSheetOption(
    name: String,
    onClickOption: @escaping () -> Void
) -> some View {
    VStack(alignment: .center) {
        Text(name)
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 100))
            .multilineTextAlignment(.leading)
            .onTapGesture {
                onClickOption()
            }
    }
}
