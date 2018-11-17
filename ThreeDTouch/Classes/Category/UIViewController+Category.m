//
//  UIViewController+Category.m
//  ThreeDTouch
//
//  Created by 仲召俊 on 2018/11/17.
//  Copyright © 2018 zhongzhaojun. All rights reserved.
//

#import "UIViewController+Category.h"

@implementation UIViewController (Category)

- (void)pushWithVCName:(NSString *)vcName andParamDic:(NSDictionary *)paramDic {
    
    if (!vcName || !vcName.length) {
        return;
    }
    
    Class vcFromName = NSClassFromString(vcName);
    UIViewController *vc = [[vcFromName alloc] init];
    
    [paramDic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if (paramDic && paramDic.count > 0) {
            if ([vc respondsToSelector:NSSelectorFromString(key)]) {
                [vc setValue:obj forKey:key];
            }
        }
    }];
    
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)pushWithVCName:(NSString *)vcName {
    
    [self pushWithVCName:vcName andParamDic:[NSDictionary dictionary]];
}

- (UIViewController *)topViewControllerWithRootViewController:(UIViewController *)rootViewController {
    
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabBarController = (UITabBarController *)rootViewController;
        return [self topViewControllerWithRootViewController:tabBarController.selectedViewController];
    } else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = (UINavigationController *)rootViewController;
        return [self topViewControllerWithRootViewController:navigationController.visibleViewController];
    } else if (rootViewController.presentedViewController) {
        UIViewController *presentedViewController = rootViewController.presentedViewController;
        return [self topViewControllerWithRootViewController:presentedViewController];
    } else {
        return rootViewController;
    }
}

- (UIViewController *)topViewController {
    
    return [self topViewControllerWithRootViewController:self];
}

@end
