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

// Keeps a tab of the total value of the criteria segemented controls.
- (IBAction)totalChanged:(id)sender
{
    long total = _makingOffers.selectedSegmentIndex + _acceptingOffers.selectedSegmentIndex + _advancing.selectedSegmentIndex + _listening.selectedSegmentIndex + _commitment.selectedSegmentIndex + _stakes.selectedSegmentIndex + _staging.selectedSegmentIndex + _skill.selectedSegmentIndex + _suggestion.selectedSegmentIndex + _interest.selectedSegmentIndex + _risk.selectedSegmentIndex + 11;
    
    
    _totalNumberLabel.text = [NSString stringWithFormat:@"%ld", total];
}

// The next series of methods are used to populate the popover with the proper information.
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
    [self showPopover:@"Listening info." withTitle:@"LISTENING" withSender:sender];
}

- (IBAction)commitmentInfo:(UIButton *)sender {
    [self showPopover:@"Commitment info." withTitle:@"COMMITMENT" withSender:sender];
}

- (IBAction)stakesInfo:(UIButton *)sender {
    [self showPopover:@"Stakes info." withTitle:@"STAKES" withSender:sender];
}

- (IBAction)stagingInfo:(UIButton *)sender {
    [self showPopover:@"Staging info." withTitle:@"STAGING" withSender:sender];
}

- (IBAction)skillInfo:(UIButton *)sender {
    if ([self.detailItem isEqualToString:(@"Story")])
    {
        [self showPopover:@"Does the team effectively use narration to tell an orginial story with a beginning, middle and end? Do they transition smoothly through the elements of the story? Is there a clear platform used throughout the scene? Is there an organic ending?" withTitle:@"STORY" withSender:sender];
    }
    else if ([self.detailItem isEqualToString:(@"Character")])
    {
        [self showPopover:@"Does the team present and orginal character through speech, physicality and action? Do they explore different aspects of that character while keeping consistent? Does that character have motivations consistent with the story and the ability to be altered?" withTitle:@"CHARACTER" withSender:sender];
    }
    else if ([self.detailItem isEqualToString:(@"Style")])
    {
        [self showPopover:@"Does the team explore recognizable elements of a genre, capturing archetypal characters, physicality and/or mood or atmosphere? Does the team use an effective format to portray these elements? Does the team present a reasonable recreation of the style while allowing the content to be variable?" withTitle:@"STYLE" withSender:sender];
    }
    else if ([self.detailItem isEqualToString:(@"Theme")])
    {
        [self showPopover:@"Does the team explore and expand upon different aspects of the theme from a variety of perspectives? Do they present these explorations in a variety of ways? Does the team use natural transitions and explore the team's unique perspective on the theme?" withTitle:@"THEME" withSender:sender];
    }
    else if ([self.detailItem isEqualToString:(@"Life")])
    {
        [self showPopover:@"Does the team perform a sincere and honest exploration of a moment or moments in life? Does the team employ an appropriate amount of creative energy? Does the team find a balance between sad/intense moments and humour?" withTitle:@"LIFE" withSender:sender];
    }
    else if ([self.detailItem isEqualToString:(@"Open")])
    {
        [self showPopover:@"Does the team perform a scene using the five elements of the basic story structure? Is there a clear setting? Characters? Problem or conflict? Stakes? Solution? Does the team perform the scene without any added games or structure?" withTitle:@"OPEN" withSender:sender];
    }
}

- (IBAction)suggestionInfo:(UIButton *)sender {
    [self showPopover:@"Suggestion info." withTitle:@"USE OF SUGGESTION" withSender:sender];
}

- (IBAction)interestInfo:(UIButton *)sender {
    [self showPopover:@"Interest info." withTitle:@"INTEREST" withSender:sender];
}

- (IBAction)riskInfo:(UIButton *)sender {
    [self showPopover:@"Risk info." withTitle:@"RISK" withSender:sender];
}

// Display a popover with criteria information.
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
