//
//  ErrorResponse.swift
//  BankAppSwiftUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 6/01/24.
//

import Foundation

struct ErrorResponse: Decodable {
    let status: String
    let message: String
}
