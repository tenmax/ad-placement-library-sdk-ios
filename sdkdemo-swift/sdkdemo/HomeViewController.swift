//
//  HomeViewController.swift
//  sdkdemo
//
//  Created by Picker Weng on 2024/7/27.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let testCases: [(String, Selector)] = [
        ("INTERSTITIAL AD", #selector(toInterstitialAd)),
        ("AUTO-RESIZING INLINE AD", #selector(toAutoResizeInlineAd)),
        ("SCREEN TOP AD", #selector(toScreenTopBannerAd)),
        ("SCREEN BOTTOM AD", #selector(toScreenBottomBannerAd)),
        ("FLOATING AD", #selector(toFloatingAd)),
    ]
    
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
        
        testCases.forEach {
            let button = createTestCaseAction(for: $0, action: $1)
            stackView.addArrangedSubview(button)
        }
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

private
extension HomeViewController {
    func createTestCaseAction(for name: String, action: Selector) -> UIButton {
        let actionButton = UIButton(type: .custom)
        actionButton.backgroundColor = .purple
        actionButton.setTitle(name, for: .normal)
        actionButton.addTarget(self, action: action, for: .touchUpInside)
        actionButton.applyCustomStyle()
        return actionButton
    }
}

extension HomeViewController {
    @objc private func toInterstitialAd() {
        navigationController?.pushViewController(InterstitialViewController(), animated: true)
    }
    
    @objc private func toAutoResizeInlineAd() {
        navigationController?.pushViewController(InlineBannerAdAutoResizeViewController(), animated: true)
    }
    
    @objc private func toAspectFillInlineAd() {
        navigationController?.pushViewController(InlineBannerAdAspectFilliViewController(), animated: true)
    }
    
    @objc private func toScreenTopBannerAd() {
        navigationController?.pushViewController(ScreenTopBannerViewController(), animated: true)
    }
    
    @objc private func toScreenBottomBannerAd() {
        navigationController?.pushViewController(ScreenBannerBottomViewController(), animated: true)
    }
    
    @objc private func toFloatingAd() {
        navigationController?.pushViewController(FloatingAdViewController(), animated: true)
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

