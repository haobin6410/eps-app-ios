//
//  HBNavView.m
//  EPS
//
//  Created by 郝斌 on 16/4/9.
//  Copyright © 2016年 hainx. All rights reserved.
//

#import "HBNavView.h"

@interface HBNavView()

@property (nonatomic, weak) UILabel *companyLabel;
@property (nonatomic, weak) UILabel *employeeLabel;
@property (nonatomic, weak) UILabel *postLabel;

@end

@implementation HBNavView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        CGFloat navBarXY = 0;
        CGFloat navBarW = [UIScreen mainScreen].bounds.size.width;

        // 1.添加公司名称label
        UILabel *companyLabel = [[UILabel alloc] init];
        companyLabel.textColor = [UIColor whiteColor];
        companyLabel.font = [UIFont systemFontOfSize:16];
        companyLabel.textAlignment = NSTextAlignmentCenter;

        NSMutableDictionary *companyFontAttrDic = [NSMutableDictionary dictionary];
        companyFontAttrDic[NSFontAttributeName] = companyLabel.font;
        CGFloat companyLabelW = navBarW;
        CGFloat companyLabelX = 0;
        CGFloat companyLabelY = 20;
        CGFloat companyLabelH = 30;
        companyLabel.frame = CGRectMake(companyLabelX, companyLabelY, companyLabelW, companyLabelH);
        [self addSubview:companyLabel];
        self.companyLabel = companyLabel;

        // 2.添加用户信息
        UIView *userView = [[UIView alloc] init];
        CGFloat userViewBorderX = 20; //左右间距
        CGFloat userViewBorderY = 15; //上下间距
        CGFloat userViewW = navBarW - 2 * userViewBorderX;
        CGFloat userViewH = 70;
        CGFloat userViewX = userViewBorderX;
        CGFloat userViewY = CGRectGetMaxY(companyLabel.frame) + userViewBorderY;
        userView.frame = CGRectMake(userViewX, userViewY, userViewW, userViewH);
        [self addSubview:userView];

        // 2.1.添加员工头像
        UIImageView *userPhoto = [[UIImageView alloc] init];
        userPhoto.image = [UIImage imageWithName:@"default_photo"];
        CGFloat userPhotoX = 0;
        CGFloat userPhotoY = 0;
        CGFloat userPhotoWH = 70;
        userPhoto.frame = CGRectMake(userPhotoX, userPhotoY, userPhotoWH, userPhotoWH);
        // 变成圆形头像
        userPhoto.layer.cornerRadius = 35;
        userPhoto.layer.masksToBounds = YES;
        [userView addSubview:userPhoto];

        // 2.2.添加员工名称
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.textColor = [UIColor whiteColor];
        nameLabel.font = [UIFont systemFontOfSize:15];
        self.employeeLabel = nameLabel;

        NSMutableDictionary *nameFontAttrDic = [NSMutableDictionary dictionary];
        nameFontAttrDic[NSFontAttributeName] = nameLabel.font;
        CGFloat nameLabelX = CGRectGetMaxX(userPhoto.frame) + userViewBorderX;
        CGFloat nameLabelY = userPhotoY + 10;
        CGFloat nameLabelH = 26;
        CGFloat nameLabelW = navBarW - nameLabelX;
        nameLabel.frame = CGRectMake(nameLabelX, nameLabelY, nameLabelW, nameLabelH);
        [userView addSubview:nameLabel];

        // 2.3.添加业务角色名称
        UILabel *roleLabel = [[UILabel alloc] init];
        roleLabel.textColor = [UIColor whiteColor];
        roleLabel.font = [UIFont systemFontOfSize:14];
        self.postLabel = roleLabel;

        NSMutableDictionary *roleFontAttrDic = [NSMutableDictionary dictionary];
        roleFontAttrDic[NSFontAttributeName] = roleLabel.font;
        CGFloat roleLabelX = nameLabelX;
        CGFloat roleLabelY = CGRectGetMaxY(nameLabel.frame);
        CGFloat roleLabelH = 24;
        CGFloat roleLabelW = navBarW - roleLabelX;
        roleLabel.frame = CGRectMake(roleLabelX, roleLabelY, roleLabelW, roleLabelH);
        [userView addSubview:roleLabel];

        // 2.4.添加右箭头
        UIImageView *rightView = [[UIImageView alloc] init];
        rightView.image = [UIImage imageWithName:@"nav_right"];
        rightView.contentMode = UIViewContentModeCenter;
        CGFloat rightViewW = rightView.image.size.width;
        CGFloat rightViewH = userViewH;
        CGFloat rightViewX = userViewW - rightViewW;
        CGFloat rightViewY = 0;
        rightView.frame = CGRectMake(rightViewX, rightViewY, rightViewW, rightViewH);
        [userView addSubview:rightView];
        
        // 3.NavigationBar高度计算
        CGFloat navBarH = CGRectGetMaxY(userView.frame) + userViewBorderY;
        self.frame = CGRectMake(navBarXY, navBarXY, navBarW, navBarH);
        self.backgroundColor = HBColorDefault;
        
        //添加手势监测
        UITapGestureRecognizer *singleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap:)];
        singleRecognizer.numberOfTapsRequired = 1;
        [self addGestureRecognizer:singleRecognizer];
        
    }
    return self;
}

- (void)setUser:(HBUser *)user
{
    _user = user;
    
    self.companyLabel.text = user.companyName;
    self.employeeLabel.text = user.employeeName;
    self.postLabel.text = user.postName;
}

- (void)singleTap:(id *)sender
{
    if([self.delegate respondsToSelector:@selector(navViewClick:)]){
        [self.delegate navViewClick:sender];
    }
}
@end
