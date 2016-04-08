//
//  HBMenu.h
//  EPS
//
//  Created by 郝斌 on 15/8/19.
//  Copyright © 2015年 hainx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HBMenu : NSObject

@property (nonatomic, copy) NSString *code;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *pic;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)menuWithDict:(NSDictionary *)dict;

- (instancetype)initWithCode:(NSString *)code title:(NSString *)title pic:(NSString *)pic;

+ (instancetype)menuWithCode:(NSString *)code title:(NSString *)title pic:(NSString *)pic;
@end
