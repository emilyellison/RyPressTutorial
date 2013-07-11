//
//  Coupe.m
//  Categories
//
//  Created by Emily on 7/11/13.
//  Copyright (c) 2013 RyPress. All rights reserved.
//

#import "Coupe.h"
#import "Car+Protected.h"

@implementation Coupe

- (void)startEngine {
    [super startEngine];
    [self prepareToDrive];
}

- (void)drive {
    NSLog(@"VROOM!");
}

@end
