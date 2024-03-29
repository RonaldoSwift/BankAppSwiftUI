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
    @ObservedObject var pagosRouter: PagosRouter = PagosRouter()
    @ObservedObject var prestamosRouter: PrestamosRouter = PrestamosRouter()
    @ObservedObject var paraTiRouter: ParaTiRouter = ParaTiRouter()
    
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
                            case .serviciosView:
                                ServiciosView()
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
            
            // 4
            NavigationStack(path: $prestamosRouter.navPath) {
                ZStack {
                    PrestamosView()
                        .navigationDestination(for: PrestamosRouter.Destination.self, destination: { destination in
                            switch(destination) {
                            case .agenciaMasSercana:
                                AgenciaSercanaView()
                            case .tiposDePrestamo:
                                TipoPrestamo()
                            }
                        })
                }
            }
            .environmentObject(prestamosRouter)
            .tabItem {
                Label("Prestamos", systemImage: "dollarsign.circle")
            }
            
            // 5
            NavigationStack(path: $paraTiRouter.navPath) {
                ZStack {
                    ParaTiView()
                        .navigationDestination(for: ParaTiRouter.Destination.self, destination: { destination in
                            switch(destination) {
                            case .ahorrar:
                                AgenciaSercanaView()
                            case .seguros:
                                AgenciaSercanaView()
                            case .venderMas:
                                AgenciaSercanaView()
                            }
                        })
                }
            }
            .tabItem {
                Label("Para Ti", systemImage: "heart")
            }
        }
    }
}

#Preview {
    PrincipalView()
}
