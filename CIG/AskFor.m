//
//  Suggestion.m
//  CIG
//
//  Created by Shawn Norman on 2014-06-24.
//  Copyright (c) 2014 Shawn Norman. All rights reserved.
//
//  Parse object subclass for ask fors.

#import "AskFor.h"
#import <Parse/PFObject+Subclass.h>

@implementation AskFor

@dynamic type;
@dynamic contents;

+(NSString *)parseClassName {
    return @"AskFor";
}

-(NSString *)randomSuggestion
{
    int random1 = arc4random_uniform((int)self.contents.count);
    return self.contents[random1];
}

@end
