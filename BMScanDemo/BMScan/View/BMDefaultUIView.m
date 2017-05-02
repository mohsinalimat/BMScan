//
//  BMDefaultUIView.m
//  BMScanDemo
//
//  Created by ___liangdahong on 2017/4/28.
//  Copyright © http://idhong.com All rights reserved.
//  Copyright © https://github.com/asiosldh/BMScan All rights reserved.
//

#import "BMDefaultUIView.h"

@interface BMDefaultUIView ()

@end

@implementation BMDefaultUIView

+ (instancetype)defaultUIView {
    BMDefaultUIView *view = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
    return view;
}

- (CABasicAnimation *)getAnimation {
    
    // 说明这个动画对象要对CALayer的position属性执行动画
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    // 动画持续1.5s
    [self layoutIfNeeded];
    
    animation.duration = 1.3333f * (CGRectGetHeight(self.scanfAreaView.frame) / 170.0) + 0.3;

    CGRectGetMidY(self.scanfAreaView.frame);
    CGRectGetMaxY(self.scanfAreaView.frame);
    
    animation.fromValue = @(0);
    animation.toValue   = @(CGRectGetHeight(self.scanfAreaView.frame));
    animation.repeatCount = INT_MAX;

    // 保持动画执行后的状态
    animation.removedOnCompletion = NO;
    animation.autoreverses = YES;

    switch (self.scanLinViewAnimation) {
        case BMScanLinViewAnimationTypeCAFillModeForwards:
            animation.fillMode = kCAFillModeForwards;
            break;
        case BMScanLinViewAnimationTypeCAFillModeBackwards:
            animation.fillMode = kCAFillModeBackwards;
            break;
        case BMScanLinViewAnimationTypeCAFillModeBoth:
            animation.fillMode = kCAFillModeBoth;
            break;
        case BMScanLinViewAnimationTypeCAFillModeRemoved:
            animation.fillMode = kCAFillModeRemoved;
            break;
        default:
            animation.fillMode = kCAFillModeForwards;
            break;
    }
    return animation;
}

- (void)startAnimation {
    self.scanfLinView.hidden = NO;
    [self.scanfLinView.layer removeAllAnimations];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.scanfLinView.layer addAnimation:[self getAnimation] forKey:nil];
    });
}

- (void)stopAnimation {
    self.scanfLinView.hidden = YES;
    [self.scanfLinView.layer removeAllAnimations];
}

@end
