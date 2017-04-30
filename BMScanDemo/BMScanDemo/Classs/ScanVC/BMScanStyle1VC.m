//
//  BMScanStyle1VC.m
//  BMScanDemo
//
//  Created by ___liangdahong on 2017/4/28.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import "BMScanStyle1VC.h"
#import "BMScanDelegate.h"
#import "BMScanDefaultDataSource.h"

@interface BMScanStyle1VC () <BMScanDelegate>

@end

@implementation BMScanStyle1VC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
}

- (void)scanController:(BMScanController *)scanController captureWithValueString:(NSString *)valueString {
    [self closureScanning];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [scanController startScanning];
    });
}

@end
