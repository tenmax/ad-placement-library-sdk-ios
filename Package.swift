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
            url: "https://github.com/tenmax/ad-placement-library-sdk-ios/releases/download/v1.0.7/TenMaxMobileAdsSDK.xcframework.zip",
            checksum: "1b82c30b32f8a03dedc1fc8f0d70533d87b712f78fe4116b04c98cc68b2d8956"
        ),
    ]
)
