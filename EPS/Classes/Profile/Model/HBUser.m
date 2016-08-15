//
//  HBUser.m
//  EPS
//
//  Created by 郝斌 on 16/5/11.
//  Copyright © 2016年 hainx. All rights reserved.
//

#import "HBUser.h"

@implementation HBUser

+ (instancetype)user
{
    HBUser *u = [[HBUser alloc] init];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [defaults objectForKey:HBLoginKey];
    if (data != nil) {
        u = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    }
    
    return u;
}

// 使用NSUserDefaults存自定义对象 则需要添加下面两个方法
- (id)initWithCoder:(NSCoder *)coder
{
    self.companyName = [[coder decodeObjectForKey:@"companyName"] copy];
    self.employeeName = [[coder decodeObjectForKey:@"employeeName"] copy];
    self.postName = [[coder decodeObjectForKey:@"postName"] copy];
    self.photo = [[coder decodeObjectForKey:@"photo"] copy];
    self.menuCodeArray = [[coder decodeObjectForKey:@"menuCodeArray"] copy];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.companyName forKey:@"companyName"];
    [coder encodeObject:self.employeeName forKey:@"employeeName"];
    [coder encodeObject:self.postName forKey:@"postName"];
    [coder encodeObject:self.photo forKey:@"photo"];
    [coder encodeObject:self.menuCodeArray forKey:@"menuCodeArray"];
}


@end
