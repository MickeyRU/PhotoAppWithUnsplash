//
//  Resources.swift
//  PhotoAppWithUnsplash
//
//  Created by Павел Афанасьев on 26.10.2022.
//

import UIKit

enum Resources {
    
    enum FieldsName: String, CaseIterable {
        case id = "id"
        case description = "description"
        case authorName = "Автор:"
        case madeDate = "Дата создания:"
        case location = "Местоположение:"
        case downloads = "Скачиваний:"
    }
    
    enum Fonts {
        static func avenirNextRegular(with size: CGFloat) -> UIFont? {
            UIFont(name: "Avenir Next", size: size)
        }
    }
}
