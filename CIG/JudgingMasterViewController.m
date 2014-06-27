//
//  JudgingMasterViewController.m
//  CIG
//
//  Created by Shawn Norman on 2014-06-12.
//  Copyright (c) 2014 Shawn Norman. All rights reserved.
//

#import "JudgingMasterViewController.h"

@interface JudgingMasterViewController ()

@end

@implementation JudgingMasterViewController

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
    NSMutableArray *events = [[NSMutableArray alloc] initWithObjects:@"Story",@"Character",@"Style",@"Theme",@"Life",@"Open", nil];
    super.objects = events;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Judging Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:cellIdentifier];
    }
    
    NSString *object = super.objects[indexPath.row];
    cell.textLabel.text = object;
    cell.textLabel.font = [UIFont fontWithName:@"Gotham-XLight" size:20];
    cell.textLabel.textColor = _delegate.brandBlack;
    [cell setBackgroundColor:_delegate.brandWhite];
    cell.textLabel.highlightedTextColor = _delegate.brandBlack;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        NSString *object = super.objects[indexPath.row];
        JudgingDetailViewController *detailView = (JudgingDetailViewController *)self.detailViewController;
        [detailView setDetailItem:object];
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
