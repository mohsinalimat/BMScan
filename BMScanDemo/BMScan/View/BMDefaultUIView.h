//
//  BMDefaultUIView.h
//  BMScanDemo
//
//  Created by ___liangdahong on 2017/4/28.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BMDefaultUIView : UIView

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLayoutConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftLayoutConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthLayoutConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightLayoutConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLabelBottonLayoutConstraint;
@property (weak, nonatomic) IBOutlet UIView *scanfAreaView;

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray <UIView *> *backgroundViewArray;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray <UIImageView *>*feetViewArray;

@property (weak, nonatomic) IBOutlet UIImageView *feetImageView1;
@property (weak, nonatomic) IBOutlet UIImageView *feetImageView2;
@property (weak, nonatomic) IBOutlet UIImageView *feetImageView3;
@property (weak, nonatomic) IBOutlet UIImageView *feetImageView4;
@property (weak, nonatomic) IBOutlet UIImageView *scanfLinView;
@property (weak, nonatomic) IBOutlet UILabel *scanTitleLabel;

@property (weak, nonatomic) IBOutlet UIView *areaView;

+ (instancetype)defaultUIView;

- (void)startAnimation;

- (void)stopAnimation;
@end
