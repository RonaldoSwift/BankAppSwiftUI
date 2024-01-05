//
//  GetUserResponse.swift
//  BankAppSwiftUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 4/01/24.
//

import Foundation

struct GetUserResponse: Decodable {
    let status: String
    let data: GetUserDataResponse
    let message: String?
}

struct GetUserDataResponse: Decodable {
    let userId: Int
    let expiration: String
    let lastName: String
    let birthDay: String
}
