//
//  RootViewController.m
//  ThreeDTouch
//
//  Created by 仲召俊 on 2018/11/17.
//  Copyright © 2018 zhongzhaojun. All rights reserved.
//

#import "RootViewController.h"

#define SELF_WIDTH [UIScreen mainScreen].bounds.size.width
#define SELF_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Root";
    
    [self initButtons];
}

- (void)initButtons {
    
    NSArray *btnNames = @[@"添加",@"搜索",@"编辑",@"播放",@"预览与跳转"];
    for (int i = 0; i < btnNames.count; i ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [btn setTitle:btnNames[i] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i;
        btn.frame = CGRectMake(0, i*(40+20)+200, SELF_WIDTH, 40);
        [self.view addSubview:btn];
        
        if (i == btnNames.count - 1) {
            btn.backgroundColor = [UIColor lightGrayColor];
        }
    }
}

- (void)btnClick:(UIButton *)button {
    
    NSLog(@"%@",button.titleLabel.text);
    
    switch (button.tag) {
        case 0:
            [self pushWithVCName:@"AddViewController"];
            break;
        case 1:
            [self pushWithVCName:@"SearchViewController"];
            break;
        case 2:
            [self pushWithVCName:@"ComposeViewController"];
            break;
        case 3:
            [self pushWithVCName:@"PlayViewController"];
            break;
        case 4:
            [self pushWithVCName:@"PreviewViewController"];
            break;
        default:
            break;
    }
}

@end
