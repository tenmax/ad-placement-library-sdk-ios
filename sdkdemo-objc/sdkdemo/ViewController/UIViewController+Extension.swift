//
//  UIViewController+Extension.swift
//  sdkdemo
//
//  Created by Picker Weng on 2024/9/11.
//

import UIKit
import Toast

public extension UIViewController {
    @objc
    func makeToast(text: String) {
        view.makeToast(text)
    }
}
