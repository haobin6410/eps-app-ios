//
//  HBPlanModel.h
//  EPS
//
//  Created by 郝斌 on 16/4/18.
//  Copyright © 2016年 hainx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HBPlanModel : NSObject

@property (nonatomic, assign) BOOL isSelected;

@property (nonatomic, assign) BOOL isShowMore;

@property (nonatomic, assign) int PlanId;

@property (nonatomic, strong) NSString *MaterialCode;

@property (nonatomic, strong) NSString *MaterialName;

@property (nonatomic, strong) NSString *MaterialDesc;

@property (nonatomic, assign) int UnitId;

@property (nonatomic, assign) int PurchasingCycle;

@property (nonatomic, assign) int IsEmergency;

@property (nonatomic, assign) int MaterialCount;

@property (nonatomic, assign) int PlanCount;

@property (nonatomic, assign) int MaterialClassId;

@property (nonatomic, assign) int MaterialGroupId;

@property (nonatomic, assign) int PlanStatus;

@property (nonatomic, strong) NSString *StrockCount;

@property (nonatomic, strong) NSString *StrockReadDate;

@property (nonatomic, strong) NSString *CreateDeptName;

@property (nonatomic, strong) NSDate *RequestDate;

@property (nonatomic, strong) NSDate *AssignDate;

@property (nonatomic, strong) NSString *RequestTypeDesc;

@property (nonatomic, assign) int IsAuditPass;

@property (nonatomic, strong) NSString *AuditDesc;

@end
