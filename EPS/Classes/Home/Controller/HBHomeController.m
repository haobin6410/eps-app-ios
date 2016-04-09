//
//  HBHomeController.m
//  EPS
//
//  Created by 郝斌 on 15/7/5.
//  Copyright (c) 2015年 hainx. All rights reserved.
//

#import "HBHomeController.h"
#import "HBMenuButton.h"
#import "HBMenuArray.h"
#import "HBMenu.h"
#import "NSString+HB.h"
#import "UIBarButtonItem+HB.h"
#import "HBTodoListController.h"
#import "HBProfileController.h"
#import "HBNavView.h"

@interface HBHomeController() <HBNavViewDelegate>

@property (nonatomic, weak)UIView *navBar;

@property (nonatomic, strong)NSArray *menuArray;

@end

@implementation HBHomeController

- (NSArray *)menuArray
{
    if(_menuArray == nil)
    {
        _menuArray = [HBMenuArray menuArray];
    }
    return _menuArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 设置Controller的背景色为白色
    self.view.backgroundColor = [UIColor whiteColor];

    // 初始化导航条
    [self setupNavBar];
    
    // 初始化菜单按钮
    [self setupMenuButton];
}

- (void)setupNavBar
{
    // 1.隐藏系统自带的NavigationBar
    self.navigationController.navigationBar.hidden = YES;
    
    // 2.添加自定义NavigationBar
    HBNavView *navBar = [[HBNavView alloc] init];
    [self.view addSubview:navBar];
    self.navBar = navBar;
    navBar.delegate = self;
}

- (void)navViewClick:(__autoreleasing id *)navView
{
    HBProfileController *profileController = [[HBProfileController alloc] init];
    [self.navigationController pushViewController:profileController animated:YES];
}

- (void)setupMenuButton
{
    // 1.添加内容View 可以上下滚动
    UIScrollView *contentView = [[UIScrollView alloc] init];
    CGFloat contentViewX = 0;
    CGFloat contentViewY = CGRectGetMaxY(self.navBar.frame);
    CGFloat contentViewW = self.view.frame.size.width;
    CGFloat contentViewH = self.view.frame.size.height - contentViewY;
    contentView.frame = CGRectMake(contentViewX, contentViewY, contentViewW, contentViewH);
    CGFloat menuBtnViewContentW = contentViewW;

    
    NSInteger menuBtnViewColumnCount = 3;
    CGFloat menuBtnViewPadding = 30;
    CGFloat menuBtnViewW = (contentViewW - menuBtnViewPadding * (menuBtnViewColumnCount + 1)) / menuBtnViewColumnCount;
    CGFloat menuBtnViewH = 120;
    for (int i = 0; i < self.menuArray.count; i++)
    {
        HBMenu *menu = self.menuArray[i];
        
        // 1.添加一个菜单按钮的View
        UIView *menuBtnView = [[UIView alloc] init];
        CGFloat menuBtnViewX = menuBtnViewPadding + (i % menuBtnViewColumnCount) * (menuBtnViewW + menuBtnViewPadding);
        CGFloat menuBtnViewY = menuBtnViewPadding + (i / menuBtnViewColumnCount) * (menuBtnViewH + menuBtnViewPadding);
        menuBtnView.frame = CGRectMake(menuBtnViewX, menuBtnViewY, menuBtnViewW, menuBtnViewH);
        //menuBtnView.backgroundColor = [UIColor greenColor];
        [contentView addSubview:menuBtnView];
        
        // 2.添加菜单
        HBMenuButton *menuButton = [[HBMenuButton alloc] init];
        [menuButton setTitle:menu.title forState:UIControlStateNormal];
        [menuButton setTitle:menu.title forState:UIControlStateHighlighted];
        [menuButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [menuButton setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
        
        [menuButton setIcon:menu.pic forState:UIControlStateNormal];
        [menuButton setIcon:menu.pic forState:UIControlStateHighlighted];
        [menuButton setIconColor:[UIColor grayColor] forState:UIControlStateNormal];
        [menuButton setIconColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
        
        CGFloat menuButtonX = 0;
        CGFloat menuButtonY = 0;
        CGFloat menuButtonW = menuBtnViewW;
        CGFloat menuButtonH = menuBtnViewH;
        menuButton.frame = CGRectMake(menuButtonX, menuButtonY, menuButtonW, menuButtonH);
        
        menuButton.badgeValue = @"10";
        
        [menuButton addTarget:self action:@selector(menuClick:) forControlEvents:UIControlEventTouchUpInside];
        [menuBtnView addSubview:menuButton];
    }
    
    // 内容View可以滚动的高度
    CGFloat menuBtnViewContentH = CGRectGetMaxY([[contentView subviews] lastObject].frame) + menuBtnViewPadding;
    contentView.contentSize = CGSizeMake(menuBtnViewContentW, menuBtnViewContentH);
    [self.view addSubview:contentView];
}

- (void)menuClick:(UIButton *)menuBtn
{
    HBTodoListController *todoListController = [[HBTodoListController alloc] init];
    [self.navigationController pushViewController:todoListController animated:YES];
}

@end
