//
//  HBMenu.m
//  EPS
//
//  Created by 郝斌 on 15/8/19.
//  Copyright © 2015年 hainx. All rights reserved.
//

#import "HBMenu.h"

@implementation HBMenu

- (instancetype)initWithDict:(NSDictionary *)dict
{
    // 此方法无法解析\U0000 这样的编码 所以暂停使用
    
    if(self = [super init]){
//        [self setValuesForKeysWithDictionary:dict];
        self.code = dict[@"code"];
        self.title = dict[@"title"];
        self.pic = dict[@"pic"];
    }
    
    return self;
}

+ (instancetype)menuWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

- (instancetype)initWithCode:(NSString *)code title:(NSString *)title pic:(NSString *)pic
{
    if (self = [super init]) {
        self.code = code;
        self.title = title;
        self.pic = pic;
    }
    
    return self;

}

+ (instancetype)menuWithCode:(NSString *)code title:(NSString *)title pic:(NSString *)pic
{
    return [[self alloc] initWithCode:code title:title pic:pic];
}

@end