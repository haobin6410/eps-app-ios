//
//  HBTabBar.m
//  EPS
//
//  Created by 郝斌 on 15/7/3.
//  Copyright (c) 2015年 hainx. All rights reserved.
//

#import "HBTabBar.h"
#import "HBTabBarButton.h"

@interface HBTabBar()
@property (nonatomic, strong) NSMutableArray *tabBarButtons;
@property (nonatomic, weak) HBTabBarButton *selectedButton;
@end

@implementation HBTabBar

- (nonnull instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    //self.backgroundColor = HBColor(17, 150, 80);
    
    return self;
}

- (NSMutableArray *)tabBarButtons
{
    if(_tabBarButtons == nil)
    {
        _tabBarButtons = [NSMutableArray array];
    }
    return _tabBarButtons;
}


- (void)addTabBarButtonWithItem:(UITabBarItem *)item
{
    // 1.创建按钮
    HBTabBarButton *btn = [[HBTabBarButton alloc ]init];
    [self addSubview:btn];
    
    //添加按钮到数组中
    [self.tabBarButtons addObject:btn];
    
    // 2.设置数据
    btn.item = item;
    
    // 3.监听按钮点击
    [btn addTarget:self action:@selector(tabBarButtonClick:) forControlEvents:UIControlEventTouchDown];
    
    // 4.默认选中第0个按钮
    if (self.tabBarButtons.count == 1) {
        [self tabBarButtonClick:btn];
    }
    
}

// 按钮点击事件
- (void)tabBarButtonClick:(HBTabBarButton *)btn
{
    // 1.通知代理
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectedButtonFrom:to:)]) {
        [self.delegate tabBar:self didSelectedButtonFrom:self.selectedButton.tag to:btn.tag];
    }
    
    // 2.设置按钮状态
    self.selectedButton.selected = NO;
    btn.selected = YES;
    self.selectedButton = btn;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 按钮的frame数据
    CGFloat h = self.frame.size.height;
    CGFloat w = self.frame.size.width;
    
    CGFloat btnH = h;
    CGFloat btnW = w / self.subviews.count;
    CGFloat btnY = 0;
    
    for (int index = 0; index<self.tabBarButtons.count; index++) {
        // 1.取出按钮
        HBTabBarButton *btn = self.tabBarButtons[index];
        
        // 2.设置按钮的frame
        CGFloat btnX = index * btnW;
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        
        // 3.绑定tag
        btn.tag = index;
    }
}



@end
