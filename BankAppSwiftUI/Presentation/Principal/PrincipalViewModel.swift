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
        getUsersFromDatabase()
        loginRepository.requestRecetas()
    }
    
    func getUsersFromDatabase() {
        loginRepository.getUsersPublicador()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch (completion) {
                case .finished:
                    print("asdf")
                case .failure(let error):
                    print("\(error)")
                }
            } receiveValue: { (users: [User]) in
                if(users.isEmpty) {
                    self.getUserFromWebService()
                }
            }
            .store(in: &cancellables)

    }
        
    func getUserFromWebService() {
        let jwt = loginRepository.getTokenFromMemoria()
        loginRepository
            .getUserFromWebService(apiToken: jwt, userId: 10)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch (completion) {
                case .finished:
                    print("finished")
                case .failure(let error):
                    print("\(error)")
                }
            } receiveValue: { (user: User) in
                // store in data base
                print("\(user)")
                self.loginRepository.insertUser()
            }
            .store(in: &cancellables)

    }
    
}
