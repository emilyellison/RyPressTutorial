//
//  Car.m
//  Protocols
//
//  Created by Emily on 7/9/13.
//  Copyright (c) 2013 RyPress. All rights reserved.
//

#import "Car.h"

@implementation Car

- (void)signalStop {
    NSLog(@"Brake lights light up");
}

- (void)signalLeftTurn {
    NSLog(@"Turn on left turn signal");
}

- (void)signalRightTurn {
    NSLog(@"Turn on right turn signal");
}

- (void)startEngine {
    NSLog(@"Looks like the car's running today.");
}

- (void)drive {
    NSLog(@"Off we go!");
}

- (void)brake {
    NSLog(@"Slowing down...");
}

@end
