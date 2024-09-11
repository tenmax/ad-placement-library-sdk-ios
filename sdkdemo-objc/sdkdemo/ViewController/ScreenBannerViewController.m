//
//  ScreenBannerViewController.m
//  sdkdemo
//
//  Created by Picker Weng on 2024/9/11.
//

#import "ScreenBannerViewController.h"
#import "sdkdemo-Swift.h"

#import <WebKit/WebKit.h>

@import TenMaxMobileAdsSDK;

@interface ScreenBannerViewController () <TenMaxAdSessionDelegate>

@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) TenMaxAd *screenTopAd;
@property (nonatomic, strong) TenMaxAd *screenTopDuplicatedAd;
@property (nonatomic, strong) TenMaxAd *screenBottomAd;
@property (nonatomic, copy) NSString *screenTopSpaceId;
@property (nonatomic, copy) NSString *screenBottomSpaceId;

@end

@implementation ScreenBannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.screenTopSpaceId = DemoSettings.screenTop;
    self.screenBottomSpaceId = DemoSettings.screenBottom;
    
    self.webView = [[WKWebView alloc] init];
    self.webView.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSURL *url = [NSURL URLWithString:@"https://www.tenmax.io/tw/"];
    if (url) {
        [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    }
    
    [self.view addSubview:self.webView];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.webView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor],
        [self.webView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor],
        [self.webView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor],
        [self.webView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor],
    ]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.screenTopAd = [TenMaxMobileSDK.shared bannerAdWithSpaceId:self.screenTopSpaceId on:self.view at:TenMaxBannerPositionTop :self :nil];
    self.screenBottomAd = [TenMaxMobileSDK.shared bannerAdWithSpaceId:self.screenBottomSpaceId on:self.view at:TenMaxBannerPositionBottom :self :nil];
    
    [self.screenTopAd show];
    [self.screenBottomAd show];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.screenTopAd dispose];
    [self.screenBottomAd dispose];
}

#pragma mark - TenMaxAdSessionDelegate

- (void)adViewableEventSent:(TenMaxAdSession *)session {
    [self makeToastWithText:[NSString stringWithFormat:@"viewable event sent (space id: %@)", session.space.spaceId]];
}

@end
