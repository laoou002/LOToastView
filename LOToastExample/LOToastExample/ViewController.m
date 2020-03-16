//
//  ViewController.m
//  LOToastExample
//
//  Created by 欧ye on 2020/3/12.
//  Copyright © 2020 老欧. All rights reserved.
//

#import "ViewController.h"
#import "LOToastView/LOToastView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - Action

- (IBAction)showAction:(UIButton *)sender {
    switch (sender.tag) {
        case 1:
            [LOToastView showWithMsg:@"我在中间" showType:LOToastShowTypeCenter];
            break;
        case 2:
            [LOToastView showWithMsg:@"我从下边来" showType:LOToastShowTypeBottom];
            break;
        default:
            [LOToastView showWithMsg:@"我从天上来"];
            break;
    }
}

@end
