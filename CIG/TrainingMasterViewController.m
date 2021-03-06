//
//  TrainingMasterViewController.m
//  CIG
//
//  Created by Shawn Norman on 2014-06-12.
//  Copyright (c) 2014 Shawn Norman. All rights reserved.
//

#import "TrainingMasterViewController.h"

@interface TrainingMasterViewController ()

@end

@implementation TrainingMasterViewController

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
    PFQuery *query = [PFQuery queryWithClassName:@"Exercise"];
    [query orderByAscending:@"title"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *exercises, NSError *error) {
        if (!error) {
            super.objects = [exercises mutableCopy];
            [self.tableView reloadData];
            
            // Select random exercise
            NSInteger random = arc4random_uniform((int)super.objects.count);
            NSObject *randomObject = super.objects[random];
            [self.detailViewController setDetailItem:randomObject];
        }
        else {
            NSLog(@"%@", error);
        }
    }];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"Training Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:cellIdentifier];
    }
    
    Exercise *object = super.objects[indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:@"Gotham-XLight" size:20];
    cell.textLabel.text = object.title;
    cell.textLabel.textColor = _delegate.brandBlack;
    [cell setBackgroundColor:_delegate.brandWhite];
    cell.textLabel.highlightedTextColor = _delegate.brandBlack;
    
    return cell;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        Exercise *object = super.objects[indexPath.row];
        TrainingDetailViewController *detailView = (TrainingDetailViewController *)self.detailViewController;
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
