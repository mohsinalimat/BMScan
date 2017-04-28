//
//  BMScanController.h
//  BMScanDemo
//
//  Created by ___liangdahong on 2017/4/28.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMScanDelegate.h"
#import "BMScanDataSource.h"

@protocol BMScanDelegate, BMScanDataSource;

@interface BMScanController : UIViewController

@property (weak, nonatomic) id <BMScanDelegate > delegate;
@property (weak, nonatomic) id <BMScanDataSource > dataSource;

#pragma mark - 继承时使用

- (void)startScanning NS_REQUIRES_SUPER;
- (void)closureScanning NS_REQUIRES_SUPER;

@end
