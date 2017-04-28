//
//  BMStyleSelectVC.m
//  BMScanDemo
//
//  Created by ___liangdahong on 2017/4/28.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import "BMStyleSelectVC.h"
#import "BMScanStyle1VC.h"
#import "BMScanDefaultCotroller.h"

@interface BMStyleSelectVC ()

@end

@implementation BMStyleSelectVC

- (IBAction)style1ButtonClick {
    [self.navigationController pushViewController:[BMScanDefaultCotroller new] animated:YES];
}
@end
