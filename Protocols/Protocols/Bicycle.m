//
//  Bicycle.m
//  Protocols
//
//  Created by Emily on 7/9/13.
//  Copyright (c) 2013 RyPress. All rights reserved.
//

#import "Bicycle.h"

@implementation Bicycle

// ADOPTING PROTOCOLS

- (void)signalStop {
    NSLog(@"Bending left arm downwards");
}

- (void)signalLeftTurn {
    NSLog(@"Extending left arm outwards");
}

- (void)signalRightTurn {
    NSLog(@"Bending left arm upwards");
}

- (void)startPedaling {
    NSLog(@"Here we go!");
}

- (void)removeFrontWheel {
    NSLog(@"Front wheel id off."
          "Should probably replace that before pedaling...");
}

- (void)lockToStructure:(id)theStructure {
    NSLog(@"Locked to structure. Don't forget the combination!");
}

@end
