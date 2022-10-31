//
//  DetailResults.swift
//  PhotoAppWithUnsplash
//
//  Created by Павел Афанасьев on 10.10.2022.
//

import UIKit

struct DetailResults: Decodable {
    let id: String
    let urls: [UrlKind.RawValue: String]
    let location: Location?
    let downloads: Int
    let created_at: String
    let user: User

    enum UrlKind: String {
        case raw
        case full
        case regular
        case small
        case thumb
    }
}

struct Location: Decodable {
    let name: String?
}

struct User: Decodable {
    let name: String
}

