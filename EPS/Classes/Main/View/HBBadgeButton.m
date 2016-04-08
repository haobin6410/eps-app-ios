//
//  HBBadgeButton.m
//  EPS
//
//  Created by 郝斌 on 15/7/3.
//  Copyright (c) 2015年 hainx. All rights reserved.
//

#import "HBBadgeButton.h"

@implementation HBBadgeButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.hidden = YES;
        self.userInteractionEnabled = NO;
        [self setBackgroundImage:[UIImage resizedImageWithName:@"main_badge"] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:11];
    }
    return self;
    
}

- (void)setBadgeValue:(NSString *)badgeValue
{
    _badgeValue = [badgeValue copy];
    
    if (badgeValue) {
        self.hidden = NO;
        
        //设置文字
        [self setTitle:badgeValue forState:UIControlStateNormal];
        
        //设置frame
        CGRect badgeFrame = self.frame;
        CGFloat badgeH = self.currentBackgroundImage.size.height;
        CGFloat badgeW = self.currentBackgroundImage.size.width;
        if(badgeValue.length > 1){
            //设置文字尺寸
            NSDictionary *sizeAttr = @{ NSFontAttributeName:self.titleLabel.font };
            CGSize badgeSize = [badgeValue sizeWithAttributes:sizeAttr];
            badgeW = badgeSize.width + 10;
        }
        badgeFrame.size.width = badgeW;
        badgeFrame.size.height = badgeH;
        self.frame = badgeFrame;
    }
    else {
        self.hidden = YES;
    }
}

@end
