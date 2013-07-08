//
//  main.m
//  Classes
//
//  Created by Emily on 7/8/13.
//  Copyright (c) 2013 RyPress. All rights reserved.
//

// INSTANTIATION AND USAGE

#import <Foundation/Foundation.h>
#import "Car.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        [Car setDefaultModel:@"Nissan Versa"];
        
        Car *toyota = [[Car alloc] init];
        NSLog(@"The default is a %@", [toyota model]);
        
        // Set the model using square brackets
        [toyota setModel:@"Toyota Corolla"];
        NSLog(@"Created a %@", [toyota model]);
        
        // Set the model using normal, reasonable syntax ;)
        toyota.model = @"Toyota Camry";
        NSLog(@"Changed the car to a %@", toyota.model);
        
        // Instantiating objects
        Car *nissan = [[Car alloc] init];
        NSLog(@"Created a %@", [nissan model]);
        
        Car *chevy = [[Car alloc] initWithModel:@"Chevy Corvette"];
        NSLog(@"Created a %@, too", chevy.model);
        
        // DYNAMIC TYPING
        
        Car *delorean = [[Car alloc] initWithModel:@"Delorean"];
        
        // Get the class of an object
        NSLog(@"%@ is an instance of the %@ class", [delorean model], [delorean class]);
        
        // Check an object against a class and all subclasses
        if ([delorean isKindOfClass:[NSObject class]]) {
            NSLog(@"%@ is an instance of NSObject or one of its subclasses", [delorean model]);
        } else {
            NSLog(@"%@ is not an instance of NSObject or one of its subclasses", [delorean model]);
        }
        
        // Check an object agains a class, but not its subclasses
        if ([delorean isMemberOfClass:[NSObject class]]) {
            NSLog(@"%@ is a instance of NSObject", [delorean model]);
        } else {
            NSLog(@"%@ is not an instance of NSObject", [delorean model]);
        }
        
        // Convert between strings and classes
        if (NSClassFromString(@"Car") == [Car class]) {
            NSLog(@"I can convert between strings and classes!");
        }
        
    }
    return 0;
}

