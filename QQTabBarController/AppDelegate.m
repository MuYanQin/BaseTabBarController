//
//  AppDelegate.m
//  QQTabBarController
//213
//  Created by qinmuqiao on 2018/6/29.
//  Copyright © 2018年 fengshun. All rights reserved.
//

#import "AppDelegate.h"
#import "fristViewController.h"
#import "twoViewController.h"
#import "threeViewController.h"
#import "fourViewController.h"
#import "fivewViewController.h"
@interface AppDelegate ()<QQTabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window.rootViewController = self.TabBar;

    [self.window makeKeyAndVisible];
    return YES;
}

- (QQTabBarController *)TabBar
{
        if (!_TabBar) {
            
            MCTabBarItem * item0 = [MCTabBarItem buttonWithType:UIButtonTypeCustom];
            item0.vc = [fristViewController   new];
            item0.text = @"首页";
            item0.Badge = 30;
            item0.defaultImg = [UIImage imageNamed:@"navigation_home_defaut"];
            item0.selectedImg = [UIImage imageNamed:@"navigation_home_active"];
            
            MCTabBarItem * item1 =[MCTabBarItem buttonWithType:UIButtonTypeCustom];
            item1.text = @"赏金";
            item1.Badge = 9;
            item1.vc = [twoViewController new];
            item1.defaultImg = [UIImage imageNamed:@"navigation_Finding_car_defaut"];
            item1.selectedImg = [UIImage imageNamed:@"navigation_Finding_car_active"];
            
            MCTabBarItem * item2 =[MCTabBarItem  buttonWithType:UIButtonTypeCustom];
            //不传就是一个单纯的按钮
            item2.vc = [fivewViewController new];
            item2.text = @"大Button";
            item2.isBigItem = YES;
            item2.bigItemSize = CGSizeMake(60, 60);
            item2.defaultImg = [UIImage imageNamed:@"tab_launch"];
            item2.selectedImg = [UIImage imageNamed:@"tab_launch"];
            
            MCTabBarItem * item3 =[MCTabBarItem buttonWithType:UIButtonTypeCustom];
            item3.vc = [threeViewController new];
            item3.text = @"实名";
            item3.Badge = 100;
            item3.defaultImg = [UIImage imageNamed:@"navigation_home_defaut"];
            item3.selectedImg = [UIImage imageNamed:@"navigation_home_active"];
            
            MCTabBarItem * item4 =[MCTabBarItem buttonWithType:UIButtonTypeCustom];
            item4.vc = [fourViewController   new];
            item4.text = @"我的";
            item4.defaultImg = [UIImage imageNamed:@"navigation_mine_defaut"];
            item4.selectedImg = [UIImage imageNamed:@"navigation_mine_active"];
            
            _TabBar = [[QQTabBarController alloc]initTabWithItems:@[item0,item1,item2,item3,item4] navClass:[UINavigationController class]];
            _TabBar.customDelegate   = self;
            _TabBar.defaultColor = [UIColor redColor];
            _TabBar.selectedColor = [UIColor purpleColor];
            _TabBar.font = [UIFont systemFontOfSize:10 weight:(UIFontWeightRegular)];
        }
        return _TabBar;
}

- (void)QQTabBarController:(QQTabBarController *)tab didSelectdIndex:(NSInteger)index
{
    
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
