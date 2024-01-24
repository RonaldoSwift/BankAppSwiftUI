//
//  SupplierRepository.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 18/01/24.
//

import Foundation
import Combine

class SupplierRepository {
    
    private let bankApi: BankApi
    
    var cancelLables = Set<AnyCancellable>()
    
    init(bankApi: BankApi) {
        self.bankApi = bankApi
    }
    
    func getSupplierFromWebServices(apiToken: String) -> AnyPublisher<[Supplier], Error> {
        return bankApi
            .fetchSuppliers(apiKey: apiToken)
            .map({ suppliersResponse in
                suppliersResponse.map { supplierResponse in
                    Supplier(
                        id: supplierResponse.id,
                        name: supplierResponse.name
                    )
                }
            })
            .eraseToAnyPublisher()
    }
}
