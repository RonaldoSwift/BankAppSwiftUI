//
//  WelcomeView.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 18/12/23.
//

import SwiftUI

struct WelcomeView: View {
    
    var body: some View {
        NavigationView{
            VStack(spacing: 35){
                Asset.Imagenes.logoWelcom.swiftUIImage
                
                Text("¿Primera vez que ingresas?")
                    .font(.custom("Inter-ExtraBold", size: 18))
                
                NavigationLink(destination: ModalOptionView()){
                    HStack{
                        Image(systemName: "iphone.gen1")
                        Text("Registrate aqui")
                            .font(.custom("Inter-ExtraBold", size: 15))
                        Image(systemName: "arrowtriangle.right.fill")
                    }
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.orange)
                    .cornerRadius(20)
                }
                
                            
                Text("¿Ya te has registrado?")
                    .font(.custom("Inter-ExtraBold", size: 18))
                
                NavigationLink(destination: ModalOptionView()){
                    HStack{
                        Text("Ingresa Aqui")
                            .font(.custom("Inter-ExtraBold", size: 15))
                        Image(systemName: "arrowtriangle.right.fill")
                        
                    }
                    .padding()
                    .foregroundColor(Color("Greenbutton"))
                    .overlay(
                        Capsule().stroke(lineWidth: 2)
                            .foregroundColor(Color("Greenbutton"))
                    )
                }
                
                HStack(spacing: 113){
                    HStack{
                        Button(action: {}, label: {
                            Image(systemName: "mappin")
                            Text("Ubicanos")
                            Image(systemName: "arrowtriangle.right.fill")
                            
                        })
                        .font(.custom("Inter-ExtraBold", size: 15))
                        .foregroundColor(Color("Metallic"))
                    }
                    HStack{
                        Button(action: {}, label: {
                            Image(systemName: "phone")
                            Text("Llamanos")
                            Image(systemName: "arrowtriangle.right.fill")
                            
                        })
                        .font(.custom("Inter-ExtraBold", size: 15))
                        .foregroundColor(Color("Metallic"))
                    }
                }
                .padding()
            }
            
        }
    }
    
    
    private func butonNext(titulo:String) -> some View{
        VStack{
            Text("¿Primera vez que ingresas?")
                .font(.custom("Inter-ExtraBold", size: 18))
            
            NavigationLink(destination: ModalOptionView()){
                HStack{
                    Image(systemName: "iphone.gen1")
                    Text("Registrate aqui")
                        .font(.custom("Inter-ExtraBold", size: 15))
                    Image(systemName: "arrowtriangle.right.fill")
                }
                .padding()
                .foregroundColor(Color.white)
                .background(Color.orange)
                .cornerRadius(20)
            }
        }
    }
    
}

#Preview {
    WelcomeView()
}
