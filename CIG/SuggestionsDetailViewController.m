//
//  SuggestionsDetailViewController.m
//  CIG
//
//  Created by Shawn Norman on 2014-06-12.
//  Copyright (c) 2014 Shawn Norman. All rights reserved.
//

#import "SuggestionsDetailViewController.h"

@interface SuggestionsDetailViewController ()

@end

@implementation SuggestionsDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (BOOL)canBecomeFirstResponder {
    
    return YES;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _dictionary = [Lexicontext sharedDictionary];
    _delegate = [[UIApplication sharedApplication] delegate];
    _delegate.masterDetailManager.delegate = self;
    _askForLabel.textColor = _delegate.brandBlack;
    _suggestionLabel.textColor = _delegate.brandBlack;
    _askForLabel.font = [UIFont fontWithName:@"Gotham-XLight" size:30];
    _suggestionLabel.font = [UIFont fontWithName:@"Gotham-XLight" size:30];
    
    [self getDefinition];
}

- (void) viewDidAppear:(BOOL)animated
{
    [self becomeFirstResponder];
}

- (void) viewWillDisappear:(BOOL)animated
{
    [self resignFirstResponder];
}

- (void)configureView
{
    // Update the user interface for the detail item.
    if (self.detailItem) {
        [super.navigationController popViewControllerAnimated:YES];
        self.askForLabel.text = self.detailItem.type;
        if ([self.detailItem.type isEqual: @"Any Word"]) {
            _dictionary = [Lexicontext sharedDictionary];
            self.suggestionLabel.text = [_dictionary randomWord];
        }
        else {
        self.suggestionLabel.text = [self.detailItem randomSuggestion];
        }
        [self getDefinition];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getDefinition
{
    NSString *toDefine = _suggestionLabel.text;
    NSMutableString *definition = [[NSMutableString alloc] init];
    if ([_dictionary containsDefinitionFor:toDefine]) {
        [definition appendString:[_dictionary definitionAsHTMLFor:toDefine withTextColor:@"Black" backgroundColor:@"FloralWhite" definitionBodyFontFamily:@"HelveticaNeue" definitionBodyFontSize:16.0]];
        
    }
    else {
        NSArray *phrases = [toDefine componentsSeparatedByString:@"&"];
        for (NSString *phrase in phrases)
        {
            if ([_dictionary containsDefinitionFor:phrase]) {
                [definition appendString:[_dictionary definitionAsHTMLFor:phrase withTextColor:@"Black" backgroundColor:@"FloralWhite" definitionBodyFontFamily:@"HelveticaNeue" definitionBodyFontSize:16.0]];
                [_definitionWebView loadHTMLString:definition baseURL:nil];
            }
            else {
                NSArray *words = [phrase componentsSeparatedByString:@" "];
                for (NSString *word in words)
                {
                    if ([_dictionary containsDefinitionFor:word]) {
                    [definition appendString:[_dictionary definitionAsHTMLFor:word withTextColor:@"Black" backgroundColor:@"FloralWhite" definitionBodyFontFamily:@"HelveticaNeue" definitionBodyFontSize:16.0]];
                    [_definitionWebView loadHTMLString:definition baseURL:nil];
                    }
                }
            }
        }
        
    }
    [_definitionWebView loadHTMLString:definition baseURL:nil];
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    
    if (motion == UIEventSubtypeMotionShake)
    {
        [self refresh:self];
    }
    
}

- (IBAction)refresh:(id)sender
{
    [self configureView];
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
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
