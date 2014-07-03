//
//  SuggestionsMasterViewController.m
//  CIG
//
//  Created by Shawn Norman on 2014-06-12.
//  Copyright (c) 2014 Shawn Norman. All rights reserved.
//

#import "SuggestionsMasterViewController.h"

@interface SuggestionsMasterViewController ()

@end

@implementation SuggestionsMasterViewController

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
    
    self.tableView.backgroundColor = _delegate.brandWhite;
    UIView *footerView = [[UIView alloc] init];
    footerView.backgroundColor = [UIColor clearColor];
    self.tableView.tableFooterView = footerView;
    PFQuery *query = [PFQuery queryWithClassName:@"AskFor"];
    [query orderByAscending:@"type"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *askFors, NSError *error) {
        if (!error) {
            super.objects = [askFors mutableCopy];
            [self.tableView reloadData];
        }
        else {
            NSLog(@"%@", error);
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Suggestions Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:cellIdentifier];
    }
    
    AskFor *object = super.objects[indexPath.row];
    cell.textLabel.text = object.type;
    cell.textLabel.font = [UIFont fontWithName:@"Gotham-XLight" size:20];
    cell.textLabel.textColor = _delegate.brandBlack;
    [cell setBackgroundColor:_delegate.brandWhite];
    cell.textLabel.highlightedTextColor = _delegate.brandBlack;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        AskFor *object = super.objects[indexPath.row];
        SuggestionsDetailViewController *detailView = (SuggestionsDetailViewController *)self.detailViewController;
        [detailView setDetailItem:object];
    }
}

@end
