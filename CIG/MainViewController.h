//
//  MainViewController.h
//  CIG
//
//  Created by Shawn Norman on 2014-06-12.
//  Copyright (c) 2014 Shawn Norman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainViewController : NSObject <UISplitViewControllerDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) UISplitViewController *splitViewController;
@property (strong, nonatomic) NSArray *detailControllers;
@property (strong, nonatomic) UIBarButtonItem *masterBarButtonItem;
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
@property (strong, nonatomic) UIViewController *currentDetailController;

-(id)initWithSplitViewController:(UISplitViewController*)splitViewController
       withDetailRootControllers:(NSArray*)detailControllers;

@end
