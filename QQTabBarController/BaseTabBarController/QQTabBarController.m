//
//  QQTabbarViewController.m
//  tabbarTest
//
//  Created by Maybe on 2017/12/21.
//  Copyright © 2017年 JJBangKeJi. All rights reserved.
//

#import "QQTabBarController.h"
#import "MCTabBarItem.h"
#define kwidth          [UIScreen mainScreen].bounds.size.width
#define RGB(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]

static const NSInteger ButtonTag = 100;

static const NSInteger tabbarHeight = 80;//自定义TabBar的高度
@interface QQTabBarController ()
@property (nonatomic,strong) MCTabBarItem *lastItem;
@end

@implementation QQTabBarController
- (instancetype)init
{
    if (self = [super init]) {

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initVC];
    [self createVc];
    [self.tabBar addSubview:self.tabBarView];
    
}

/**
 改变tabbar的高度
 */
- (void)viewWillLayoutSubviews{
    CGRect tabFrame = self.tabBar.frame;
    tabFrame.size.height = tabbarHeight;
    tabFrame.origin.y = self.view.frame.size.height - tabbarHeight;
    self.tabBar.frame = tabFrame;
    CGRect rect = self.tabBar.bounds;
    self.tabBarView.frame = rect;
}
- (void)initVC{
    self.one = [fristViewController new];
    self.two = [twoViewController new];
    self.three = [threeViewController new];
    self.four = [fourViewController new];

    self.viewControllers = @[self.one,
                             self.two,
                             self.three,
                             self.four];
}
- (void)createVc
{
    NSArray *heightBackground = @[@"navigation_home_active",@"navigation_reward_active",@"navigation_Finding_car_active",@"navigation_authorized_active"];
    NSArray *backgroud = @[@"navigation_home_defaut",@"navigation_reward_defaut",@"navigation_Finding_car_defaut",@"navigation_authorized_defaut"];
    NSArray *VCname = @[@"首页",@"悬赏",@"寻车",@"我的"];
    self.item0 =[MCTabBarItem buttonWithType:UIButtonTypeCustom];
    self.item1 =[MCTabBarItem buttonWithType:UIButtonTypeCustom];
    self.item1.isHasBackGroudImageview = YES;
    self.item2 =[MCTabBarItem buttonWithType:UIButtonTypeCustom];
    self.item2.backgroundColor = [UIColor clearColor];
    self.item3 =[MCTabBarItem buttonWithType:UIButtonTypeCustom];

    NSArray *items = @[self.item0,self.item1,self.item2,self.item3];
    float TabWidth = kwidth/backgroud.count;
    for (int i=0; i<backgroud.count; i++) {
        NSString *backImage = backgroud[i];
        NSString *heightImage = heightBackground[i];
        MCTabBarItem *item = items[i];
        item.frame = CGRectMake(i*TabWidth, 0, TabWidth, tabbarHeight);
        item.tag = ButtonTag + i;
        item.titleLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightMedium];
        item.titleLabel.textAlignment = NSTextAlignmentCenter;
        [item setTitle:VCname[i] forState:UIControlStateNormal];
        [item setTitleColor:RGB(102, 102, 102)  forState:UIControlStateNormal];
        [item setTitleColor:RGB(102, 102, 102)  forState:UIControlStateSelected];
        if (i == 0) {
            item.selected  = YES;
            self.lastItem = item;
            self.SelectIndex = 0;
        }
        [item setImage:[UIImage imageNamed:backImage] forState:UIControlStateNormal];
        [item setImage:[UIImage imageNamed:heightImage] forState:UIControlStateSelected];
        [item addTarget:self action:@selector(selectedTab:)
       forControlEvents:UIControlEventTouchUpInside];

        [self.tabBarView addSubview:item];
    }
}
- (void)selectedTab:(MCTabBarItem *)item
{
    if (self.lastItem) {
        self.lastItem.selected = NO;
    }
    self.selectedIndex = item.tag - ButtonTag;
    self.SelectIndex = self.selectedIndex;
    item.selected = YES;
    self.lastItem = item;
    if (self.SelectIndex ==1) {
        self.item1.BackGroudImageName = @"navigation_reward_BG";
    }else{
        self.item1.BackGroudImageName = @"";
    }
    [self QQTabBarController:self didSelect:self.viewControllers[self.selectedIndex]];
}
- (void)QQTabBarController:(QQTabBarController *)TabBarController  didSelect:(UIViewController *)viewcontroller
{

}
//设置选中的下标
- (void)setTabIndex:(NSInteger)index
{
    MCTabBarItem *item = [self.tabBarView viewWithTag:index + ButtonTag];
    [self selectedTab:item];
}

- (UIView *)tabBarView
{
    if (!_tabBarView) {
        _tabBarView = [[UIView alloc]init];
        _tabBarView.backgroundColor = [UIColor whiteColor];
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kwidth, 0.4)];
        line.backgroundColor = [UIColor lightGrayColor];
        line.alpha = 0.4;
        [_tabBarView addSubview:line];
    }
    return _tabBarView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
