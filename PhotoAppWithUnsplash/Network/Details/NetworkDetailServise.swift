//
//  NetworkDetailServise.swift
//  PhotoAppWithUnsplash
//
//  Created by Павел Афанасьев on 10.10.2022.
//

import UIKit

class NetworkDetailServise {
    
    // MARK: - Search Requests for Photo details in DetailViewController

    // Построение запроса данных по URL
    func request (photoId: String, completion: @escaping (Data?, Error?) -> Void) {
        guard let url = prepeareURL(photoId: photoId) else { return }
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = prepareHeader()
        request.httpMethod = "get"
        let task = createDataTask(from: request, complition: completion)
        task.resume()
    }

    // Настраиваем URl
    private func prepeareURL(photoId: String) -> URL? {
        let url = "https://api.unsplash.com/photos/" + photoId
        guard let prepearedURL = URL(string: url) else { return nil}
        return prepearedURL
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


