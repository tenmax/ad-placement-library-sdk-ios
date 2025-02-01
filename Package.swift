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
            url: "https://github.com/tenmax/ad-placement-library-sdk-ios/releases/download/v1.1.0/TenMaxMobileAdsSDK.xcframework.zip",
            checksum: "64de7ca1d2c7ecc54575daf68045ab8319a9e4c38de6efb6d7a57abeee2ebdfb"
        ),
    ]
)
