//
//  SplashView.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 15/12/23.
//

import SwiftUI

struct SplashView: View {
    
    @State private var isActive: Bool = false
    
    var body: some View {
        ZStack{
            if self.isActive{
                WelcomeView()
            } else{
                Color.green.edgesIgnoringSafeArea(.all)
                Image("LogoPrincipal")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100,height: 100)
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
