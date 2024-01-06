//
//  LoginRepository.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 27/12/23.
//

import Foundation
import Combine

class LoginRepository {
    
    private let memoriaLogin : MemoriaLogin
    private let bankApi: BankApi
    
    var cancelLables = Set<AnyCancellable>()
    
    init(memoriaLogin: MemoriaLogin, bankApi: BankApi) {
        self.memoriaLogin = memoriaLogin
        self.bankApi = bankApi
    }
    
    // MARK: CRUD Login
    
    func saveTokenInMemory(jwtToken: String) {
        memoriaLogin.setTokenDeUsuario(jwtToken: jwtToken)
    }
    
    func getTokenFromMemoria() -> String {
        return memoriaLogin.obtenerTokenDeUsuario()
    }
    
    func getLoginFromWebService(documentNumber: Int, internetPassword: Int) -> AnyPublisher<Authentication, Error> {
        
        let loginRequest = LoginRequest(
            documentNumber: documentNumber,
            password: internetPassword
        )
        
        return bankApi
            .fetchLogin(loginRequest: loginRequest)
            .map { (loginResponse: LoginResponse) in
                Authentication(
                    jwt: loginResponse.data.accessToken
                )
            }
            .eraseToAnyPublisher()
    }
    
    // MARK: CRUD User
    func getUserFromWebService(apiToken: String, userId: Int) -> AnyPublisher<User, Error> {
        return bankApi
            .fetchUser(apiToken: apiToken, userId: userId)
            .map { (getUserResponse: GetUserResponse) in
                User(
                    street: getUserResponse.data.currentUser.lastName,
                    city: "",
                    state: "",
                    homeNumber: 1,
                    postalCode: getUserResponse.data.currentUser.name
                )
            }
            .eraseToAnyPublisher()
    }
}
