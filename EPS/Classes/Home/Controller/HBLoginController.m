//
//  HBLoginController.m
//  EPS
//
//  Created by 郝斌 on 16/5/11.
//  Copyright © 2016年 hainx. All rights reserved.
//

#import "HBLoginController.h"
#import <UIView+SDAutoLayout.h>
#import "AppDelegate.h"
#import "HBTabBarViewController.h"
#import "HBUser.h"
#import "HBShow.h"

@interface HBLoginController() <UITextFieldDelegate>

@property (nonatomic, weak) UITextField *uNameTextField;
@property (nonatomic, weak) UITextField *uPwdTextField;
@property (nonatomic, weak) UIButton *loginBtn;

@end

@implementation HBLoginController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 设置Controller的背景色为白色
    self.view.backgroundColor = HBColorDefault;
    
    [self setup];
}


- (void)setup
{
    UIButton *logoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [logoBtn setTitle:@"一采通" forState:UIControlStateNormal];
    [logoBtn setTitle:@"一采通" forState:UIControlStateHighlighted];
    logoBtn.titleLabel.font = [UIFont systemFontOfSize:40];
    logoBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [logoBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [logoBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [self.view addSubview:logoBtn];
    
    UITextField *uNameTextField = [[UITextField alloc] init];
    uNameTextField.borderStyle = UITextBorderStyleRoundedRect;
    uNameTextField.placeholder = @"用户名";
    uNameTextField.delegate = self;
    [uNameTextField addTarget:self action:@selector(textFieldChanged:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:uNameTextField];
    self.uNameTextField = uNameTextField;
    
    UITextField *uPwdTextField = [[UITextField alloc] init];
    uPwdTextField.borderStyle = UITextBorderStyleRoundedRect;
    uPwdTextField.placeholder = @"密码";
    uPwdTextField.secureTextEntry = YES;
    uPwdTextField.delegate = self;
    [uPwdTextField addTarget:self action:@selector(textFieldChanged:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:uPwdTextField];
    self.uPwdTextField = uPwdTextField;

    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setTitle:@"登录" forState:UIControlStateHighlighted];
    [loginBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [loginBtn setBackgroundColor:[UIColor lightGrayColor]];
    [loginBtn addTarget:self action:@selector(loginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [loginBtn.layer setMasksToBounds:YES];
    [loginBtn.layer setCornerRadius:5.0];
    loginBtn.enabled = NO;
    [self.view addSubview:loginBtn];
    self.loginBtn = loginBtn;
    
    logoBtn.sd_layout
    .topSpaceToView(self.view, 100)
    .centerXIs(self.view.frame.size.width/2)
    .widthIs(self.view.frame.size.width)
    .heightIs(50);
    
    uNameTextField.sd_layout
    .topSpaceToView(logoBtn, 20)
    .centerXEqualToView(logoBtn)
    .widthRatioToView(self.view, 0.7)
    .heightIs(40);
    
    uPwdTextField.sd_layout
    .topSpaceToView(uNameTextField, 10)
    .centerXEqualToView(uNameTextField)
    .widthRatioToView(uNameTextField, 1)
    .heightIs(40);
    
    loginBtn.sd_layout
    .topSpaceToView(uPwdTextField, 20)
    .centerXEqualToView(uNameTextField)
    .widthRatioToView(uNameTextField, 1)
    .heightIs(40);
    
}

- (void)textFieldChanged:(UITextField *)textField
{
    if (self.uPwdTextField.text.length > 0 && self.uNameTextField.text.length > 0) {
        self.loginBtn.enabled = YES;
        [self.loginBtn setBackgroundColor:[UIColor whiteColor]];
    }
    else {
        self.loginBtn.enabled = NO;
        [self.loginBtn setBackgroundColor:[UIColor lightGrayColor]];
    }
}

- (void)loginBtnClick:(UIButton *)sender
{
    if (![self.uNameTextField.text isEqualToString:@"haobin"] && ![self.uPwdTextField.text isEqualToString:@"1"]) {
        [HBShow showFailure:@"账号或密码错误"];
        return;
    }
    
    // 模拟登录
    [HBShow showMessage:@"正在登录..." isAutoHide:NO];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        HBUser *user = [HBUser user];
        user.companyName = @"一采通信息科技有限公司";
        user.employeeName = @"郝斌";
        user.postName = @"采购部 > 价格科";
        
        user.menuCodeArray = @[@"icon_ApplyAudit", @"icon_ApplySend"];
        
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:user];
        
        [defaults setObject:data forKey:HBLoginKey];
        [defaults synchronize];
        
        [HBShow hide];
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
    });
    
}


@end
