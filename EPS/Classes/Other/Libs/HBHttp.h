//
//  HBHttp.h
//  EPS
//
//  Created by 郝斌 on 16/4/13.
//  Copyright © 2016年 hainx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HBHttp : NSObject

+ (void)GET:(NSString *)URLString
 parameters:(id)parameters
    success:(void (^)(id responseObject))success
    failure:(void (^)(NSError *error))failure;

+ (void)POST:(NSString *)URLString
  parameters:(id)parameters
     success:(void (^)(id responseObject))success
     failure:(void (^)(NSError *error))failure;

@end
