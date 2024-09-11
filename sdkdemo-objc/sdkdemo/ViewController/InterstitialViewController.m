//
//  InterstitialViewController.m
//  sdkdemo
//
//  Created by Picker Weng on 2024/9/11.
//

#import "InterstitialViewController.h"
#import "sdkdemo-Swift.h"

@import TenMaxMobileAdsSDK;

@interface InterstitialViewController () <TenMaxAdSessionDelegate>

@property (nonatomic, strong) NSString *spaceId;
@property (nonatomic, strong) TenMaxAd *tenMaxAd;

@end

@implementation InterstitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.spaceId = DemoSettings.interstitial;
    
    UIButton *button = [self createButtonWithTitle:@"Open Interstitial Ad" color:[UIColor orangeColor] action:@selector(openAd:)];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:button];
    
    [NSLayoutConstraint activateConstraints:@[
        [button.widthAnchor constraintEqualToConstant:240],
        [button.heightAnchor constraintEqualToConstant:40],
        [button.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [button.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-20]
    ]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tenMaxAd dispose];
    self.tenMaxAd = [TenMaxMobileSDK.shared interstitialAdWithSpaceId:self.spaceId :self :^(NSArray *spaces, NSError *error) {
        if (error) {
            NSLog(@"%@", error);
        } else {
            NSLog(@"%@", spaces);
        }
    }];
}

- (void)dealloc {
    [self.tenMaxAd dispose];
}

- (void)openAd:(UIButton *)sender {
    [self.tenMaxAd show];
}

- (UIButton *)createButtonWithTitle:(NSString *)title color:(UIColor *)color action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:title forState:UIControlStateNormal];
    button.backgroundColor = color;
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.layer.cornerRadius = 10;
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

#pragma mark - TenMaxAdSessionDelegate

- (void)adViewableEventSent:(TenMaxAdSession *)session {
//    [self.view makeToast:[NSString stringWithFormat:@"viewable event sent (space id: %@)", session.space.spaceId]];
}

@end
