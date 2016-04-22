//
//  HBHttp.m
//  EPS
//
//  Created by 郝斌 on 16/4/13.
//  Copyright © 2016年 hainx. All rights reserved.
//

#import "HBHttp.h"
#import <AFNetworking.h>

@interface HBHttp()

@end

@implementation HBHttp

+ (NSString *)GetUrl:(NSString *)url
{
    NSString *host = @"http://119.57.160.154:8045";
    //NSString *host = @"http://192.168.0.69:8045";
    
    if ([url hasPrefix:@"/"]) {
        return [NSString stringWithFormat:@"%@%@", host, url];
    }
    else {
        return [NSString stringWithFormat:@"%@/%@", host, url];
    }
}

+ (void)GET:(NSString *)URLString
       parameters:(id)parameters
          success:(void (^)(id responseObject))success
          failure:(void (^)(NSError *error))failure
{
    NSString *url = [self GetUrl:URLString];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
        
    }];
}

+ (void)POST:(NSString *)URLString
       parameters:(id)parameters
          success:(void (^)(id responseObject))success
          failure:(void (^)(NSError *error))failure
{
    NSString *url = [self GetUrl:URLString];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager POST:url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
        
    }];
}

@end
