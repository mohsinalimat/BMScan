//
//  BMStyleSelectVC.m
//  BMScanDemo
//
//  Created by ___liangdahong on 2017/4/28.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import "BMStyleSelectVC.h"
#import "BMScanStyle1VC.h"
#import "BMScanStyle2VC.h"

@interface BMStyleSelectVC ()

@end

@implementation BMStyleSelectVC

- (IBAction)style1ButtonClick {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"自定义" message:nil preferredStyle:0];
    [alertController addAction:[UIAlertAction actionWithTitle:@"默认" style:0 handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController pushViewController:[BMScanStyle1VC new] animated:YES];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"自定义" style:0 handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController pushViewController:[BMScanStyle2VC new] animated:YES];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"canel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }]];
    [self presentViewController:alertController animated:YES completion:nil];
}
@end
