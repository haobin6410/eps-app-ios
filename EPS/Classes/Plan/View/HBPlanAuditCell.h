//
//  HBPlanAuditCell.h
//  EPS
//
//  Created by 郝斌 on 16/4/18.
//  Copyright © 2016年 hainx. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HBPlanModel;
@class HBPlanAuditCell;

@protocol HBPlanAuditCellDelegate <NSObject>

@optional
- (void)planAuditCell:(HBPlanAuditCell *)cell moreClick:(UIButton *)btn;

@end

@interface HBPlanAuditCell : UITableViewCell

@property (nonatomic, strong) HBPlanModel *model;

@property (nonatomic, strong) NSIndexPath *indexPath;

@property (nonatomic, assign) id<HBPlanAuditCellDelegate> delegate;

- (void)radioClick;

@end




