//
//  DocumentNumberView.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 18/12/23.
//

import SwiftUI

struct DocumentNumberView: View {
    var body: some View {
        
        NavigationLink(destination: PrincipalView()){
            Text(" Este es pANTALLA Document nUmber!!!")

        }
    }
}

#Preview {
    DocumentNumberView()
}
