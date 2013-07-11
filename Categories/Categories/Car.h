//
//  Car.h
//  Categories
//
//  Created by Emily on 7/10/13.
//  Copyright (c) 2013 RyPress. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject

@property (copy) NSString *model;
@property (readonly) double odometer;

- (void)startEngine;
- (void)drive;
- (void)turnLeft;
- (void)turnRight;

@end
