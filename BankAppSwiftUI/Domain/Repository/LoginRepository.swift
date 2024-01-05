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
    
    func saveLoginToken(jwtToken: String) {
        memoriaLogin.setTokenDeUsuario(jwtToken: jwtToken)
    }
    
    func getLoginFromMemoria() -> String {
        return memoriaLogin.obtenerTokenDeUsuario()
    }
    
    func getLoginFromWebService(documentNumber: String, internetPassword: String) -> AnyPublisher<Authentication, Error> {
        return bankApi
            .fetchLogin(documentNumber: documentNumber, internetPassword: internetPassword)
            .map { (loginResponse: LoginResponse) in
                Authentication(
                    jwt: loginResponse.data.token
                )
            }.eraseToAnyPublisher()
    }
}
