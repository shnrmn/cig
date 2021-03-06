//
//  MasterViewController.h
//  CIG
//
//  Created by Shawn Norman on 2014-06-10.
//  Copyright (c) 2014 Shawn Norman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "EmptyViewController.h"

@class DetailViewController;

@interface MasterViewController : UITableViewController 

@property (strong, nonatomic) DetailViewController *detailViewController;
@property (strong, nonatomic) NSMutableArray *objects;

@end
