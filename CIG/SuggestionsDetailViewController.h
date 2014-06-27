//
//  SuggestionsDetailViewController.h
//  CIG
//
//  Created by Shawn Norman on 2014-06-12.
//  Copyright (c) 2014 Shawn Norman. All rights reserved.
//

#import "DetailViewController.h"
#import "Lexicontext.h"
#import "AppDelegate.h"
#import "AskFor.h"

@interface SuggestionsDetailViewController : DetailViewController <UISplitViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *askForLabel;
@property (weak, nonatomic) IBOutlet UILabel *suggestionLabel;
@property (weak, nonatomic) IBOutlet UIWebView *definitionWebView;
@property (strong, nonatomic) UIPopoverController *masterPopoverController;

@property (strong, nonatomic) Lexicontext *dictionary;
@property (strong, nonatomic) AppDelegate *delegate;

@property (strong, nonatomic) AskFor *detailItem;

- (IBAction)refresh:(id)sender;

@end
