//
//  Project.h
//  firebasetest
//
//  Created by Olivier on 05/04/2017.
//  Copyright © 2017 maestun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Project : NSObject

@property (strong, nonatomic) NSString * name;
@property (strong, nonatomic) NSArray * players;

- (instancetype)initWithName:(NSString *)aName;

+ (NSArray *)getAllProjects;
+ (void)sync;
@end
