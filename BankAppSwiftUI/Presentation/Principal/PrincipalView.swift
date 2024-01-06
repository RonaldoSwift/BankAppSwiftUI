//
//  PrincipalView.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 20/12/23.
//

import SwiftUI

struct PrincipalView: View {
    
    @ObservedObject var consultasRouter: ConsultasRouter = ConsultasRouter()
    @ObservedObject var transferenciaAOtraCuentaRouter: TransferenciaAOtraCuentaRouter = TransferenciaAOtraCuentaRouter()
    @ObservedObject var prestamosRouter: PrestamosRouter = PrestamosRouter()
    
    var body: some View {
        TabView {
            //1
            NavigationStack(path: $consultasRouter.navPath) {
                ZStack(content: {
                    ConsultasView()
                    
                        .navigationDestination(for: ConsultasRouter.Destination.self, destination: { destination in
                            switch (destination) {
                            case .detalleCuenta:
                                DetalleCuentaView()
                            }
                        })
                })
            }
            .environmentObject(consultasRouter)
            .tabItem {
                Label("Consultas", systemImage: "magnifyingglass")
            }
            
            //2
            NavigationStack(path: $transferenciaAOtraCuentaRouter.navPath) {
                ZStack(content: {
                    TransferenciaView()
                    
                        .navigationDestination(for: ConsultasRouter.Destination.self, destination: { destination in
                            switch (destination) {
                            case .detalleCuenta:
                                OtrasCuentasView()
                            }
                        })
                })
            }
            .environmentObject(transferenciaAOtraCuentaRouter)
            .tabItem {
                Label("Transferencia", systemImage: "arrowshape.left.arrowshape.right")
            }
            
            //3
            NavigationStack(path: $prestamosRouter.navPath) {
                ZStack(content: {
                    PagosView()
                    
                        .navigationDestination(for: ConsultasRouter.Destination.self, destination: { destination in
                            switch (destination) {
                            case .detalleCuenta:
                                OtrasCuentasView()
                            }
                        })
                })
            }
            .environmentObject(prestamosRouter)
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
