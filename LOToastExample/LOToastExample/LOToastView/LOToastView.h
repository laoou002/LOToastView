//
//  LOToastView.h
//  LOToastExample
//
//  Created by 欧ye on 2020/3/12.
//  Copyright © 2020 老欧. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LOToastShowType) {
    LOToastShowTypeTop = 0,  //从顶部弹出，默认
    LOToastShowTypeBottom,    //从底部弹出
    LOToastShowTypeCenter    //从中间渐显
};

@interface LOToastView : UIView

/**
 弹出提示框
 
 @param msg 消息
 */
+ (void)showWithMsg:(NSString *)msg;

/**
 弹出提示框
 
 @param msg 消息
 @param showType 弹出动画类型
 */
+ (void)showWithMsg:(NSString *)msg showType:(LOToastShowType)showType;

@end
