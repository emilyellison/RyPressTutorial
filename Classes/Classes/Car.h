//
//  Car.h
//  Classes
//
//  Created by Emily on 7/8/13.
//  Copyright (c) 2013 RyPress. All rights reserved.
//

// INTERFACES

#import <Foundation/Foundation.h>

@interface Car : NSObject {
    // Protected instance variables (not recommended)
}

@property (copy) NSString *model;

// CLASS METHODS

// Class methods are prefaced with +
+ (void)setDefaultModel:(NSString *)aModel;

// CONSTRUCTOR METHODS

// Custom constructor (or initialization) method
- (id)initWithModel:(NSString *)aModel;

// INSTANCE METHODS

// Instance methods are prefaced with -
- (void)drive;

@end
