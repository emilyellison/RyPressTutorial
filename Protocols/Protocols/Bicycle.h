//
//  Bicycle.h
//  Protocols
//
//  Created by Emily on 7/9/13.
//  Copyright (c) 2013 RyPress. All rights reserved.
//

// ADOPTING PROTOCOLS

#import <Foundation/Foundation.h>
#import "StreetLegal.h"

// Adopting the protocol is like adding all of the methods
// in StreetLegal.h to Bicycle.h. This would work the exact
// same way even if Bicycle inherited from a different
// superclass. Multiple protocols can be adopted by separating
// them with commas (e.g., <StreetLegal, SomeOtherProtocol>).

@interface Bicycle : NSObject <StreetLegal>

- (void)startPedaling;
- (void)removeFrontWheel;
- (void)lockToStructure:(id)theStructure;

@end
