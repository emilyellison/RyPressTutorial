//
//  Car.h
//  Blocks
//
//  Created by Emily on 7/12/13.
//  Copyright (c) 2013 RyPress. All rights reserved.
//

#import <Foundation/Foundation.h>

// Define a new type for the block
typedef double (^SpeedFunction)(double);

@interface Car : NSObject

@property double odometer;

- (void)driveForDuration:(double)duration
//     withVariableSpeed:(double (^)(double time))speedFunction
       withVariableSpeed:(SpeedFunction)speedFunction
                   steps:(int)numSteps;

@end
