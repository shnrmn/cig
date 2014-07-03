//
//  Exercise.h
//  CIG
//
//  Created by Shawn Norman on 2014-06-29.
//  Copyright (c) 2014 Shawn Norman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface Exercise : PFObject <PFSubclassing>

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *subtitle;
@property (strong, nonatomic) NSString *rules;
@property (strong, nonatomic) NSString *objectives;
@property (strong, nonatomic) NSString *comments;
@property (strong, nonatomic) NSString *variations;

@end
