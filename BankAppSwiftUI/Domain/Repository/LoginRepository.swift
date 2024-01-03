//
//  LoginRepository.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 27/12/23.
//

import Foundation
import Combine

class LoginRepository {
    
    let memoriaLogin : MemoriaLogin
    
    var cancelLables = Set<AnyCancellable>()
    
    init(memoriaLogin: MemoriaLogin) {
        self.memoriaLogin = memoriaLogin
    }
    
    func getLoginFromMemoria() -> Array<Login> {
        return memoriaLogin.logins.map { (loginData:LoginData) in
            let login = Login(
                id: loginData.id,
                numeroDeDocumento: loginData.numeroDeDocumento,
                claveDeInternet: loginData.claveDeInternet
            )
            return login
        }
    }
}
