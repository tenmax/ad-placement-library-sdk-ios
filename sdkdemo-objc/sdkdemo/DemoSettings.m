//
//  DemoSettings.m
//  sdkdemo
//
//  Created by Picker Weng on 2024/9/12.
//

#import <Foundation/Foundation.h>
#import "DemoSettings.h"
#import "sdkdemo-Swift.h"

@import TenMaxMobileAdsSDK;

@interface DemoSettings ()

@end

@implementation DemoSettings

+ (NSString *)interstitial {
    return @"3f8e54ea2c4549d0";
}

+ (NSString *)inlineBanner {
    return @"7ae4f7cd01c64629";
}

+ (NSString *)screenTop {
    return @"12b441e7abce4bb4";
}

+ (NSString *)screenBottom {
    return @"059d401c74754687";
}

+ (TenMaxMobileSDKConfiguration *)configuration {
    return [[TenMaxMobileSDKConfiguration alloc] initWithPublisherId:@"0fe5b5e7c1"];
}

@end
