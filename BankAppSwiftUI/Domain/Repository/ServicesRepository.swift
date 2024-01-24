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
    
    var cancelLables = Set<AnyCancellable>()
    
    init(bankApi: BankApi) {
        self.bankApi = bankApi
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
}
