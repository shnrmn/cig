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

/*
 NSDate+Helper.h
 Copyright © 2009, 2010, ZETETIC LLC
 All rights reserved.
 
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:
 
 Redistributions of source code must retain the above copyright
 notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright
 notice, this list of conditions and the following disclaimer in the
 documentation and/or other materials provided with the distribution.
 Neither the name of the ZETETIC LLC nor the
 names of its contributors may be used to endorse or promote products
 derived from this software without specific prior written permission.
 
 THIS SOFTWARE IS PROVIDED BY ZETETIC LLC ‘’AS IS’’ AND ANY
 EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 DISCLAIMED. IN NO EVENT SHALL ZETETIC LLC BE LIABLE FOR ANY
 DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

@interface NotesDetailViewController ()

@end

const int timerHeight = 154;
const int minOffset = 100;

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
}

- (BOOL)canBecomeFirstResponder {
    
    return YES;
    
}

- (void) viewDidAppear:(BOOL)animated
{
    [self registerForKeyboardNotifications];
    [self becomeFirstResponder];
}

- (void) viewWillDisappear:(BOOL)animated
{
    [self unregisterForKeyboardNotifications];
    [self resignFirstResponder];
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

// Update the note title when the text field changes.
- (IBAction)newTitle:(id)sender
{
    self.detailItem.title = self.titleTextField.text;
}

// Update the note body when the text view changes.
- (void)textViewDidChange:(UITextView *)textView
{
    self.detailItem.body = textView.text;
}

// Register for keyboard notification to move text view.
-(void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidChangeFrame:) name:UIKeyboardDidChangeFrameNotification object:nil];
    
}

-(void)unregisterForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidChangeFrameNotification object:nil];
}

// Move the text view when the keyboard changes frame.
-(void)keyboardDidChangeFrame:(NSNotification*)notification
{
    NSDictionary *info = [notification userInfo];
    CGPoint kbOrigin = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].origin;
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    float offset = 0;
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
    
    if (offset < minOffset)
        offset = minOffset;
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         CGRect frameOffset = self.bodyTextView.frame;
                         frameOffset.size.height = offset;
                         self.bodyTextView.frame = frameOffset;
                     }
     ];
}


@end
