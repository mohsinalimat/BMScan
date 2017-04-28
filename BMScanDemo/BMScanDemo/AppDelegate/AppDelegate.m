//
//  AppDelegate.m
//  BMScanDemo
//
//  Created by ___liangdahong on 2017/4/28.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import "AppDelegate.h"
#import "BMStyleSelectVC.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    self.window.backgroundColor = [UIColor whiteColor];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[BMStyleSelectVC new]];
    nav.navigationBar.hidden = NO;
    nav.navigationBar.translucent = NO;
    self.window.rootViewController = nav;
    return YES;
}



@end
