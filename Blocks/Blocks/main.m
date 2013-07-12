//
//  main.m
//  Blocks
//
//  Created by Emily on 7/12/13.
//  Copyright (c) 2013 RyPress. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // CREATING BLOCKS
        
        // Declare the block variable
        // The caret (^) is used to mark the distanceFromRateAndTime
        // variable as a block. Like a function declaration, you need
        // to include the return type and parameter types so the compiler
        // can enforce type safety. The ^ behaves in a similar manner
        // to the asterisk before a pointer (e.g., int *aPointer) in that
        // it is only required when declaring the block, after which you
        // can use it like a normal variable.
        double (^distanceFromRateAndTime)(double rate, double time);
        
        // Create and assign the block variable
        distanceFromRateAndTime = ^double(double rate, double time) {
            return rate*time;
        };
        
        // Call the block
        double dx = distanceFromRateAndTime(35, 1.5);
        
        NSLog(@"A car driving 35 mph will travel %.2f miles in 1.5 hours", dx);
        
        // Parameterless blocks
        double (^randomPercent)(void) = ^ {
            return (double)arc4random() / 4294967295;
        };
        
        double rp = randomPercent() * 100;
        NSLog(@"You gas tank is %f%% full.", rp);
        
        // CLOSURES
        
        // Inside of a block, you have access to same data as in
        // a normal function: local variables, parameters passed to
        // the block, and global variables/functions. But, blocks are
        // implented as closures, which means that you also have access
        // to non-local variables. Non-local variables are variables defined
        // in the block’s enclosing lexical scope, but outside the block itself.
        
        NSString *make = @"Honda";
        NSString *(^getFullCarName)(NSString *) = ^(NSString *model) {
            // Non-local variables are copied and stored with the block as
            // const variables, which means they are read-only. Trying to
            // assign a new value to the make variable from inside the block
            // will throw a compiler error.
            return [make stringByAppendingFormat:@" %@", model];
        };
        NSLog(@"%@", getFullCarName(@"Accord"));
        
        // Try changing the non-local variable (it won't change the block)
        make = @"Porsche";
        NSLog(@"%@", getFullCarName(@"911 Turbo")); // Honda 911 Turbo
        
        // MUTABLE NON-LOCAL VARIABLES
        
        // You can override the const copy behavior by declaring a
        // non-local variable with the __block storage modifier
        
        __block int i = 0;
        int (^count)(void) = ^ {
            i += 1;
            return i;
        };
        NSLog(@"%d", count());
        NSLog(@"%d", count());
        NSLog(@"%d", count());
        
        // BLOCKS AS METHOD PARAMETERS
        
        Car *theCar =  [[Car alloc] init];
        
        // Drive with constant speed 5 m/s
        [theCar driveForDuration:10.0 withVariableSpeed:^double(double time) {
            return 5.0;
        } steps:100];
        NSLog(@"The car has now driven %.2f meters", theCar.odometer);

        // Start accelerating at a rate of 1.0 m/s^2
        [theCar driveForDuration:10.0 withVariableSpeed:^double(double time) {
            return 5.0 + time;
        } steps:100];
        NSLog(@"The car has now driven %.2f meters", theCar.odometer);

    }
    return 0;
}

