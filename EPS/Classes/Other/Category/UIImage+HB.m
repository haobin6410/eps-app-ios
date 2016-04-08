//
//  UIImage+HB.m
//  EPS
//
//  Created by 郝斌 on 15/7/4.
//  Copyright (c) 2015年 hainx. All rights reserved.
//

#import "UIImage+HB.h"

@implementation UIImage (HB)

+ (UIImage *)imageWithName:(NSString *)name
{
    if(IOS6)
    {
        NSString *newName = [name stringByAppendingString:@"_os6"];
        UIImage *image = [UIImage imageNamed:newName];
        if(image == nil){
            image = [UIImage imageNamed:name];
        }
        return image;
    }
    
    return [UIImage imageNamed:name];
}

+ (UIImage *)resizedImageWithName:(NSString *)name
{
    UIImage *image = [self imageWithName:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}

@end
