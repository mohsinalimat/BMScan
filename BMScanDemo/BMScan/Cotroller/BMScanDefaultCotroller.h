//
//  BMScanDefaultCotroller.h
//  BMScanDemo
//
//  Created by ___liangdahong on 2017/4/28.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
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
