//
//  DemoSettings.swift
//  sdkdemo
//
//  Created by Picker Weng on 2024/9/8.
//

import TenMaxMobileAdsSDK

struct DemoSettings {
    private static let publisherId = ServiceIds.publisherId
    
    enum Space {
        case interstitial
        case inline
        case screenTop
        case screenBottom
    }
    
    static let SpaceIds: [Space:String] = [
        Space.interstitial: ServiceIds.interstitialAd,
        Space.inline: ServiceIds.inlineAd,
        Space.screenTop: ServiceIds.screenTopAd,
        Space.screenBottom: ServiceIds.screenBottomAd,
    ]
    
    static var configuration: TenMaxMobileSDK.Configuration {
        .init(publisherId: publisherId)
    }
    
    static func spaceId(of adSpace: Space) -> String {
        SpaceIds[adSpace] ?? ""
    }
}
