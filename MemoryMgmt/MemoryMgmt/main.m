//
//  main.m
//  MemoryMgmt
//
//  Created by Emily on 7/15/13.
//  Copyright (c) 2013 RyPress. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CarStore.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // MANUAL RETAIN RELEASE
        
        // From a practical standpoint, this means that you have to
        // balance every alloc, retain, and copy call with a release
        // or autorelease on the same object.
        
        // If you forget to release an object, its underlying memory
        // is never freed, resulting in a memory leak. Small leaks won’t
        // have a visible effect on your program, but if you eat up
        // enough memory, your program will eventually crash. On the
        // other hand, if you try to release an object too many times,
        // you’ll have what’s called a dangling pointer. When you try to
        // access the dangling pointer, you’ll be requesting an invalid
        // memory address, and your program will most likely crash.
        
        // THE ALLOC METHOD
        
        NSMutableArray *inventory = [[NSMutableArray alloc] init];
        [inventory addObject:@"Honda Civic"];
        NSLog(@"%@", inventory);
        
        // THE RELEASE METHOD
        
        [inventory release];
        
        // THE RETAIN METHOD
        
        NSMutableArray *newInventory = [[NSMutableArray alloc] init];
        [newInventory addObject:@"Honda Civic"];
        
        CarStore *superstore = [[CarStore alloc] init];
        [superstore setInventory:newInventory];
        [newInventory release];

        // This will error out unless you change the superstore object
        // has a strong reference to the inventory array
        
        NSLog(@"%@", [superstore inventory]);
        
    }
    return 0;
}

