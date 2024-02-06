//
//  OtrasCuentasView.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 3/01/24.
//

import SwiftUI

struct OtrasCuentasView: View {
    
    @State private var numeroDeCuentaDestino: String = ""
    @State private var dineroPorTransferir: String = ""
    
    var body: some View {
        VStack(spacing: 40) {
            Text("A otras cuentas de Mibanco")
                .font(Fonts.Inter.bold.swiftUIFont(size: 25))
                .foregroundColor(Asset.Colores.greenbutton.swiftUIColor)
                .multilineTextAlignment(.center)
            
            ZStack {
                // Gradiente como fondo del botón (tarjeta)
                LinearGradient(gradient: Gradient(colors: [Color.white, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .mask(RoundedRectangle(cornerRadius: 12))
                    .frame(width: 360, height: 400)
                    .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 0)
                
                HStack(alignment: .center) {
                    VStack(alignment: .leading) {
                        Text("Cual es la cuenta de origen?")
                            .font(Fonts.Inter.medium.swiftUIFont(size: 17))
                        
                        Text("Full Ahorro  Plus (Soles)")
                            .font(Fonts.Inter.light.swiftUIFont(size: 15))
                        
                        Text("S/ 2,863.11")
                            .font(Fonts.Inter.medium.swiftUIFont(size: 17))
                        
                        Text("Saldo disponible")
                            .font(Fonts.Inter.light.swiftUIFont(size: 15))
                        
                        Text("Cual es el numero de cuenta destino?")
                            .font(Fonts.Inter.medium.swiftUIFont(size: 17))
                        
                        TextField("", text: $numeroDeCuentaDestino)
                            .padding()
                            .foregroundColor(Color.gray)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                        
                        Text("Selecciona el tipo de moneda")
                            .font(Fonts.Inter.medium.swiftUIFont(size: 17))
                        
                        HStack {
                            HStack {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(Asset.Colores.greenbutton.swiftUIColor)
                                
                                Text("S/ PEN")
                                
                            }
                            .padding()
                            .font(Fonts.Inter.light.swiftUIFont(size: 15))
                            
                            .overlay(
                                Capsule().stroke(lineWidth: 1)
                                    .foregroundColor(Asset.Colores.metallic.swiftUIColor)
                            )
                            .onTapGesture {
                                
                            }
                            
                            Text("$ USD")
                                .padding()
                                .font(Fonts.Inter.light.swiftUIFont(size: 15))
                            
                                .overlay(
                                    Capsule().stroke(lineWidth: 1)
                                        .foregroundColor(Asset.Colores.metallic.swiftUIColor)
                                )
                                .onTapGesture {
                                    
                                }
                        }
                        
                        Text("Cuanto dinero desea transferir?")
                            .font(Fonts.Inter.medium.swiftUIFont(size: 17))
                        
                        Text("Monto entre S/ 1.00 y S/ 15,000.00")
                            .font(Fonts.Inter.light.swiftUIFont(size: 15))
                        
                        HStack {
                            Text("S/")
                            TextField("", text: $dineroPorTransferir)
                        }
                        .padding()
                        .foregroundColor(Color.gray)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        
                    }
                    
                    Spacer()
                }
                .frame(width: 320, height: 400)
                .background(Color.clear)
                .foregroundColor(Color.black)
                .cornerRadius(12)
                
            }
            
            Button(action: {
                
            }, label: {
                Text("Siguiente")
                    .padding(.horizontal, 140) // Agrega un padding horizontal mayor
                    .padding(.vertical, 10)
                    .foregroundColor(Color.white)
                    .background(Asset.Colores.greenbutton.swiftUIColor)
                    .cornerRadius(20)
            })
            
        }
        .padding()
        .toolbar(content: {
            TextToolbarContent(title: "Transferencias")
        })
        .navigationBarBackButtonHidden(true)
        Spacer()
    }
}

#Preview {
    OtrasCuentasView()
}
