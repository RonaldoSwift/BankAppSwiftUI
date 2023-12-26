//
//  ModalOptionView.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 18/12/23.
//

import SwiftUI

struct ModalOptionView: View {
    
    var body: some View {
        VStack {
            NavigationLink(destination: RegisterView()) {
                Text(" Este es Modal --Registrarme con DNI")
            }
            
            NavigationLink(destination: DocumentNumberView()) {
                Text("Registrarme con Targeta de credito")
                
            }
        }
    }
}

#Preview {
    ModalOptionView()
}
