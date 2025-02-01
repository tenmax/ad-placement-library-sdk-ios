// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TenMaxMobileAdsSDK",
    platforms: [
        .iOS(.v12),
        .tvOS(.v15)
    ],
    products: [
        .library(name: "TenMaxMobileAdsSDK", targets: ["TenMaxMobileAdsSDK"])
    ],
    targets: [
        .binaryTarget(
            name: "TenMaxMobileAdsSDK",
            url: "https://github.com/tenmax/ad-placement-library-sdk-ios/releases/download/v1.0.13/TenMaxMobileAdsSDK.xcframework.zip",
            checksum: "6aa273362f3c596d15957a9a8ec20df1a827f7481b4be12c453a61976985b065"
        ),
    ]
)
