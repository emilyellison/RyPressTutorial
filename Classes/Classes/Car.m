//
//  Car.m
//  Classes
//
//  Created by Emily on 7/8/13.
//  Copyright (c) 2013 RyPress. All rights reserved.
//

// IMPLEMENTATIONS

#import "Car.h"

// CLASS METHODS AND VARIABLES

static NSString *_defaultModel;

@implementation Car {
        
// Private instance variables
double _odometer;
    
}

// CLASS-LEVEL INITIALIZATION

// The initialize method is the class-level equivalent of init
+ (void)initialize {
    if (self == [Car class]) {
        // Make sure this isn't executed more than once
        _defaultModel = @"Nissan Versa";
    }
}

// CLASS METHODS AND VARIABLES

// Class method implementation
+ (void)setDefaultModel:(NSString *)aModel {
    _defaultModel = [aModel copy];
}

// CONSTRUCTOR METHODS

// Custom constructor method implementation
- (id)initWithModel:(NSString *)aModel {
    self = [super init];
    if (self) {
        _model = [aModel copy];
        _odometer = 0;
    }
    return self;
}

- (id)init {
    // Forward initWithModel to the "designated" initialization method
    return [self initWithModel:_defaultModel];
}

// INSTANCE METHODS

// This automatically generates accessor methods for the property
@synthesize model = _model; // Optional for Xcode 4.4 +

// Instance method implementation
- (void)drive {
    NSLog(@"Driving a %@. Vroom!", self.model);
}


@end
