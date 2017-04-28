//
//  BMScanDelegate.h
//  BMScanDemo
//
//  Created by ___liangdahong on 2017/4/28.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BMScanController;

@protocol BMScanDelegate <NSObject>

@required

- (void)scanController:(BMScanController *)scanController captureWithValueString:(NSString *)valueString;

@end
