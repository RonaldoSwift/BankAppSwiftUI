//
//  PagosView.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 20/12/23.
//

import SwiftUI

struct PagosView: View {
    var body: some View {
        VStack{
            Text("Pantalla Pagos View")
            
            NavigationLink(destination: BancaInternetView()){
                Text("Ir a pantalla Banca por internet")
            }
            
            NavigationLink(destination: PagarServicioView()){
                Text("Ir Pantalla Pagos de servicio")
            }
        }
    }
}

#Preview {
    PagosView()
}
