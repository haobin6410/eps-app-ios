//
//  HBRadioButton.m
//  EPS
//
//  Created by 郝斌 on 16/4/20.
//  Copyright © 2016年 hainx. All rights reserved.
//

#import "HBRadioButton.h"
#import "UIImage+HB.h"

@implementation HBRadioButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundImage:[UIImage imageWithName:@"radio.png"] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageWithName:@"radio-checked.png"] forState:UIControlStateSelected];
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted
{
    
}

- (void)setFrame:(CGRect)frame
{
    frame = CGRectMake(frame.origin.x, frame.origin.y, 24, 24);
    
    [super setFrame:frame];
}

@end
