//
//  QQTabbarViewController.h
//  tabbarTest
//
//  Created by Maybe on 2017/12/21.
//  Copyright © 2017年 JJBangKeJi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCTabBarItem.h"

@class QQTabBarController;

@protocol QQTabBarControllerDelegate <NSObject>

@optional
- (void)clickBigItem;

- (void)QQTabBarController:(QQTabBarController *)tab didSelectdIndex:(NSInteger)index;

@end

@interface QQTabBarController : UITabBarController

- (instancetype)initTabWithItems:(NSArray<MCTabBarItem *> *)items navClass:(Class)navClass;

/**代理*/
@property (nonatomic , assign) id<QQTabBarControllerDelegate>  customDelegate;
/**字体*/
@property (nonatomic , strong) UIFont * font;
/**默认字体颜色*/
@property (nonatomic,strong) UIColor * defaultColor;
/**选中字体颜色*/
@property (nonatomic,strong) UIColor * selectedColor;
/**
 修改选中的下标
 @param index 下标
 */
- (void)setTabIndex:(NSInteger)index;
@end

