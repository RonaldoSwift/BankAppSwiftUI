//
//  CircularProgressView.swift
//  BankAppSwiftUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 31/12/23.
//

import SwiftUI

struct CircularProgressView: View {
    
    private let progress: Double
    private let tint: Color
    
    var body: some View {
        Circle()
            .trim(from: 0.0, to: progress)
            .stroke(tint, lineWidth: 4.0)
            .frame(width: 48.0, height: 48.0)
    }
    
    init(progress: Double, tint: Color = Asset.Colores.water.swiftUIColor) {
        self.progress = progress
        self.tint = tint
    }
    
}

#Preview {
    CircularProgressView(progress: 40, tint: .red)
}
