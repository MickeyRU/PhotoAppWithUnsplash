//
//  NetworkService.swift
//  PhotoAppWithUnsplash
//
//  Created by Павел Афанасьев on 03.10.2022.
//

import UIKit

class NetworkService {
    
    // MARK: - Search Requests from start View Controller
    
    // Построение запроса данных по URL
    func request (searchTerm: String, completion: @escaping (Data?, Error? ) -> Void) {
        let params = self.prepareParams(searchTerm: searchTerm)
        let url = url.self(params: params)
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = prepareHeader()
        request.httpMethod = "get"
        let task = createDataTask(from: request, complition: completion)
        task.resume()
    }
        
    // Настраиваем параметры для работы последующих функций
    private func prepareParams(searchTerm: String?) -> [String: String] {
        var params = [String: String]()
        params["query"] = searchTerm
        params["page"] = String(1)
        params["per_page"] = String(30)
        return params
    }
    
    // Собираем URL адрес по кусочкам с помощью URLComponents
    private func url (params: [String: String]) -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.unsplash.com"
        components.path = "/search/photos"
        components.queryItems = params.map{ URLQueryItem(name: $0, value: $1)}
        return components.url!
    }
    
    // Настраиваем шапку запроса - с кодом авторитизации
    private func prepareHeader() -> [String: String]? {
        var header = [String: String]()
        header["Authorization"] = "Client-ID 9DBEOX6EqKYZabf3tBM1qLIda6Y8bEdgcHIyjnpQKMs"
        return header
    }
    
    // Настраиваем task
    private func createDataTask(from request: URLRequest, complition: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                complition(data, error)
            }
        }
    }
}
