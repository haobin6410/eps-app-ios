//
//  UIBarButtonItem+HB.m
//  EPS
//
//  Created by 郝斌 on 15/7/5.
//  Copyright (c) 2015年 hainx. All rights reserved.
//

#import "UIBarButtonItem+HB.h"

@implementation UIBarButtonItem (HB)

/**
 *  快速创建一个显示图片的item
 */
+ (UIBarButtonItem *)itemWithIcon:(NSString *)icon hightIcon:(NSString *)hightIcon target:(id)target action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageWithName:icon] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageWithName:hightIcon] forState:UIControlStateHighlighted];
    btn.frame = (CGRect){CGPointZero, btn.currentBackgroundImage.size};
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
    
}

@end
