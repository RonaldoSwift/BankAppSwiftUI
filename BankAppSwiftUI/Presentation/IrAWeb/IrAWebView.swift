//
//  BancaInternetView.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 20/12/23.
//

import SwiftUI

struct IrAWebView: View {
    var body: some View {
        VStack {
            Link(destination: URL(string: "https://www.mibanco.com.pe/?from=googlesearch&gad_source=1&gclid=Cj0KCQiAh8OtBhCQARIsAIkWb69y3SzGoF3dgaYx8QelEIG3VbiJrpBWll9piP1Mjkk3PysGmRpl3IUaAk7gEALw_wcB&gclsrc=aw.ds")!) {
                Text("Banca por internet")
            }
        }
    }
}

#Preview {
    IrAWebView()
}
