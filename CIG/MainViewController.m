//
//  MainViewController.m
//  CIG
//
//  Created by Shawn Norman on 2014-06-12.
//  Copyright (c) 2014 Shawn Norman. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController

-(id)initWithSplitViewController:(UISplitViewController*)splitViewController withDetailRootControllers:(NSArray*)detailControllers
{
    self = [super init];
    if(self){
        _splitViewController = splitViewController;
        _detailControllers = [detailControllers copy];
        UINavigationController* detailRoot = [splitViewController.viewControllers objectAtIndex:1];
        _currentDetailController = detailRoot.topViewController;
        
        splitViewController.delegate = self;
        UITabBarController* tabBar = [splitViewController.viewControllers objectAtIndex:0];
        tabBar.delegate = self;
    }
    
    return self;
}

/* forward the message to the current detail view
 */
-(void)splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)pc
{
    self.masterBarButtonItem = barButtonItem;
    self.masterPopoverController = pc;
    
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    
    [self.currentDetailController.navigationItem setLeftBarButtonItem:self.masterBarButtonItem animated:YES];
}

/* forward the message to the current detail view
 * all detail views must implement UISplitViewControllerDelegate
 */
-(void)splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    self.masterBarButtonItem = nil;
    self.masterPopoverController = nil;
    
    [self.currentDetailController.navigationItem setLeftBarButtonItem:nil animated:YES];
    
}

// change detail view to reflect the current master controller
-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    UINavigationController* detailRootController = [self.detailControllers objectAtIndex:tabBarController.selectedIndex];
    UIViewController* detailControler = detailRootController.topViewController;
    
    if(detailControler != self.currentDetailController)
    {
        [self.currentDetailController.navigationItem setLeftBarButtonItem:nil animated:NO];
        self.currentDetailController = detailControler;
        
        UIViewController* tabBarController = [self.splitViewController.viewControllers objectAtIndex:0];
        
        self.splitViewController.viewControllers = [NSArray arrayWithObjects:tabBarController,detailRootController, nil];
        
        // replace the passthrough views with current detail navigationbar
        if([self.masterPopoverController isPopoverVisible]){
            self.masterPopoverController.passthroughViews = [NSArray arrayWithObject:detailRootController.navigationBar];
        }
    }
}

@end
