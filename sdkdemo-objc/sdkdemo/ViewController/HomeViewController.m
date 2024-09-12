//
//  HomeViewController.m
//  sdkdemo
//
//  Created by Picker Weng on 2024/9/11.
//

#import <Foundation/Foundation.h>

#import "HomeViewController.h"
#import "InterstitialViewController.h"
#import "InlineBannerViewController.h"
#import "ScreenBannerViewController.h"

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray *viewControllers = @[
        [self createViewController:[[InterstitialViewController alloc] init] title:@"Interstitial" imageName:@"home" tag:0],
        [self createViewController:[[InlineBannerViewController alloc] init] title:@"Inline" imageName:@"favorite" tag:1],
        [self createViewController:[[ScreenBannerViewController alloc] init] title:@"Top & Bottom" imageName:@"dataset" tag:2]
    ];
    
    self.viewControllers = viewControllers;
    
    // Debug: Print the number of view controllers
    NSLog(@"Number of view controllers: %lu", (unsigned long)self.viewControllers.count);
    
    // Debug: Check if tabBar is hidden
    NSLog(@"TabBar is hidden: %@", self.tabBar.isHidden ? @"Yes" : @"No");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // Debug: Check which view controller is currently visible
    NSLog(@"Current visible view controller: %@", NSStringFromClass([self.selectedViewController class]));
}

- (UIViewController *)createViewController:(UIViewController *)viewController title:(NSString *)title imageName:(NSString *)imageName tag:(NSInteger)tag {
    viewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:[UIImage imageNamed:imageName] tag:tag];
    return viewController;
}

@end
