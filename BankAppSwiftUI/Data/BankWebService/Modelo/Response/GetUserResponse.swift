//
//  GetUserResponse.swift
//  BankAppSwiftUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 4/01/24.
//

import Foundation

struct GetUserResponse: Decodable {
    let status: String
    let data: CurrentUserDataResponse
    let message: String?
    
    private enum CodingKeys: String, CodingKey {
        case status
        case data
        case message
    }
}

struct CurrentUserDataResponse: Decodable {
    let currentUser: UserDataResponse
    
    private enum CodingKeys : String, CodingKey {
        case currentUser = "current_user"
    }
}

struct UserDataResponse: Decodable {
    let id: Int
    let name: String
    let lastName: String
    let documentNumber: Int
    let birthDay: String
}
