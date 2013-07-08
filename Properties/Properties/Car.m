//
//  Car.m
//  Properties
//
//  Created by Emily on 7/8/13.
//  Copyright (c) 2013 RyPress. All rights reserved.
//

#import "Car.h"

@implementation Car

// THE @PROPERTY DIRECTIVE

// This creates a getter and setter method for the running property
// _running is the instance variable

@synthesize running = _running; // Optional for Xcode 4.4+

// THE READONLY ATTRIBUTE

// These methods will change running internally rather than
// us setting the running property manually.

- (void)startEngine {
    _running = YES;
}

- (void)stopEngine {
    _running = NO;
}

@end
