//
//  NotesMasterViewController.h
//  CIG
//
//  Created by Shawn Norman on 2014-06-12.
//  Copyright (c) 2014 Shawn Norman. All rights reserved.
//

#import "MasterViewController.h"
#import "Note.h"
#import "NoteDAO.h"
#import "NotesDetailViewController.h"
#import "DataStore.h"
#import "NoteCell.h"
#import "AppDelegate.h"
#import "NSDate+Helper.h"

@interface NotesMasterViewController : MasterViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) AppDelegate *delegate;

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) NSManagedObjectContext *context;
@property (nonatomic, strong) DataStore *ds;

@end
