//
//  InlineBannerViewController.swift
//  sdkdemo
//
//  Created by Picker Weng on 2024/8/8.
//

import UIKit
import TenMaxMobileAdsSDK
import Toast

class InlineBannerViewController: UIViewController {

    private let spaceId = "5508e386d26f4b52"
    
    private var water1: UIImageView!
    private var water2: UIImageView!
    private var water3: UIImageView!
    private var water4: UIImageView!
    
    private var inlineAd1 = UIView()
    private var inlineAd2 = UIView()
    
    private var tenMaxAd: TenMaxAd?
    private var duplicatedTenMaxAd: TenMaxAd?
    
    private let scrollView = UIScrollView()
    private let stackView = UIStackView()
    
    private var inlineAd1HeightConstraint: NSLayoutConstraint!
    private var inlineAd2HeightConstraint: NSLayoutConstraint!
    
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
        
        water1 = createImageView(named: "water1")
        water2 = createImageView(named: "water2")
        water3 = createImageView(named: "water3")
        water4 = createImageView(named: "water4")
        
        stackView.addArrangedSubview(water1)
        stackView.addArrangedSubview(inlineAd1)
        stackView.addArrangedSubview(water2)
        stackView.addArrangedSubview(water3)
        stackView.addArrangedSubview(inlineAd2)
        stackView.addArrangedSubview(water4)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tenMaxAd = TenMaxMobileSDK.shared().inlineAd(spaceId: spaceId, on: inlineAd1, self)
        duplicatedTenMaxAd = TenMaxMobileSDK.shared().inlineAd(spaceId: spaceId, on: inlineAd2, self)
        
        tenMaxAd?.show()
        duplicatedTenMaxAd?.show()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        tenMaxAd?.dispose()
        duplicatedTenMaxAd?.dispose()
    }
    
    private func createImageView(named: String) -> UIImageView {
        let imageView = UIImageView(image: UIImage(named: named))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
    private func configureInlineAd(_ inlineAd: UIView, heightConstraint: inout NSLayoutConstraint?) {
        inlineAd.translatesAutoresizingMaskIntoConstraints = false
        heightConstraint = inlineAd.heightAnchor.constraint(equalToConstant: 250)
        heightConstraint?.isActive = true
    }
}

extension InlineBannerViewController: TenMaxAdSessionDelegate {
    func adViewableEventSent(_ session: TenMaxAdSession) {
        view.makeToast("viewable event sent (space id: \(session.space.spaceId)")
    }
}
