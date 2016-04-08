//
//  UIImage+HB.h
//  EPS
//
//  Created by 郝斌 on 15/7/4.
//  Copyright (c) 2015年 hainx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (HB)

/**
 * 加载图片
 *
 * @param name 图片名
 */
+ (UIImage *)imageWithName:(NSString *)name;

/**
 * 返回一张自由拉伸的图片
 *
 * @param name 图片名
 */
+ (UIImage *)resizedImageWithName:(NSString *)name;

@end
