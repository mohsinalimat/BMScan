//
//  UIImage+BMScan.m
//  BMScanDemo
//
//  Created by __liangdahong on 2017/4/30.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import "UIImage+BMScan.h"
#import "BMScanController.h"

@implementation UIImage (BMScan)

//改变图片颜色
- (UIImage *)bm_imageWithColor:(UIColor *)color {
    
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, self.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextClipToMask(context, rect, self.CGImage);
    [color setFill];
    CGContextFillRect(context, rect);
    UIImage*newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (instancetype)bm_loadImageWithName:(NSString *)name {
    NSBundle *bundle = [NSBundle bundleWithPath:[[NSBundle bundleForClass:[BMScanController class]] pathForResource:@"BMScan" ofType:@"bundle"]];
    return [UIImage imageWithContentsOfFile:[bundle pathForResource:name ofType:@"png"]];
}

@end
