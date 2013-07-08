//
//  main.m
//  Functions
//
//  Created by Emily on 7/7/13.
//  Copyright (c) 2013 RyPress. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CarUtilities.h"

// BASIC SYNTAX

int getRandomInteger(int min, int max) {
    return arc4random_uniform((max - min) + 1) + min;
}

NSString *getRandomMake(NSArray *makes) {
    int max = (int)[makes count];
    int randomIndex = arc4random_uniform(max);
    return makes[randomIndex];
}

// THE STATIC KEYWORD

// Static function declaration
static int staticGetRandomInteger(int, int);

// Static local variables
int countByTwo() {
    static int currentCount = 0;
    currentCount += 2;
    return currentCount;
}

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // BASIC SYNTAX
        
        int randomNumber = getRandomInteger(-10, 10);
        NSLog(@"Selected a random number between -10 and 10: %d", randomNumber);
        
        NSArray *makes = @[@"Honda", @"Ford", @"Nissan", @"Porsche"];
        NSLog(@"Selected a %@", getRandomMake(makes));
        
        // THE STATIC KEYWORD
        
        // Static function full definition
        int anotherRandomNumber = staticGetRandomInteger(20, 40);
        NSLog(@"Selected a random number between 20 and 40: %d", anotherRandomNumber);
        
        // Static local variables
        NSLog(@"%d", countByTwo());
        NSLog(@"%d", countByTwo());
        NSLog(@"%d", countByTwo());
        
        // FUNCTION LIBRARIES
        
        NSDictionary *makesAndModels = @{
            @"Ford": @[@"Explorer", @"F-150"],
            @"Honda": @[@"Accord", @"Civic", @"Pilot"],
            @"Nissan": @[@"370Z", @"Altima", @"Versa"],
            @"Porsche": @[@"911 Turbo", @"Boxster", @"Cayman S"]
        };
        NSString *randomCar = CUGetRandomMakeAndModel(makesAndModels);
        NSLog(@"Selected a %@", randomCar);
        
    }
    return 0;
}

// Static function implementation
static int staticGetRandomInteger(int min, int max) {
    return  arc4random_uniform((max - min) + 1) + min;
}