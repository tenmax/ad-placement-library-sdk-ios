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

    private let spaceId = TenMaxSdkConfiguration.AdSpaceIds.interstitialAd
    
    private var water1: UIImageView!
    private var water2: UIImageView!
    private var water3: UIImageView!
    private var water4: UIImageView!
    private let scrollView = UIScrollView()
    private let stackView = UIStackView()
    
    private var tenMaxAd: TenMaxAd?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -20)
        ])
        
        water1 = UIImageView.create(named: "water1")
        water2 = UIImageView.create(named: "water2")
        water3 = UIImageView.create(named: "water3")
        water4 = UIImageView.create(named: "water4")
        
        stackView.addArrangedSubview(water1)
        stackView.addArrangedSubview(water2)
        stackView.addArrangedSubview(water3)
        stackView.addArrangedSubview(water4)
        
        tenMaxAd?.dispose()
        tenMaxAd = TenMaxMobileSDK.shared().interstitialAd(
            spaceId: spaceId,
            with: .init()
                .listenSession(self)
                .monitorInitiation({ spaces, error in
                    if let error {
                        self.view.makeToast("failed to initiate, due to \(error.localizedDescription)")
                    }
                })
        )
        tenMaxAd?.show()
    }
    
    deinit {
        tenMaxAd?.dispose()
    }
    
    @objc func openAd(_ sender: UIButton) {
        tenMaxAd?.show()
    }
}

extension InterstitialViewController: TenMaxAdSessionDelegate {
    func adViewableEventSent(_ session: TenMaxAdSession) {
        view.makeToast("viewable event sent (space id: \(session.space.spaceId)")
    }
}
