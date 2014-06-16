//
//  NoteDAO.h
//  CIG
//
//  Created by Shawn Norman on 2014-06-14.
//  Copyright (c) 2014 Shawn Norman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Note.h"

@interface NoteDAO : NSObject

@property(nonatomic, strong) NSMutableArray *notes;

-(NSMutableArray *)populateDataSource;

@end
