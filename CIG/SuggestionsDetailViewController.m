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

// Code from lexicontext dictionary API. Modified to check multi-word string.
- (void)getDefinition
{
    NSString *toDefine = _suggestionLabel.text;
    NSMutableString *definition = [[NSMutableString alloc] init];
    // Check if whole suggestion is in dictionary.
    if ([_dictionary containsDefinitionFor:toDefine]) {
        [definition appendString:[_dictionary definitionAsHTMLFor:toDefine withTextColor:@"Black" backgroundColor:@"FloralWhite" definitionBodyFontFamily:@"HelveticaNeue" definitionBodyFontSize:16.0]];
        
    }
    // Break suggestion into phrases separated by ampersand.
    else {
        NSArray *phrases = [toDefine componentsSeparatedByString:@"&"];
        for (NSString *phrase in phrases)
        {
            if ([_dictionary containsDefinitionFor:phrase]) {
                [definition appendString:[_dictionary definitionAsHTMLFor:phrase withTextColor:@"Black" backgroundColor:@"FloralWhite" definitionBodyFontFamily:@"HelveticaNeue" definitionBodyFontSize:16.0]];
                [_definitionWebView loadHTMLString:definition baseURL:nil];
            }
            // Break suggestion into words separated by spaces.
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

// Get new suggestion after shake.
- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    
    if (motion == UIEventSubtypeMotionShake)
    {
        [self refresh:self];
    }
    
}

// Get new suggestion.
- (IBAction)refresh:(id)sender
{
    [self configureView];
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
