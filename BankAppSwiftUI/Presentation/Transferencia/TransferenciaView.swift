//
//  TransferenciaView.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 20/12/23.
//

import SwiftUI

struct TransferenciaView: View {
    
    @EnvironmentObject var transferenciaAOtraCuentaRouter: TransferenciaAOtraCuentaRouter
    
    @State private var showingAlert = true
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: OtrasCuentasView()) {
                    Text("A otras cuentas de MiBanco")
                }
                
                NavigationLink(destination: Text("Contenido de la celda 2")) {
                    HStack {
                        Text("A otros bancos")
                        Text("Sin comiciones")
                            .foregroundColor(Color.yellow)
                    }
                }
            }
            .navigationTitle("Transferencias")
        }
        .alert(isPresented: $showingAlert) {
            Alert(
                title: Text("Transefrencia a otros bancos"),
                message: Text("Esta operacion esta disponible por la App, de lunes a viernes de 6:00 am a 8:30 pm, excepto los sabados, domingos y feriados."),
                dismissButton: .default(
                    Text("Entendido"),
                    action: {
                        // Acción al presionar el botón "Entendido"
                    }
                )
            )
        }
    }
}

#Preview {
    TransferenciaView()
}
