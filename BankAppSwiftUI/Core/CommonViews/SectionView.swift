//
//  Section.swift
//  BankAppSwiftUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 31/12/23.
//

import SwiftUI

struct SectionView<Header, Content>: View where Header: View, Content: View {
    
    private let header: Header?
    private let content: Content
    
    var body: some View {
        VStack(spacing: 0.0, content: {
            header
            content
        })
        .listRowSeparator(.hidden)
        .listRowBackground(Asset.Colores.greenbutton.swiftUIColor)
        .listRowInsets(.init(top: 0.0, leading: 0.0, bottom: 16.0, trailing: 0.0))
    }
    
    init(header: Header, content: Content) {
        self.header = header
        self.content = content
    }
    
    init(
        @ViewBuilder header: () -> Header,
        @ViewBuilder content: () -> Content
    ) {
        self.header = header()
        self.content = content()
    }
    
    init(
        @ViewBuilder content: () -> Content
    ) where Header == EmptyView {
        self.header = nil
        self.content = content()
    }
}

#Preview {
    SectionView {
        Text("CONTENT")
    }
}
