// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TenMaxMobileAdsSDK",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        .library(name: "TenMaxMobileAdsSDK", targets: ["TenMaxMobileAdsSDK"])
    ],
    targets: [
        .binaryTarget(
            name: "TenMaxMobileAdsSDK",
            url: "https://github.com/tenmax/ad-placement-library-sdk-ios/releases/download/v1.0.10/TenMaxMobileAdsSDK.xcframework.zip",
            checksum: "3afc7235393e86937e20e3f00440ba43dc5ae1faa5ea133fb2e48e1a2835d848"
        ),
    ]
)
