//
//  HBMenuButton.m
//  EPS
//
//  Created by 郝斌 on 16/4/8.
//  Copyright © 2016年 hainx. All rights reserved.
//

#import "HBMenuButton.h"
#import "HBIconButton.h"
#import "HBBadgeButton.h"

@interface HBMenuButton()

@property (nonatomic, weak) HBIconButton *iconView;
@property (nonatomic, weak) HBBadgeButton *badgeButton;

@end

@implementation HBMenuButton

- (nonnull instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        
        // 添加一个图标按钮
        HBIconButton *iconLabel = [[HBIconButton alloc] init];
        [iconLabel setUserInteractionEnabled:NO];
        [self addSubview: iconLabel];
        self.iconView = iconLabel;
        
        // 添加一个提醒数字按钮
        HBBadgeButton *badgeButton = [[HBBadgeButton alloc] init];
        [self addSubview:badgeButton];
        self.badgeButton = badgeButton;
    }
    return self;
}

- (void)layoutSubviews
{
    CGFloat titleLabelH = 24;
    CGFloat titleLabelX = self.frame.origin.x;
    CGFloat titleLabelY = self.frame.size.height - titleLabelH;
    CGFloat titleLabelW = self.frame.size.width;
    self.titleLabel.frame = CGRectMake(titleLabelX, titleLabelY, titleLabelW, titleLabelH);
    
    CGFloat iconViewX = self.frame.origin.x;
    CGFloat iconViewY = self.frame.origin.y;
    CGFloat iconViewW = self.frame.size.width;
    CGFloat iconViewH = self.frame.size.height - titleLabelH;
    self.iconView.frame = CGRectMake(iconViewX, iconViewY, iconViewW, iconViewH);
    
    // 设置提醒数字的位置
    CGFloat badgeY = 10;
    CGFloat badgeX = self.frame.size.width * 0.5 + 20;
    CGRect badgeF = self.badgeButton.frame;
    badgeF.origin.x = badgeX;
    badgeF.origin.y = badgeY;
    self.badgeButton.frame = badgeF;
}

-(void)setIcon:(NSString *)iconName forState:(UIControlState)state;
{
    [self.iconView setTitle:iconName forState:state];
}

- (void)setIconColor:(UIColor *)color forState:(UIControlState)state
{
    [self.iconView setTitleColor:color forState:state];
}

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    
    [self.iconView setHighlighted:highlighted];
}

- (void)setBadgeValue:(NSString *)badgeValue
{
    _badgeValue = badgeValue;
    
    self.badgeButton.badgeValue = badgeValue;
}


@end
