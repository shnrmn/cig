//
//  JudgingDetailViewController.m
//  CIG
//
//  Created by Shawn Norman on 2014-06-12.
//  Copyright (c) 2014 Shawn Norman. All rights reserved.
//

#import "JudgingDetailViewController.h"

@interface JudgingDetailViewController ()

@end

@implementation JudgingDetailViewController

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
    _eventLabel.textColor = _delegate.brandBlack;
    _totalLabel.textColor = _delegate.brandBlack;
    _totalNumberLabel.textColor = _delegate.brandBlack;
    _eventLabel.font = [UIFont fontWithName:@"Gotham-XLight" size:30];
    _totalLabel.font = [UIFont fontWithName:@"Gotham-XLight" size:30];
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

- (IBAction)totalChanged:(id)sender
{
    long total = _makingOffers.selectedSegmentIndex + _acceptingOffers.selectedSegmentIndex + _advancing.selectedSegmentIndex + _listening.selectedSegmentIndex + _commitment.selectedSegmentIndex + _stakes.selectedSegmentIndex + _staging.selectedSegmentIndex + _skill.selectedSegmentIndex + _suggestion.selectedSegmentIndex + _interest.selectedSegmentIndex + _risk.selectedSegmentIndex + 11;
    
    
    _totalNumberLabel.text = [NSString stringWithFormat:@"%ld", total];
}

- (IBAction)makingInfo:(id)sender
{
    
}

- (IBAction)acceptingInfo:(id)sender {
//    UIViewController *infoController = [[UIViewController alloc] init];
//    UITextView *infoText = [[UITextView alloc] init];
//    infoText.text = @"Accepting Offers";
//    [infoController.view addSubview:infoText];
//    
//    UIPopoverController *popoverView = [[UIPopoverController alloc] init];
//     self.popOver =[[UIPopoverController alloc] initWithContentViewController:popoverView];
//     [self.popOver presentPopoverFromRect:sender.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];

}

- (IBAction)advancingInfo:(id)sender {
}

- (IBAction)listeningInfo:(id)sender {
}

- (IBAction)commitmentInfo:(id)sender {
}

- (IBAction)stakesInfo:(id)sender {
}

- (IBAction)stagingInfo:(id)sender {
}

- (IBAction)skillInfo:(id)sender {
}

- (IBAction)suggestionInfo:(id)sender {
}

- (IBAction)interestInfo:(id)sender {
}

- (IBAction)riskInfo:(id)sender {
}

@end
