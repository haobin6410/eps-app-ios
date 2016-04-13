//
//  HBShow.h
//  EPS
//
//  Created by 郝斌 on 16/4/13.
//  Copyright © 2016年 hainx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HBShow : NSObject

+ (void)showSuccess:(NSString *)success;
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;

+ (void)showFailure:(NSString *)failure;
+ (void)showFailure:(NSString *)failure toView:(UIView *)view;

+ (void)hide;
+ (void)hideForView:(UIView *)view;
@end
