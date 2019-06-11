//
//  AppDelegate.m
//  Project_Demo_OC
//
//  Created by wanglei on 2019/5/31.
//  Copyright © 2019 PURANG. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]init];
    self.window.frame = [UIScreen mainScreen].bounds;
    [self.window makeKeyAndVisible];
    
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[ViewController new]];
    self.window.rootViewController = nav;
    
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



#pragma mark - NSNotificationCenter

- (void)pushLoginNotification:(NSNotification *)notification{
    [self presentLogin];
}

- (void)pushLoginAlertNotification:(NSNotification *)notification{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"您还未登录，点击确定去登录" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self presentLogin];
    }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    
    [[self topmostViewController] presentViewController:alertController animated:YES completion:^{
    }];
}

#pragma mark - action

- (void)presentLogin {
    
    [MBProgressHUD showText:@"请到AppDelegate补全登录"];
    
    //艳阳天登录
    /*
    UIViewController *logingVC = [PRGetModuleInstance(BSSPersonComponentModuleProtocol) fetchLoginControllerWithStatusBlock:^(NSInteger loginResult) {
    }];
    logingVC.hidesBottomBarWhenPushed = YES;
    BSSBaseNavigationController *nav = [[BSSBaseNavigationController alloc] initWithRootViewController:logingVC];
    [self presentViewController:nav animated:YES completion:nil];
     */
}

- (UIViewController *)topmostViewController {
    //rootViewController需要是TabBarController,排除正在显示FirstPage的情况
    UIViewController *rootViewContoller = [UIApplication sharedApplication].delegate.window.rootViewController;
    if (!rootViewContoller || (![rootViewContoller isKindOfClass:[UITabBarController class]] && ![rootViewContoller isKindOfClass:[UINavigationController class]])) {
        return nil;
    }
    
    //当前显示哪个tab页
    UINavigationController *rootNavController = nil;
    if([rootViewContoller isKindOfClass:[UITabBarController class]]){
        rootNavController = (UINavigationController *) [(UITabBarController*)rootViewContoller selectedViewController];
    }else if([rootViewContoller isKindOfClass:[UINavigationController class]]){
        rootNavController = (UINavigationController *)rootViewContoller;
    } else {
        return rootViewContoller;
    }
    
    if (!rootNavController) {
        return nil;
    }
    
    UINavigationController *navController = rootNavController;
    while ([navController isKindOfClass:[UINavigationController class]]) {
        UIViewController *topViewController = [navController topViewController];
        if ([topViewController isKindOfClass:[UINavigationController class]]) { //顶层是个导航控制器，继续循环
            navController = (UINavigationController *) topViewController;
        } else {
            //是否有弹出presentViewControllr;
            UIViewController *presentedViewController = topViewController.presentedViewController;
            while (presentedViewController) {
                topViewController = presentedViewController;
                if ([topViewController isKindOfClass:[UINavigationController class]]) {
                    break;
                } else {
                    presentedViewController = topViewController.presentedViewController;
                }
            }
            navController = (UINavigationController *) topViewController;
        }
    }
    return (UIViewController *) navController;
}



@end
