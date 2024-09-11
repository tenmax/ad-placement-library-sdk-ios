//
//  HomeViewController.swift
//  sdkdemo
//
//  Created by Picker Weng on 2024/7/27.
//

import UIKit

class HomeViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let firstVC = InterstitialViewController()
        firstVC.tabBarItem = UITabBarItem(title: "Intersitial", image: UIImage(named: "home"), tag: 0)
        
        let secondVC = InlineBannerViewController()
        secondVC.tabBarItem = UITabBarItem(title: "Inline", image: UIImage(named: "favorite"), tag: 1)
        
        let thirdVC = ScreenBannerViewController()
        thirdVC.tabBarItem = UITabBarItem(title: "Top & Bottom", image: UIImage(named: "dataset"), tag: 2)
        
        viewControllers = [firstVC, secondVC, thirdVC]
    }
}
