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

@interface NotesMasterViewController : MasterViewController

@property(nonatomic, strong) NoteDAO *daoNote;
@property(nonatomic, strong) NSMutableArray *notes;

@end
