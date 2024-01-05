//
//  MemoriaLogin.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 27/12/23.
//

import Foundation

class MemoriaLogin {
    
    private let userTokenKey = "USER_TOKEN_KEY"
    
    func setTokenDeUsuario(jwtToken: String) {
        UserDefaults.standard.set(jwtToken, forKey: userTokenKey)
    }
    
    func obtenerTokenDeUsuario() -> String {
        return UserDefaults.standard.string(forKey: userTokenKey) ?? ""
    }
}
