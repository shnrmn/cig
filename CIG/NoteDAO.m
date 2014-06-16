//
//  NoteDAO.m
//  CIG
//
//  Created by Shawn Norman on 2014-06-14.
//  Copyright (c) 2014 Shawn Norman. All rights reserved.
//

#import "NoteDAO.h"

@implementation NoteDAO

-(NSMutableArray *)populateDataSource
{
    _notes = [[NSMutableArray alloc] init];
    Note *newNote = [[Note alloc] init];
    
    newNote.title = @"New Note";
    [_notes addObject:newNote];
    newNote = nil;
    
    return _notes;
}

@end
