//
//  DataStore.m
//  CIG
//
//  Code from StackOverflow user "Steve" 2013-09-25
//

#import "DataStore.h"

@implementation DataStore

// Return the data store singleton.
+ (id)sharedStore{
    static DataStore *sharedStore = nil;
    if (!sharedStore) {
        sharedStore = [[self alloc] init];
    }
    
    return sharedStore;
}

// Get the managed object context.
+ (NSManagedObjectContext*)managedObjectContext{
    static NSManagedObjectContext *context = nil;
    
    if(context){
        return context;
    }
    
    NSPersistentStoreCoordinator *coordinator = nil;
    
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"CIG" withExtension:@"momd"];
    NSManagedObjectModel *objectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    
    if (!coordinator) {
        coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:objectModel];
    }
    
    if(!coordinator){
        return nil;
    }
    
    NSString *storePath = [[self documentsDirectoryPath] stringByAppendingPathComponent:@"datastore.sqlite"];
    NSURL *storeURL = [NSURL fileURLWithPath:storePath];
    
    NSError *error;
    
    if (![coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:NULL error:&error])
    {
        NSLog(@"Database error: %@", error);
        // if you make changes to your model and a database already exists in the app
        // you'll get a NSInternalInconsistencyException exception. When the model is updated
        // the databasefile must be removed. Remove the database here because it's easy.
        NSFileManager *fileManager = [NSFileManager defaultManager];
        [fileManager removeItemAtURL:storeURL error:nil];
        
        //try to add the persistant store one more time. If it still fails then abort
        if (![coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:NULL error:&error])
            return nil;
    }
    
    context = [[NSManagedObjectContext alloc] init];
    [context setPersistentStoreCoordinator:coordinator];
    [context setUndoManager:nil];
    
    return context;
    
}

// Get the documents directory path.
+ (NSString *)documentsDirectoryPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    return basePath;
}

@end
