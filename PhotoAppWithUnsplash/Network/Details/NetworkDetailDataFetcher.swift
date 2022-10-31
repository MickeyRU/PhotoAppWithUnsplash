//
//  NatworkDetailDataFetcher.swift
//  PhotoAppWithUnsplash
//
//  Created by Павел Афанасьев on 10.10.2022.
//

import UIKit

class NetworkDetailDataFetcher {
    
    var networkDetailService = NetworkDetailServise()

    func fetchData(photoId: String, complition: @escaping (DetailResults?) -> ()){
        networkDetailService.request(photoId: photoId) { (data, error) in
            if let error = error {
                print(error.localizedDescription)
                complition(nil)
            }
            let decode = self.decodeJSON(type: DetailResults.self, from: data)
            complition(decode)
        }
    }

    // Универсальная функция с джинериками позволяющая использовать любую модель данных, главное чтоб была подписана под протокол Decodable
    func decodeJSON<T:Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from else {return nil}
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let error {
            print(error)
            return nil
        }
    }
}


