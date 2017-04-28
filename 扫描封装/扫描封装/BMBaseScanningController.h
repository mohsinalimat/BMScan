//
//  BMBaseScanningController.h
//  扫描封装
//
//  Created by ___liangdahong on 2017/4/28.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BMBaseScanningController : UIViewController

#pragma mark - 配置信息

- (CGRect)rectOfInterest;

#pragma mark - 继承时使用

- (void)startScanning NS_REQUIRES_SUPER;
- (void)closureScanning NS_REQUIRES_SUPER;
- (void)captureWithValueString:(NSString *)valueString;


@end
