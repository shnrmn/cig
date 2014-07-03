//
//  DataStore.h
//  CIG
//
//  Code from StackOverflow user "Steve" 2013-09-25
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface DataStore : NSObject

+ (id)sharedStore;
+ (NSManagedObjectContext*)managedObjectContext;
+ (NSString *)documentsDirectoryPath;

@end
