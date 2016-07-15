//
//  ViewController.m
//  computerLogIn
//
//  Created by 李洋 on 16/7/15.
//  Copyright © 2016年 zyzs. All rights reserved.
//

#import "ViewController.h"
#import "LYComputerLogInView.h"

@interface ViewController ()<LYComputerLogInViewDelegate>
@property (nonatomic,strong)NSTimer *timer;
@property (nonatomic,strong)LYComputerLogInView *testView ;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   

}
- (IBAction)click:(id)sender {
    
    LYComputerLogInView *testView = [LYComputerLogInView computerLogInView];
    testView.delegate = self;
    [testView.headImageView setImage:[UIImage imageNamed:@"ly_ComputerLogIn"]];
    testView.titleLabel.text = @"中烟追溯登录确认";
    testView.descripLabel.text = @"为保障账户安全，请确保是本人操作";
    [testView.logInbtn setTitle:@"确认登陆" forState:UIControlStateNormal];
    [testView.logInbtn setBackgroundImage:[UIImage imageNamed:@"ly_loginButton"] forState:UIControlStateNormal];
    [testView.clickBtn setTitle:@"取消" forState:UIControlStateNormal];
    [testView showInRect:[UIApplication sharedApplication].keyWindow.bounds withAnimation:YES];
    self.testView = testView;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:5.0f target:self selector:@selector(changeView) userInfo:nil repeats:NO];
}
#pragma 测试方法
-(void)changeView
{
    [self.testView.headImageView setImage:[UIImage imageNamed:@"ly_logInError"]];
    self.testView.titleLabel.text = @"二维码已失效";
    self.testView.descripLabel.text = @"请返回电脑重新扫描";
    [self.testView.logInbtn setTitle:@"重新扫描" forState:UIControlStateNormal];
    [self.testView.logInbtn setBackgroundImage:[UIImage imageNamed:@"ly_loginButton"] forState:UIControlStateNormal];
    [self.testView.clickBtn setTitle:@"重新扫描" forState:UIControlStateNormal];
    self.testView.clickBtn.layer.borderWidth = 5;
    self.testView.clickBtn.layer.borderColor = [UIColor orangeColor].CGColor;
    self.testView.clickBtn.layer.cornerRadius = 8;
    self.testView.logInbtn.hidden = YES;
    [self.testView showInRect:[UIApplication sharedApplication].keyWindow.bounds withAnimation:NO];
}
-(void)lyComputerLogInViewDidDismissed:(LYComputerLogInView *)computerLogInView
{
    NSLog(@"dismiss");
}
-(void)logInClick
{
    /**
     *  如果点击了登陆按钮则取消timer定时器
     */
    [self.timer invalidate];
    NSLog(@"向后台发送登陆信息---带唯一设备标识码确保唯一设备登陆");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
