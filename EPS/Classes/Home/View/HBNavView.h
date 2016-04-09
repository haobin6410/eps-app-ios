//
//  HBNavView.h
//  EPS
//
//  Created by 郝斌 on 16/4/9.
//  Copyright © 2016年 hainx. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HBNavViewDelegate <NSObject>

@optional
-(void)navViewClick:(id *)navView;

@end

@interface HBNavView : UIView

@property (nonatomic, assign) id<HBNavViewDelegate> delegate;

@end
