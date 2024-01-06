//
//  WelcomeViewModel.swift
//  BankAppSwiftUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 4/01/24.
//

import Foundation
import Combine

@MainActor
final class WelcomeViewModel: ObservableObject {
    
    let loginRepository : LoginRepository
    
    @Published private(set) var loginState = WelcomeUiState.defaultState
    
    var cancellables = Set<AnyCancellable>()
    
    init(loginRepository: LoginRepository) {
        self.loginRepository = loginRepository
    }
    
    func getUser() {
        let jwt = loginRepository.getTokenFromMemoria()
        loginRepository
            .getUserFromWebService(apiToken: jwt, userId: 1)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch (completion) {
                case .finished:
                    print("asdf")
                case .failure(let error):
                    print("asdf")
                }
            } receiveValue: { (user: User) in
                // store in data base
                print("\(user)")
            }
            .store(in: &cancellables)

    }
    
}
