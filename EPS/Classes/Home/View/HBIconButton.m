//
//  HBIconButton.m
//  EPS
//
//  Created by 郝斌 on 15/8/13.
//  Copyright © 2015年 hainx. All rights reserved.
//

#import "HBIconButton.h"

@interface HBIconButton()

@end

@implementation HBIconButton

- (nonnull instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont fontWithName:@"1ct-regular" size:50];
    }
    return self;
}

- (void)layoutSubviews
{
    self.titleLabel.frame = self.frame;
}

@end
