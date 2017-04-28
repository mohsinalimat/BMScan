//
//  BMScanDataSource.h
//  BMScanDemo
//
//  Created by ___liangdahong on 2017/4/28.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BMScanController;

@protocol BMScanDataSource <NSObject>

@optional

- (CGRect)rectOfInterestInScanController:(BMScanController *)scanController;

@end
