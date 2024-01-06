//
//  DetalleResponse.swift
//  BankAppSwiftUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 4/01/24.
//

import Foundation

struct LoginResponse: Decodable {

    var status: String
    var data: LoginDataResponse
    var message: String?
    
    private enum CodingKeys: String, CodingKey {
        case status
        case data
        case message
    }
}

struct LoginDataResponse: Decodable {
    let accessToken: String
    let expires: Int
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case expires
    }
}
