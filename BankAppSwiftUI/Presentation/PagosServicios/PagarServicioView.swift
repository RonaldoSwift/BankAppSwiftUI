//
//  PagarServicioView.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 20/12/23.
//

import SwiftUI

struct PagarServicioView: View {
    
    @State private var mostrarProgresView : Bool = false
    @State private var mostrarTextos : Bool = false
    @State private var serviciosDeVista : [Servicio] = []
    @State private var textoDeError : String = ""
    @State private var mostrarAlerta : Bool = false
    
    @StateObject private var pagosViewModel = PagosViewModel(servicesRepository: ServicesRepository(
        bankApi: BankApi(),
        memoriaLogin: MemoriaLogin()
    )
    )
    
    var body: some View {
        VStack {
            if(mostrarTextos == true) {
                Text(L10n.Register.Modal.ServicioQueDesea.text)
                    .font(Fonts.Inter.extraBold.swiftUIFont(size: 27))
                    .foregroundColor(Asset.Colores.greenbutton.swiftUIColor)
                    .multilineTextAlignment(.center)
                    ForEach(serviciosDeVista, id: \.id) { servicio in
                        if(servicio.id == 100) {
                            Asset.Imagenes.calendar.swiftUIImage
                                .resizable()
                                .frame(width: 50)
                        } else if (servicio.id == 101) {
                            Asset.Imagenes.light.swiftUIImage
                                .resizable()
                                .frame(width: 50)
                        } else if (servicio.id == 102) {
                            Asset.Imagenes.calendar.swiftUIImage
                                .resizable()
                                .frame(width: 50)
                        } else if (servicio.id == 103) {
                            Asset.Imagenes.calendar.swiftUIImage
                                .resizable()
                                .frame(width: 50)
                        } else if (servicio.id == 104) {
                            Asset.Imagenes.phone.swiftUIImage
                                .resizable()
                                .frame(width: 50)
                        }
                        
                        Button {
                            print("Click")
                        } label: {
                            Text(servicio.name)
                                .font(Fonts.Inter.bold.swiftUIFont(size: 15))
                                .foregroundColor(Color.black)
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1)) // Fondo del elemento de la cuadrícula
                        .cornerRadius(10)
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
}

#Preview {
    PagarServicioView()
}
