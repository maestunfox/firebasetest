//
//  Project.m
//  firebasetest
//
//  Created by Olivier on 05/04/2017.
//  Copyright © 2017 maestun. All rights reserved.
//

#import "Project.h"

@implementation Project


- (instancetype) initWithName:(NSString *)aName {
    self = [super init];
    if(self) {
//        NSString * user = [[KCSUser activeUser] username];
        [self setName:aName];
//        [self setCreated:[NSDate date]];
//        [self setUpdated:[NSDate date]];
//        [self setCreatedBy:user];
//        [self setUpdatedBy:user];
    }
    return self;
}

+ (NSArray *)getAllProjects {
    return nil;
}

@end
