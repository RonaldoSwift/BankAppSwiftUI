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
    
    @Published private(set) var loginState = LoginUiState.inicial
    
    var cancellables = Set<AnyCancellable>()
    
    init(loginRepository: LoginRepository) {
        self.loginRepository = loginRepository
    }
    
    // Esta funcion se llama cuando al persona le a click al button login
    func startLogin() {
        
        guard let documentNumber = Int(documentNumber) else {
            loginState = LoginUiState.error("Document Number invalid")
            return
        }
        
        guard let internetPassword = Int(internetPassword) else {
            loginState = LoginUiState.error("Internet Password invalid")
            return
        }
        
        loginState = LoginUiState.cargando
        
        loginRepository.getLoginFromWebService(documentNumber: documentNumber, internetPassword: internetPassword) // 2. Traer Login de Web Service
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch (completion) {
                case .finished:
                    break
                case .failure(let error):
                    self.loginState = LoginUiState.error("Error web service \(error)")
                }
            }, receiveValue: { (authentication: Authentication) in
                
                self.loginRepository.saveTokenInMemory(jwtToken: authentication.jwt) // 3. Grabar el token en memoria
                
                self.loginState = LoginUiState.success
                print(authentication)
            })
            .store(in: &cancellables)
    }
}
