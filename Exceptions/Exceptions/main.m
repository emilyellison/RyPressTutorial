//
//  main.m
//  Exceptions
//
//  Created by Emily on 7/14/13.
//  Copyright (c) 2013 RyPress. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InventoryErrors.h"

NSString *getRandomCarFromInventory(NSArray *inventory) {
    int maximum = (int)[inventory count];
    if (maximum == 0) {
        NSException *e = [NSException exceptionWithName:@"EmptyInventoryException" reason:@"This inventory doesn't have any cars!" userInfo:nil];
        @throw e;
    }
    int randomIndex = arc4random_uniform(maximum);
    return inventory[randomIndex];
}

NSString *selectRandomCarFromInventory(NSArray *inventory, NSError **error) {
    int maximum = (int)[inventory count];
    if (maximum == 0) {
        if (error != NULL) {
            NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Could not select a car because no cars exist in your inventory."};
            *error = [NSError errorWithDomain:InventoryErrorDomain code:InventoryEmptyError userInfo:userInfo];
        }
        return nil;
    }
    int randomIndex = arc4random_uniform(maximum);
    return inventory[randomIndex];
}

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSArray *inventory = @[@"Honda Civic", @"Nissan Versa", @"Ford F-150"];
        
        int selected_index = 3;
        @try {
            NSString *car = inventory[selected_index];
            NSLog(@"The selected car is %@", car);
        }
        
        // In the real world, you’ll want your @catch() block
        // to actually handle the exception by logging the problem,
        // correcting it, or possibly even promoting the exception to an
        // error object so it can be displayed to the user. The default
        // behavior for uncaught exceptions is to output a message to
        // the console and exit the program.
        
        @catch (NSException *exception) {
            NSLog(@"An exception occurred: %@", exception.name);
            NSLog(@"Here are some details: %@", exception.reason);
        }
        @finally {
            NSLog(@"Executing finally block");
        }
        
        // CUSTOM EXCEPTIONS
        
        @try {
            NSString *car = getRandomCarFromInventory(@[]);
            NSLog(@"The selected car is %@", car);
        }
        @catch (NSException *exception) {
            if (exception.name == @"EmptyInventoryException") {
                NSLog(@"Caught an EmptyInventoryException");
            } else {
                NSLog(@"Ignored a %@ exception", exception);
                @throw;
            }
        }
        
        // While occasionally necessary, you shouldn’t really need
        // to throw custom exceptions like this in normal applications.
        // For one, exceptions represent programmer errors, and there
        // are very few times when you should be planning for serious
        // coding mistakes. Second, @throw is an expensive operation,
        // so it’s always better to use errors if possible.
        
        // HANDLING ERRORS
        
        NSString *fileToLoad = @"/path/to/non-existent-file.txt";
        NSError *error;
        NSString *content = [NSString stringWithContentsOfFile:fileToLoad encoding:NSUTF8StringEncoding error:&error];
        
        if (content == nil) {
            NSLog(@"Error loading the file %@!", fileToLoad);
            NSLog(@"Domain: %@", error.domain);
            NSLog(@"Code: %ld", error.code);
            NSLog(@"Description: %@", error.localizedDescription);
            NSLog(@"Reason: %@", error.localizedFailureReason);
        } else {
            NSLog(@"Content loaded!");
            NSLog(@"%@", content);
        }
        
        if (content == nil) {
            if ([error.domain isEqualToString:@"NSCocoaErrorDomain"] && error.code == NSFileReadNoSuchFileError ) {
                NSLog(@"That file doesn't exist!");
                NSLog(@"Path: %@", [[error userInfo] objectForKey:NSFilePathErrorKey]);
            } else {
                NSLog(@"Some other kind of read error occurred");
            }
        }
        
        // CUSTOM ERRORS
        
        NSArray *anotherInventory = @[];
        NSError *anotherError;
        NSString *car = selectRandomCarFromInventory(anotherInventory, &anotherError);
        
        if (car == nil) {
            NSLog(@"Car could not be selected!");
            NSLog(@"Domain: %@", anotherError.domain);
            NSLog(@"Code: %ld", anotherError.code);
            NSLog(@"Description: %@", anotherError.localizedDescription);
        } else {
            NSLog(@"Car selected!");
            NSLog(@"%@", car);
        }
    }
    return 0;
}

