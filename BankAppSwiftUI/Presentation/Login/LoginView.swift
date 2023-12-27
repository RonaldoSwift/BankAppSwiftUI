//
//  LoginView.swift
//  BankAppSwiftUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 25/12/23.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject private var appRootManager: AppRootManager
    @State private var documentNumber: String = ""
    @State private var internetPassword: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            Asset.Imagenes.logoPrincipal.swiftUIImage
                .resizable()
                .frame(width: 60, height: 60)
                .frame(maxWidth: .infinity,maxHeight: 50)
            
            Spacer()
            HStack {
                Text("Numero De Documento")
                    .font(Fonts.Inter.bold.swiftUIFont(size: 15))
                    .foregroundColor(Asset.Colores.metallic.swiftUIColor)
                
                Image(systemName: "questionmark.circle.fill")
                    .foregroundColor(Asset.Colores.interrogation.swiftUIColor)
            }
            
            HStack {
                Image(systemName: "person.text.rectangle")
                    .resizable()
                    .frame(width: 17, height: 19)
                TextField("", text: $documentNumber)
            }
            .padding()
            .foregroundColor(Color.gray)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1)
            )
            
            HStack {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor( Asset.Colores.greenbutton.swiftUIColor)
                Text("Recordar Documento")
                
                Image(systemName: "questionmark.circle.fill")
                    .foregroundColor( Asset.Colores.interrogation.swiftUIColor)
            }
            .frame(maxHeight: 50)

            HStack {
                Text("Clave de internet")
                    .font(Fonts.Inter.bold.swiftUIFont(size: 15))
                    .foregroundColor(Asset.Colores.metallic.swiftUIColor)
                    .multilineTextAlignment(.leading)
                Text("(6 digitos)")
                Image(systemName: "questionmark.circle.fill")
                    .foregroundColor( Asset.Colores.interrogation.swiftUIColor)
            }
            
            HStack {
                Image(systemName: "lock.fill")
                    .resizable()
                    .frame(width: 15, height: 20)
                SecureField("", text: $internetPassword)
                Image(systemName: "x.circle.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            .padding()
            .foregroundColor(Color.gray)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1)
            )
            .keyboardType(.numberPad)
            
            HStack {
                Button(action: {
                    
                }, label: {
                    Text("Olvide mi clave de internet")
                        .font(Fonts.Inter.bold.swiftUIFont(size: 15))
                        .foregroundColor(Asset.Colores.greenbutton.swiftUIColor)
                })
                Image(systemName: "play.fill")
                    .foregroundColor(Asset.Colores.greenbutton.swiftUIColor)
            }
            
            Button(action: {
                appRootManager.currentRoot = .home
            }, label: {
                Text("Ir a la pantalla principal")
                    .padding(.horizontal, 50) // Agrega un padding horizontal mayor
                    .padding(.vertical, 15)
                    .foregroundColor(Color.white)
                    .background( Asset.Colores.greenbutton.swiftUIColor)
                    .cornerRadius(30)
                    .frame(maxWidth: .infinity)
                
            })
            
            VStack {
                Text("Pimera vez que ingresas o cambiaste de tarjeta")
                    .font(Fonts.Inter.bold.swiftUIFont(size: 15))
                    .foregroundColor(Asset.Colores.metallic.swiftUIColor)
                    .multilineTextAlignment(.center) // Centra el texto horizontalmente
                    .frame(width: UIScreen.main.bounds.width * 0.5)
                
                Button(action: {
                }, label: {
                    Image(systemName: "iphone.gen1")
                        .foregroundColor(Color.orange)
                    Text("Registrate Aqui")
                        .font(Fonts.Inter.bold.swiftUIFont(size: 15))
                        .foregroundColor(Color.orange)
                    Image(systemName: "play.fill")
                        .foregroundColor(Color.orange)
                })
            }
            .frame(maxWidth: .infinity)

            Spacer()
            
            HStack(spacing: 90) {
                ubicanosYLlamanos(
                    imageTab: "mappin",
                    texto: "Ubicanos",
                    imageNext: "arrowtriangle.right.fill"
                )
                
                ubicanosYLlamanos(
                    imageTab: "phone",
                    texto: "Llamanos",
                    imageNext: "arrowtriangle.right.fill"
                )
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    LoginView()
}
