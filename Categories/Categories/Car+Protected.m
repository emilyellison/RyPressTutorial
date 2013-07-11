//
//  Car+Protected.m
//  Categories
//
//  Created by Emily on 7/11/13.
//  Copyright (c) 2013 RyPress. All rights reserved.
//

// PROTECTED METHODS

#import "Car+Protected.h"

@implementation Car (Protected)

- (void)prepareToDrive {
    NSLog(@"Doing some internal work to get the %@ ready drive", [self model]);
}

@end
