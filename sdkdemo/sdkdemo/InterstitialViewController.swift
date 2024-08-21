//
//  InterstitialViewController.swift
//  sdkdemo
//
//  Created by Picker Weng on 2024/7/27.
//

import UIKit
import TenMaxMobileAdsSDK
import Toast

class InterstitialViewController: UIViewController {

    private let spaceId = "a99bbda71a6f4fb2"
    
    private var tenMaxAd: TenMaxAd?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = createButton(title: "Open Interstitial Ad", color: .orange, action: #selector(openAd(_:)))
        button.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 240),
            button.heightAnchor.constraint(equalToConstant: 40),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tenMaxAd = TenMaxMobileSDK.shared().interstitialAd(spaceId: spaceId, self) { spaces, error in
            if let error {
                print (error)
            } else {
                print (spaces)
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        tenMaxAd?.dispose()
    }
    
    @objc func openAd(_ sender: UIButton) {
        tenMaxAd?.show()
    }
    
    func createButton(title: String, color: UIColor, action: Selector) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.backgroundColor = color
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: action, for: .touchUpInside)
        return button
    }
}

extension InterstitialViewController: TenMaxAdSessionDelegate {
    func adViewableEventSent(_ session: TenMaxAdSession) {
        view.makeToast("viewable event sent (space id: \(session.space.spaceId)")
    }
}
