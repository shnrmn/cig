//
//  MasterDetailViewController.h
//  CIG
//
//  Created by Shawn Norman on 2014-06-13.
//  Copyright (c) 2014 Shawn Norman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"

@interface MasterDetailViewController : UISplitViewController <UISplitViewControllerDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) UISplitViewController *splitViewController;
@property (strong, nonatomic) NSArray *detailControllers;

@property (strong, nonatomic) NSLayoutConstraint *bottom;
@property (strong, nonatomic) NSLayoutConstraint *trailing;

@property (strong, nonatomic) UIBarButtonItem *masterBarButtonItem;
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
@property (strong, nonatomic) DetailViewController *currentDetailController;
@property (strong, nonatomic) UIViewController *timerView;

-(id)initWithSplitViewController:(UISplitViewController*)splitViewController
       withDetailRootControllers:(NSArray*)detailControllers;

@end
