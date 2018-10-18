//
//  AppDelegate.m
//  CustomContainerViewController
//
//  Created by niekang on 2018/10/16.
//  Copyright © 2018 xiangshang360. All rights reserved.
//

#import "AppDelegate.h"
#import "CustomContainerViewController.h"
#import "ViewController.h"

@interface AppDelegate ()


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    UIViewController *first = [[ViewController alloc] init];
    first.title = @"first";
    first.view.backgroundColor = [UIColor colorWithRed:0.4 green:0.8 blue:1 alpha:1];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:first];
    
    UIViewController *second = [[ViewController alloc] init];
    second.title = @"second";
    second.view.backgroundColor = [UIColor colorWithRed:0.1 green:0.4 blue:0.8 alpha:1];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:second];

    UIViewController *third = [[ViewController alloc] init];
    third.title = @"third";
    third.view.backgroundColor = [UIColor colorWithRed:0.3 green:0.8 blue:0.4 alpha:1];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:third];

    UIViewController *forth = [[ViewController alloc] init];
    forth.title = @"forth";
    forth.view.backgroundColor = [UIColor colorWithRed:0.5 green:0.4 blue:0.5 alpha:1];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:forth];

    UIViewController *root = [[CustomContainerViewController alloc] initWithViewControllers:@[nav1, nav2, nav3, nav4]];
    root.title = @"custom";
    self.window.rootViewController = root;
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


@end
