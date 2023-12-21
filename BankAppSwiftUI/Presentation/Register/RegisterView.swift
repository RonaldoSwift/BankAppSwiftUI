//
//  RegisterView.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 18/12/23.
//

import SwiftUI

struct RegisterView: View {
    var body: some View {
        VStack{
            NavigationLink(destination: PrincipalView()){
                Text("Este es Pantalla Registro!!!")

            }
        }
    }
}

#Preview {
    RegisterView()
}
