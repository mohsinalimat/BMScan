//
//  BMScanDefaultCotroller.h
//  BMScanDemo
//
//  Created by ___liangdahong on 2017/4/28.
//  Copyright © http://idhong.com All rights reserved.
//  Copyright © https://github.com/asiosldh/BMScan All rights reserved.
//

#import "BMScanController.h"
#import "BMScanDefaultDataSource.h"

@class BMScanDefaultCotroller;

typedef void(^BMCaptureSuccessBlock)(__kindof BMScanDefaultCotroller *scanVC, NSString *valueString);

/**
 包含UI 的扫描控制器
 */
@interface BMScanDefaultCotroller : BMScanController

@property (weak, nonatomic) id <BMScanDefaultDataSource> dataSource; ///< 数据源代理（配置信息）
@property (copy, nonatomic) BMCaptureSuccessBlock captureSuccessBlock; ///< 扫描到内容的回调block
@property (strong, nonatomic, readonly) UILabel *scanfTitleLabel; ///< 标题label

@end
