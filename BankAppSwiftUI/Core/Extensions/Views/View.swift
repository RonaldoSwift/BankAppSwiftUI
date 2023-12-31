//
//  View.swift
//  BankAppSwiftUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 31/12/23.
//

import Foundation
import SwiftUI

public extension View {
    
    func spinner(isPresented: Binding<Bool>) -> some View {
        modifier(SpinnerViewModifier(isPresented: isPresented))
    }
    
    func renderIf(_ condition: Bool) -> some View {
        modifier(RenderIfModifier(condition))
    }
    
}

private struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}
