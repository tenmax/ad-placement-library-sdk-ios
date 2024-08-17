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
            url: "https://github.com/tenmax/ad-placement-library-sdk-ios/releases/download/v0.0.0/TenMaxMobileAdsSDK.xcframework.zip",
            checksum: "5dbecdb9487149f0be7ed7d96897e12f0d38862b9165053f3e0373dd463335d1"
        ),
    ]
)
