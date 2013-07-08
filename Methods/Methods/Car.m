//
//  Car.m
//  Methods
//
//  Created by Emily on 7/8/13.
//  Copyright (c) 2013 RyPress. All rights reserved.
//

#import "Car.h"

@implementation Car

- (id)initWithModel:(NSString *)aModel mileage:(double)theMileage {
    self = [ super init ];
    if (self) {
        [self setModel:[aModel copy]];
        if (theMileage) {
            [self setMileage:theMileage];
        } else {
            [self setMileage:0.0];
        }
    }
    return self;
}

- (void)startEngine {
    [self setRunning:YES];
}

- (void)driveForDistance:(double)theDistance {
    double current_mileage = self.theMileage;
    current_mileage += theDistance;
    [self setMileage:current_mileage];
}

- (void)turnByAngle:(double)theAngle {
    NSLog(@"%f", theAngle);
}

// NOTES
// “Private” methods can be created by defining them in
// a class’s implementation file while omitting them from
// its interface file.

@end
