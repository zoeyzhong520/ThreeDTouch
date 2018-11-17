//
//  MainTabViewController.h
//  ThreeDTouch
//
//  Created by 仲召俊 on 2018/11/17.
//  Copyright © 2018 zhongzhaojun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainTabViewController : UITabBarController

+ (MainTabViewController *)tabBarWithSelectedIndex:(NSInteger)selectedIndex;

@end

NS_ASSUME_NONNULL_END
