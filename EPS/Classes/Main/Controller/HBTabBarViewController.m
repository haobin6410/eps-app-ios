//
//  HBTabBarViewController.m
//  EPS
//
//  Created by 郝斌 on 15/7/3.
//  Copyright (c) 2015年 hainx. All rights reserved.
//

#import "HBTabBarViewController.h"
#import "HBNavigationViewController.h"
#import "HBTabBar.h"
#import "HBHomeController.h"

@interface HBTabBarViewController () <HBTabBarDelegate>

@property (nonatomic, weak) HBTabBar *customTabBar;

@end

@implementation HBTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 初始化TabBar
    [self setupTabBar];
    
    // 初始化所有的子控制器
    [self setupAllChildViewControllers];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 删除系统自动生成的UITabBarButton
    for(UIView *child in self.tabBar.subviews)
    {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}

/**
 * 初始化TabBar
 */
- (void)setupTabBar
{
    HBTabBar *customTabBar = [[HBTabBar alloc] init];
    customTabBar.frame = self.tabBar.bounds;
    customTabBar.delegate = self;
    [self.tabBar addSubview:customTabBar];
    self.customTabBar = customTabBar;
}

/**
 *  监听tabbar按钮的改变
 *  @param from   原来选中的位置
 *  @param to     最新选中的位置
 */
- (void)tabBar:(HBTabBar *)tabBar didSelectedButtonFrom:(NSInteger)from to:(NSInteger)to
{
    self.selectedIndex = to;
}

/**
 * 初始化所有的子控制器
 */
- (void)setupAllChildViewControllers
{
    // 1.待办
    HBHomeController *home = [[HBHomeController alloc] init];
//    home.tabBarItem.badgeValue = @"new";
    [self setupChildViewController:home title:@"待办" imageName:@"tabbar_notifications" selectedImageName:@"tabbar_notifications_selected"];
    
    // 2.归档
    UIViewController *message = [[UITableViewController alloc] init];
//    message.tabBarItem.badgeValue = @"9";
    [self setupChildViewController:message title:@"归档" imageName:@"tabbar_folder" selectedImageName:@"tabbar_folder_selected"];
    
    // 3.设置
    UIViewController *discover = [[UITableViewController alloc] init];
//    discover.tabBarItem.badgeValue = @"26";
    [self setupChildViewController:discover title:@"设置" imageName:@"tabbar_settings" selectedImageName:@"tabbar_settings_selected"];
}

/**
 *  初始化一个子控制器
 *
 *  @param childViewController  需要初始化的子控制器
 *  @param title                标题
 *  @param imageName            图标
 *  @param selectedImageName    选中的图标
 */
- (void)setupChildViewController:(UIViewController *)childViewController title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 1.设置控制器的属性
    
    // 设置文字
    childViewController.title = title;
    
    // 设置图标
    childViewController.tabBarItem.image = [UIImage imageWithName:imageName];
    
    // 设置选中的图标
    UIImage *selectedImage = [UIImage imageWithName:selectedImageName];
    childViewController.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 2.包装一个导航控制器
    HBNavigationViewController *nav = [[HBNavigationViewController alloc] initWithRootViewController:childViewController];
    [self addChildViewController:nav];
    
    // 3.添加TabBar内部的按钮
    [self.customTabBar addTabBarButtonWithItem:childViewController.tabBarItem];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
