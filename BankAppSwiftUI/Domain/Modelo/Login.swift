//
//  Login.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 27/12/23.
//

import Foundation

struct Login: Codable, Identifiable {
    
    let id: Int
    let numeroDeDocumento: String
    let claveDeInternet: String
    
    init(id: Int, numeroDeDocumento: String, claveDeInternet: String) {
        self.id = id
        self.numeroDeDocumento = numeroDeDocumento
        self.claveDeInternet = claveDeInternet
    }
}
