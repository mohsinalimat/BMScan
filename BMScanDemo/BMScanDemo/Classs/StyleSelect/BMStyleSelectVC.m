//
//  BMStyleSelectVC.m
//  BMScanDemo
//
//  Created by ___liangdahong on 2017/4/28.
//  Copyright © http://idhong.com All rights reserved.
//  Copyright © https://github.com/asiosldh/BMScan All rights reserved.
//

#import "BMStyleSelectVC.h"
#import "BMScanStyle1VC.h"
#import "BMScanStyle2VC.h"
#import "BMScanDefaultCotroller.h"

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


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    BMScanDefaultCotroller *vc = [BMScanDefaultCotroller new];
    vc.captureSuccessBlock = ^(__kindof BMScanDefaultCotroller *scanVC, NSString *valueString) {
        NSLog(@"%@", valueString);
        [scanVC.navigationController popViewControllerAnimated:YES];
    };
    [self.navigationController pushViewController:vc animated:YES];
}


@end
