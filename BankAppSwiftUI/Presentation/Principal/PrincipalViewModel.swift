//
//  WelcomeViewModel.swift
//  BankAppSwiftUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 4/01/24.
//

import Foundation
import Combine

@MainActor
final class PrincipalViewModel: ObservableObject {
    
    let loginRepository : LoginRepository
    
    @Published private(set) var loginState = PrincipalUiState.defaultState
    
    var cancellables = Set<AnyCancellable>()
    
    init(loginRepository: LoginRepository) {
        self.loginRepository = loginRepository
        getUserFromWebService()
        getRecetasFromDatabase()
        loginRepository.requestRecetas()
    }
    
    func getUserFromWebService() {
        let jwt = loginRepository.getTokenFromMemoria()
        loginRepository
            .getUserFromWebService(apiToken: jwt, userId: 10)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch (completion) {
                case .finished:
                    print("asdf")
                case .failure(let error):
                    print("\(error)")
                }
            } receiveValue: { (user: User) in
                // store in data base
                print("\(user)")
                //self.loginRepository.insertReceta()
            }
            .store(in: &cancellables)

    }
    
    func insertUser() {
        loginRepository.insertReceta()
    }
    
    func getRecetasFromDatabase() {
        loginRepository.getRecetasPublicador()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch (completion) {
                case .finished:
                    print("asdf")
                case .failure(let error):
                    print("\(error)")
                }
            } receiveValue: { (recetas: [Receta]) in
                print(recetas)
            }
            .store(in: &cancellables)

    }
    
}
