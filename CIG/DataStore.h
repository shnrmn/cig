//
//  DataStore.h
//  CIG
//
//  Created by Shawn Norman on 2014-06-19.
//  Copyright (c) 2014 Shawn Norman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface DataStore : NSObject

+ (id)sharedStore;
+ (NSManagedObjectContext*)managedObjectContext;
+ (NSString *)documentsDirectoryPath;

@end
