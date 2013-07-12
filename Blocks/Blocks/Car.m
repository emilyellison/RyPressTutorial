//
//  Car.m
//  Blocks
//
//  Created by Emily on 7/12/13.
//  Copyright (c) 2013 RyPress. All rights reserved.
//

#import "Car.h"

@implementation Car

@synthesize odometer = _odometer;

-(void)driveForDuration:(double)duration withVariableSpeed:(double (^)(double))speedFunction steps:(int)numSteps {
    double dt = duration / numSteps;
    for (int i = 1; i < numSteps; i++) {
        _odometer = speedFunction(i*dt) * dt;
    }
}

@end
