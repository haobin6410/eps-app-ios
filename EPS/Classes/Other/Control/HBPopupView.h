//
//  HBPopupView.h
//  EPS
//
//  Created by 郝斌 on 16/4/23.
//  Copyright © 2016年 hainx. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, PopupViewDirection)
{
    PopupViewDirectionDefault,
    PopupViewDirectionLeft,
    PopupViewDirectionRight,
    PopupViewDirectionTop,
    PopupViewDirectionBottom
};

@interface HBPopupView : UIView

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIFont *textFont;

+ (instancetype)popupViewWithPoint:(CGPoint)point direction:(PopupViewDirection)direction borderColor:(UIColor *)borderColor backgroundColor:(UIColor *)backgroundColor;

@end
