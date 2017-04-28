//
//  ViewController.m
//  扫描封装
//
//  Created by ___liangdahong on 2017/4/26.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import "ViewController.h"
#import "BMBaseScanningController.h"
#import "BMDefaultScanningController.h"
#import "BMViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.translucent = NO;
}

- (IBAction)c:(id)sender {
    
    if (1) {
        BMDefaultScanningController *vc = [BMViewController new];
        vc.scanningSuccessBlock = ^(BMDefaultScanningController *scanningVC, NSString *valueString) {
//            [scanningVC.navigationController popViewControllerAnimated:YES];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [scanningVC startScanning];
            });
        };
        [self.navigationController pushViewController:vc animated:YES];
    } else {
        BMDefaultScanningController *vc = [BMViewController new];
        vc.scanningSuccessBlock = ^(BMDefaultScanningController *scanningVC, NSString *valueString) {
//            [scanningVC dismissViewControllerAnimated:YES completion:nil];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [scanningVC startScanning];
            });
        };
        [self.navigationController presentViewController:vc animated:YES completion:nil];
    }
}


@end
