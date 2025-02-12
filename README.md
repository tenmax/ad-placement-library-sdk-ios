# TenMax Mobile SDK for iOS/tvOS

This repository provides the guideline and examples to demonstrate how to use TenMax Mobile SDK to show AD on your iOS/tvOS app.

## Prerequisites

Before using the SDK, please contact TenMax (app_support@tenmax.io) to

- register you app bundle ID
- obtain you app publisher ID

The bundle ID and publisher ID would be used to initiate the SDK.

## Installation
### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the Xcode.

#### Xcode Project Integration

Go to `File > Add Package Dependencies...`, paste `https://github.com/tenmax/ad-placement-library-sdk-ios` into package URL. After the package is found, you can indicate the exact version of SDK. Then, click the `Add Package` to add the SDK package into your Xcode project.

#### Swift Package Integration

Adding TenMaxMobileAdsSDK as a dependency into the your `Package.swift` and indicating the SDK version.

```swift
dependencies: [
    .package(url: "https://github.com/tenmax/ad-placement-library-sdk-ios", .upToNextMajor(from: "0.0.1"))
]
```

Normally you'll need to add the `TenMaxMobileAdsSDK` target:

```swift
.product(name: "TenMaxMobileAdsSDK", package: "TenMaxMobileAdsSDK")
```

The Package.swift sample like this,

```swift
let package = Package(
    name: "YourPackageName",
    products: [
        .library(name: "YourPackageName", targets: ["YourTargetName"]),
    ],
    dependencies: [
      .package(url: "https://github.com/tenmax/ad-placement-library-sdk-ios", .upToNextMajor(from: "0.0.1"))
    ],
    targets: [
        .target(
            name: "YourTargetName",
            dependencies: [
              .product(name: "TenMaxMobileAdsSDK", package: "ad-placement-library-sdk-ios")
            ],
        ),
    ]
)
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks. To integrate TenMaxMobileAdsSDK into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
binary "https://raw.githubusercontent.com/tenmax/ad-placement-library-sdk-ios/main/TenMaxMobileAdsSDK.json"
```

After Carthage downloaded the `TenMaxMobileAdsSDK.xcframework` file, you can found out the file in the folder `./Carthage/Build`. Make sure you have added `TenMaxMobileAdsSDK.xcframework` to the "Linked Frameworks and Libraries" section of your target.

## SDK Configuration

### App Configuration

Update your app's `info.plist` file to add `NSUserTrackingUsageDescription` key with a string value that will be showed on the dialog when user to request the app-tracking authorization.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>NSUserTrackingUsageDescription</key>
	<string>Tracking usage description</string>
	<key>UIApplicationSceneManifest</key>
</dict>
</plist>

```

### SDK initiation

TenMax Mobile SDK must be initiated before use, thus, we recommend you to initiate it in your `AppDelegate` class. The SDK would run the initiation in an independent thread pool so won't increase your application launch time.

The publisher ID is provided by TenMax and the bundle ID must be the same as the value you registered in the [Prerequisites](#prerequisites) section.

```swift
import TenMaxMobileAdsSDK

class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      TenMaxMobileSDK.initiate(
        configuration: .init(publisherId: "{publisher-id}")) { spaces, error in
          if let error {
              print (error)
          } else {
              print (spaces)
          }
      }
    }
}
```

If you do not initiate the SDK, every call to show ADs, the SDK would give you an error. The SDK initiation would load the AD information from the TenMax's server and try to obtain the iOS advertising ID (IDFA) for you. Now, you are ready to show AD.

## Show ADs

### Interstitial AD (iOS only)

First, let show an interstitial AD (fullscreen AD) when you click the `Open Interstitial Ad` button. Assume your application's `HomeViewController` has three tabs: `InterstitialViewController`, `InlineBannerViewController`, and `ScreenBannerViewController`. In the `InterstitialViewController`, add following lines to show an interstitial AD when pressed the `Open Interstitial Ad` button:

```swift
import TenMaxMobileAdsSDK

class InterstitialViewController: UIViewController {

    private var tenMaxAd: TenMaxAd?

