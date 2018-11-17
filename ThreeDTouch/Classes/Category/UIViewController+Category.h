//
//  UIViewController+Category.h
//  ThreeDTouch
//
//  Created by 仲召俊 on 2018/11/17.
//  Copyright © 2018 zhongzhaojun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Category)

- (void)pushWithVCName:(NSString *)vcName andParamDic:(NSDictionary *)paramDic;

- (void)pushWithVCName:(NSString *)vcName;

- (UIViewController*)topViewControllerWithRootViewController:(UIViewController*)rootViewController;

- (UIViewController *)topViewController;

@end

NS_ASSUME_NONNULL_END
