//
//  AppDelegate.m
//  ThreeDTouch
//
//  Created by 仲召俊 on 2018/11/17.
//  Copyright © 2018 zhongzhaojun. All rights reserved.
//

#import "AppDelegate.h"
#import "MainTabViewController.h"
#import "UIViewController+Category.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [MainTabViewController new];
    [self initShortcutItemsWithApplication:application];
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler  API_AVAILABLE(ios(9.0)){
    
    NSLog(@"itemType===%@",shortcutItem.type);
    
    NSInteger selectedIndex = 0;
    NSString *className = nil;
    
    if ([shortcutItem.type isEqualToString:@"add"]) {//添加
        className = @"AddViewController";
        selectedIndex = 0;
    } else if (([shortcutItem.type isEqualToString:@"search"])) {//搜索
        className = @"SearchViewController";
        selectedIndex = 0;
    } else if (([shortcutItem.type isEqualToString:@"compose"])) {//编辑
        className = @"ComposeViewController";
        selectedIndex = 1;
    } else if (([shortcutItem.type isEqualToString:@"play"])) {//播放
        className = @"PlayViewController";
        selectedIndex = 2;
    }
 
    //传入索引
    MainTabViewController *mainTabVC = [MainTabViewController tabBarWithSelectedIndex:selectedIndex];
    //把控制器设置为根控制器
    self.window.rootViewController = mainTabVC;
    [[self.window.rootViewController topViewController] pushWithVCName:className];
    
    completionHandler(YES);
}

#pragma mark - init ShortcutItems
- (void)initShortcutItemsWithApplication:(UIApplication *)application {
    
    if (@available(iOS 9.0, *)) {
        
        if ([application respondsToSelector:@selector(shortcutItems)]) {
            
            UIApplicationShortcutItem *addItem = [[UIApplicationShortcutItem alloc] initWithType:@"add" localizedTitle:@"这是添加操作" localizedSubtitle:nil icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeAdd] userInfo:nil];
            
            UIApplicationShortcutItem *searchItem = [[UIApplicationShortcutItem alloc] initWithType:@"search" localizedTitle:@"这是搜索操作" localizedSubtitle:nil icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeSearch] userInfo:nil];
            
            UIApplicationShortcutItem *composeItem = [[UIApplicationShortcutItem alloc] initWithType:@"compose" localizedTitle:@"这是编辑操作" localizedSubtitle:nil icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeCompose] userInfo:nil];
            
            UIApplicationShortcutItem *playItem = [[UIApplicationShortcutItem alloc] initWithType:@"play" localizedTitle:@"这是播放操作" localizedSubtitle:nil icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypePlay] userInfo:nil];
            
            application.shortcutItems = @[addItem, searchItem, composeItem, playItem];
            
        }
        
    } else {
        // Fallback on earlier versions
    }
    
}

@end
