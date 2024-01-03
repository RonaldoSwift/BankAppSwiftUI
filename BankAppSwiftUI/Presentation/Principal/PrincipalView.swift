//
//  PrincipalView.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 20/12/23.
//

import SwiftUI

struct PrincipalView: View {
    
    @ObservedObject var consultasRouter: ConsultasRouter = ConsultasRouter()
    
    var body: some View {
        TabView {
            
            NavigationStack(path: $consultasRouter.navPath) {
                ZStack(content: {
                    ConsultasView()
                        .tabItem {
                            Label("Consultas", systemImage: "magnifyingglass")
                        }        
                        .navigationDestination(for: ConsultasRouter.Destination.self, destination: { destination in
                            switch (destination) {
                            case .detalleCuenta:
                                DetalleCuentaView()
                            }
                        })
                })
            }
            .environmentObject(consultasRouter)
            
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
