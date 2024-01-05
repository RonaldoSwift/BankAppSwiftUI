//
//  Created by Carlos Vargas on 1/04/23.
//

import Foundation
import Combine

class BankApi {

    /**
    * Example: http://localhost:8000/login
    */
    func fetchLogin(documentNumber: String, internetPassword: String) -> AnyPublisher<LoginResponse, Error> {
        guard var urlComponents = URLComponents(string: "http://localhost:8000/login") else {
            return Fail(error: RonaldoError.errorURL)
                .eraseToAnyPublisher()
        }
        
        guard let validUrl = urlComponents.url else {
            return Fail(error: RonaldoError.errorDesconocido)
                .eraseToAnyPublisher()
        }
        
        var urlRequest = URLRequest(
            url: validUrl
        )
        
        urlRequest.httpMethod = "GET"
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map { (data: Data, _: URLResponse) in
                data
            }
            .decode(type: LoginResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    /**
    * Example: http://localhost:8000/user
    */
    func fetchUser(id: Int) -> AnyPublisher<GetUserResponse, Error> {
        guard var urlComponents = URLComponents(string: "http://localhost:8000/login") else {
            return Fail(error: RonaldoError.errorURL)
                .eraseToAnyPublisher()
        }
        urlComponents.queryItems = [
            URLQueryItem(name: "apiKey", value: "3b1513fc749947bda8c22aed3955dd9f")
        ]
        
        guard let validUrl = urlComponents.url else {
            return Fail(error: RonaldoError.errorDesconocido)
                .eraseToAnyPublisher()
        }
        
        var urlRequest = URLRequest(
            url: validUrl
        )
        
        urlRequest.httpMethod = "GET"
                
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { (data: Data, _: URLResponse) in
                do {
                    let decoder = JSONDecoder()
                    let getUserResponse = try decoder.decode(GetUserResponse.self, from: data)
                    return getUserResponse
                } catch {
                    throw RonaldoError.errorDesconocido
                }
            }
            .eraseToAnyPublisher()
    }
    
    enum RonaldoError: Error {
        case errorURL
        case urlInvalido
        case errorDesconocido
    }

}
