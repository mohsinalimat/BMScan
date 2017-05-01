//
//  BMScanStyle2VC.m
//  BMScanDemo
//
//  Created by __liangdahong on 2017/4/30.
//  Copyright © http://idhong.com All rights reserved.
//  Copyright © https://github.com/asiosldh/BMScan All rights reserved.
//

#import "BMScanStyle2VC.h"
#define kw  [[UIScreen mainScreen] bounds].size.width
#define kh  [[UIScreen mainScreen] bounds].size.height
@interface BMScanStyle2VC ()  <BMScanDelegate, BMScanDefaultDataSource>

@end

@implementation BMScanStyle2VC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    self.dataSource = self;
}

- (void)scanController:(BMScanController *)scanController captureWithValueString:(NSString *)valueString {
    
    [self closureScanning];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [scanController startScanning];
    });
}

- (CGFloat)areaXInscanController:(BMScanController *)scanController {
    
    return (kw  - 200)/2.0;
}

- (CGFloat)areaYInscanController:(BMScanController *)scanController {
    return 100;
}

- (CGFloat)areaWidthInscanController:(BMScanController *)scanController {
    
    return 200;
}

- (CGFloat)areaXHeightInscanController:(BMScanController *)scanController {
    
    return 200;
}
- (CGFloat)areaTitleDistanceHeightInscanController:(BMScanController *)scanController {
    return 10;
}

- (UIColor *)areaColorInscanController:(BMScanController *)scanController {
    return [UIColor colorWithRed:0 green:0 blue:0 alpha:arc4random_uniform(100)/100.0];
}

- (UIColor *)feetColorInscanController:(BMScanController *)scanController {
    return [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
}

- (UIColor *)scanfLinInscanController:(BMScanController *)scanController {
    return [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
}

@end
