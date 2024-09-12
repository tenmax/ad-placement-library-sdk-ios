//
//  DemoSettings.h
//  sdkdemo
//
//  Created by Picker Weng on 2024/9/12.
//

#ifndef DemoSettings_h
#define DemoSettings_h

@class TenMaxMobileSDKConfiguration;

@interface DemoSettings : NSObject

+ (NSString *)interstitial;
+ (NSString *)inlineBanner;
+ (NSString *)screenTop;
+ (NSString *)screenBottom;
+ (TenMaxMobileSDKConfiguration *)configuration;

@end

#endif /* DemoSettings_h */
