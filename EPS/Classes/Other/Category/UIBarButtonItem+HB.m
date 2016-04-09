//
//  UIBarButtonItem+HB.m
//  EPS
//
//  Created by 郝斌 on 15/7/5.
//  Copyright (c) 2015年 hainx. All rights reserved.
//

#import "UIBarButtonItem+HB.h"
#import "NSString+HB.h"

@implementation UIBarButtonItem (HB)

/**
 *  快速创建一个显示图片的item
 */
+ (UIBarButtonItem *)itemWithIcon:(NSString *)icon hightIcon:(NSString *)hightIcon target:(id)target action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setBackgroundImage:[UIImage imageWithName:icon] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageWithName:hightIcon] forState:UIControlStateHighlighted];
    
    CGFloat btnWidth = btn.currentBackgroundImage.size.width;
    CGFloat btnHeight = btn.currentBackgroundImage.size.height;
    CGSize btnSize = CGSizeMake(btnWidth, btnHeight);
    btn.frame = (CGRect){CGPointZero, btnSize};
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
    
}

+ (UIBarButtonItem *)itemWithTitle:(NSString *)title icon:(NSString *)icon hightIcon:(NSString *)hightIcon target:(id)target action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitle:title forState:(UIControlStateHighlighted)];
    [btn setImage:[UIImage imageWithName:icon] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageWithName:hightIcon] forState:UIControlStateHighlighted];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    
    NSDictionary *fontDict = @{NSFontAttributeName:btn.titleLabel.font};
    CGFloat titleWidth = [title sizeWithAttributes:fontDict].width;
    
    CGFloat btnWidth = btn.currentImage.size.width + titleWidth + 5;
    CGFloat btnHeight = btn.currentImage.size.height;
    CGSize btnSize = CGSizeMake(btnWidth, btnHeight);
    btn.frame = (CGRect){CGPointZero, btnSize};
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

@end
