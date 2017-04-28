//
//  BMDefaultScanningController.h
//  扫描封装
//
//  Created by ___liangdahong on 2017/4/28.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import "BMBaseScanningController.h"

@class BMDefaultScanningController;

typedef void(^BMScanningSuccessBlock)(__kindof BMDefaultScanningController *scanningVC, NSString *valueString);

@interface BMDefaultScanningController : BMBaseScanningController

#pragma mark - UI

@property (strong, nonatomic, readonly) UILabel *scanfTitleLabel;
@property (strong, nonatomic, readonly) UIImageView *leftTopImageView;
@property (strong, nonatomic, readonly) UIImageView *leftBottonImageView;
@property (strong, nonatomic, readonly) UIImageView *rightTopImageView;
@property (strong, nonatomic, readonly) UIImageView *rightBottonImageView;

#pragma mark - 配置信息

- (CGFloat)areaY;
- (CGFloat)areaWidth;
- (CGFloat)areaHeight;
- (CGFloat)areaTitleDistanceHeight;
- (UIColor *)areaColor;

#pragma mark - 逻辑

@property (copy, nonatomic) BMScanningSuccessBlock scanningSuccessBlock; ///< 扫描到内容时回调 block

@end
