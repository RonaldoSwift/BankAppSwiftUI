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
        VStack{
            Text("Hola!")
                .foregroundColor(Color.green)
            Text("Por tu seguridad, validaremos tus datos con una foto de tu DNI y una selfie.")
            
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
                Text("Este es Pantalla Registro!!!")
                
            }
        }
    }
}

#Preview {
    RegisterView()
}
