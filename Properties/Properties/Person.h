//
//  Person.h
//  Properties
//
//  Created by Emily on 7/8/13.
//  Copyright (c) 2013 RyPress. All rights reserved.
//

#import <Foundation/Foundation.h>

// This is a forward declaration of the Car class.
// If we imported here and in the Person.h file,
// we would have an endless loop.

@class Car;

@interface Person : NSObject

@property (nonatomic) NSString *name;

// The weak attribute creates a non-owning relationship to
// car. This allows john to have a reference to hyundai while
// avoiding a retina cycle. Should hyundai be destroyed while
// john still has a reference to it, the attribute car will be
// set to nil to avoid a dangling pointer.

// A common use case for the weak attribute is parent-child
// data structures. By convention, the parent object should
// maintain a strong reference with it’s children, and the
// children should store a weak reference back to the parent.

@property (nonatomic, weak) Car *car;

@end
