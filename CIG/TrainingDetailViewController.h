//
//  TrainingDetailViewController.h
//  CIG
//
//  Created by Shawn Norman on 2014-06-12.
//  Copyright (c) 2014 Shawn Norman. All rights reserved.
//

#import "DetailViewController.h"
#import "Exercise.h"
#import "AppDelegate.h"

@interface TrainingDetailViewController : DetailViewController

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *headers;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *rulesLabel;
@property (weak, nonatomic) IBOutlet UILabel *objectivesLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentsLabel;
@property (weak, nonatomic) IBOutlet UILabel *variationsLabel;
@property (weak, nonatomic) IBOutlet UILabel *variationsHeader;

@property (strong, nonatomic) Exercise *detailItem;
@property (strong, nonatomic) AppDelegate *delegate;


@end
