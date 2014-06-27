//
//  MasterDetailViewController.m
//  CIG
//
//  Created by Shawn Norman on 2014-06-13.
//  Copyright (c) 2014 Shawn Norman. All rights reserved.
//

#import "MasterDetailViewController.h"

@interface MasterDetailViewController ()

@end

@implementation MasterDetailViewController

-(void)viewDidLoad
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPad" bundle:nil];
    _timerView = [storyboard instantiateViewControllerWithIdentifier:@"Timer View"];
    _timerView.view.frame = CGRectMake(0, 852, 720, 134);
    _timerView.view.translatesAutoresizingMaskIntoConstraints = NO;
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_timerView.view];
    
    [self registerForKeyboardNotifications];
    [self updateViewConstraints];
}

- (void)updateViewConstraints
{
    [super updateViewConstraints];
    
    _bottom = [NSLayoutConstraint constraintWithItem:_timerView.view
                                           attribute:NSLayoutAttributeBottom
                                           relatedBy:NSLayoutRelationEqual
                                              toItem:self.view
                                           attribute:NSLayoutAttributeBottom
                                          multiplier:1.0
                                            constant:0.0];
    
    _trailing = [NSLayoutConstraint constraintWithItem:_timerView.view
                                             attribute:NSLayoutAttributeTrailing
                                             relatedBy:NSLayoutRelationEqual
                                                toItem:self.view
                                             attribute:NSLayoutAttributeTrailing
                                            multiplier:1.0
                                              constant:30.0];
    
    [self.view addConstraint:_bottom];
    [self.view addConstraint:_trailing];

}

-(id)initWithSplitViewController:(UISplitViewController*)splitViewController withDetailRootControllers:(NSArray*)detailControllers
{
    
    self = [super init];
    if(self){
        _splitViewController = splitViewController;
        _detailControllers = [detailControllers copy];
        UINavigationController* detailRoot = [splitViewController.viewControllers objectAtIndex:1];
        _currentDetailController = detailRoot.topViewController;
        
        splitViewController.delegate = self;
        UITabBarController* tabBar = [splitViewController.viewControllers objectAtIndex:0];
        tabBar.delegate = self;
        
    }

    
    return self;
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
    float timerOffset = 0;
    float minOffset = 284;
    if (self.interfaceOrientation == UIInterfaceOrientationPortrait) {
        offset = kbOrigin.y;
        timerOffset = offset - 134;
    }
    else if (self.interfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
        offset = kbOrigin.x;
        timerOffset = offset - 134;
    }
    else if (self.interfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        offset -= kbOrigin.x - screenSize.width + kbSize.width;
        timerOffset = (offset - 134);
    }
    else if (self.interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
        offset -= kbOrigin.y - screenSize.height + kbSize.height;
        timerOffset = (offset - 134);
    }
    
    if (timerOffset < minOffset) {
        timerOffset = minOffset;
    }
    [UIView animateWithDuration:0.3
                     animations:^{
                         CGRect frameOffset = self.timerView.view.frame;
                         frameOffset.origin.y = timerOffset;
                         self.timerView.view.frame = frameOffset;
                     }
     ];
}

/* forward the message to the current detail view
 */
-(void)splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)pc
{
    self.masterBarButtonItem = barButtonItem;
    self.masterPopoverController = pc;
    
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    
    [self.currentDetailController.navigationItem setLeftBarButtonItem:self.masterBarButtonItem animated:YES];
}

/* forward the message to the current detail view
 * all detail views must implement UISplitViewControllerDelegate
 */
-(void)splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    self.masterBarButtonItem = nil;
    self.masterPopoverController = nil;
    
    [self.currentDetailController.navigationItem setLeftBarButtonItem:nil animated:YES];
    
}

// change detail view to reflect the current master controller
-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    UINavigationController* detailRootController = [self.detailControllers objectAtIndex:tabBarController.selectedIndex];
    UIViewController* detailControler = detailRootController.topViewController;
    
    if(detailControler != self.currentDetailController)
    {
        [self.currentDetailController.navigationItem setLeftBarButtonItem:nil animated:NO];
        self.currentDetailController = detailControler;
        
        UIViewController* tabBarController = [self.splitViewController.viewControllers objectAtIndex:0];
        
        self.splitViewController.viewControllers = [NSArray arrayWithObjects:tabBarController,detailRootController, nil];
        
        // replace the passthrough views with current detail navigationbar
        if([self.masterPopoverController isPopoverVisible]){
            self.masterPopoverController.passthroughViews = [NSArray arrayWithObject:detailRootController.navigationBar];
        }
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

@end
