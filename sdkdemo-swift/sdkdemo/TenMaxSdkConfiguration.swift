//
//  TenMaxSdkConfiguration.swift
//  sdkdemo
//
//  Created by Picker Weng on 2024/11/14.
//

import Foundation
import TenMaxMobileAdsSDK

struct TenMaxSdkConfiguration {
    private static let infoList = Bundle.main.infoDictionary?["TenMax SDK Configuration"] as? [String: Any] ?? [:]
    
    static var publisherId: String {
        return infoList["Publisher Identifier"] as? String ?? ""
    }
    
    struct AdSpaceIds {
        private static let ids = infoList["AdSpace Identifiers"] as? [String: Any] ?? [:]
        
        static var interstitialAd: String {
            return ids["interstitial"] as? String ?? ""
        }
        
        static var resizingInlineAd: String {
            return ids["resizing inline"] as? String ?? ""
        }
        
        static var aspectFillingInlineAd: String {
            return ids["aspect-filling inline"] as? String ?? ""
        }
        
        static var screenTopAd: String {
            return ids["screenTop"] as? String ?? ""
        }
        
        static var screenBottomAd: String {
            return ids["screenBottom"] as? String ?? ""
        }
        
        static var floatingAd: String {
            return ids["floating"] as? String ?? ""
        }
        
        static var all: [String: String] {
            return ids as? [String: String] ?? [:]
        }
    }
}
extension TenMaxSdkConfiguration {
    static var configuration: TenMaxMobileSDK.Configuration {
        .init(publisherId: publisherId)
    }
}
