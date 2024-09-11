//
//  HomeViewController.m
//  sdkdemo
//
//  Created by Picker Weng on 2024/9/11.
//
#import "HomeViewController.h"
#import "InterstitialViewController.h"
#import "InlineBannerViewController.h"
#import "ScreenBannerViewController.h"

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    InterstitialViewController *firstVC = [[InterstitialViewController alloc] init];
    firstVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Intersitial" image:[UIImage imageNamed:@"home"] tag:0];
    
    InlineBannerViewController *secondVC = [[InlineBannerViewController alloc] init];
    secondVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Inline" image:[UIImage imageNamed:@"favorite"] tag:1];
    
    ScreenBannerViewController *thirdVC = [[ScreenBannerViewController alloc] init];
    thirdVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Top & Bottom" image:[UIImage imageNamed:@"dataset"] tag:2];
    
    self.viewControllers = @[firstVC, secondVC, thirdVC];
}

@end
