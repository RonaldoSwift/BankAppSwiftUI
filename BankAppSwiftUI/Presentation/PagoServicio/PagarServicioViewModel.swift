//
//  PagarServicioViewModel.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 18/01/24.
//

import Foundation
import Combine
import Dispatch

@MainActor
final class PagarServicioViewModel: ObservableObject {
    
    let supplierRepository : SupplierRepository
    let loginRepository : LoginRepository
    
    @Published private(set) var pagarServicioUiState = PagarServicioUiState.inicial
    
    var cancellables = Set<AnyCancellable>()
    
    init(supplierRepository: SupplierRepository, loginRepository: LoginRepository) {
        self.supplierRepository = supplierRepository
        self.loginRepository = loginRepository
    }
    
    func starService() {
        
        pagarServicioUiState = PagarServicioUiState.cargando
        
        supplierRepository.getSupplierFromWebServices(apiToken: loginRepository.getTokenFromMemoria())
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
            switch (completion) {
            case .finished:
                break
            case .failure(let error):
                self.pagarServicioUiState = PagarServicioUiState.error("\(error)")
            }
            }, receiveValue: { (supplier: [Supplier]) in
                self.pagarServicioUiState = PagarServicioUiState.success(supplier)
            })
            .store(in: &cancellables)
    }
}
