//
//  Created by Carlos Vargas on 1/04/23.
//

import Foundation
import Combine

class BankApi {
    
    /**
     * Example: http://localhost:8000/login
     */
    func fetchLogin(loginRequest: LoginRequest) -> AnyPublisher<LoginResponse, Error> {
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
        
        urlRequest.httpMethod = "POST" // Remember: Body request works with POST not GET
        
        // Body
        let requestData = try! JSONEncoder().encode(loginRequest)
        urlRequest.httpBody = requestData
        
        // Header: - Important to send json request
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { (data: Data, response: URLResponse) in
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw RonaldoError.errorDesconocido
                }
                
                if (200 ... 299  ~= httpResponse.statusCode) {
                    return data
                }
                
                // Error status code: 300 ... 450
                let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: data)
                throw RonaldoError.errorData(errorResponse.message)
            }
            .decode(type: LoginResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    /**
     * Example: http://localhost:8000/user
     */
    func fetchUser(apiToken: String, userId: Int) -> AnyPublisher<GetUserResponse, Error> {
        guard var urlComponents = URLComponents(string: "http://localhost:8000/users/\(userId)") else {
            return Fail(error: RonaldoError.errorURL)
                .eraseToAnyPublisher()
        }
        urlComponents.queryItems = [
            URLQueryItem(name: "apiKey", value: apiToken)
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
                    print(error)
                    throw RonaldoError.errorData("")
                }
            }
            .eraseToAnyPublisher()
    }
    
    enum RonaldoError: Error, Equatable {
        case errorURL
        case urlInvalido
        case errorData(String)
        case errorStatusCode
        case errorDesconocido
    }
    
}
