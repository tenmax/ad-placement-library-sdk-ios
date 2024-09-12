//
//  AppDelegate.m
//  sdkdemo
//
//  Created by Picker Weng on 2024/9/12.
//

#import "AppDelegate.h"
#import "DemoSettings.h"
#import "HomeViewController.h"

@import TenMaxMobileAdsSDK;

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    if (@available(iOS 13, *)) {
        // Do only pure app launch stuff, not interface stuff
    } else {
        [TenMaxMobileSDK initiateWith:[UIApplication sharedApplication] configuration:DemoSettings.configuration callback:^(NSArray<TenMaxAdSpace *> * _Nullable spaces, NSError * _Nullable error) {
            if (error) {
                NSLog(@"Error: %@", error);
            } else {
                NSLog(@"Spaces: %@", spaces);
            }
        }];

        self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        self.window.rootViewController = [[HomeViewController alloc] init];
        [self.window makeKeyAndVisible];
    }
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options API_AVAILABLE(ios(13.0)) {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions API_AVAILABLE(ios(13.0)) {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
