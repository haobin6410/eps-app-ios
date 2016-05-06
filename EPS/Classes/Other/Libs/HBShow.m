//
//  HBShow.m
//  EPS
//
//  Created by 郝斌 on 16/4/13.
//  Copyright © 2016年 hainx. All rights reserved.
//

#import "HBShow.h"
#import <MBProgressHUD.h>

@implementation HBShow

+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = text;
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", icon]]];
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // 1秒之后再消失
    [hud hide:YES afterDelay:0.7];
}

+ (void)showSuccess:(NSString *)success
{
    [self showSuccess:success toView:nil];
}
+ (void)showSuccess:(NSString *)success toView:(UIView *)view
{
    [self show:success icon:@"success.png" view:view];
}

+ (void)showFailure:(NSString *)failure
{
    [self show:failure icon:failure view:nil];
}
+ (void)showFailure:(NSString *)failure toView:(UIView *)view
{
    [self show:failure icon:@"error.png" view:view];
}

+ (void)showMessage:(NSString *)message isAutoHide:(BOOL)isAutoHide
{
    [self showMessage:message toView:nil isAutoHide:isAutoHide];
}

+ (void)showMessage:(NSString *)message toView:(UIView *)view isAutoHide:(BOOL)isAutoHide {
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = message;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // YES代表需要蒙版效果
    hud.dimBackground = YES;
    if (isAutoHide) {
        // 1秒之后再消失
        [hud hide:YES afterDelay:0.7];
    }
}

+ (void)hide
{
    [self hideForView:nil];
}
+ (void)hideForView:(UIView *)view
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    [MBProgressHUD hideHUDForView:view animated:YES];
}

@end
