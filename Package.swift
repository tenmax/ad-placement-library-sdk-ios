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
            url: "https://github.com/tenmax/ad-placement-library-sdk-ios/releases/download/v0.0.3/TenMaxMobileAdsSDK.xcframework.zip",
            checksum: "686c6619cddea54d6b9b0c7152e019b441082d8ff6b0307381f89a6d8c0de942"
        ),
    ]
)
