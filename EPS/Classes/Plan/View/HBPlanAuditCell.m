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

@interface HBPlanAuditCell()

@property (nonatomic, strong) HBRadioButton *checkButton;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *typeLabel;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UIButton *moreButton;
@property (nonatomic, strong) UISegmentedControl *passSegment;
@property (nonatomic, strong) UIView *moreView;

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
    _checkButton = [[HBRadioButton alloc] init];
    [_checkButton addTarget:self action:@selector(checkButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_checkButton];
    
    _dateLabel = [[UILabel alloc] init];
    _dateLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:_dateLabel];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.numberOfLines = 0;
    [self.contentView addSubview:_titleLabel];

    _typeLabel = [[UILabel alloc] init];
    _typeLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:_typeLabel];
    
    _moreButton = [[UIButton alloc] init];
    [_moreButton setTitle:@"更多信息" forState:UIControlStateNormal];
    [_moreButton setTitle:@"更多信息" forState:UIControlStateHighlighted];
    [_moreButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_moreButton setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
    _moreButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    _moreButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [_moreButton addTarget:self action:@selector(moreButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_moreButton];
    
    _passSegment = [[UISegmentedControl alloc] init];
    [_passSegment insertSegmentWithTitle:@"同意" atIndex:0 animated:YES];
    [_passSegment insertSegmentWithTitle:@"不同意" atIndex:1 animated:YES];
    [_passSegment setTintColor:[UIColor grayColor]];
    [self.contentView addSubview:_passSegment];
    
    _moreView = [[UIView alloc] init];
    _moreView.backgroundColor = HBColor(245, 245, 245);
    [self.contentView addSubview:_moreView];
    
    
    _checkButton.sd_layout
    .topSpaceToView(self.contentView, 10)
    .leftSpaceToView(self.contentView, 10);
    
    _titleLabel.sd_layout
    .topSpaceToView(self.contentView, 10)
    .leftSpaceToView(_checkButton, 10)
    .rightSpaceToView(self.contentView, 10)
    .autoHeightRatio(0);
    
    _typeLabel.sd_layout
    .topSpaceToView(_titleLabel, 10)
    .leftEqualToView(_titleLabel)
    .widthRatioToView(_titleLabel, 1)
    .autoHeightRatio(0);
    
    _dateLabel.sd_layout
    .topSpaceToView(_typeLabel, 10)
    .leftEqualToView(_titleLabel)
    .widthRatioToView(_titleLabel, 1)
    .autoHeightRatio(0);
    
    _moreButton.sd_layout
    .topSpaceToView(_dateLabel, 10)
    .leftEqualToView(_dateLabel)
    .heightIs(24)
    .widthIs(100);
    
    _passSegment.sd_layout
    .topSpaceToView(_dateLabel, 10)
    .rightEqualToView(_dateLabel)
    .heightIs(24)
    .widthIs(100);
    
    _moreView.sd_layout
    .topSpaceToView(self.moreButton, 10)
    .leftSpaceToView(self.contentView, 10)
    .rightSpaceToView(self.contentView, 10)
    .heightIs(150);
    
    // 当你不确定哪个view在自动布局之后会排布在cell最下方的时候可以调用次方法将所有可能在最下方的view都传过去
    // [self setupAutoHeightWithBottomViewsArray:@[_titleLabel, _imageView] bottomMargin:margin];
    //[self setupAutoHeightWithBottomView:titleLabel bottomMargin:10];
    //[self setupAutoHeightWithBottomView:self.passSegment bottomMargin:10];
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
