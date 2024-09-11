//
//  DemoSettings.swift
//  sdkdemo
//
//  Created by Picker Weng on 2024/9/8.
//

import TenMaxMobileAdsSDK

struct DemoSettings {
    private static let publisherId = "0fe5b5e7c1"
    
    enum Space: String {
        case interstitial = "3f8e54ea2c4549d0"
        case inline = "7ae4f7cd01c64629"
        case screenTop = "12b441e7abce4bb4"
        case screenBottom = "059d401c74754687"
    }
    
    static var configuration: TenMaxMobileSDK.Configuration {
        .init(publisherId: publisherId)
    }
}
