//
//  HBPlanAuditCell.m
//  EPS
//
//  Created by 郝斌 on 16/4/18.
//  Copyright © 2016年 hainx. All rights reserved.
//

#import "HBPlanAuditCell.h"
#import <UIView+SDAutoLayout.h>
#import "HBPlanModel.h"
#import "HBRadioButton.h"
#import "UISwitch+HB.h"
#import "HBPlanAuditController.h"
#import "HBPopupView.h"

@interface HBPlanAuditCell()

@property (nonatomic, weak) HBRadioButton *checkButton;
@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, weak) UILabel *typeLabel;
@property (nonatomic, weak) UILabel *dateLabel;
@property (nonatomic, weak) UIButton *moreButton;
@property (nonatomic, weak) UISegmentedControl *passSegment;
@property (nonatomic, weak) HBPopupView *moreView;

@end

@implementation HBPlanAuditCell 

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    int controlPadding = 10;
    int moreButtonWidth = 100;
    
    // 选择
    HBRadioButton *checkButton = [[HBRadioButton alloc] init];
    [checkButton addTarget:self action:@selector(checkButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:checkButton];
    self.checkButton = checkButton;
    
    // 申请提交审核日期
    UILabel *dateLabel = [[UILabel alloc] init];
    dateLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:dateLabel];
    self.dateLabel = dateLabel;
    
    // 物料描述
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.numberOfLines = 0;
    [self.contentView addSubview:titleLabel];
    self.titleLabel = titleLabel;

    // 申请类型 物料编号
    UILabel *typeLabel = [[UILabel alloc] init];
    typeLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:typeLabel];
    self.typeLabel = typeLabel;
    
    // 更多信息按钮
    UIButton *moreButton = [[UIButton alloc] init];
    [moreButton setTitle:@"更多信息" forState:UIControlStateNormal];
    [moreButton setTitle:@"更多信息" forState:UIControlStateHighlighted];
    [moreButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [moreButton setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
    moreButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    moreButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [moreButton addTarget:self action:@selector(moreButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:moreButton];
    self.moreButton = moreButton;
    
    // 是否同意
    UISegmentedControl *passSegment = [[UISegmentedControl alloc] init];
    [passSegment insertSegmentWithTitle:@"同意" atIndex:0 animated:YES];
    [passSegment insertSegmentWithTitle:@"不同意" atIndex:1 animated:YES];
    [passSegment setTintColor:[UIColor grayColor]];
    [self.contentView addSubview:passSegment];
    self.passSegment = passSegment;
    
    // 更多信息内容
    CGPoint pPoint = CGPointMake(60, 0);
    HBPopupView *moreView = [HBPopupView popupViewWithPoint:pPoint direction:PopupViewDirectionBottom borderColor:HBColor(164, 164, 164) backgroundColor:HBColor(245, 245, 245)];
    moreView.textColor = [UIColor grayColor];
    moreView.textFont = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:moreView];
    self.moreView = moreView;
    
    self.checkButton.sd_layout
    .topSpaceToView(self.contentView, controlPadding)
    .leftSpaceToView(self.contentView, controlPadding);
    
    self.titleLabel.sd_layout
    .topSpaceToView(self.contentView, controlPadding)
    .leftSpaceToView(self.checkButton, controlPadding)
    .rightSpaceToView(self.contentView, controlPadding)
    .autoHeightRatio(0);
    
    self.typeLabel.sd_layout
    .topSpaceToView(self.titleLabel, controlPadding)
    .leftEqualToView(self.titleLabel)
    .widthRatioToView(self.titleLabel, 1)
    .autoHeightRatio(0);
    
    self.dateLabel.sd_layout
    .topSpaceToView(self.typeLabel, controlPadding)
    .leftEqualToView(self.titleLabel)
    .widthRatioToView(self.titleLabel, 1)
    .autoHeightRatio(0);
    
    self.moreButton.sd_layout
    .topSpaceToView(self.dateLabel, controlPadding)
    .leftEqualToView(self.dateLabel)
    .heightIs(24)
    .widthIs(moreButtonWidth);
    
    self.passSegment.sd_layout
    .topSpaceToView(self.dateLabel, controlPadding)
    .rightEqualToView(self.dateLabel)
    .heightIs(24)
    .widthIs(100);
    
    self.moreView.sd_layout
    .topSpaceToView(self.moreButton, 0)
    .leftEqualToView(self.checkButton)
    .rightEqualToView(self.passSegment);
}


- (void)setModel:(HBPlanModel *)model
{
    _model = model;
    
    self.checkButton.selected = model.isSelected;
    self.titleLabel.text = model.MaterialDesc;
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    self.dateLabel.text = [dateFormatter stringFromDate: model.AssignDate];
    NSString *requestTypeDesc = model.RequestTypeDesc;
    if (model.MaterialCode != nil) {
        requestTypeDesc = [NSString stringWithFormat:@"%@[%@]", requestTypeDesc, model.MaterialCode];
    }
    self.typeLabel.text = requestTypeDesc;
    if (model.IsAuditPass == 1) {
        [self.passSegment setSelectedSegmentIndex:0];
    }
    else {
        [self.passSegment setSelectedSegmentIndex:1];
    }
    self.moreView.text = @"物料类型：\r\n物料组：";
    if (model.isShowMore == NO) {
        self.moreView.hidden = YES;
        [self setupAutoHeightWithBottomView:self.passSegment bottomMargin:10];
    }
    else {
        self.moreView.hidden = NO;
        [self setupAutoHeightWithBottomView:self.moreView bottomMargin:10];
    }
}

- (void)checkButtonClick:(HBRadioButton *)sender
{
    sender.selected = !sender.selected;
    self.model.isSelected = sender.selected;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    // 去掉选中状态
}

- (void)radioClick
{
    [self checkButtonClick:self.checkButton];
}

- (void)moreButtonClick:(UIButton *)sender
{
    self.model.isShowMore = !self.model.isShowMore;
    
    if ([self.delegate respondsToSelector:@selector(planAuditCell:moreClick:)]) {
        [self.delegate planAuditCell:self moreClick:sender];
    }
}

@end
