//
//  InfoPlist+Utils.swift
//  com.tenmax.sdkdemo.public
//
//  Created by Picker Weng on 2024/11/3.
//

import Foundation

struct InfoPlistReader {
    static let bundle = Bundle.main
    
    static func value<T>(for key: String) -> T? {
        return bundle.object(forInfoDictionaryKey: key) as? T
    }
    
    static func string(for key: String) -> String? {
        return value(for: key)
    }
    
    static func bool(for key: String) -> Bool? {
        return value(for: key)
    }
    
    static func number(for key: String) -> NSNumber? {
        return value(for: key)
    }
    
    static func array<T>(for key: String) -> [T]? {
        return value(for: key)
    }
    
    static func dictionary<K: Hashable, V>(for key: String) -> [K: V]? {
        return value(for: key)
    }
}

struct ServiceIds {
    private static let dictionary = Bundle.main.infoDictionary?["ServiceIds"] as? [String: Any] ?? [:]
    
    static var publisherId: String {
        return dictionary["PublisherId"] as? String ?? ""
    }
    
    static var interstitialAd: String {
        return dictionary["InterstitialAd"] as? String ?? ""
    }
    
    static var inlineAd: String {
        return dictionary["InlineAd"] as? String ?? ""
    }
    
    static var screenTopAd: String {
        return dictionary["ScreenTopAd"] as? String ?? ""
    }
    
    static var screenBottomAd: String {
        return dictionary["ScreenBottomAd"] as? String ?? ""
    }
    
    static var floatingAd: String {
        return dictionary["FloatingAd"] as? String ?? ""
    }
    
    static var all: [String: String] {
        return dictionary as? [String: String] ?? [:]
    }
}

struct AppConfiguration {
    static var bundleId: String {
        return InfoPlistReader.string(for: "CFBundleIdentifier") ?? ""
    }
    
    static var displayName: String {
        if let displayName = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String {
            return displayName
        }
        if let bundleName = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String {
            return bundleName
        }
        return ""
    }
}
