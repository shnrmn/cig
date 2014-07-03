//
//  Exercise.m
//  CIG
//
//  Created by Shawn Norman on 2014-06-29.
//  Copyright (c) 2014 Shawn Norman. All rights reserved.
//
//  Parse object subclass for exercises.

#import "Exercise.h"
#import <Parse/PFObject+Subclass.h>

@implementation Exercise

@dynamic title;
@dynamic subtitle;
@dynamic rules;
@dynamic objectives;
@dynamic comments;
@dynamic variations;

+(NSString *)parseClassName {
    return @"Exercise";
}

@end
