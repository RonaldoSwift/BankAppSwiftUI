//
//  PagarServicioView.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 20/12/23.
//

import SwiftUI

struct ServiciosView: View {
    
    @State private var mostrarProgresView : Bool = false
    @State private var mostrarTextos : Bool = false
    @State private var serviciosDeVista : [Servicio] = []
    @State private var textoDeError : String = ""
    @State private var mostrarAlerta : Bool = false
    @EnvironmentObject var pagosRouter: PagosRouter
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @StateObject private var pagosViewModel = PagosViewModel(
        servicesRepository: ServicesRepository(bankApi: BankApi()),
        loginRepository: LoginRepository(
            memoriaLogin: MemoriaLogin(),
            bankApi: BankApi(),
            bankGRDB: BankGRDB()
        )
    )
    
    var body: some View {
        ScrollView {
            VStack {
                if(mostrarTextos == true) {
                    Text(L10n.Register.Modal.ServicioQueDesea.text)
                        .font(Fonts.Inter.extraBold.swiftUIFont(size: 27))
                        .foregroundColor(Asset.Colores.green800.swiftUIColor)
                        .multilineTextAlignment(.center)
                    LazyVGrid(columns: columns, spacing: 5) {
                        ForEach(serviciosDeVista, id: \.id) { servicio in
                            Button {
                                pagosRouter.navigate(to: PagosRouter.Destination.pagarServicio)
                            } label: {
                                ZStack {
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color.white, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                    .mask(RoundedRectangle(cornerRadius: 12))
                                    .frame(width: 160, height: 130)
                                    .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 0)
                                    VStack {
                                        if(servicio.id == 100) {
                                            Asset.Imagenes.calendar.swiftUIImage
                                                .resizable()
                                                .frame(width: 60, height: 60)
                                                .foregroundColor(Asset.Colores.yellow500.swiftUIColor)
                                            
                                        } else if (servicio.id == 101) {
                                            Asset.Imagenes.light.swiftUIImage
                                                .resizable()
                                                .frame(width: 60, height: 60)
                                                .foregroundColor(Asset.Colores.yellow500.swiftUIColor)
                                        } else if (servicio.id == 102) {
                                            Asset.Imagenes.calendar.swiftUIImage
                                                .resizable()
                                                .frame(width: 60, height: 60)
                                                .foregroundColor(Asset.Colores.yellow500.swiftUIColor)
                                        } else if (servicio.id == 103) {
                                            Asset.Imagenes.calendar.swiftUIImage
                                                .resizable()
                                                .frame(width: 60, height: 60)
                                                .foregroundColor(Asset.Colores.yellow500.swiftUIColor)
                                        } else if (servicio.id == 104) {
                                            Asset.Imagenes.phone.swiftUIImage
                                                .resizable()
                                                .frame(width: 60, height: 60)
                                                .foregroundColor(Asset.Colores.yellow500.swiftUIColor)
                                        }
                                        
                                        Text(servicio.name)
                                            .font(Fonts.Inter.bold.swiftUIFont(size: 15))
                                            .foregroundColor(Color.black)
                                    }
                                    .frame(width: 200, height: 100)
                                    .background(Color.clear)
                                    .foregroundColor(Color.black)
                                    .cornerRadius(12)
                                }
                            }
                        }
                    }
                }
                
                if(mostrarProgresView == true) {
                    ProgressView()
                }
            }
            
            .alert(textoDeError, isPresented: $mostrarAlerta) {
                Button("OK", role: .cancel) {
                    
                }
            }
            .onAppear {
                pagosViewModel.starService()
            }
            .onReceive(pagosViewModel.$pagoUiState) { pagoUiState in
                switch pagoUiState {
                case .cargando:
                    mostrarProgresView = true
                case .inicial:
                    break
                case .error(let error):
                    mostrarProgresView = false
                    mostrarAlerta = true
                    textoDeError = error
                case .success(let servicios):
                    mostrarProgresView = false
                    mostrarTextos = true
                    serviciosDeVista = servicios
                }
            }
        }
        .toolbar(content: {
            TextToolbarContent(title: "Pagar Servicios")
        })
        .navigationBarBackButtonHidden(true)
        
    }
}

#Preview {
    ServiciosView()
}
