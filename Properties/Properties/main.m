//
//  main.m
//  Properties
//
//  Created by Emily on 7/8/13.
//  Copyright (c) 2013 RyPress. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"
#import "Person.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Car *honda = [[Car alloc] init];
        // This method is impossible once the readonly attribute is set.
        // honda.running = YES;             // = [honda setRunning:YES]
        NSLog(@"Is the Honda running?");
        NSLog(@"%d", honda.running);        // = [honda isRunning]
        NSLog(@"%d", [honda isRunning]);
        
        [honda startEngine];
        NSLog(@"Is the Honda running?");
        NSLog(@"%d", honda.running);
        // This method is impossible once the readonly attribute is set.
        // honda.running = NO;
        
        Person *john = [[Person alloc] init];
        john.name = @"John";
        
        Car *hyundai = [[Car alloc] init];
        honda.model = @"Honda Civic";
        honda.driver = john;
        john.car = hyundai;
        
        NSLog(@"%@ is driving the %@", honda.driver, honda.model);
        
        Car *toyota = [[Car alloc] init];
        NSMutableString *model = [NSMutableString stringWithString:@"Toyota Camry"];
        toyota.model = model;
        
        NSLog(@"%@", toyota.model);
        
        // Changing the model doesn't change toyota.model
        // because model has the copy attribute. If you remove
        // the attribute, it does change.
        
        [model setString:@"Nissan Versa"];
        NSLog(@"%@", toyota.model);
        
        // OTHER ATTRIBUTES
        
        // The retain attribute is the Manual Retain Release version of
        // strong, and it has the exact same effect: claiming ownership
        // of assigned values. You shouldn’t use this in an Automatic
        // Reference Counted environment.
        
        // Properties with the unsafe_unretained attribute behave similar
        // to weak properties, but they don’t automatically set their
        // value to nil if the referenced object is destroyed. The only
        // reason you should need to use unsafe_unretained is to make
        // your class compatible with code that doesn’t support the
        // weak property.
        
        // The assign attribute doesn’t perform any kind of
        // memory-management call when assigning a new value to the
        // property. This is the default behavior for primitive data
        // types, and it used to be a way to implement weak references
        // before iOS 5. Like retain, you shouldn’t ever need to
        // explicitly use this in modern applications.
        

    }
    return 0;
}

