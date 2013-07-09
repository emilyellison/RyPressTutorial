//
//  Car.h
//  Protocols
//
//  Created by Emily on 7/9/13.
//  Copyright (c) 2013 RyPress. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StreetLegal.h"

@interface Car : NSObject <StreetLegal>

- (void)startEngine;
- (void)drive;
- (void)brake;

@end
