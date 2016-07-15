//
//  LYComputerLogInView.m
//  ZYZSSCAN
//
//  Created by 李洋 on 16/7/15.
//  Copyright © 2016年 zyzs. All rights reserved.
//

#import "LYComputerLogInView.h"

@implementation LYComputerLogInView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //创建图片
        self.headImageView = [[UIImageView alloc] init];
        //创建标题
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.textColor = [UIColor grayColor];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        //创建描述
        self.descripLabel = [[UILabel alloc] init];
        self.descripLabel.textAlignment = NSTextAlignmentCenter;
        self.descripLabel.textColor = [UIColor lightGrayColor];
        self.descripLabel.font = [UIFont systemFontOfSize:18];
        //创建登录按钮
        self.logInbtn = [[UIButton alloc] init];
        [self.logInbtn addTarget:self action:@selector(logIn) forControlEvents:UIControlEventTouchUpInside];
        self.logInbtn.layer.masksToBounds = YES;
        self.logInbtn.layer.cornerRadius = 8;
        //创建通用按钮
        self.clickBtn = [[UIButton alloc] init];
        [self.clickBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self.clickBtn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        self.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1];
        [self addSubview:self.headImageView];
        [self addSubview:self.titleLabel];
        [self addSubview:self.descripLabel];
        [self addSubview:self.logInbtn];
        [self addSubview:self.clickBtn];
        
    }
    return self;
}
/**
 *  重写外部属性set方法
 *
 *  @param titleLabel
 */
-(void)setTitleLabel:(UILabel *)titleLabel
{
    _titleLabel = titleLabel;
}
-(void)setDescripLabel:(UILabel *)descripLabel
{
    _descripLabel = descripLabel;
}
-(void)setHeadImageView:(UIImageView *)headImageView
{
    _headImageView = headImageView;
}
-(void)setLogInbtn:(UIButton *)logInbtn
{
    _logInbtn = logInbtn;
}
-(void)setClickBtn:(UIButton *)clickBtn
{
    _clickBtn = clickBtn;
}
/**
 *  控件布局
 */
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    
}
-(void)logIn
{
    if ([self.delegate respondsToSelector:@selector(logInClick)]) {
        [self.delegate logInClick];
        NSLog(@"点了");
    }
}
-(void)dismiss
{
    if ([self.delegate respondsToSelector:@selector(lyComputerLogInViewDidDismissed:)]) {
        [self.delegate lyComputerLogInViewDidDismissed:self];
    }
    CGFloat timeSpan = 1;
    [UIView animateWithDuration:1 animations:^{
        self.frame = CGRectMake(0, self.frame.size.height, self.frame.size.width, self.frame.size.height);
    }];
    [self performSelector:@selector(removeView) withObject:nil afterDelay:timeSpan+.5];
}

-(void)removeView
{
    [self removeFromSuperview];
}

- (void)showInRect:(CGRect)rect withAnimation:(BOOL)animation
{
    self.frame = CGRectMake(0, rect.size.height, rect.size.width, rect.size.height);
    
    //图片位置
    CGFloat imageW = self.frame.size.width/3;
    CGFloat imageH = self.self.frame.size.width/3;
    self.headImageView.frame = CGRectMake(0, 0, imageW, imageH);
    CGPoint imageCenter = CGPointMake(self.frame.size.width/2, self.frame.size.height*.25);
    self.headImageView.center = imageCenter;
    //标题位置
    CGFloat margin = 10;
    CGFloat titleLabelY = self.headImageView.frame.origin.y+imageH+margin*3;
    CGFloat titleLabelW = self.frame.size.width;
    CGFloat titleLabelH = 30;
    self.titleLabel.frame = CGRectMake(0, titleLabelY, titleLabelW, titleLabelH);
    //描述位置
    CGFloat descLabelY = self.titleLabel.frame.origin.y+titleLabelH+margin*.5;
    CGFloat descLabelW = self.frame.size.width;
    CGFloat descLabelH = 30;
    self.descripLabel.frame = CGRectMake(0, descLabelY, descLabelW, descLabelH);
    //登录按钮位置
    CGFloat logInBtnY = self.frame.size.height-self.frame.size.height*.3;
    CGFloat logInBtnW = self.frame.size.width-margin*2;
    CGFloat logInBtnH = 40;
    self.logInbtn.frame = CGRectMake(margin, logInBtnY, logInBtnW, logInBtnH);
    //通用按钮位置
    CGFloat clickBtnY = logInBtnH+self.logInbtn.frame.origin.y+margin;
    CGFloat clickBtnW = self.frame.size.width-margin*2;
    CGFloat clickBtnH = 40;
    self.clickBtn.frame = CGRectMake(margin, clickBtnY, clickBtnW, clickBtnH);
    //是否有动画效果
    if (animation) {
        [UIView animateWithDuration:1 animations:^{
            self.frame = rect;
        }];
    }else
    {
        self.frame = rect;
    }

    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    [window addSubview:self];
}


-(instancetype)initComputerLogInView
{
    if (self = [super init]) {
        
    }
    return self;
}

+(instancetype)computerLogInView
{
    return [[self alloc] initComputerLogInView];
}
@end
