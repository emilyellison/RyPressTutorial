//
//  Car+Maintenance.h
//  Categories
//
//  Created by Emily on 7/10/13.
//  Copyright (c) 2013 RyPress. All rights reserved.
//

#import "Car.h"

@interface Car (Maintenance)

- (BOOL)needsOilChange;
- (void)changeOil;
- (void)rotateTires;
- (void)jumpBatteryUsingCar:(Car *)anotherCar;

@end
