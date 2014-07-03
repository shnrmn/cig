//
//  Suggestion.h
//  CIG
//
//  Created by Shawn Norman on 2014-06-24.
//  Copyright (c) 2014 Shawn Norman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface AskFor : PFObject <PFSubclassing>

@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) NSArray *contents;

+(NSString *)parseClassName;
-(NSString *)randomSuggestion;

@end
