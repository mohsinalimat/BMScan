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

/**
 包含UI 的扫描控制器
 */
@interface BMScanDefaultCotroller : BMScanController

/**
 数据源代理（配置信息）
 */
@property (weak, nonatomic) id <BMScanDefaultDataSource> dataSource;

/**
 标题label
 */
@property (strong, nonatomic, readonly) UILabel *scanfTitleLabel;

@end
