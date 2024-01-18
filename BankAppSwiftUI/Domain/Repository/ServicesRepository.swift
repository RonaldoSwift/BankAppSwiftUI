//
//  ServicesRepository.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 7/01/24.
//

import Foundation
import Combine

class ServicesRepository {
    
    private let bankApi: BankApi
    private let memoriaLogin: MemoriaLogin
    
    var cancelLables = Set<AnyCancellable>()
    
    init(bankApi: BankApi, memoriaLogin: MemoriaLogin) {
        self.bankApi = bankApi
        self.memoriaLogin = memoriaLogin
    }
    
    // MARK: CRUD Servicio
    func getServicesFromWebService(apiToken: String) -> AnyPublisher<[Servicio], Error> {
        return bankApi
            .fetchServices(apiKey: apiToken)
            .map({ serviciosResponse in
                serviciosResponse.map { servicioResponse
                    in
                    Servicio(
                        id: servicioResponse.id,
                        name: servicioResponse.name
                    )
                }
            })
            .eraseToAnyPublisher()
    }
    
    func obtenerTokenDeMemoriaLogin() -> String {
        return memoriaLogin.obtenerTokenDeUsuario()
    }
}
