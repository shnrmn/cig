//
//  JudgingDetailViewController.h
//  CIG
//
//  Created by Shawn Norman on 2014-06-12.
//  Copyright (c) 2014 Shawn Norman. All rights reserved.
//

#import "DetailViewController.h"
#import "JudgingPopoverViewController.h"
#import "AppDelegate.h"

@interface JudgingDetailViewController : DetailViewController <JudgingPopoverDelegate>

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
@property (strong, nonatomic) NSString *detailItem;


- (IBAction)totalChanged:(id)sender;
- (IBAction)makingInfo:(UIButton *)sender;
- (IBAction)acceptingInfo:(UIButton *)sender;
- (IBAction)advancingInfo:(UIButton *)sender;
- (IBAction)listeningInfo:(UIButton *)sender;
- (IBAction)commitmentInfo:(UIButton *)sender;
- (IBAction)stakesInfo:(UIButton *)sender;
- (IBAction)stagingInfo:(UIButton *)sender;
- (IBAction)skillInfo:(UIButton *)sender;
- (IBAction)suggestionInfo:(UIButton *)sender;
- (IBAction)interestInfo:(UIButton *)sender;
- (IBAction)riskInfo:(UIButton *)sender;





















@end
