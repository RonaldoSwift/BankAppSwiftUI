//
//  prueba2.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 21/12/23.
//

import Foundation

public struct User: Codable {

    public let street: String
    public let city: String
    public let state: String
    
    // sourcery: customMock = ".random(in: 0..<100)"
    public let homeNumber: Int
    
    // sourcery: customMock = ""00000-000""
    public let postalCode: String
}
