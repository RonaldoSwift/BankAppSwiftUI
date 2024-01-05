//
//  DetalleResponse.swift
//  BankAppSwiftUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 4/01/24.
//

import Foundation

struct LoginResponse: Decodable {
    let status: String
    let data: LoginDataResponse
    let message: String?
}

struct LoginDataResponse: Decodable {
    let token: String
    let expiration: Double
}
