//
//  RenderIfModifier.swift
//  BankAppSwiftUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 31/12/23.
//

import SwiftUI

struct RenderIfModifier: ViewModifier {
    
    private let condition: Bool
    
    init(_ condition: Bool) {
        self.condition = condition
    }
    
    func body(content: Content) -> some View {
        if condition {
            content
        }
    }
    
}
