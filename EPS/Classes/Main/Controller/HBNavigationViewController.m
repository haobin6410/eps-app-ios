//
//  HBNavigationViewController.m
//  EPS
//
//  Created by 郝斌 on 15/7/3.
//  Copyright (c) 2015年 hainx. All rights reserved.
//

#import "HBNavigationViewController.h"

@interface HBNavigationViewController ()

@end

@implementation HBNavigationViewController

// 第一次使用这个类的时候会调用（1个类只会调用1次）
+ (void)initialize
{
    // 1.设置导航栏主题
    [self setupNavBarTheme];
    
    // 2.设置导航栏按钮主题
    [self setupNavBarButtonItemTheme];
}

// 设置导航栏主题
+ (void)setupNavBarTheme
{
    // 取出appearance对象
    UINavigationBar *navBar = [UINavigationBar appearance];
    // 设置背景颜色
    navBar.barTintColor = HBColorDefault;
    // 取消半透明
    navBar.translucent = NO;
    // 设置标题属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    // 文字颜色
    textAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    // 文字大小
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:16];
    // 去除阴影
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowOffset = CGSizeZero;
    textAttrs[NSShadowAttributeName] = shadow;
    [navBar setTitleTextAttributes:textAttrs];
}

// 设置导航栏按钮主题
+ (void)setupNavBarButtonItemTheme
{
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    // 设置文字属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize: 16];
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowOffset = CGSizeZero;
    textAttrs[NSShadowAttributeName] = shadow;
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateHighlighted];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    self.navigationBar.hidden = NO;
    
    [super pushViewController:viewController animated:animated];
    
}

- (nullable UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    self.navigationBar.hidden = YES;
    
    return [super popViewControllerAnimated:animated];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
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
