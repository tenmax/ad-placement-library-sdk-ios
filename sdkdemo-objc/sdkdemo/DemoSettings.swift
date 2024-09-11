//
//  DemoSettings.swift
//  sdkdemo
//
//  Created by Picker Weng on 2024/9/8.
//

import TenMaxMobileAdsSDK

@objcMembers
class DemoSettings: NSObject {
    private static let publisherId = "0fe5b5e7c1"
    
    static let interstitial: String = "3f8e54ea2c4549d0"
    static let inlineBanner: String = "7ae4f7cd01c64629"
    static let screenTop: String = "12b441e7abce4bb4"
    static let screenBottom: String = "059d401c74754687"
    
    static var configuration: TenMaxMobileSDK.Configuration {
        .init(publisherId: publisherId)
    }
}