    override func viewDidLoad() {
      /** initialization for the OpenAD button */
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tenMaxAd = TenMaxMobileSDK.shared().interstitialAd(spaceId: "{interstitial-space-id}") { spaces, error in
            if let error {
                print (error)
            } else {
                print (spaces)
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        tenMaxAd?.dispose()
    }
    
    @objc func openAd(_ sender: UIButton) {
        tenMaxAd?.show()
    }
}

```

The AD presentation is asynchronous, thus, please keep the `TenMaxAdDisposable` object returned from the `interstitialAd` method. You can dispose (cancel) the presentation when the user switch to other tabs by calling `disposable.dipose()`. The SDK would cancel the presentation (if not presented yet) or remove the presentation and then clean up resources to reduce the memory usage.

### Banner AD (iOS only)

You can show a banner AD on top of the screen or bottom of the screen. Even more, you can show both top and bottom banner on the same screen. However, the relationship between the banner and your app's UI is up to you.

You can call the `bannerAd` method to let SDK show the banner AD in the specified container.

```swift
import TenMaxMobileAdsSDK

class ScreenBannerViewController: UIViewController {

    private var screenTopAd: TenMaxAd?
    
    override func viewDidLoad() {
      /** initialization for sub-views */
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        screenTopAd = TenMaxMobileSDK.shared().bannerAd(spaceId: "{banner-space-id}", on: view, at: .top)
        screenTopAd?.show()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        screenTopAd?.dispose()
    }
}
```

The SDK would use this information to avoid duplication (see [Duplication Detection](#duplication-detection)).

### Inline AD (supported iOS and tvOS)

To embed an inline AD into your app, you need to add a container into your layout. The SDK process the AD view based on `Auto Layout` system, thus, you should provide the constraints to indicate the relationship between your UIs and AD container correctly.

In your code, use the `inlineAd` method to embed the AD into the container. Then, the SDK would resize your container when the AD is loaded and ready to show.

```swift
import TenMaxMobileAdsSDK

class InlineBannerViewController: UIViewController {

    private let inlineAd = UIView()
    private var tenMaxAd: TenMaxAd?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tenMaxAd = TenMaxMobileSDK.shared().inlineAd(spaceId: "{inline-space-id}", on: inlineAd)
        tenMaxAd?.show()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        tenMaxAd?.dispose()
    }
}
```

[This is an experimental feature, cloud be changed in the later version.]
You can let the inline AD to (aspect) full fill a container with fixed size.
For example, the `inlineAdContainer` is a 300 x 200 fixed size container. 

Then, when initiate the inline AD, you can configure it with a options to specify which container to fill.

```swift
override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    tenMaxAd = TenMaxMobileSDK.shared().inlineAd(
        spaceId: "{inline-space-id}", 
        on: inlineAd,
        with: TenMaxInlineAdOptions()
            .aspectFill(inlineAdContainer)
    )
    tenMaxAd?.show()
}
```

Note, to use the aspect fill, you need to ensure the container's aspect ratio is the same as the AD.
If the aspect ratio does not match, if after scale, the calculated width or height exceeds the container's
width or height, the AD could be cropped. You can know the case happened by listen the event (see the [callbacks and delegate](#callback-and-delegate) section).

### Floating AD (iOS only)

You can let an AD keep floating on your app **until the app user close it**.
To show the floating app, call `floatingAd` with the root-view.

```swift
import TenMaxMobileAdsSDK

class FloatingAdViewController: UIViewController {

    private var tenMaxAd: TenMaxAd?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tenMaxAd = TenMaxMobileSDK.shared().floatingAd(
            spaceId: "{floating-space-id}", 
            on: view,
            options: TenMaxFloatingAdOptions()
        )
        tenMaxAd?.show()
    }
    
    deinit {
        tenMaxAd?.dispose()
    }
}

```

## Advanced topics

### Timing and Naming Convention

AD on different pages would have different prices. To collect needed information, TenMax Mobile SDK would monitor your application behavior. Thus, to avoid disturbing information collection, please follow these convention:

- Always show ADs when or after the view will appear to ensure the size layout is already finished
- Give unique name to the view controller that plays the role like a page, e.g., `InterstitialViewController`, `ScreenBannerViewController`, or `InlineBannerViewController` in the previous samples.

If you do not follow the convention and SDK can not collect the correct information, the SDK would refuse to show AD in the unexpected case.

### Callback and Delegate
Each method that show AD has two optional parameters: delegate and callback. The callback would be called immediately when the specified space ID is found or something wrong happened. You can provide the callback to know what happened during the setup.

You can provide the delegate to receive all the events of the entire presentation lifecycle. Here is a simple delegate to receive three important events:
- `adViewableEventSent` - the user saw the AD for 1 second, and SDK would send viewable event to the TenMax server.
- `adLoadingTimeout` - the AD loading timeout (maybe network is too slow) so the presentation is cancelled.
- `adNotFound` - can not find an AD for the specified space so the presentation is cancelled.

```swift
class SessionDelegate: TenMaxAdSessionDelegate {
  private let view: UIView

  init(view: UIView) {
    self.view = view
  }
  
  func adViewableEventSent(_ session: TenMaxAdSession) {
      view.makeToast("viewable event sent")
  }

  func adLoadingTimeout(_ session: TenMaxAdSession) {
      view.makeToast("AD loading timeout")
  }

  func adNotFound(_ session: TenMaxAdSession) {
      view.makeToast("received adNoFill event")
  }
}
```

### Duplication Detection

For most of ADs, the presentation must be unique on page. Thus, TenMax Mobile SDK would track the presentation requests. If SDK found the duplication, it would show the warning message for the app developer to fix the case. Also, TenMax would review your app to ensure you follow TenMax's rules.

## Apple Privacy Survey for TenMax SDK

iOS publisher should provide the information that data their apps collect, including the data collected by third-party SDKs. For your convenience, TenMax SDK provides the information on its data collection in the [Apple Privacy Survey for TenMax SDK](Privacy.md).

## app-ads.txt Support

The app-ads.txt file is a standardized document listing authorized digital sellers, introduced by the IAB to enhance transparency and combat fraud in the advertising ecosystem. It ensures seller legitimacy, safeguarding against fraudulent activities and domain misrepresentation.

Developers are required to host this file at the root of their website. Brand advertisers and demand-side platforms (DSPs) access and analyze this file to validate seller authenticity when purchasing ad inventory programmatically through exchanges, supply-side platforms (SSPs), or ad networks.

Copy the app-ads.txt file into the root of the developer website so that it's findable in the location.

### app-ads.txt
```text
google.com, pub-4338256439626145, DIRECT, f08c47fec0942fa0 
google.com, pub-9467144491537745, DIRECT, f08c47fec0942fa0
tenmax.io, fadcc2c833, DIRECT
fout.jp, 1537, DIRECT
fout.jp, 113, DIRECT
```

## Issues and Contact

If you have any issue when using TenMax Mobile SDK, please contact app_support@tenmax.io. We would help you as soon as possible.

## User Data Deletion Notice

For requests to delete the privacy data linked to users, please submit the request via [User Data Deletion Notice Form](https://forms.office.com/r/SnU40q6VmQ).

## License

TenMax
