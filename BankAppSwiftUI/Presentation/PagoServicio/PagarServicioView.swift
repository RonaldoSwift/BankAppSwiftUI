//
//  PagarServicioLuzView.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 18/01/24.
//

import SwiftUI

struct PagarServicioView: View {
    
    @State private var empresa: String = ""
    @State private var servicio: String = ""
    @State private var suministro: String = ""
    @State private var isButtonCargando: Bool = false
    
    @StateObject private var pagarServicioViewModel = PagarServicioViewModel(
        supplierRepository: SupplierRepository(bankApi: BankApi()),
        loginRepository: LoginRepository(
            memoriaLogin: MemoriaLogin(),
            bankApi: BankApi(),
            bankGRDB: BankGRDB()
        )
    )
    
    var body: some View {
        VStack {
            HStack {
                Image(Asset.Imagenes.light.name)
                    .resizable()
                    .frame(width: 70,height: 70)
                VStack(alignment:.leading) {
                    Text(L10n.Register.Modal.Luz.text)
                        .font(Fonts.Inter.extraBold.swiftUIFont(size: 27))
                        .foregroundStyle(Asset.Colores.greenbutton.swiftUIColor)
                    
                    Text(L10n.Pay.Service.PagarServicioRapido.text)
                        .font(Fonts.Inter.light.swiftUIFont(size: 15))
                        .foregroundStyle(Asset.Colores.metallic.swiftUIColor)
                }
                Spacer()
            }
            .padding()
            
            ZStack {
                // Gradiente como fondo del botón (tarjeta)
                LinearGradient(gradient: Gradient(colors: [Color.white, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .mask(RoundedRectangle(cornerRadius: 12))
                    .frame(width: 360, height: 400)
                    .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 0)
                
                VStack(alignment: .leading) {
                    Text(L10n.Pay.Service.Empresa.text)
                        .font(Fonts.Inter.medium.swiftUIFont(size: 16))
                    
                    HStack {
                        TextField("", text: $empresa)
                        Button {
                            
                            isButtonCargando = true
                            
                        } label: {
                            Image(systemName: "ellipsis")
                        }
                    }
                    .padding()
                    .foregroundColor(Color.gray)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    
                    Text(L10n.Pay.Service.Servicio.text)
                        .font(Fonts.Inter.medium.swiftUIFont(size: 16))
                    
                    HStack {
                        TextField("", text: $servicio)
                        Button {
                            print("PRESIONADO!!!!")
                        } label: {
                            Image(systemName: "ellipsis")
                        }
                    }
                    .padding()
                    .foregroundColor(Color.gray)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    
                    Text(L10n.Pay.Service.Horario.text)
                        .font(Fonts.Inter.medium.swiftUIFont(size: 16))
                        .foregroundStyle(Asset.Colores.mostaza.swiftUIColor)
                        .padding()
                    
                    Text(L10n.Pay.Service.Suministro.text)
                        .font(Fonts.Inter.medium.swiftUIFont(size: 16))
                    
                    TextField("", text: $suministro)
                        .padding()
                        .foregroundColor(Color.gray)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                    
                }
                .frame(width: 320, height: 380)
                .background(Color.clear)
                .foregroundColor(Color.black)
                .cornerRadius(12)
            }
            
            Button(action: {
                print(L10n.Pay.Service.Recibos.text)
            }, label: {
                Text("Buscar mis recibos                ")
                    .font(Fonts.Inter.bold.swiftUIFont(size: 15))
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Asset.Colores.greenbutton.swiftUIColor)
                    .cornerRadius(25)
            })
            .padding()
            .frame(maxWidth: .infinity)
            Spacer()
        }
        .sheet(isPresented: $isButtonCargando, content: {
            PagarServicioSheetView(
                pagarServicioViewModel: pagarServicioViewModel
            )
            .presentationDetents([.height(500), .large])
        })
    }
}

#Preview {
    PagarServicioView()
}
