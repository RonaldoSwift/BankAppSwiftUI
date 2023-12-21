//
//  PrincipalView.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 20/12/23.
//

import SwiftUI

struct PrincipalView: View {
    var body: some View {
        TabView {
            ConsultasView()
                .tabItem {
                    Label("Consultas", systemImage: "magnifyingglass")
                }
            
            TransferenciaView()
                .tabItem {
                    Label("Transferencia", systemImage: "arrowshape.left.arrowshape.right")
                }
            
            PagosView()
                .tabItem {
                    Label("Pagos", systemImage: "dollarsign.arrow.circlepath")
                }
            
            PrestamosView()
                .tabItem {
                    Label("Prestamos", systemImage: "dollarsign.circle")
                }
            
            ParaTiView()
                .tabItem {
                    Label("Para Ti", systemImage: "heart")
                }
            
        }
    }
}

#Preview {
    PrincipalView()
}
