//
//  ScreenBannerViewController.swift
//  sdkdemo
//
//  Created by Picker Weng on 2024/7/28.
//

import UIKit
import WebKit
import TenMaxMobileAdsSDK
import Toast

class ScreenBannerViewController: UIViewController {

    private let screenTopSpaceId = "142f40b224cd48e6"
    private let screenBottomSpaceId = "bc4f97b54f5c425b"
    
    private var webView: WKWebView!
    
    private var screenTopAd: TenMaxAd?
    private var screenBottomAd: TenMaxAd?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        if let url = URL(string: "https://www.tenmax.io/tw/") {
            webView.load(URLRequest(url: url))
        }
        view.addSubview(webView)
        
        NSLayoutConstraint.activate([
            webView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        screenTopAd = TenMaxMobileSDK.shared().bannerAd(spaceId: screenTopSpaceId, on: view, at: .top, self)
        screenBottomAd = TenMaxMobileSDK.shared().bannerAd(spaceId: screenBottomSpaceId, on: view, at: .bottom, self)
        
        screenTopAd?.show()
        screenBottomAd?.show()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        screenTopAd?.dispose()
        screenBottomAd?.dispose()
    }
}

extension ScreenBannerViewController: TenMaxAdSessionDelegate {
    func adViewableEventSent(_ session: TenMaxAdSession) {
        view.makeToast("viewable event sent (space id: \(session.space.spaceId)")
    }
}
