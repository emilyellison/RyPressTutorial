//
//  Car.m
//  Categories
//
//  Created by Emily on 7/10/13.
//  Copyright (c) 2013 RyPress. All rights reserved.
//

#import "Car.h"
#import "Car+Protected.h"

// EXTENSIONS

// For example, if you wanted to formally add a private engineIsWorking
// method to the Car class defined above, you could include an extension
// in Car.m. The compiler complains if the method isn’t defined in the main
// @implementation block, but since it’s declared in Car.m instead of Car.h,
// it remains a private method

@interface Car()

- (BOOL)engineIsWorking;

// This allows odometer to be read/write private and readonly publicly.
// We can then assign values to self.odometer inside of the implementation,
// but trying to do so outside of Car.m will result in a compiler error.

@property (readwrite) double odometer;

@end

@implementation Car

@synthesize model = _model;

- (BOOL)engineIsWorking {
    return YES;
}

- (void)startEngine {
    if ([self engineIsWorking]) {
        NSLog(@"Starting the %@'s engine", _model);
    }
}

- (void)drive {
    [self prepareToDrive];
    NSLog(@"The %@ is now driving", _model);
}

- (void)turnLeft {
    NSLog(@"The %@ is turning left", _model);
}

- (void)turnRight {
    NSLog(@"The %@ is turning right", _model);
}

@end
