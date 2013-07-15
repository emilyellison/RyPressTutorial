//
//  CarStore.m
//  MemoryMgmt
//
//  Created by Emily on 7/15/13.
//  Copyright (c) 2013 RyPress. All rights reserved.
//

#import "CarStore.h"

@implementation CarStore {
    NSMutableArray *_inventory;
}

- (NSMutableArray *)inventory {
    return _inventory;
}

// As soon as we pass another value to setInventory:,
// we can’t access the old value, which means we can never
// free it. To fix this, setInventory: needs to call release
// on the old value:

- (void)setInventory:(NSMutableArray *)newInventory {
    if (_inventory == newInventory) {
        return;
    }
    NSMutableArray *oldValue = _inventory;
    _inventory = [newInventory retain];
    // Could use the copy method to create a brand new instance of
    // the object and increments the reference count on that,
    //leaving the original unaffected
    // _inventory = [newInventory copy];
    [oldValue release];
}

// This relinquishes ownership of the object immediately after
// creating it, but keeps it in memory long enough for the caller
// to interact with it. Specifically, it waits until the end of the
// nearest @autoreleasepool{} block, after which it calls a normal
// release method. This is why there’s always an @autoreleasepool{}
// surrounding the entire main() function—it makes sure all of the
// autoreleased objects are destroyed after the program is done executing.

+ (CarStore *)carStore {
    CarStore *newStore = [[CarStore alloc] init];
    return [newStore autorelease];
}

- (void)dealloc {
    [_inventory release];
    [super dealloc];
}

@end
