//
//  main.m
//  Categories
//
//  Created by Emily on 7/10/13.
//  Copyright (c) 2013 RyPress. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"
#import "Car+Maintenance.h"
#import "Coupe.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Car *porsche = [[Car alloc] init];
        porsche.model = @"Porsche 911 Turbo";
        
        Car *ford = [[Car alloc] init];
        ford.model = @"Ford F-150";
        
        [porsche startEngine];
        [porsche drive];
        [porsche turnLeft];
        [porsche turnRight];
        
        if ([porsche needsOilChange]) {
            [porsche changeOil];
        }
        [porsche rotateTires];
        [porsche jumpBatteryUsingCar:ford];
    
        // "Protected" methods have not been imported,
        // so this will *not* work
        // [porsche prepareToDrive];
        SEL protectedMethod = @selector(prepareToDrive);
        if ([porsche respondsToSelector:protectedMethod]) {
            [porsche performSelector:protectedMethod];
        }
        
        Coupe *coupe = [[Coupe alloc] init];
        coupe.model = @"Coupe";
        [coupe startEngine];
        [coupe drive];
        [coupe turnRight];
    }
    return 0;
}

