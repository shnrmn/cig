//
//  NotesDetailViewController.h
//  CIG
//
//  Created by Shawn Norman on 2014-06-12.
//  Copyright (c) 2014 Shawn Norman. All rights reserved.
//

#import "DetailViewController.h"
#import "Note.h"

@interface NotesDetailViewController : DetailViewController <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextView;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
@property (nonatomic) float textViewY;

@property (strong, nonatomic) Note *detailItem;

- (IBAction)newTitle:(id)sender;

@end
