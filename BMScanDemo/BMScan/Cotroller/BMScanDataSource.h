//
//  BMScanDataSource.h
//  BMScanDemo
//
//  Created by ___liangdahong on 2017/4/28.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BMScanController;
@protocol BMScanSource;

/**
 扫描数据源协议
 */
@protocol BMScanDataSource <NSObject>

@optional

/**
 设置可以识别区域

 @param scanController 扫描控制器
 @return 可识别区域
 */
- (CGRect)rectOfInterestInScanController:(BMScanController *)scanController;

@end
