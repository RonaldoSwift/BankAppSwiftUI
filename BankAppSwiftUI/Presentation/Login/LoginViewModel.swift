//
//  LoginViewModel.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 27/12/23.
//

import Foundation
import Combine
import Dispatch

final class LoginViewModel: ObservableObject {
    
    let loginRepository : LoginRepository
    
    @Published private(set) var estadoDeButtonLogin = LoginButtonState.inicial
    
    var cancellables = Set<AnyCancellable>()
    
    init(loginRepository: LoginRepository) {
        self.loginRepository = loginRepository
    }
    
    //Esta funcion se llama cuando al persona le a click al button login
    func getLoginFromMemory(documentNumber: String, internetPassword: String) {
        
        estadoDeButtonLogin = LoginButtonState.cargando
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            let loginDeMemoria = self.loginRepository.getLoginFromMemoria()
            let numeroDeDocumentoDeMemoria = loginDeMemoria.first?.numeroDeDocumento
            let claveDeInternetDeMemoria = loginDeMemoria.first?.claveDeInternet
            
            if(documentNumber == numeroDeDocumentoDeMemoria && internetPassword == claveDeInternetDeMemoria) {
                self.estadoDeButtonLogin = LoginButtonState.final
            } else {
                self.estadoDeButtonLogin = LoginButtonState.inicial
            }
        }
    }
}
