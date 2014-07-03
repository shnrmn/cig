//
//  NotesDetailViewController.m
//  CIG
//
//  Created by Shawn Norman on 2014-06-12.
//  Copyright (c) 2014 Shawn Norman. All rights reserved.
//

#import "NotesDetailViewController.h"
#import "AppDelegate.h"
#import "NSDate+Helper.h"

@interface NotesDetailViewController ()

@end

@implementation NotesDetailViewController

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
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    
    _titleLabel.font = [UIFont fontWithName:@"Gotham-XLight" size:30];
    _titleLabel.textColor = delegate.brandBlack;
    _dateLabel.font = [UIFont fontWithName:@"Gotham-XLight" size:30];
    _dateLabel.textColor = delegate.brandBlack;
    _bodyTextView.delegate = self;
    
    [_bodyTextView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self registerForKeyboardNotifications];
}

- (void) viewWillDisappear:(BOOL)animated
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configureView
{
    // Update the user interface for the detail item.
    if (self.detailItem) {
        [self.navigationController popViewControllerAnimated:YES];
        self.titleTextField.text = self.detailItem.title;
        self.bodyTextView.text = self.detailItem.body;
        self.dateLabel.text = [NSDate stringForDisplayFromDate:self.detailItem.date];
    }
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

- (IBAction)newTitle:(id)sender
{
    self.detailItem.title = self.titleTextField.text;
}

- (void)textViewDidChange:(UITextView *)textView
{
    self.detailItem.body = textView.text;
}

- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidChangeFrame:) name:UIKeyboardDidChangeFrameNotification object:nil];
    
}


-(void)keyboardDidChangeFrame:(NSNotification*)notification
{
    NSDictionary *info = [notification userInfo];
    CGPoint kbOrigin = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].origin;
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    float offset = 0;
    float timerHeight = 154;
    float textTopSpace = self.bodyTextView.frame.origin.y;
    if (self.interfaceOrientation == UIInterfaceOrientationPortrait) {
        offset = kbOrigin.y - timerHeight - textTopSpace;
    }
    else if (self.interfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
        offset = kbOrigin.x - timerHeight - textTopSpace;
    }
    else if (self.interfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        offset = screenSize.width - kbOrigin.x - kbSize.width - timerHeight - textTopSpace;
    }
    else if (self.interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
        offset = screenSize.height - kbOrigin.y - kbSize.height - timerHeight - textTopSpace;
    }
    
    if (offset < 100)
        offset = 100;
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         CGRect frameOffset = self.bodyTextView.frame;
                         frameOffset.size.height = offset;
                         self.bodyTextView.frame = frameOffset;
                     }
     ];
}


@end
