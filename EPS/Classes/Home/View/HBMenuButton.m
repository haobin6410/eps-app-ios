//
//  HBMenuButton.m
//  EPS
//
//  Created by 郝斌 on 16/4/8.
//  Copyright © 2016年 hainx. All rights reserved.
//

#import "HBMenuButton.h"
#import "HBIconButton.h"

@interface HBMenuButton()

@property (nonatomic, weak)HBIconButton *iconView;

@end

@implementation HBMenuButton

- (nonnull instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        
        HBIconButton *iconLabel = [[HBIconButton alloc] init];
        [iconLabel setUserInteractionEnabled:NO];
        [self addSubview: iconLabel];
        self.iconView = iconLabel;
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


@end
