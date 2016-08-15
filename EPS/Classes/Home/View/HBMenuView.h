//
//  HBMenuView.h
//  EPS
//
//  Created by 郝斌 on 16/5/12.
//  Copyright © 2016年 hainx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HBMenuButton.h"

@protocol HBMenuViewDelegate <NSObject>

@optional
- (void)menuButtonClick:(HBMenuButton *)menuButton;

@end

@interface HBMenuView : UIScrollView

@property (nonatomic, strong) NSArray *menuArray;
@property (nonatomic, assign) id<HBMenuViewDelegate> menuViewDelegate;

+ (instancetype)menuViewWithFrame:(CGRect)frame;

@end
