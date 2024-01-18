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
    
    @Published private(set) var pagoUiState = PagoUiState.inicial
    
    var cancellables = Set<AnyCancellable>()
    
    init(servicesRepository: ServicesRepository) {
        self.servicesRepository = servicesRepository
    }
    
    func starService() {
        
        pagoUiState = PagoUiState.cargando
        
        var jwt = servicesRepository.obtenerTokenDeMemoriaLogin()
        
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
