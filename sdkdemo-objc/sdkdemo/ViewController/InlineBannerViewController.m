//
//  InlineBannerViewController.m
//  sdkdemo
//
//  Created by Picker Weng on 2024/9/11.
//

#import "InlineBannerViewController.h"
#import "sdkdemo-Swift.h"

@import TenMaxMobileAdsSDK;

@interface InlineBannerViewController () <TenMaxAdSessionDelegate>
@property (nonatomic, strong) TenMaxAd *tenMaxAd;
@property (nonatomic, strong) NSString *spaceId;
@property (nonatomic, strong) UIView *inlineAd1;
@end

@implementation InlineBannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.spaceId = DemoSettings.inlineBanner;
    
    self.view.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:scrollView];
    
    UIStackView *stackView = [[UIStackView alloc] init];
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.spacing = 10;
    stackView.distribution = UIStackViewDistributionEqualSpacing;
    stackView.alignment = UIStackViewAlignmentCenter;
    stackView.translatesAutoresizingMaskIntoConstraints = NO;
    [scrollView addSubview:stackView];
    
    [NSLayoutConstraint activateConstraints:@[
        [scrollView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [scrollView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
        [scrollView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
        [scrollView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
        
        [stackView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [stackView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
        [stackView.topAnchor constraintEqualToAnchor:scrollView.topAnchor],
        [stackView.bottomAnchor constraintEqualToAnchor:scrollView.bottomAnchor]
    ]];
    
    self.inlineAd1 = [[UIView alloc] init];
    
    UIImageView *water1 = [self createImageViewWithName:@"water1"];
    UIImageView *water2 = [self createImageViewWithName:@"water2"];
    UIImageView *water3 = [self createImageViewWithName:@"water3"];
    UIImageView *water4 = [self createImageViewWithName:@"water4"];
    
    [stackView addArrangedSubview:water1];
    [stackView addArrangedSubview:self.inlineAd1];
    [stackView addArrangedSubview:water2];
    [stackView addArrangedSubview:water3];
    [stackView addArrangedSubview:water4];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.tenMaxAd = [TenMaxMobileSDK.shared inlineAdWithSpaceId:self.spaceId on:self.inlineAd1 :self :nil];
    [self.tenMaxAd show];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.tenMaxAd dispose];
}

- (UIImageView *)createImageViewWithName:(NSString *)name {
    UIImage *image = [UIImage imageNamed:name];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    return imageView;
}

#pragma mark - TenMaxAdSessionDelegate

- (void)adViewableEventSent:(TenMaxAdSession *)session {
    [self makeToastWithText:[NSString stringWithFormat:@"viewable event sent (space id: %@)", session.space.spaceId]];
}

@end
