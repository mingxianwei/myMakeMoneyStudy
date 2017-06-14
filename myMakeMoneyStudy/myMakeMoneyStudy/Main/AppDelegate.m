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
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}



- (void)jumpToAdViewController:(NSString *)url{
    MXWAdviewController * viewVC = [[MXWAdviewController alloc] initWithUrlString:url];
    UIViewController * viewController = self.window.rootViewController;
    UINavigationController * navigation = [[UINavigationController alloc] initWithRootViewController:viewVC];
    [viewController presentViewController:navigation animated:YES completion:nil];
}

@end
