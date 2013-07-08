//
//  main.m
//  Methods
//
//  Created by Emily on 7/8/13.
//  Copyright (c) 2013 RyPress. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // Nesting method calls is a common pattern in Objective-C
        // programs. It’s a natural way to pass the result of one
        // call to another.
        
        Car *nissan = [[Car alloc] initWithModel:@"Nissan"];
        NSLog(@"%@", nissan.model);
        
        Car *toyota = [[Car alloc] initWithModel:@"Toyota" mileage:42000.0];
        NSLog(@"%f", toyota.theMileage);
        
        Car *porsche = [[Car alloc] init];
        porsche.model = @"Porsche 911 Carrera";
        
        SEL stepOne = NSSelectorFromString(@"startEngine");
        SEL stepTwo = @selector(driveForDistance:);
        SEL stepThree = @selector(turnByAngle:);
        
        // This is the same as [porsche startEngine];
        NSLog(@"Is the porsche running? %d", porsche.isRunning);
        [porsche performSelector:stepOne];
        NSLog(@"Is the porsche running? %d", porsche.isRunning);
        
        // This is the same as
        // [porsche driveForDistance:[NSNumber numberWithDouble:5.7]];
        NSLog(@"The porsche has mileage: %f", porsche.theMileage);
        [porsche performSelector:stepTwo];
        NSLog(@"The porsche has mileage: %f", porsche.theMileage);
        
        [porsche performSelector:stepThree];

        
        

    }
    return 0;
}

