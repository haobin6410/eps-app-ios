//
//  HBTabBar.h
//  EPS
//
//  Created by 郝斌 on 15/7/3.
//  Copyright (c) 2015年 hainx. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HBTabBar;

@protocol HBTabBarDelegate <NSObject>

@optional
- (void)tabBar:(HBTabBar *)tabBar didSelectedButtonFrom:(NSInteger)from to:(NSInteger)to;

@end

@interface HBTabBar : UIView

- (void)addTabBarButtonWithItem:(UITabBarItem *)item;

@property (nonatomic, weak) id<HBTabBarDelegate> delegate;

@end
