//
//  HomeViewController.swift
//  sdkdemo
//
//  Created by Picker Weng on 2024/7/27.
//
import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = AppConfiguration.displayName
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 40
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        let interstitialButton = UIButton(type: .custom)
        interstitialButton.backgroundColor = .purple
        interstitialButton.setTitle("SHOW INTERSTITIAL AD", for: .normal)
        interstitialButton.addTarget(self, action: #selector(toInterstitialAd), for: .touchUpInside)
        interstitialButton.applyCustomStyle()
        
        let inlineButton = UIButton(type: .custom)
        inlineButton.setTitle("SHOW INLINE AD", for: .normal)
        inlineButton.addTarget(self, action: #selector(toInlineAd), for: .touchUpInside)
        inlineButton.applyCustomStyle()
        
        let screenTopButton = UIButton(type: .custom)
        screenTopButton.setTitle("SHOW SCREEN TOP AD", for: .normal)
        screenTopButton.addTarget(self, action: #selector(toScreenTopAd), for: .touchUpInside)
        screenTopButton.applyCustomStyle()
        
        let screenBottomButton = UIButton(type: .custom)
        screenBottomButton.setTitle("SHOW SCREEN BOTTOM AD", for: .normal)
        screenBottomButton.addTarget(self, action: #selector(toScreenBottomAd), for: .touchUpInside)
        screenBottomButton.applyCustomStyle()
        
        stackView.addArrangedSubview(interstitialButton)
        stackView.addArrangedSubview(inlineButton)
        stackView.addArrangedSubview(screenTopButton)
        stackView.addArrangedSubview(screenBottomButton)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func toInterstitialAd() {
        let vc = InterstitialViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func toInlineAd() {
        let vc = InlineBannerViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func toScreenTopAd() {
        let vc = ScreenTopBannerViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func toScreenBottomAd() {
        let vc = ScreenBannerBottomViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension UIButton {
    func applyCustomStyle() {
        backgroundColor = .main
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 10
        contentEdgeInsets = UIEdgeInsets(top: 12, left: 30, bottom: 12, right: 30)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.1
        
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 300),
            heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

