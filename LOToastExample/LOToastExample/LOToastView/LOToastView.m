//
//  LOToastView.m
//  LOToastExample
//
//  Created by 欧ye on 2020/3/12.
//  Copyright © 2020 老欧. All rights reserved.
//

#import "LOToastView.h"

@interface LOToastView()

//内容View
@property (nonatomic, strong) UIView *contentView;
//消息label
@property (nonatomic, strong) UILabel *msgLabel;
//提示框动画类型
@property (nonatomic) LOToastShowType showType;
//内容视图初始y轴
@property (nonatomic) CGFloat fromY;

@end

@implementation LOToastView

+ (void)showWithMsg:(NSString *)msg{
    [self showWithMsg:msg showType:LOToastShowTypeTop];
}

+ (void)showWithMsg:(NSString *)msg showType:(LOToastShowType)showType{
    //切回主线程
    dispatch_async(dispatch_get_main_queue(), ^{
        LOToastView *toastView = [[LOToastView alloc] init];
        toastView.showType = showType;
        [toastView setupUI];
        [toastView showWithMsg:msg];
    });
}

//配置UI
- (void)setupUI{
    self.backgroundColor = [UIColor blackColor];
    self.layer.cornerRadius = 6;
    self.userInteractionEnabled = NO;
    
    self.msgLabel = [[UILabel alloc] init];
    self.msgLabel.font = [UIFont systemFontOfSize:13];
    self.msgLabel.textColor = [UIColor whiteColor];
    self.msgLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.msgLabel];
}

/**
 显示提示
 
 @param msg 消息
 */
- (void)showWithMsg:(NSString *)msg{
    self.alpha = 0;
    self.msgLabel.text = msg;
    
    //根据text的font和字符串自动算出size
    CGSize size = [self.msgLabel.text sizeWithAttributes:@{NSFontAttributeName:self.msgLabel.font}];
    self.msgLabel.center = self.center;
    
    //label外边距
    CGFloat labelMargin = 30;
    //最大允许宽度
    CGFloat maxWidth = [UIScreen mainScreen].bounds.size.width-120;
    //label宽度
    CGFloat labelWidth = size.width>maxWidth?maxWidth:size.width;
    //内容视图宽度
    CGFloat width = labelWidth + labelMargin*2;
    //内容视图高度
    CGFloat height = 36;
    
    //初始内容视图y轴位置
    switch (self.showType) {
        case LOToastShowTypeBottom:
            self.fromY = [UIScreen mainScreen].bounds.size.height+100;
            break;
        case LOToastShowTypeCenter:
            self.fromY = ([UIScreen mainScreen].bounds.size.height-height)/2;
            break;
        default:
            self.fromY = -100;
            break;
    }
    
    //目的y轴位置
    CGFloat toY = 0;
    switch (self.showType) {
        case LOToastShowTypeBottom:
            toY = [UIScreen mainScreen].bounds.size.height - 84;
            break;
        case LOToastShowTypeCenter:
            toY = self.fromY;
            break;
        default:
            toY = 64;
            break;
    }
    
    self.frame = CGRectMake(
                            ([UIScreen mainScreen].bounds.size.width-width)/2,
                            self.fromY,
                            width, height);
    self.msgLabel.frame = CGRectMake(labelMargin, 0, labelWidth, self.frame.size.height);
    
    //添加到keyWindow
    UIView *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
    [window bringSubviewToFront:self];
    
    [UIView animateWithDuration:0.8 animations:^{
        self.frame = CGRectMake(self.frame.origin.x,toY,self.frame.size.width, self.frame.size.height);
        
        self.alpha = 1;
    }];
    
    //两秒后自动消失
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self hide];
    });
}

//隐藏
- (void)hide{
    [UIView animateWithDuration:0.8 animations:^{
        self.frame = CGRectMake(self.frame.origin.x,self.fromY,self.frame.size.width, self.frame.size.height);
        
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
