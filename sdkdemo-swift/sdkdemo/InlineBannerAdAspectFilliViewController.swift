//
//  InlineBannerAdAspectFilliViewController.swift
//  sdkdemo
//
//  Created by Picker Weng on 2024/11/14.
//

import UIKit
import TenMaxMobileAdsSDK
import Toast

final class InlineBannerAdAspectFilliViewController: UIViewController {

    private var water1: UIImageView!
    private var water2: UIImageView!
    private var water3: UIImageView!
    private var water4: UIImageView!
    
    private let adFramer = UIView()
    private let adContainer = UIView()
    
    private var tenMaxAd: TenMaxAd?
    
    private let scrollView = UIScrollView()
    private let stackView = UIStackView()
    
    private var adFramerWidthConstraint: NSLayoutConstraint!
    private var adFramerHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Inline AD"
        
        view.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stackView)
        
        water1 = createImageView(named: "water1")
        water2 = createImageView(named: "water2")
        water3 = createImageView(named: "water3")
        water4 = createImageView(named: "water4")
        
        stackView.addArrangedSubview(water1)
        stackView.addArrangedSubview(adFramer)
        stackView.addArrangedSubview(water2)
        stackView.addArrangedSubview(water3)
        stackView.addArrangedSubview(water4)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])
        
        setupAspectFillingAd()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        tenMaxAd = TenMaxMobileSDK.shared().inlineAd(
            spaceId: TenMaxSdkConfiguration.AdSpaceIds.aspectFillingInlineAd,
            on: adContainer,
            with: TenMaxInlineAdOptions()
                .aspectFill(adFramer)
                .listenSession(self)
                .monitorInitiation { spaces, error in
                    if let error {
                        self.view.makeToast("failed to initiate, due to \(error.localizedDescription)")
                    }
                }
        )
        tenMaxAd?.show()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        tenMaxAd?.dispose()
    }
    
    private func createImageView(named: String) -> UIImageView {
        let imageView = UIImageView(image: UIImage(named: named))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
}

extension InlineBannerAdAspectFilliViewController {
    func setupAspectFillingAd() {
        adFramer.translatesAutoresizingMaskIntoConstraints = false
        adFramer.addSubview(adContainer)
        
        adContainer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            adContainer.centerXAnchor.constraint(equalTo: adFramer.centerXAnchor),
            adContainer.centerYAnchor.constraint(equalTo: adFramer.centerYAnchor),
        ])
        
        adFramerWidthConstraint = adFramer.widthAnchor.constraint(equalToConstant: 300)
        adFramerHeightConstraint = adFramer.heightAnchor.constraint(equalToConstant: 250)
        
        NSLayoutConstraint.activate([
            adFramerWidthConstraint,
            adFramerHeightConstraint
        ])
    }
}

extension InlineBannerAdAspectFilliViewController: TenMaxAdSessionDelegate {
    func adViewableEventSent(_ session: TenMaxAdSession) {
        view.makeToast("viewable event sent (space id: \(session.space.spaceId)")
    }
}
