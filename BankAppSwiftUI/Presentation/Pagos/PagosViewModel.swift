//
//  PagosViewModel.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 8/01/24.
//

import Foundation
import Combine
import Dispatch

@MainActor
final class PagosViewModel: ObservableObject {
    
    let servicesRepository : ServicesRepository
    let loginRepository : LoginRepository
    
    @Published private(set) var pagoUiState = PagoUiState.inicial
    
    var cancellables = Set<AnyCancellable>()
    
    init(servicesRepository: ServicesRepository, loginRepository: LoginRepository) {
        self.servicesRepository = servicesRepository
        self.loginRepository = loginRepository
    }
    
    func starService() {
        
        pagoUiState = PagoUiState.cargando
        
        let jwt = loginRepository.getTokenFromMemoria()
        
        servicesRepository.getServicesFromWebService(apiToken: jwt)
            .subscribe(on: DispatchQueue.global())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch (completion) {
                case .finished:
                    break
                case .failure(let error):
                    self.pagoUiState = PagoUiState.error("Error \(error)")
                }
            }, receiveValue: { (servicios:[Servicio]) in
                self.pagoUiState = PagoUiState.success(servicios)
            })
            .store(in: &cancellables)
    }
}
