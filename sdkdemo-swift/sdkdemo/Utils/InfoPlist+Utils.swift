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
