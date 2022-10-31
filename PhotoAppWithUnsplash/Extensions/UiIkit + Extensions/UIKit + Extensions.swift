//
//  UIKit + Extensions.swift
//  PhotoAppWithUnsplash
//
//  Created by Павел Афанасьев on 25.10.2022.
//

import UIKit

extension UIView {
    
    func addViews(_ view: UIView){
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setUpLabel(text: String, fontSize: CGFloat) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = Resources.Fonts.avenirNextRegular(with: fontSize)
        return label
    }
}

