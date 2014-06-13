//
//  NotesDetailViewController.m
//  CIG
//
//  Created by Shawn Norman on 2014-06-12.
//  Copyright (c) 2014 Shawn Norman. All rights reserved.
//

#import "NotesDetailViewController.h"

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
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)keyboardWillShow:(NSNotification *)notification
{
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    //Assign new frame to your view
    NSDictionary* info = [notification userInfo];
    CGSize keyboardSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    [self.parentViewController.view setFrame:CGRectMake(0,keyboardSize.height,screenWidth,screenHeight)];
}

-(void)keyboardWillHide:(NSNotification *)notification
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    [self.parentViewController.view setFrame:CGRectMake(0,0,screenWidth,screenHeight)];
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
