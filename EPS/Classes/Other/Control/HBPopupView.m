//
//  HBPopupView.m
//  EPS
//
//  Created by 郝斌 on 16/4/23.
//  Copyright © 2016年 hainx. All rights reserved.
//

#import "HBPopupView.h"

@interface HBPopupView()

@property (nonatomic, assign) CGPoint point;
@property (nonatomic, strong) UIColor *borderColor;
@property (nonatomic, strong) UIColor *bgColor;
@property (nonatomic, assign) PopupViewDirection direction;
@property (nonatomic, assign) int sideLength;
@property (nonatomic, strong) UILabel *contentLabel;

@end

@implementation HBPopupView

- (int)sideLength
{
    return 10;
}

+ (instancetype)popupViewWithPoint:(CGPoint)point direction:(PopupViewDirection)direction borderColor:(UIColor *)borderColor backgroundColor:(UIColor *)backgroundColor
{
    if (direction == PopupViewDirectionDefault) {
        direction = PopupViewDirectionBottom;
    }

    HBPopupView *popupView = [[self alloc] init];
    popupView.direction = direction;
    popupView.point = point;
    popupView.bgColor = backgroundColor;
    popupView.borderColor = borderColor;
    popupView.backgroundColor = [UIColor clearColor];
    return popupView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentLabel = [[UILabel alloc] init];
        self.contentLabel.textColor = self.textColor;
        [self addSubview:self.contentLabel];
        
        self.contentLabel.sd_layout
        .topSpaceToView(self, self.sideLength * 2)
        .leftSpaceToView(self, self.sideLength)
        .rightSpaceToView(self, self.sideLength)
        .autoHeightRatio(0);
        
        [self setupAutoHeightWithBottomView:_contentLabel bottomMargin:self.sideLength];
    }
    return self;
}

- (void)setText:(NSString *)text
{
    self.contentLabel.text = text;
}

- (void)setTextColor:(UIColor *)textColor
{
    self.contentLabel.textColor = textColor;
}

- (void)setTextFont:(UIFont *)textFont
{
    self.contentLabel.font = textFont;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    // 1.获取图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.绘图
    CGMutablePathRef path = CGPathCreateMutable();
    if (self.direction == PopupViewDirectionTop) {
        // 上面
    }
    else if (self.direction == PopupViewDirectionBottom) {
        // 下面
        CGPathMoveToPoint(path, NULL, rect.origin.x, rect.origin.y + self.sideLength);
        CGPathAddLineToPoint(path, NULL, self.point.x - self.sideLength, rect.origin.y + self.sideLength);
        CGPathAddLineToPoint(path, NULL, self.point.x, rect.origin.y);
        CGPathAddLineToPoint(path, NULL, self.point.x + self.sideLength, rect.origin.y + self.sideLength);
        CGPathAddLineToPoint(path, NULL, CGRectGetMaxX(rect), rect.origin.y + self.sideLength);
        CGPathAddLineToPoint(path, NULL, CGRectGetMaxX(rect), CGRectGetMaxY(rect));
        CGPathAddLineToPoint(path, NULL, rect.origin.x, CGRectGetMaxY(rect));
        CGPathCloseSubpath(path);
    }
    else if (self.direction == PopupViewDirectionLeft) {
        // 左边
    }
    else if (self.direction == PopupViewDirectionRight) {
        // 右边
    }
    
    // 3.渲染
    // 画背景
    [self.bgColor set];
    CGContextAddPath(ctx, path);
    CGContextFillPath(ctx);
    // 画边框
    [self.borderColor set];
    CGContextSetLineWidth(ctx, 1);
    CGContextAddPath(ctx, path);
    CGContextStrokePath(ctx);
    
    CGPathRelease(path);
}

@end
