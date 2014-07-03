//
//  TrainingDetailViewController.m
//  CIG
//
//  Created by Shawn Norman on 2014-06-12.
//  Copyright (c) 2014 Shawn Norman. All rights reserved.
//

#import "TrainingDetailViewController.h"

@interface TrainingDetailViewController ()

@end

@implementation TrainingDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _delegate = [[UIApplication sharedApplication] delegate];
    _delegate.masterDetailManager.delegate = self;
    _titleLabel.textColor = _delegate.brandBlack;
    _descriptionLabel.textColor = _delegate.brandBlack;
    _titleLabel.font = [UIFont fontWithName:@"Gotham-XLight" size:30];
    _rulesLabel.textColor = _delegate.brandBlack;
    _objectivesLabel.textColor = _delegate.brandBlack;
    _commentsLabel.textColor = _delegate.brandBlack;
    _variationsLabel.textColor = _delegate.brandBlack;
    
    [self.splitViewController.view setNeedsLayout];
}

- (void)configureView
{
    // Update the user interface for the detail item.
    if (self.detailItem) {
        [super.navigationController popViewControllerAnimated:YES];
        self.titleLabel.text = self.detailItem.title;
        self.descriptionLabel.text = self.detailItem.subtitle;
        self.rulesLabel.text = self.detailItem.rules;
        self.objectivesLabel.text = self.detailItem.objectives;
        self.commentsLabel.text = self.detailItem.comments;
        self.variationsLabel.text = self.detailItem.variations;
        for (UILabel *header in self.headers)
        {
            header.font = [UIFont fontWithName:@"Gotham-XLight" size:20];
            header.textColor = _delegate.brandBlack;
        }
        if ([self.detailItem.variations length] == 0) {
            [self.variationsHeader setHidden:YES];
        }
        else
        {
            [self.variationsHeader setHidden:NO];
        }
        
        if (self.masterPopoverController != nil) {
            [self.masterPopoverController dismissPopoverAnimated:YES];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
