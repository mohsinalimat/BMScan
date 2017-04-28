//
//  BMScanSettingView.h
//  BMQRBarCode
//
//  Created by ___liangdahong on 16/8/31.
//  Copyright © 2016年 月亮小屋（中国）有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

/*!
 *  @brief 扫描界面配置view （外部不需使用）
 */
@interface BMScanSettingView : UIView

@property (weak, nonatomic) IBOutlet UIView *scanfAreaView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLayoutConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthLayoutConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightLayoutConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLabelBottonLayoutConstraint;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *leftTopImageView;
@property (weak, nonatomic) IBOutlet UIImageView *leftBottonImageView;
@property (weak, nonatomic) IBOutlet UIImageView *rightTopImageView;
@property (weak, nonatomic) IBOutlet UIImageView *rightBottonImageView;
@property (strong, nonatomic) UIColor *scanfColor;

- (void)startAnimation;
- (void)stopAnimation;

+ (instancetype)scanSettingView;

@end
