//
//  HBMenuView.m
//  EPS
//
//  Created by 郝斌 on 16/5/12.
//  Copyright © 2016年 hainx. All rights reserved.
//

#import "HBMenuView.h"
#import "HBMenu.h"
#import "HBMenuButton.h"

@implementation HBMenuView

+ (instancetype)menuViewWithFrame:(CGRect)frame
{
    // 1.添加内容View 可以上下滚动
    HBMenuView *contentView = [[HBMenuView alloc] init];
    contentView.bounces = YES;
    contentView.frame = frame;
    
    return contentView;
}


- (void)setMenuArray:(NSArray *)menuArray
{
    _menuArray = menuArray;
    
    CGFloat menuBtnViewContentW = self.frame.size.width;
    
    NSInteger menuBtnViewColumnCount = 3;
    CGFloat menuBtnViewPaddingTop = 10;
    CGFloat menuBtnViewPaddingaLeft = 15;
    CGFloat menuBtnViewW = (menuBtnViewContentW - menuBtnViewPaddingaLeft * (menuBtnViewColumnCount + 1)) / menuBtnViewColumnCount;
    CGFloat menuBtnViewH = 120;
    for (int i = 0; i < menuArray.count; i++)
    {
        HBMenu *menu = menuArray[i];
        
        // 1.添加一个菜单按钮的View
        UIView *menuBtnView = [[UIView alloc] init];
        CGFloat menuBtnViewX = menuBtnViewPaddingaLeft + (i % menuBtnViewColumnCount) * (menuBtnViewW + menuBtnViewPaddingaLeft);
        CGFloat menuBtnViewY = menuBtnViewPaddingTop + (i / menuBtnViewColumnCount) * (menuBtnViewH + menuBtnViewPaddingTop);
        menuBtnView.frame = CGRectMake(menuBtnViewX, menuBtnViewY, menuBtnViewW, menuBtnViewH);
        //menuBtnView.backgroundColor = [UIColor greenColor];
        [self addSubview:menuBtnView];
        
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
        
        menuButton.btnCode = menu.code;
        //menuButton.badgeValue = @"10";
        
        [menuButton addTarget:self action:@selector(menuClick:) forControlEvents:UIControlEventTouchUpInside];
        [menuBtnView addSubview:menuButton];
    }
    
    // 内容View可以滚动的高度
    UIView *lastView = [[self subviews] lastObject];
    CGFloat menuBtnViewContentH = CGRectGetMaxY(lastView.frame) + menuBtnViewPaddingTop;
    self.contentSize = CGSizeMake(menuBtnViewContentW, menuBtnViewContentH);
}

- (void)menuClick:(HBMenuButton *)menuBtn
{
    if ([self.menuViewDelegate respondsToSelector:@selector(menuButtonClick:)]) {
        [self.menuViewDelegate menuButtonClick:menuBtn];
    }
}

@end
