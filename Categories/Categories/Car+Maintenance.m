//
//  Car+Maintenance.m
//  Categories
//
//  Created by Emily on 7/10/13.
//  Copyright (c) 2013 RyPress. All rights reserved.
//

#import "Car+Maintenance.h"

@implementation Car (Maintenance)

- (BOOL)needsOilChange {
    return YES;
}

- (void)changeOil {
    NSLog(@"Changing oil for the %@", [self model]);
}

- (void)rotateTires {
    NSLog(@"Rotating tires for the %@", [self model]);
}

- (void)jumpBatteryUsingCar:(Car *)anotherCar {
    NSLog(@"Jumped the %@ with a %@", [self model], [anotherCar model]);
}

@end
