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
#import "HBPlanAuditController.h"
#import "HBNavView.h"
#import <UIView+SDAutoLayout.h>
#import "HBLoginController.h"
#import "HBUser.h"
#import "HBMenuView.h"

@interface HBHomeController() <HBNavViewDelegate, HBMenuViewDelegate>

@property (nonatomic, weak)HBNavView *navBar;
@property (nonatomic, weak)HBMenuView *menuView;
@property (nonatomic, weak)NSTimer *timer;

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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:HBLoginKey] == nil) {
        [self presentViewController:[[HBLoginController alloc] init] animated:YES completion:nil];
    }
    else {
        self.navBar.user = [HBUser user];
        self.menuView.menuArray = [HBMenuArray menuArray];
        
        [self refreshMenuButtonBadge];
    }
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
    
    // 定时器 定时刷新菜单按钮气泡
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(refreshMenuButtonBadge) userInfo:nil repeats:YES];
    // 定时器异步 其它操作不阻塞定时器
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    [timer fire];
    self.timer = timer;
}

- (void)dealloc
{
    // 销毁定时器
    [self.timer invalidate];
}

// 刷新菜单按钮气泡
- (void)refreshMenuButtonBadge
{
    for (UIView *view in self.menuView.subviews) {
        for(UIView *btn in view.subviews){
            if ([btn isKindOfClass:[HBMenuButton class]]) {
                HBMenuButton *menuBtn = (HBMenuButton *)btn;
                menuBtn.badgeValue = [NSString stringWithFormat:@"%d", arc4random() % 100];
            }
        }
    }
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

- (void)navViewClick:(id *)navView
{
    HBProfileController *profileController = [[HBProfileController alloc] initWithStyle:UITableViewStyleGrouped];
    [self.navigationController pushViewController:profileController animated:YES];
}

- (void)setupMenuButton
{
    CGFloat contentViewX = 0;
    CGFloat contentViewY = CGRectGetMaxY(self.navBar.frame);
    CGFloat contentViewW = self.view.frame.size.width;
    CGFloat contentViewH = self.view.frame.size.height - contentViewY - 44; //必须减去tabbar高度
    CGRect menuViewFrame = CGRectMake(contentViewX, contentViewY, contentViewW, contentViewH);
    HBMenuView *menuView = [HBMenuView menuViewWithFrame:menuViewFrame];
    menuView.menuViewDelegate = self;
    [self.view addSubview:menuView];
    self.menuView = menuView;
}

- (void)menuButtonClick:(HBMenuButton *)menuButton
{
    if ([menuButton.btnCode isEqual: @"icon_ApplyAudit"]) {
        HBPlanAuditController *planAuditController = [[HBPlanAuditController alloc] init];
        planAuditController.title = menuButton.titleLabel.text;
        [self.navigationController pushViewController:planAuditController animated:YES];
    }
    else
    {
        HBTodoListController *todoListController = [[HBTodoListController alloc] init];
        todoListController.title = menuButton.titleLabel.text;
        [self.navigationController pushViewController:todoListController animated:YES];
    }
}

@end
