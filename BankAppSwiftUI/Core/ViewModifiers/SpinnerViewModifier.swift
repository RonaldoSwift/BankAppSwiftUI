//
//  Spinner.swift
//  BankAppSwiftUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 31/12/23.
//

import SwiftUI

struct SpinnerViewModifier: ViewModifier {
    
    @Binding var isPresented: Bool
    @State private var rotatingDegress = 0.0
    private let progress = 0.7
    
    func body(content: Content) -> some View {
        ZStack {
            content
            CircularProgressView(progress: progress)
                .rotationEffect(.degrees(rotatingDegress))
                .renderIf(isPresented)
                .onAppear {
                    withAnimation(
                        Animation
                            .linear(duration: 0.8)
                            .repeatForever(autoreverses: false)
                    ) {
                        rotatingDegress = 360.0
                    }
                }
        }
        .disabled(isPresented)
    }
    
    init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
    }
}

#Preview {
    SpinnerViewModifier(isPresented: .constant(false)) as! any View
}
