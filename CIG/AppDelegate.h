//
//  AppDelegate.h
//  CIG
//
//  Created by Shawn Norman on 2014-06-10.
//  Copyright (c) 2014 Shawn Norman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MainViewController *masterDetailManager;
@property (strong, nonatomic) UIColor *brandRed;
@property (strong, nonatomic) UIColor *brandBlack;
@property (strong, nonatomic) UIColor *brandWhite;

@end
