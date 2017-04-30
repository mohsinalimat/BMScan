
//
//  BMScanDefaultCotroller.m
//  BMScanDemo
//
//  Created by ___liangdahong on 2017/4/28.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import "BMScanDefaultCotroller.h"
#import "BMDefaultUIView.h"
#import "UIImage+BMScan.h"
#import "BMScanDataSource.h"
#import "BMScanDelegate.h"

@interface BMScanDefaultCotroller () <BMScanDelegate, BMScanDefaultDataSource>

@property (strong, nonatomic) BMDefaultUIView *scanSettingView;

@end

@implementation BMScanDefaultCotroller

@dynamic dataSource;

#pragma mark -

- (instancetype)init {
    self = [super init];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

#pragma mark - 生命周期

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.view insertSubview:self.scanSettingView atIndex:1];
    self.scanSettingView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:self.scanSettingView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0];
    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:self.scanSettingView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0];
    NSLayoutConstraint *bottonConstraint = [NSLayoutConstraint constraintWithItem:self.scanSettingView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:self.scanSettingView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0];
    [self.view addConstraints:@[topConstraint, leftConstraint, bottonConstraint, rightConstraint]];
    
    if ([self.dataSource respondsToSelector:@selector(areaYInscanController:)]) {
        self.scanSettingView.topLayoutConstraint.constant = [self.dataSource areaYInscanController:self];
    }

    if ([self.dataSource respondsToSelector:@selector(areaXInscanController:)]) {
        self.scanSettingView.leftLayoutConstraint.constant = [self.dataSource areaXInscanController:self];
    }
    
    if ([self.dataSource respondsToSelector:@selector(areaWidthInscanController:)]) {
        self.scanSettingView.widthLayoutConstraint.constant = [self.dataSource areaWidthInscanController:self];
    }
    
    if ([self.dataSource respondsToSelector:@selector(areaXHeightInscanController:)]) {
        self.scanSettingView.heightLayoutConstraint.constant = [self.dataSource areaXHeightInscanController:self];
    }
    
    if ([self.dataSource respondsToSelector:@selector(areaTitleDistanceHeightInscanController:)]) {
        self.scanSettingView.titleLabelBottonLayoutConstraint.constant = [self.dataSource areaTitleDistanceHeightInscanController:self];
    }
    
    if ([self.dataSource respondsToSelector:@selector(areaColorInscanController:)]) {
        UIColor *color = [self.dataSource areaColorInscanController:self];
        [self.scanSettingView.backgroundViewArray enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            obj.backgroundColor =  color;
        }];
    }
    
    if ([self.dataSource respondsToSelector:@selector(feetColorInscanController:)]) {
        UIColor *color = [self.dataSource feetColorInscanController:self];
        [self.scanSettingView.feetViewArray enumerateObjectsUsingBlock:^(UIImageView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            obj.image = [obj.image imageWithColor:color];
        }];
    }
    
    if ([self.dataSource respondsToSelector:@selector(leftTopColorInscanController:)]) {
        self.scanSettingView.feetImageView1.image = [self.scanSettingView.feetImageView1.image imageWithColor:[self.dataSource leftTopColorInscanController:self]];
    }

    if ([self.dataSource respondsToSelector:@selector(leftBottonColorInscanController:)]) {
        self.scanSettingView.feetImageView3.image = [self.scanSettingView.feetImageView3.image imageWithColor:[self.dataSource leftBottonColorInscanController:self]];
    }
    
    if ([self.dataSource respondsToSelector:@selector(rightTopInscanController:)]) {
        self.scanSettingView.feetImageView2.image = [self.scanSettingView.feetImageView2.image imageWithColor:[self.dataSource rightTopInscanController:self]];
    }
    
    if ([self.dataSource respondsToSelector:@selector(rightBottonInscanController:)]) {
        self.scanSettingView.feetImageView4.image = [self.scanSettingView.feetImageView4.image imageWithColor:[self.dataSource rightBottonInscanController:self]];
    }
    if ([self.dataSource respondsToSelector:@selector(scanfLinInscanController:)]) {
        self.scanSettingView.scanfLinView.image = [self.scanSettingView.scanfLinView.image imageWithColor:[self.dataSource scanfLinInscanController:self]];
    }
}

#pragma mark - getters setters

- (BMDefaultUIView *)scanSettingView {
    if (!_scanSettingView) {
        _scanSettingView = [BMDefaultUIView defaultUIView];
    }
    return _scanSettingView;
}

- (UILabel *)scanfTitleLabel {
    return self.scanSettingView.scanTitleLabel;
}

#pragma mark - 系统delegate

#pragma mark - 自定义delegate

- (void)scanController:(BMScanController *)scanController captureWithValueString:(NSString *)valueString {
}

- (CGRect)rectOfInterestInScanController:(BMScanController *)scanController {
    [self.view layoutIfNeeded];
    return self.scanSettingView.scanfAreaView.frame;
}

- (CGFloat)areaXInscanController:(BMScanController *)scanController {
    NSLayoutConstraint *c1 = [NSLayoutConstraint constraintWithItem:self.scanSettingView.areaView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.scanSettingView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    NSLayoutConstraint *c2 = [NSLayoutConstraint constraintWithItem:self.scanSettingView.areaView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.scanSettingView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    [self.scanSettingView addConstraints:@[c1, c2]];
    return 0;
}

- (CGFloat)areaYInscanController:(BMScanController *)scanController {
    NSLayoutConstraint *c1 = [NSLayoutConstraint constraintWithItem:self.scanSettingView.areaView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.scanSettingView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    NSLayoutConstraint *c2 = [NSLayoutConstraint constraintWithItem:self.scanSettingView.areaView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.scanSettingView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    [self.scanSettingView addConstraints:@[c1, c2]];
    return 0;
}
#pragma mark - 公有方法
- (void)startScanning {
    [super startScanning];
    [self.scanSettingView startAnimation];
}

- (void)closureScanning {
    [super closureScanning];
    [self.scanSettingView stopAnimation];
}

#pragma mark - 私有方法
#pragma mark - 事件响应

@end
