//
//  ModelsMock.meta.swift
//  BankAppSwiftUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 23/12/23.
//

import Foundation
import SourceryRuntime

let autoMockableProtocolName = "Codable"

private let models: [Struct] = {
    types.structs.filter {
        $0.inheritedTypes.contains(autoMockableProtocolName)
    }
}()

private func generateMock() -> String {
    let stringMocks = models.map {
        var varNames = [String]()
        
        let paramsLines = $0.rawVariables.map {
            
            varNames.append($0.name)
            
            var typeName = $0.typeName.name
            if let type = $0.type,
               type.isKind(of: Enum.self) {
                typeName = $0.typeName.actualTypeName?.name ?? typeName
            }
            
            return "\($0.name): \(typeName) = \(mockParam(variable: $0))"
        }

        return """
// MARK: - Generated \($0.name)

extension \($0.name) {

    static func mock(
        \(paramsLines.joined(separator: ",\n        "))
    ) -> \($0.name) {
        .init(
            \(varNames.map { "\($0): \($0)" }.joined(separator: ",\n            "))
        )
    }
}
"""
    }
    
    return stringMocks.joined(separator: "\n\n")
}

// MARK: - Output

func generateModelsMockOutput() -> String {
"""
//
//  \(projectName)Models+mock.swift
//  \(projectName)Tests
//
//  Created by Sourcery on xx/xx/xx.
//

import Foundation

@testable import \(projectName)

\(generateMock())
"""
}
