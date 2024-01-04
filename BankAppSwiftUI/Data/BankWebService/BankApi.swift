//
//  Created by Carlos Vargas on 1/04/23.
//

import Foundation
import Combine

class BankApi {

    /**
    * Example: https://api.spoonacular.com/recipes/782585/information?apiKey=faea268df94a44d4b75e8a46ee06f2fc
    */
    func fetShoom(id: Int)-> AnyPublisher<DetalleResponse,Error>{
        guard var urlComponents = URLComponents(string: "https://api.spoonacular.com/recipes/\(id)/information") else{
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
            .map{ (data: Data, response: URLResponse) in
                data
            }
            .decode(type: DetalleResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    enum RonaldoError: Error{
        case errorURL
        case urlInvalido
        case errorDesconocido
    }

}