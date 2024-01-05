//
//  LoginViewModel.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 27/12/23.
//

import Foundation
import Combine
import Dispatch

@MainActor
final class LoginViewModel: ObservableObject {
    
    let loginRepository : LoginRepository
    
    // MARK: Input
    @Published var documentNumber: String = ""
    @Published var internetPassword: String = ""
    
    // MARK: Output
    @Published var usernameMessage: String = ""
    @Published var isValid: Bool = false
    
    @Published private(set) var loginState = LoginButtonState.inicial
    
    var cancellables = Set<AnyCancellable>()
    
    init(loginRepository: LoginRepository) {
        self.loginRepository = loginRepository
    }
    
    // Esta funcion se llama cuando al persona le a click al button login
    func startLogin() {
        
        loginState = LoginButtonState.cargando
        
        if (loginRepository.getLoginFromMemoria().isEmpty) { // 1. El usuario no tiene token?
            loginRepository.getLoginFromWebService(documentNumber: documentNumber, internetPassword: "123") // 2. Traer Login de Web Service
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { completion in
                    switch (completion) {
                    case .finished:
                        break
                    case .failure(let error):
                        print("\(error)")
                        self.loginState = LoginButtonState.inicial
                    }
                }, receiveValue: { (authentication: Authentication) in
                    
                    self.loginRepository.saveLoginToken(jwtToken: authentication.jwt) // 3. Grabar el token en memoria
                    
                    self.loginState = LoginButtonState.final
                    print(authentication)
                })
                .store(in: &cancellables)
        } else { // 4. El usuario tiene token?
            self.loginState = LoginButtonState.final
        }
    }
}
