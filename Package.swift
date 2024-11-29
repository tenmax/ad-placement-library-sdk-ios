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
            url: "https://github.com/tenmax/ad-placement-library-sdk-ios/releases/download/v1.0.12/TenMaxMobileAdsSDK.xcframework.zip",
            checksum: "640b589d1904ec341e22a495e288e5d81b2019842548451730a46a4f18eac93d"
        ),
    ]
)
