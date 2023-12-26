//
//  RegisterView.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 18/12/23.
//

import SwiftUI

struct RegisterView: View {
    
    @State private var numeroDeDni : String = ""
    
    var body: some View {
        VStack(spacing: 15){
            Text("¡Hola!")
                .foregroundColor(Color.green)
                .font(Fonts.Inter.extraBold.swiftUIFont(size: 21))
            
            Text("Por tu seguridad, validaremos tus datos con una foto de tu DNI y una selfie.")
                .foregroundColor(Asset.Colores.metallic.swiftUIColor)
                .multilineTextAlignment(.center)
                .padding(.vertical, 10)
            
            ZStack {
                // Gradiente como fondo de la tarjeta
                LinearGradient(gradient: Gradient(colors: [Color.white, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .mask(RoundedRectangle(cornerRadius: 12))
                    .frame(width: 380, height: 120)
                    .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 0)
                
                VStack(alignment: .leading) {
                    Text("Numero de DNI")
                        .padding(.bottom, 5)
                    
                    TextField("Ej. 12345678", text: $numeroDeDni)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .keyboardType(.numberPad)
                }
                .frame(width: 360, height: 80)
                .background(Color.clear)
                .cornerRadius(12)
            }
            
            tomaFoto(
                titulo: "Toma una foto a tu",
                subtitulo: "DNI por adelante",
                primerIcono: "person.text.rectangle"
            )
            
            tomaFoto(
                titulo: "Toma una foto a tu",
                subtitulo: "DNI por atras",
                primerIcono: "rectangle.and.hand.point.up.left"
            )
            
            tomaFoto(
                titulo: "Tomate una",
                subtitulo: "Selfie",
                primerIcono: "camera"
            )
            
            NavigationLink(destination: PrincipalView()){
                Text("Siguiente")
                    .padding(.horizontal, 150) // Agrega un padding horizontal mayor
                    .padding(.vertical, 10)
                    .foregroundColor(Color.white)
                    .background(Color.orange)
                    .cornerRadius(10)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Menu {
                    Button("Opción 1") {
                    }
                    Button("Opción 2") {
                    }
                    Button("Opción 3") {
                    }
                } label: {
                    Image(systemName: "ellipsis")
                }
            }
        }
    }
}

#Preview {
    RegisterView()
}
