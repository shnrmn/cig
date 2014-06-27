//
//  JudgingPopoverViewController.h
//  CIG
//
//  Created by Shawn Norman on 2014-06-25.
//  Copyright (c) 2014 Shawn Norman. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JudgingPopoverDelegate <NSObject>

@end

@interface JudgingPopoverViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *info;
@property (weak, nonatomic) IBOutlet UINavigationItem *skillTitle;
@property (weak, nonatomic) IBOutlet UINavigationBar *navbar;
@property (nonatomic, weak) id <JudgingPopoverDelegate> popoverDelegate;

@end
