//
//  Car.h
//  Properties
//
//  Created by Emily on 7/8/13.
//  Copyright (c) 2013 RyPress. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface Car : NSObject

// THE @PROPERTY DIRECTIVE

// This declares the property and creates getter and setter
// methods for you "running" and "setRunning". synthesize used
// to do the getting and setting. Now it's no longer necessary
// unless you want to create custom getter and setter methods.

// We've changed the setter method to readonly.

@property (getter=isRunning, readonly) BOOL running;

// THE NONATOMIC ATTRIBUTE

// Properties declared with @property are atomic by default.
// If you aren't worried about thread safety (the getter and the setter
// being called simultaneously), use nonatomic for speed.

// Only nonatomic methods let you mix custom accessors with
// synthesized ones.

// THE COPY ATTRIBUTE

// The copy attribute is an alternative to strong. Instead of
// taking ownership of the existing object, it creates a copy of
// whatever you assign to the property, then takes ownership of that.

@property (nonatomic, copy) NSString *model;

// THE STRONG ATTRIBUTE

@property (nonatomic, strong) Person *driver;

// THE READONLY ATTRIBUTE
// These determine whether isRunning is YES or NO

- (void)startEngine;
- (void)stopEngine;

@end
