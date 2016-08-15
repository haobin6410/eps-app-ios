//
//  HBUser.h
//  EPS
//
//  Created by 郝斌 on 16/5/11.
//  Copyright © 2016年 hainx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HBUser : NSObject

@property (nonatomic, strong) NSString *companyName;
@property (nonatomic, strong) NSString *employeeName;
@property (nonatomic, strong) NSString *postName;
@property (nonatomic, strong) NSString *photo;
@property (nonatomic, strong) NSArray *menuCodeArray;

+ (instancetype)user;

@end
