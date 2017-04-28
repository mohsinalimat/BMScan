//
//  BMDefaultScanningController.m
//  扫描封装
//
//  Created by ___liangdahong on 2017/4/28.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import "BMDefaultScanningController.h"
#import "BMScanSettingView.h"

#define BMScanSettingViewWidth   CGRectGetWidth([UIScreen mainScreen].bounds)
#define BMScanSettingViewHeight  CGRectGetHeight([UIScreen mainScreen].bounds)

#define kAreaWidth  170
#define kAreaHeight 170
#define kDistance   10
#define kAreaY (BMScanSettingViewHeight - kAreaHeight - 64) / 2.0

@interface BMDefaultScanningController ()

@property (strong, nonatomic) BMScanSettingView *scanSettingView;

@end

@implementation BMDefaultScanningController

- (BMScanSettingView *)scanSettingView {
    if (!_scanSettingView) {
        _scanSettingView = [BMScanSettingView scanSettingView];
    }
    return _scanSettingView;
}

- (UILabel *)scanfTitleLabel {
    return self.scanSettingView.titleLabel;
}
- (UIImageView *)leftTopImageView {
    return self.scanSettingView.leftTopImageView;
}
- (UIImageView *)leftBottonImageView {
    return self.scanSettingView.leftBottonImageView;
}
- (UIImageView *)rightTopImageView {
    return self.scanSettingView.rightTopImageView;
}
- (UIImageView *)rightBottonImageView {
    return self.scanSettingView.rightBottonImageView;
}

- (CGRect)rectOfInterest {
    [self.scanSettingView layoutIfNeeded];
    return self.scanSettingView.scanfAreaView.frame;
}

- (void)startScanning {
    [super startScanning];
    [self.scanSettingView startAnimation];
}

- (void)closureScanning {
    [super closureScanning];
    [self.scanSettingView stopAnimation];
}

- (void)captureWithValueString:(NSString *)valueString {
    if (self.scanningSuccessBlock) {
        self.scanningSuccessBlock(self, valueString);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view insertSubview:self.scanSettingView atIndex:1];
    self.scanSettingView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:self.scanSettingView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0];
    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:self.scanSettingView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0];
    NSLayoutConstraint *bottonConstraint = [NSLayoutConstraint constraintWithItem:self.scanSettingView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:self.scanSettingView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0];
    
    [self.view addConstraints:@[topConstraint, leftConstraint, bottonConstraint, rightConstraint]];

    [self.scanSettingView startAnimation];
    self.scanSettingView.topLayoutConstraint.constant = [self areaY];
    self.scanSettingView.widthLayoutConstraint.constant = [self areaWidth];
    self.scanSettingView.heightLayoutConstraint.constant = [self areaHeight];
    self.scanSettingView.titleLabelBottonLayoutConstraint.constant = [self areaTitleDistanceHeight];
    self.scanSettingView.scanfColor = [self areaColor];

    self.scanSettingView.leftTopImageView.image = [UIImage imageNamed:@"image_qr_corner_001_"];
    self.scanSettingView.leftBottonImageView.image = [UIImage imageNamed:@"image_qr_corner_003_"];
    self.scanSettingView.rightTopImageView.image = [UIImage imageNamed:@"image_qr_corner_002_"];
    self.scanSettingView.rightBottonImageView.image = [UIImage imageNamed:@"image_qr_corner_004_"];
    [self.scanSettingView startAnimation];
}

- (CGFloat)areaY {
    return 10;
}
- (CGFloat)areaWidth {
    return 300;
}

- (CGFloat)areaHeight {
    return 100;
}
- (CGFloat)areaTitleDistanceHeight {
    return kDistance;
}
- (UIColor *)areaColor {
    return [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
}

@end
