//
//  TimerViewController.h
//  CIG
//
//  Created by Shawn Norman on 2014-06-12.
//  Copyright (c) 2014 Shawn Norman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface TimerViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *progress;
@property (strong, nonatomic) IBOutlet UIStepper *minuteStepper;
@property (strong, nonatomic) IBOutlet UIStepper *secondStepper;
@property (strong, nonatomic) NSTimer *timer;
@property (nonatomic) int currentMinutes;
@property (nonatomic) int currentSeconds;

-(IBAction)start:(id)sender;
-(IBAction)stop:(id)sender;
-(IBAction)reset:(id)sender;
-(IBAction)minuteValueChanged:(UIStepper *)sender;
-(IBAction)secondValueChanged:(UIStepper *)sender;

-(void)setTimeText;

@end
