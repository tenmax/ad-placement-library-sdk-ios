//
//  UIImageView+Utils.swift
//  sdkdemo
//
//  Created by Picker Weng on 2024/11/3.
//

import UIKit

extension UIImageView {
    static func create(named: String, contentMode: ContentMode = .scaleAspectFill) -> UIImageView {
        let imageView = UIImageView(image: UIImage(named: named))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
}
