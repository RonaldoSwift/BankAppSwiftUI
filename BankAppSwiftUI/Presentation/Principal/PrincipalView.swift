//
//  PrincipalView.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 20/12/23.
//

import SwiftUI

struct PrincipalView: View {
    //1
    @ObservedObject var consultasRouter: ConsultasRouter = ConsultasRouter()
    //2
    @ObservedObject var transferenciaAOtraCuentaRouter: TransferenciaAOtraCuentaRouter = TransferenciaAOtraCuentaRouter()
    
    //3
    @ObservedObject var pagosRouter: PagosRouter = PagosRouter()
    
    //4
    @ObservedObject var prestamosRouter: PrestamosRouter = PrestamosRouter()
    
    @StateObject private var principalViewModel = PrincipalViewModel(
        loginRepository: LoginRepository(
            memoriaLogin: MemoriaLogin(),
            bankApi: BankApi(),
            bankGRDB: BankGRDB()
        )
    )
    
    var body: some View {
        TabView {
            // 1
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
            
            // 2
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
            
            // 3
            NavigationStack(path: $pagosRouter.navPath) {
                ZStack(content: {
                    PagosView()
                    
                        .navigationDestination(for: PagosRouter.Destination.self, destination: { destination in
                            switch (destination) {
                            case .web:
                                IrAWebView()
                            case .pagarServicio:
                                PagarServicioView()
                            }
                        })
                })
            }
            .environmentObject(pagosRouter)
            .tabItem {
                Label("Pagos", systemImage: "dollarsign.arrow.circlepath")
            }
            
            //4
            PrestamosView()
                .tabItem {
                    Label("Prestamos", systemImage: "dollarsign.circle")
                }
            
            //5
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
