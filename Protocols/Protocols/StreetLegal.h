//
//  StreetLegal.h
//  Protocols
//
//  Created by Emily on 7/9/13.
//  Copyright (c) 2013 RyPress. All rights reserved.
//

// CREATING PROTOCOLS

#import <Foundation/Foundation.h>

// The <NSObject> after the protocol name incorporates
// the NSObject protocol (not to be confused with the
// NSObject class) into the StreetLegal protocol. That
// is, any objects conforming to the StreetLegal protocol
// are required to conform to the NSObject protocol, too.

@protocol StreetLegal <NSObject>

- (void)signalStop;
- (void)signalLeftTurn;
- (void)signalRightTurn;

@end
