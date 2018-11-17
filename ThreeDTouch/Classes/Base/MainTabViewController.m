//
//  MainTabViewController.m
//  ThreeDTouch
//
//  Created by 仲召俊 on 2018/11/17.
//  Copyright © 2018 zhongzhaojun. All rights reserved.
//

#import "MainTabViewController.h"
#import "BaseNavigationViewController.h"

@interface MainTabViewController ()

@end

@implementation MainTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray *tabArray = @[@{@"className":@"RootViewController",@"title":@"Root"},@{@"className":@"HomeViewController",@"title":@"Home"},@{@"className":@"ProfileViewController",@"title":@"Profile"}];
    [tabArray enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        Class vcFromName = NSClassFromString(obj[@"className"]);
        UIViewController *vc = [[vcFromName alloc] init];
        vc.title = obj[@"title"];
        
        UINavigationController *vcNav = [[BaseNavigationViewController alloc] initWithRootViewController:vc];
        vcNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:vc.title image:[UIImage new] selectedImage:[UIImage new]];
        [self addChildViewController:vcNav];
    }];
}

+ (MainTabViewController *)tabBarWithSelectedIndex:(NSInteger)selectedIndex {
    
    MainTabViewController *mainTabVC = [MainTabViewController new];
    mainTabVC.selectedIndex = selectedIndex;
    return mainTabVC;
}

@end
