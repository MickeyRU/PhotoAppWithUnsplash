//
//  SearchResults.swift
//  PhotoAppWithUnsplash
//
//  Created by Павел Афанасьев on 03.10.2022.
//

import UIKit

struct SearchResults: Decodable {
    let total: Int
    let results: [UnsplasPhotos]
}

struct UnsplasPhotos: Decodable {
    let id: String
    let width: Int
    let height: Int
    let urls: [UrlKind.RawValue: String]
    let user: UserInfo
    
    enum UrlKind: String {
        case raw
        case full
        case regular
        case small
        case thumb
    }
}

struct UserInfo: Decodable {
    let name: String
}

