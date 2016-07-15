//
//  LYComputerLogInView.h
//  ZYZSSCAN
//
//  Created by 李洋 on 16/7/15.
//  Copyright © 2016年 zyzs. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LYComputerLogInView;
@protocol LYComputerLogInViewDelegate <NSObject>

@optional
//登陆代理事件
- (void)logInClick;
//退出点击事件
- (void)lyComputerLogInViewDidDismissed:(LYComputerLogInView *)computerLogInView;

@end

@interface LYComputerLogInView : UIView
/**
 *  图片
 */
@property (nonatomic,strong,readonly)UIImageView *headImageView;
/**
 *  标题
 */
@property (nonatomic,strong,readonly)UILabel *titleLabel;
/**
 *  描述
 */
@property (nonatomic,strong,readonly)UILabel *descripLabel;
/**
 *  登录按钮
 */
@property (nonatomic,strong,readonly)UIButton *logInbtn;
/**
 *  取消或者重新扫描按钮
 */
@property (nonatomic,strong,readonly)UIButton *clickBtn;


@property (nonatomic,weak)id <LYComputerLogInViewDelegate>delegate;
/**
 *  显示方法
 *
 *  @param rect 传尺寸
 */
- (void)showInRect:(CGRect)rect withAnimation:(BOOL)animation;
/**
 *  消失方法
 */
- (void)dismiss;
/**
 *  类方法
 *
 *  @return computerView
 */
+(instancetype)computerLogInView;
/**
 *  初始化方法
 *
 *  @return computerView
 */
-(instancetype)initComputerLogInView;
@end
