//
//  Note.h
//  CIG
//
//  Created by Shawn Norman on 2014-06-18.
//  Copyright (c) 2014 Shawn Norman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface Note : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSString * body;

@end
