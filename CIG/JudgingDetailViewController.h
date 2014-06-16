//
//  JudgingDetailViewController.h
//  CIG
//
//  Created by Shawn Norman on 2014-06-12.
//  Copyright (c) 2014 Shawn Norman. All rights reserved.
//

#import "DetailViewController.h"
#import "AppDelegate.h"

@interface JudgingDetailViewController : DetailViewController

@property (weak, nonatomic) IBOutlet UILabel *eventLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *makingOffers;
@property (weak, nonatomic) IBOutlet UISegmentedControl *acceptingOffers;
@property (weak, nonatomic) IBOutlet UISegmentedControl *advancing;
@property (weak, nonatomic) IBOutlet UISegmentedControl *listening;
@property (weak, nonatomic) IBOutlet UISegmentedControl *commitment;
@property (weak, nonatomic) IBOutlet UISegmentedControl *stakes;
@property (weak, nonatomic) IBOutlet UISegmentedControl *staging;
@property (weak, nonatomic) IBOutlet UISegmentedControl *skill;
@property (weak, nonatomic) IBOutlet UISegmentedControl *suggestion;
@property (weak, nonatomic) IBOutlet UISegmentedControl *interest;
@property (weak, nonatomic) IBOutlet UISegmentedControl *risk;
@property (nonatomic,strong) UIPopoverController *popOver;
@property (strong, nonatomic) AppDelegate *delegate;

- (IBAction)totalChanged:(id)sender;
- (IBAction)makingInfo:(id)sender;
- (IBAction)acceptingInfo:(id)sender;
- (IBAction)advancingInfo:(id)sender;
- (IBAction)listeningInfo:(id)sender;
- (IBAction)commitmentInfo:(id)sender;
- (IBAction)stakesInfo:(id)sender;
- (IBAction)stagingInfo:(id)sender;
- (IBAction)skillInfo:(id)sender;
- (IBAction)suggestionInfo:(id)sender;
- (IBAction)interestInfo:(id)sender;
- (IBAction)riskInfo:(id)sender;





















@end
