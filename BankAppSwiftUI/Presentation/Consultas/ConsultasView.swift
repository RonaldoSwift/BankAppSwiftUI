//
//  ConsultasView.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 20/12/23.
//

import SwiftUI

struct ConsultasView: View {
    
    @EnvironmentObject var consultasRouter: ConsultasRouter
    
    @State var showSheet = true
    
    var body: some View {
        
        VStack(alignment: .leading,spacing: 10) {
            Asset.Imagenes.logoPrincipal.swiftUIImage
                .resizable()
                .frame(width: 60, height: 60)
                .frame(maxWidth: .infinity)
            
            HStack {
                Image(systemName: "rectangle.on.rectangle.circle")
                    .resizable()
                    .frame(width: 30,height: 30)
                    .foregroundColor(Asset.Colores.mostaza.swiftUIColor)
                Text("Hola C***** Le**** Ca****")
                    .foregroundColor(Asset.Colores.metallic.swiftUIColor)
                    .font(Fonts.Inter.bold.swiftUIFont(size: 21))
            }
            
            Text("Tipo de Cambio Referencia")
            
            HStack {
                HStack {
                    Text("Compra US$:")
                    Text("S/3.650")
                        .font(Fonts.Inter.bold.swiftUIFont(size: 15))
                }
                Text("-")
                HStack {
                    Text("Venta US$:")
                    Text("S/3.820")
                        .font(Fonts.Inter.bold.swiftUIFont(size: 15))
                }
            }
            
            Text("Mis ahorros")
                .font(Fonts.Inter.bold.swiftUIFont(size: 22))
                .foregroundColor(Asset.Colores.greenbutton.swiftUIColor)
                .multilineTextAlignment(.center)
            
            ticketMonto(
                titulo: "Full ahorro Plus (Soles)",
                montoDeDinero: "32,863.11",
                saldoDisponible: "Saldo Disponible",
                onClickInDetalle: {
                    consultasRouter.navigate(to: ConsultasRouter.Destination.detalleCuenta)
                }
            )
            
            VStack {
                Text("Necesitas otra cuenta")
                Button(action: {
                    
                }, label: {
                    Text("Abre tu cuenta Ahorro Negocio aqui")
                    Image(systemName: "play.fill")
                })
                .foregroundColor(Asset.Colores.metallic.swiftUIColor)
                .font(Fonts.Inter.bold.swiftUIFont(size: 15))
                
            }
            .frame(maxWidth: .infinity)
            
            Spacer()
            
        }
        .padding()
        .toolbar(content: {
            ImageToolbarContent()
        })
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showSheet) {
            consultaSheetView(onClickEntendido: {
                showSheet = false
            })
                .presentationDetents([.medium])
        }
    }
}

#Preview {
    ConsultasView()
}
