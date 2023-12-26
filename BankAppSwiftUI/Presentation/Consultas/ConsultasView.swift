//
//  ConsultasView.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 20/12/23.
//

import SwiftUI

struct ConsultasView: View {
    var body: some View {
        VStack {
            Text("Consulta!!!")
            NavigationLink(destination: DetalleDeCuentaView()) {
                Text("Ir a detalle Cuenta")
            }
        }
    }
}

#Preview {
    ConsultasView()
}
