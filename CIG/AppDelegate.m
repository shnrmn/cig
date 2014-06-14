//
//  AppDelegate.m
//  CIG
//
//  Created by Shawn Norman on 2014-06-10.
//  Copyright (c) 2014 Shawn Norman. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    _brandRed = [UIColor colorWithRed:239.0/255.0 green:65.0/255.0 blue:53.0/255.0 alpha:1.0];
    _brandBlack = [UIColor colorWithRed:38.0/255.0 green:35.0/255.0 blue:36.0/255.0 alpha:1.0];
    _brandWhite = [UIColor colorWithRed:239.0/255.0 green:233.0/255.0 blue:229.0/255.0 alpha:1.0];
    
    // Navigation bar appearance (background and title)
    [[UINavigationBar appearance] setBarTintColor:_brandRed];
    
    // Navigation bar buttons appearance
    [[UIBarButtonItem appearance] setTintColor:_brandWhite];
    
    [Parse setApplicationId:@"XTZO0ccMXVwnoXHjwYu97Sa2VadIGwcYYAU41ivF"
    clientKey:@"uoYx4URUucwRHo3sjmGsb2KzkguCvVhlHfDkZ7zs"];
    
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPad" bundle:nil];
    
    //UISplitViewController *splitViewController = [[MasterDetailViewController alloc] init];
    UISplitViewController *splitViewController = (UISplitViewController *)self.window.rootViewController;
    
    //UIViewController* detail1 = [storyboard instantiateViewControllerWithIdentifier:@"Training Root"];
    UIViewController* detail1 = [splitViewController.viewControllers objectAtIndex:1];
    UIViewController* detail2 = [storyboard instantiateViewControllerWithIdentifier:@"Suggestions Root"];
    UIViewController* detail3 = [storyboard instantiateViewControllerWithIdentifier:@"Judging Root"];
    UIViewController* detail4 = [storyboard instantiateViewControllerWithIdentifier:@"Notes Root"];
    
    self.masterDetailManager = [[MasterDetailViewController alloc] initWithSplitViewController:splitViewController
                                                                        withDetailRootControllers:[NSArray arrayWithObjects:detail1,detail2,detail3,detail4,nil]];
    
    return YES;
}

							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
