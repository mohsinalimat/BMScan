//
//  BMScanController.h
//  BMScanDemo
//
//  Created by ___liangdahong on 2017/4/28.
//  Copyright © http://idhong.com All rights reserved.
//  Copyright © https://github.com/asiosldh/BMScan All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMScanDelegate.h"
#import "BMScanDataSource.h"

/**
 扫描控制器的基类
 */
@interface BMScanController : UIViewController

/**
 数据源代理（主要提供一些配置）
 */
@property (weak, nonatomic) id <BMScanDataSource> dataSource;

/**
 代理（事件回调）
 */
@property (weak, nonatomic) id <BMScanDelegate> delegate;

#pragma mark - 继承时使用

/**
 开始扫描
 */
- (void)startScanning NS_REQUIRES_SUPER;

/**
 结束扫描
 */
- (void)closureScanning NS_REQUIRES_SUPER;

@end
