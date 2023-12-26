//
//  MockParameterValue.meta.swift
//  BankAppSwiftUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 23/12/23.
//

import Foundation
import SourceryRuntime

let customMockAnnotation = "customMock"

// MARK: - MockParameterValue

struct MockParameter {
    static let emptyArrayValue = "[]"
    static let nilValue = "nil"
    static let initValue = ".init()"
    static let mockValue = ".mock()"
    static let emptyStringValue = "\"\""
    static let intValue = "0"
    static let boolValue = "false"
}

var mockParameterDefaultValueDict: [String: String] {
    [
        "String": MockParameter.emptyStringValue,
        "Int": MockParameter.intValue,
        "Bool": MockParameter.boolValue
    ]
}

func mockParam(variable: Variable) -> String {
    if let customMock = variable.annotations[customMockAnnotation] {
        return "\(customMock)"
    }
    
    guard !variable.isOptional else {
        return MockParameter.nilValue
    }
    
    return mockParameterDefaultValueByType(variable.typeName)
}

func mockParameterDefaultValueByType(_ typeName: TypeName) -> String {
    
    guard let mockParameter = mockParameterDefaultValueDict[typeName.name] else {
        return MockParameter.mockValue
    }
    
    return mockParameter
}
