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
    _delegate.masterDetailManager.delegate = self;
    _eventLabel.textColor = _delegate.brandBlack;
    _totalLabel.textColor = _delegate.brandBlack;
    _totalNumberLabel.textColor = _delegate.brandBlack;
    _eventLabel.font = [UIFont fontWithName:@"Gotham-XLight" size:30];
    _totalLabel.font = [UIFont fontWithName:@"Gotham-XLight" size:30];
}

- (void)configureView
{
    // Update the user interface for the detail item.
    if (self.detailItem) {
        [self.navigationController popViewControllerAnimated:YES];            
        self.eventLabel.text = [self.detailItem description];
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

- (IBAction)totalChanged:(id)sender
{
    long total = _makingOffers.selectedSegmentIndex + _acceptingOffers.selectedSegmentIndex + _advancing.selectedSegmentIndex + _listening.selectedSegmentIndex + _commitment.selectedSegmentIndex + _stakes.selectedSegmentIndex + _staging.selectedSegmentIndex + _skill.selectedSegmentIndex + _suggestion.selectedSegmentIndex + _interest.selectedSegmentIndex + _risk.selectedSegmentIndex + 11;
    
    
    _totalNumberLabel.text = [NSString stringWithFormat:@"%ld", total];
}

- (IBAction)makingInfo:(UIButton *)sender
{
    [self showPopover:@"Are players presenting new information to the scene, flowing freely without hesitation? Are they creating opportunities for revelation. Are they endowing and making offers that are specific and detailed?" withTitle:@"MAKING OFFERS" withSender:sender];
}

- (IBAction)acceptingInfo:(UIButton *)sender
{
    [self showPopover:@"Are players showing agreement and adding imformation? Are they being affected and acting on opportunities set up by the other players? Are offers being heightened, made important and justified into the context of the scene?" withTitle:@"ACCEPTING OFFERS" withSender:sender];
}

- (IBAction)advancingInfo:(UIButton *)sender {
    [self showPopover:@"Are the circumstances of the scene changing? Are players taking action while allowing an appropriate amount of expansion? Do the events of the scene follow a logical of narrative cause & effect, building at an appropriate pace to a natural ending?" withTitle:@"ADVANCING" withSender:sender];
}

- (IBAction)listeningInfo:(UIButton *)sender {
}

- (IBAction)commitmentInfo:(UIButton *)sender {
}

- (IBAction)stakesInfo:(UIButton *)sender {
}

- (IBAction)stagingInfo:(UIButton *)sender {
}

- (IBAction)skillInfo:(UIButton *)sender {
}

- (IBAction)suggestionInfo:(UIButton *)sender {
}

- (IBAction)interestInfo:(UIButton *)sender {
}

- (IBAction)riskInfo:(UIButton *)sender {
}

- (void)showPopover:(NSString *)info withTitle: (NSString *) title withSender:(UIButton *)sender
{
    JudgingPopoverViewController *popoverView =[self.storyboard instantiateViewControllerWithIdentifier:@"Judging Info"];
    popoverView.popoverDelegate = self;
    self.popOver = [[UIPopoverController alloc] initWithContentViewController:popoverView];
    popoverView.info.text = info;
    popoverView.skillTitle.title = title;
    [popoverView.navbar setTitleVerticalPositionAdjustment:6.0 forBarMetrics:UIBarMetricsDefault];
    self.popOver.backgroundColor = _delegate.brandWhite;
    [self.popOver presentPopoverFromRect:[sender bounds] inView:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

@end
