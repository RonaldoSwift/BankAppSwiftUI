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
    
    private enum CodingKeys: String, CodingKey {
        case status
        case data
        case message
    }
}

struct LoginDataResponse: Decodable {
    let accessToken: String
    let expires: Int
    
    private enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case expires 
    }
}
