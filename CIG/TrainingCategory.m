//
//  Category.m
//  CIG
//
//  Created by Shawn Norman on 2014-06-28.
//  Copyright (c) 2014 Shawn Norman. All rights reserved.
//
// Parse object subclass for training categories. For use in future releases.

#import "TrainingCategory.h"
#import <Parse/PFObject+Subclass.h>

@implementation TrainingCategory

@dynamic categoryName;
@dynamic contents;

+(NSString *)parseClassName {
    return @"Category";
}

@end
