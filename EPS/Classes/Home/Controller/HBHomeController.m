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

@interface HBHomeController()

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
    UIView *navBar = [[UIView alloc] init];
    CGFloat navBarXY = 0;
    CGFloat navBarW = self.view.frame.size.width;
    
    // 2.1.添加公司名称label
    UILabel *companyLabel = [[UILabel alloc] init];
    companyLabel.text = @"北京一采通信息科技有限公司";
    companyLabel.textColor = [UIColor whiteColor];
    companyLabel.font = [UIFont systemFontOfSize:16];
    
    NSMutableDictionary *companyFontAttrDic = [NSMutableDictionary dictionary];
    companyFontAttrDic[NSFontAttributeName] = companyLabel.font;
    CGFloat companyLabelW = [companyLabel.text sizeWithAttributes:companyFontAttrDic].width;
    CGFloat companyLabelX = (navBarW - companyLabelW) * 0.5;
    CGFloat companyLabelY = 20;
    CGFloat companyLabelH = 30;
    companyLabel.frame = CGRectMake(companyLabelX, companyLabelY, companyLabelW, companyLabelH);
    [navBar addSubview:companyLabel];
    
    // 2.2.添加用户信息
    UIView *userView = [[UIView alloc] init];
    CGFloat userViewBorderX = 20; //左右间距
    CGFloat userViewBorderY = 15; //上下间距
    CGFloat userViewW = navBarW - 2 * userViewBorderX;
    CGFloat userViewH = 70;
    CGFloat userViewX = userViewBorderX;
    CGFloat userViewY = CGRectGetMaxY(companyLabel.frame) + userViewBorderY;
    userView.frame = CGRectMake(userViewX, userViewY, userViewW, userViewH);
    [navBar addSubview:userView];
    
    // 2.2.1.添加员工头像
    UIImageView *userPhoto = [[UIImageView alloc] init];
    userPhoto.image = [UIImage imageWithName:@"default_photo"];
    CGFloat userPhotoX = 0;
    CGFloat userPhotoY = 0;
    CGFloat userPhotoWH = 70;
    userPhoto.frame = CGRectMake(userPhotoX, userPhotoY, userPhotoWH, userPhotoWH);
    // 变成圆形头像
    userPhoto.layer.cornerRadius = 35;
    userPhoto.layer.masksToBounds = YES;
    [userView addSubview:userPhoto];
    
    // 2.2.2.添加员工名称
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.text = @"郝斌";
    nameLabel.textColor = [UIColor whiteColor];
    nameLabel.font = [UIFont systemFontOfSize:15];
    
    NSMutableDictionary *nameFontAttrDic = [NSMutableDictionary dictionary];
    nameFontAttrDic[NSFontAttributeName] = nameLabel.font;
    CGFloat nameLabelW = [nameLabel.text sizeWithAttributes:nameFontAttrDic].width;
    CGFloat nameLabelX = CGRectGetMaxX(userPhoto.frame) + userViewBorderX;
    CGFloat nameLabelY = userPhotoY + 10;
    CGFloat nameLabelH = 26;
    nameLabel.frame = CGRectMake(nameLabelX, nameLabelY, nameLabelW, nameLabelH);
    [userView addSubview:nameLabel];
    
    // 2.2.3.添加业务角色名称
    UILabel *roleLabel = [[UILabel alloc] init];
    roleLabel.text = @"采购部 > 价格科";
    roleLabel.textColor = [UIColor whiteColor];
    roleLabel.font = [UIFont systemFontOfSize:14];
    
    NSMutableDictionary *roleFontAttrDic = [NSMutableDictionary dictionary];
    roleFontAttrDic[NSFontAttributeName] = roleLabel.font;
    CGFloat roleLabelW = [roleLabel.text sizeWithAttributes:roleFontAttrDic].width;
    CGFloat roleLabelX = nameLabelX;
    CGFloat roleLabelY = CGRectGetMaxY(nameLabel.frame);
    CGFloat roleLabelH = 24;
    roleLabel.frame = CGRectMake(roleLabelX, roleLabelY, roleLabelW, roleLabelH);
    [userView addSubview:roleLabel];
    
    // 2.2.4.添加右箭头
    UIImageView *rightView = [[UIImageView alloc] init];
    rightView.image = [UIImage imageWithName:@"nav_right"];
    rightView.contentMode = UIViewContentModeCenter;
    CGFloat rightViewW = rightView.image.size.width;
    CGFloat rightViewH = userViewH;
    CGFloat rightViewX = userViewW - rightViewW;
    CGFloat rightViewY = 0;
    rightView.frame = CGRectMake(rightViewX, rightViewY, rightViewW, rightViewH);
    [userView addSubview:rightView];
    
    // 2.自定义NavigationBar高度计算
    CGFloat navBarH = CGRectGetMaxY(userView.frame) + userViewBorderY;
    navBar.frame = CGRectMake(navBarXY, navBarXY, navBarW, navBarH);
    navBar.backgroundColor = HBColorDefault;
    [self.view addSubview:navBar];
    self.navBar = navBar;
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
    UITableViewController *tabController = [[UITableViewController alloc] init];
    [self.navigationController pushViewController:tabController animated:YES];
}

@end
