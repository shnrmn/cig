//
//  Category.h
//  CIG
//
//  Created by Shawn Norman on 2014-06-28.
//  Copyright (c) 2014 Shawn Norman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface TrainingCategory : PFObject <PFSubclassing>

@property (strong, nonatomic) NSString *categoryName;
@property (strong, nonatomic) NSArray *contents;

@end
