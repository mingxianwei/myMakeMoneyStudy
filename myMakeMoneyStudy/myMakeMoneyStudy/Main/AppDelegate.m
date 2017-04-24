//
//  AppDelegate.m
//  myMakeMoneyStudy
//
//  Created by 明先伟 on 16/6/18.
//  Copyright © 2016年 Miricle. All rights reserved.
//

#import "AppDelegate.h"
#import "LanchAdView.h"
#import "MXWAdviewController.h"
#import "SVModalWebViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [self.window makeKeyAndVisible]; // 这句话不可以掉 不然一直显示不正确
    __weak typeof (self) WeakeSelf = self;
    [[[LanchAdView alloc] init] showDuration:3 completionBlock:^(NSString *urlString) {
        [WeakeSelf jumpToAdViewController:urlString];
    }];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)jumpToAdViewController:(NSString *)url{
    // 获取到navVC
//    UIViewController * viewController = self.window.rootViewController;
//    SVModalWebViewController * vc = [[SVModalWebViewController alloc] initWithAddress:url];
//    [viewController presentViewController:vc animated:YES completion:nil];
    
    MXWAdviewController * viewVC = [[MXWAdviewController alloc] initWithUrlString:url];
    UIViewController * viewController = self.window.rootViewController;
    UINavigationController * navigation = [[UINavigationController alloc] initWithRootViewController:viewVC];
    [viewController presentViewController:navigation animated:YES completion:nil];
    
    
    
}

@end
