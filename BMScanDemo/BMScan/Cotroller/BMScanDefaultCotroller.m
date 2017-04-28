//
//  BMScanDefaultCotroller.m
//  BMScanDemo
//
//  Created by ___liangdahong on 2017/4/28.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import "BMScanDefaultCotroller.h"

@interface BMScanDefaultCotroller () <BMScanDelegate, BMScanDataSource>

@end

@implementation BMScanDefaultCotroller

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
    
}

#pragma mark - getters setters

#pragma mark - 系统delegate


#pragma mark - 自定义delegate


- (void)scanController:(BMScanController *)scanController captureWithValueString:(NSString *)valueString {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [scanController startScanning];
    });
}

#pragma mark - 公有方法

#pragma mark - 私有方法
#pragma mark - 事件响应

@end
